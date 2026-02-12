#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Allows a node to attempt to regain ownership of a quorum resource.
 * @remarks
 * The <i>Arbitrate</i> entry-point function is implemented for 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/quorum-resource">quorum resources</a> only. Expect this function to 
 *      be called only after both <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pstartup_routine">Startup</a> and 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-popen_routine">Open</a> have been called.
 * 
 * Implementations of <b>Arbitrate</b> should take less than 300 
 *      milliseconds to complete.
 * 
 * If <b>Arbitrate</b> is successful, make sure that only the 
 *      current node can successfully arbitrate for the quorum resource represented by 
 *      <i>ResourceId</i>. For example, a disk resource can implement a defense by continually 
 *      replacing the reservation made on it once per second.
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-parbitrate_routine
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PARBITRATE_ROUTINE extends IUnknown {

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
     * @param {Pointer<PQUORUM_RESOURCE_LOST>} LostQuorumResource 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Resource, LostQuorumResource) {
        ResourceMarshal := Resource is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, ResourceMarshal, Resource, "ptr", LostQuorumResource, "uint")
        return result
    }
}
