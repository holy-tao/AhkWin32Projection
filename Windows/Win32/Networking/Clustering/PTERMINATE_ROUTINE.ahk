#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Immediately marks a resource as unavailable for use without waiting for cleanup processing to be completed.
 * @remarks
 * The <i>Terminate</i> entry-point function instantly marks a 
 *      resource as unavailable for use. If there is a thread processing an 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-ponline_routine">Online</a> or 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/resapi/nc-resapi-poffline_routine">Offline</a> request for the resource, these requests are canceled 
 *      and the resource is taken offline immediately.
 * 
 * For effective implementation strategies of the <i>Terminate</i> 
 *      entry-point function, see 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-terminate">Implementing Terminate</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-pterminate_routine
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PTERMINATE_ROUTINE extends IUnknown {

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
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Resource) {
        ResourceMarshal := Resource is VarRef ? "ptr" : "ptr"

        ComCall(3, this, ResourceMarshal, Resource)
    }
}
