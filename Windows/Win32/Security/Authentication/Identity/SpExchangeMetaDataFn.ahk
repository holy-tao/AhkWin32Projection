#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Sends metadata to a security support provider.
 * @remarks
 * A pointer to the <b>SpExchangeMetaDataFn</b> function is available in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_function_table">SECPKG_FUNCTION_TABLE</a> structure received from the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/nc-ntsecpkg-splsamodeinitializefn">SpLsaModeInitialize</a> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/ntsecpkg/nc-ntsecpkg-spexchangemetadatafn
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SpExchangeMetaDataFn extends IUnknown {

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
     * @param {Pointer<LSA_UNICODE_STRING>} TargetName 
     * @param {Integer} ContextRequirements 
     * @param {Integer} MetaDataLength 
     * @param {Pointer} MetaData 
     * @param {Pointer<Pointer>} ContextHandle 
     * @returns {NTSTATUS} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(CredentialHandle, TargetName, ContextRequirements, MetaDataLength, MetaData, ContextHandle) {
        ContextHandleMarshal := ContextHandle is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", CredentialHandle, "ptr", TargetName, "uint", ContextRequirements, "uint", MetaDataLength, "ptr", MetaData, ContextHandleMarshal, ContextHandle, "int")
        return result
    }
}
