#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The POFFLINE_ROUTINE callback function marks a resource as unavailable for use after cleanup processing is complete.
 * @remarks
 * If <i>Offline</i> returns an error code other than 
 *      <b>ERROR_IO_PENDING</b>, the 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/resource-monitor">Resource Monitor</a> logs an event and calls 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pterminate_routine">Terminate</a>.
 * 
 * For effective implementation strategies of the <i>Offline</i> 
 *      entry-point function, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-offline">Implementing Offline</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-poffline_routine
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class POFFLINE_ROUTINE extends IUnknown {

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
