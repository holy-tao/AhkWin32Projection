#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The client dispatch function used to establish a security context between a server and client.
 * @remarks
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-spacceptlsamodecontextfn">SpAcceptLsaModeContext</a> function is the server-side function for creating a context.
 * 
 * SSP/APs must implement the <b>SpInitLsaModeContext</b> function; however, the actual name given to the implementation is up to the developer.
 * 
 * A pointer to the <b>SpInitLsaModeContext</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/ntsecpkg/nc-ntsecpkg-spinitlsamodecontextfn
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SpInitLsaModeContextFn extends IUnknown {

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
     * @param {Pointer} CredentialHandle 
     * @param {Pointer} ContextHandle 
     * @param {Pointer<LSA_UNICODE_STRING>} TargetName 
     * @param {Integer} ContextRequirements 
     * @param {Integer} TargetDataRep 
     * @param {Pointer<SecBufferDesc>} InputBuffers 
     * @param {Pointer<Pointer>} NewContextHandle 
     * @param {Pointer<SecBufferDesc>} OutputBuffers 
     * @param {Pointer<Integer>} ContextAttributes 
     * @param {Pointer<Integer>} ExpirationTime 
     * @param {Pointer<BOOLEAN>} MappedContext 
     * @param {Pointer<SecBuffer>} ContextData 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(CredentialHandle, ContextHandle, TargetName, ContextRequirements, TargetDataRep, InputBuffers, NewContextHandle, OutputBuffers, ContextAttributes, ExpirationTime, MappedContext, ContextData) {
        NewContextHandleMarshal := NewContextHandle is VarRef ? "ptr*" : "ptr"
        ContextAttributesMarshal := ContextAttributes is VarRef ? "uint*" : "ptr"
        ExpirationTimeMarshal := ExpirationTime is VarRef ? "int64*" : "ptr"
        MappedContextMarshal := MappedContext is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", CredentialHandle, "ptr", ContextHandle, "ptr", TargetName, "uint", ContextRequirements, "uint", TargetDataRep, "ptr", InputBuffers, NewContextHandleMarshal, NewContextHandle, "ptr", OutputBuffers, ContextAttributesMarshal, ContextAttributes, ExpirationTimeMarshal, ExpirationTime, MappedContextMarshal, MappedContext, "ptr", ContextData, "int")
        return result
    }
}
