#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The RPC_AUTH_KEY_RETRIEVAL_FN function is a prototype for a function that specifies the address of a server-application-provided routine returning encryption keys.
 * @remarks
 * An authorization key–retrieval function specifies the address of a server-application-provided routine returning encryption keys.
 * @see https://learn.microsoft.com/windows/win32/api//content/rpcdce/nc-rpcdce-rpc_auth_key_retrieval_fn
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_AUTH_KEY_RETRIEVAL_FN extends IUnknown {

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
     * @param {PWSTR} ServerPrincName 
     * @param {Integer} KeyVer 
     * @param {Pointer<Pointer<Void>>} Key 
     * @param {Pointer<Integer>} Status_ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Arg, ServerPrincName, KeyVer, Key, Status_) {
        ServerPrincName := ServerPrincName is String ? StrPtr(ServerPrincName) : ServerPrincName

        ArgMarshal := Arg is VarRef ? "ptr" : "ptr"
        KeyMarshal := Key is VarRef ? "ptr*" : "ptr"
        Status_Marshal := Status_ is VarRef ? "int*" : "ptr"

        ComCall(3, this, ArgMarshal, Arg, "ptr", ServerPrincName, "uint", KeyVer, KeyMarshal, Key, Status_Marshal, Status_)
    }
}
