#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A function that is called whenever an entry in the name cache is destroyed.
 * @remarks
 * If the client does not associate data with the name, this function is called only for the key data.
 * @see https://learn.microsoft.com/windows/win32/api//content/filehc/nc-filehc-cache_destroy_callback
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CACHE_DESTROY_CALLBACK extends IUnknown {

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
     * @param {Integer} cb 
     * @param {Pointer<Integer>} lpb 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(cb, lpb) {
        lpbMarshal := lpb is VarRef ? "char*" : "ptr"

        ComCall(3, this, "uint", cb, lpbMarshal, lpb)
    }
}
