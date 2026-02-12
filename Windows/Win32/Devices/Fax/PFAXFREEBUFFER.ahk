#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The FaxFreeBuffer function releases resources associated with a buffer allocated previously as the result of a function call by a fax client application.
 * @remarks
 * When the resources allocated for a buffer are no longer needed, the calling application must free the resources. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-freeing-fax-resources">Freeing Fax Resources</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/winfax/nc-winfax-pfaxfreebuffer
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class PFAXFREEBUFFER extends IUnknown {

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
     * @param {Pointer<Void>} Buffer_ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Buffer_) {
        Buffer_Marshal := Buffer_ is VarRef ? "ptr" : "ptr"

        ComCall(3, this, Buffer_Marshal, Buffer_)
    }
}
