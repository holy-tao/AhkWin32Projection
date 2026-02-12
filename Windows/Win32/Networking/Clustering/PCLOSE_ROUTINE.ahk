#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Closes a resource.
 * @remarks
 * For effective implementation strategies of the <b>Close</b> 
 *      entry-point function, see 
 *      <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mscs/implementing-close">Implementing Close</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/resapi/nc-resapi-pclose_routine
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class PCLOSE_ROUTINE extends IUnknown {

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
