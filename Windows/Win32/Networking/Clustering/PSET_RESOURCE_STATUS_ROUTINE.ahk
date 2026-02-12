#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The PSET_RESOURCE_STATUS_ROUTINE callback function is called to update the status of a resource.
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">Resource DLLs</a> call the 
 *      <i>SetResourceStatus</i> callback function to update the 
 *      status of a resource after their <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_routine">Online</a> or 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> entry point function has returned 
 *      <b>ERROR_IO_PENDING</b>. It should not be called at any other time. A pointer to the 
 *      <i>SetResourceStatus</i> function is passed in the 
 *      <i>SetResourceStatus</i> parameter to the resource's implementation of 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pstartup_routine">Startup</a>.
 * 
 * <i>SetResourceStatus</i> is implemented by the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-monitor">Resource Monitor</a> and is similar to the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> function.
 * 
 * Update the current state of a resource whenever necessary after you have returned 
 *      <b>ERROR_IO_PENDING</b>. If the resource is in one of the pending states, increment the values 
 *      for the <b>CheckPoint</b> and <b>WaitHint</b> members of the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/ns-resapi-resource_status">RESOURCE_STATUS</a> structure and set the 
 *      <b>ResourceState</b> member to <b>ClusterResourceOnlinePending</b> or 
 *      <b>ClusterResourceOfflinePending</b> before you begin calling 
 *      <i>SetResourceStatus</i>. Call 
 *      <i>SetResourceStatus</i> until one of the following 
 *      situations occurs:
 * 
 * <ul>
 * <li>The resource is placed in either the <b>ClusterResourceOnline</b> or 
 *       <b>ClusterResourceOffline</b> state.</li>
 * <li>The time limit stored in the resource's 
 *       <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resources-pendingtimeout">PendingTimeout</a> property has been 
 *       exceeded.</li>
 * </ul>
 * There is no need to call 
 *      <i>SetResourceStatus</i> to set the state of a resource to 
 *      a pending state because the Resource Monitor automatically sets it to the appropriate pending state whenever 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_routine">Online</a> or 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> returns 
 *      <b>ERROR_IO_PENDING</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-pset_resource_status_routine
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PSET_RESOURCE_STATUS_ROUTINE extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer} ResourceHandle 
     * @param {Pointer<RESOURCE_STATUS>} ResourceStatus 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(ResourceHandle, ResourceStatus) {
        result := ComCall(3, this, "ptr", ResourceHandle, "ptr", ResourceStatus, "uint")
        return result
    }
}
