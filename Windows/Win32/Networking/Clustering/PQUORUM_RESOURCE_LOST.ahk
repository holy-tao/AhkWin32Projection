#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called when control of the quorum resource has been lost.
 * @remarks
 * The <i>QuorumResourceLost</i> callback function is 
 *      called by a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-dlls">resource DLL</a> to notify the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-monitor">Resource Monitor</a> that control of the quorum resource has 
 *      been lost after arbitration. A pointer to the Resource Monitor's 
 *      <i>QuorumResourceLost</i> callback function is passed to 
 *      a quorum resource DLL in the call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-parbitrate_routine">Arbitrate</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-pquorum_resource_lost
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PQUORUM_RESOURCE_LOST extends IUnknown {

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
     * @param {Pointer} Resource 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Resource) {
        ComCall(3, this, "ptr", Resource)
    }
}
