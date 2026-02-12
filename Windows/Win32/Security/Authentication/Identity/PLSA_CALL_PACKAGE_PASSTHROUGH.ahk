#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class PLSA_CALL_PACKAGE_PASSTHROUGH extends IUnknown {

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
     * @param {Pointer<LSA_UNICODE_STRING>} AuthenticationPackage 
     * @param {Pointer<Void>} ClientBufferBase 
     * @param {Pointer} ProtocolSubmitBuffer 
     * @param {Integer} SubmitBufferLength 
     * @param {Pointer<Pointer<Void>>} ProtocolReturnBuffer 
     * @param {Pointer<Integer>} ReturnBufferLength 
     * @param {Pointer<Integer>} ProtocolStatus 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(AuthenticationPackage, ClientBufferBase, ProtocolSubmitBuffer, SubmitBufferLength, ProtocolReturnBuffer, ReturnBufferLength, ProtocolStatus) {
        ClientBufferBaseMarshal := ClientBufferBase is VarRef ? "ptr" : "ptr"
        ProtocolReturnBufferMarshal := ProtocolReturnBuffer is VarRef ? "ptr*" : "ptr"
        ReturnBufferLengthMarshal := ReturnBufferLength is VarRef ? "uint*" : "ptr"
        ProtocolStatusMarshal := ProtocolStatus is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", AuthenticationPackage, ClientBufferBaseMarshal, ClientBufferBase, "ptr", ProtocolSubmitBuffer, "uint", SubmitBufferLength, ProtocolReturnBufferMarshal, ProtocolReturnBuffer, ReturnBufferLengthMarshal, ReturnBufferLength, ProtocolStatusMarshal, ProtocolStatus, "int")
        return result
    }
}
