#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The PONLINE_ROUTINE callback function marks a resource as available for use. (PONLINE_ROUTINE)
 * @remarks
 * If the <b>Online</b> entry-point function returns an error code 
 *      other than <b>ERROR_IO_PENDING</b>, the Resource Monitor logs an event and calls 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pterminate_routine">Terminate</a>.
 * 
 * Returning a valid <i>EventHandle</i> yields the following benefits:
 * 
 * <ul>
 * <li>The Resource Monitor will not perform <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-plooks_alive_routine">LooksAlive</a> 
 *       polling. Avoiding this overhead is often useful, particularly when your DLL supports multiple resource 
 *       instances.</li>
 * <li>You can report resource failure at any time by signaling the handle. The Resource Monitor will immediately 
 *       call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-pis_alive_routine">IsAlive</a> to verify that the resource has failed.</li>
 * </ul>
 * For effective implementation strategies of the <i>Online</i> 
 *     entry-point function, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-online">Implementing Online</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-ponline_routine
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PONLINE_ROUTINE extends IUnknown {

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
     * @param {Pointer<HANDLE>} EventHandle 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Resource, EventHandle) {
        ResourceMarshal := Resource is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, ResourceMarshal, Resource, "ptr", EventHandle, "uint")
        return result
    }
}
