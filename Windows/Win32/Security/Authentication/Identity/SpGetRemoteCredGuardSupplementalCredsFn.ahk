#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SpGetRemoteCredGuardSupplementalCredsFn extends IUnknown {

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
     * @param {Pointer} CredHandle 
     * @param {Pointer<LSA_UNICODE_STRING>} TargetName 
     * @param {Pointer<HANDLE>} RedirectedLogonHandle 
     * @param {Pointer<Pointer<PLSA_REDIRECTED_LOGON_CALLBACK>>} Callback 
     * @param {Pointer<Pointer<PLSA_REDIRECTED_LOGON_CLEANUP_CALLBACK>>} CleanupCallback 
     * @param {Pointer<Integer>} SupplementalCredsSize 
     * @param {Pointer<Pointer<Void>>} SupplementalCreds 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(CredHandle, TargetName, RedirectedLogonHandle, Callback, CleanupCallback, SupplementalCredsSize, SupplementalCreds) {
        CallbackMarshal := Callback is VarRef ? "ptr*" : "ptr"
        CleanupCallbackMarshal := CleanupCallback is VarRef ? "ptr*" : "ptr"
        SupplementalCredsSizeMarshal := SupplementalCredsSize is VarRef ? "uint*" : "ptr"
        SupplementalCredsMarshal := SupplementalCreds is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", CredHandle, "ptr", TargetName, "ptr", RedirectedLogonHandle, CallbackMarshal, Callback, CleanupCallbackMarshal, CleanupCallback, SupplementalCredsSizeMarshal, SupplementalCredsSize, SupplementalCredsMarshal, SupplementalCreds, "int")
        return result
    }
}
