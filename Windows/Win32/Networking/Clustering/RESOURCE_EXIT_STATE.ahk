#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Enumerates the possible exit states of a resource.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/ne-resapi-resource_exit_state
 * @namespace Windows.Win32.Networking.Clustering
 */
class RESOURCE_EXIT_STATE extends Win32Enum {

    /**
     * The resource has not been terminated. Worker threads may continue 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_routine">Online</a> and 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> operations for the resource.
     * Native name: ResourceExitStateContinue
     * @type {Integer (Int32)}
     */
    static Continue => 0

    /**
     * The resource has been terminated. Callers should end 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_routine">Online</a> or 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> operations and immediately terminate all worker 
     *        threads assigned to the resource.
     * Native name: ResourceExitStateTerminate
     * @type {Integer (Int32)}
     */
    static Terminate => 1

    /**
     * This value is only used for comparisons. All supported values are less than 
     *       <b>ResourceExitStateMax</b>.
     * Native name: ResourceExitStateMax
     * @type {Integer (Int32)}
     */
    static Max => 2
}
