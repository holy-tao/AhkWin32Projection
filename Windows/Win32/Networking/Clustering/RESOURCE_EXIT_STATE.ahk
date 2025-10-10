#Requires AutoHotkey v2.0.0 64-bit

/**
 * Enumerates the possible exit states of a resource.
 * @see https://docs.microsoft.com/windows/win32/api//resapi/ne-resapi-resource_exit_state
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class RESOURCE_EXIT_STATE{

    /**
     * The resource has not been terminated. Worker threads may continue 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_routine">Online</a> and 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> operations for the resource.
     * @type {Integer (Int32)}
     */
    static ResourceExitStateContinue => 0

    /**
     * The resource has been terminated. Callers should end 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_routine">Online</a> or 
 *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> operations and immediately terminate all worker 
 *        threads assigned to the resource.
     * @type {Integer (Int32)}
     */
    static ResourceExitStateTerminate => 1

    /**
     * This value is only used for comparisons. All supported values are less than 
 *       <b>ResourceExitStateMax</b>.
     * @type {Integer (Int32)}
     */
    static ResourceExitStateMax => 2
}
