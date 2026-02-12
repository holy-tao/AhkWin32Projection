#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SEC_GET_KEY_FN extends IUnknown {

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
     * @param {Pointer<Void>} Arg 
     * @param {Pointer<Void>} Principal 
     * @param {Integer} KeyVer 
     * @param {Pointer<Pointer<Void>>} Key 
     * @param {Pointer<HRESULT>} Status_ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Arg, Principal, KeyVer, Key, Status_) {
        ArgMarshal := Arg is VarRef ? "ptr" : "ptr"
        PrincipalMarshal := Principal is VarRef ? "ptr" : "ptr"
        KeyMarshal := Key is VarRef ? "ptr*" : "ptr"
        Status_Marshal := Status_ is VarRef ? "int*" : "ptr"

        ComCall(3, this, ArgMarshal, Arg, PrincipalMarshal, Principal, "uint", KeyVer, KeyMarshal, Key, Status_Marshal, Status_)
    }
}
