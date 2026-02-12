#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.Compression
 * @version v4.0.30319
 */
class PFN_COMPRESS_FREE extends IUnknown {

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
     * @param {Pointer<Void>} UserContext 
     * @param {Pointer<Void>} Memory 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(UserContext, Memory) {
        UserContextMarshal := UserContext is VarRef ? "ptr" : "ptr"
        MemoryMarshal := Memory is VarRef ? "ptr" : "ptr"

        ComCall(3, this, UserContextMarshal, UserContext, MemoryMarshal, Memory)
    }
}
