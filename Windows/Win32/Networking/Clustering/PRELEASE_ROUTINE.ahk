#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Releases the quorum resource from arbitration.
 * @remarks
 * The <i>Release</i> entry-point function is implemented for quorum 
 *      resources only. A quorum resource might have to be released when the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-service">Cluster service</a> is shut down or when the quorum resource 
 *      has to be physically moved to a different <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/nodes">node</a> in the cluster.
 * 
 * <div class="alert"><b>Note</b>  All disk resources must explicitly call their own 
 *     <i>Release</i> in their  implementation of the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> callback, since one is not made by the 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/cluster-service">Cluster service</a>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-monitor">Resource Monitor</a>.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-prelease_routine
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PRELEASE_ROUTINE extends IUnknown {

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
     * @param {Pointer<Void>} Resource 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Resource) {
        ResourceMarshal := Resource is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, ResourceMarshal, Resource, "uint")
        return result
    }
}
