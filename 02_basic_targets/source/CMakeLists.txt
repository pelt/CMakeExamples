cmake_minimum_required(VERSION 3.10)
project(simple_project VERSION 0.2 LANGUAGES C)

# build the executable from source files
# either in target "all" or by naming it directly
add_executable(app_with_multiple_sources
    main.c
    module.c
)

# do not build the app for target "all", this is useful for developer tools
add_executable(not_in_all EXCLUDE_FROM_ALL
    main.c
    module.c
)

# two addtional target for linking demonstration later on
add_executable(app_with_static_lib main.c)
add_executable(app_with_shared_lib main.c)

# create static library, i.e. libmodule_static.a
# don't add "lib" as prefix in the name, it depends on the system and will be
# added automatically
add_library(module_static STATIC
    module.c
)

# create shared library, i.e. libmodule_shared.so
add_library(module_shared SHARED
    module.c
)

# create a component for runtime loading
# i.e. under linux same as shared libmodule_plugin.so
# never use a MODULE in target_link_libraries to be fully cross-platform
add_library(module_component MODULE
    module.c
)

# create a static or shared library, depending on the BUILD_SHARED_LIBS varibale
# If no specific reason, let it free for greater flexibility
add_library(module_prefered module.c)

# link a library as PRIVATE, so i.e. linking the target "app_with_static_lib" to
# another target does not required to link "module_static"
target_link_libraries(app_with_static_lib
    PRIVATE module_static
    # additionally link also math and pthread which are not part of this project
    # (and not used, it's just for demonstration)
    PUBLIC m pthread
)

# link a library as PUBLIC, this is usually the case if the target uses i.e.
# types from "module_shared" for its own public interface
target_link_libraries(app_with_shared_lib PUBLIC module_shared)
