#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ACTCTX_REQUESTED_RUN_LEVEL enumeration describes the requested run level of the activation context.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ne-winnt-actctx_requested_run_level
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class ACTCTX_REQUESTED_RUN_LEVEL extends Win32Enum{

    /**
     * The application manifest does not specify a requested run level for the application.
     * @type {Integer (Int32)}
     */
    static ACTCTX_RUN_LEVEL_UNSPECIFIED => 0

    /**
     * The application manifest requests the least privilege level to run the application.
     * @type {Integer (Int32)}
     */
    static ACTCTX_RUN_LEVEL_AS_INVOKER => 1

    /**
     * The application manifest requests the highest privilege level to run the application.
     * @type {Integer (Int32)}
     */
    static ACTCTX_RUN_LEVEL_HIGHEST_AVAILABLE => 2

    /**
     * The application manifest requests the administrator privilege level to run the application.
     * @type {Integer (Int32)}
     */
    static ACTCTX_RUN_LEVEL_REQUIRE_ADMIN => 3

    /**
     * Total number of possible run levels.
     * @type {Integer (Int32)}
     */
    static ACTCTX_RUN_LEVEL_NUMBERS => 4
}
