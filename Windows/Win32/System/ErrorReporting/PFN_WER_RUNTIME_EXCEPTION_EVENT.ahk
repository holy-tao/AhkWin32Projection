#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * WER calls this function to determine whether the exception handler is claiming the crash.
 * @remarks
 * You must implement this function in your exception handler DLL.
 * @see https://learn.microsoft.com/windows/win32/api//content/werapi/nc-werapi-pfn_wer_runtime_exception_event
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class PFN_WER_RUNTIME_EXCEPTION_EVENT extends IUnknown {

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
     * @param {Pointer<Void>} pContext 
     * @param {Pointer<WER_RUNTIME_EXCEPTION_INFORMATION>} pExceptionInformation 
     * @param {Pointer<BOOL>} pbOwnershipClaimed 
     * @param {PWSTR} pwszEventName 
     * @param {Pointer<Integer>} pchSize 
     * @param {Pointer<Integer>} pdwSignatureCount 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pContext, pExceptionInformation, pbOwnershipClaimed, pwszEventName, pchSize, pdwSignatureCount) {
        pwszEventName := pwszEventName is String ? StrPtr(pwszEventName) : pwszEventName

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"
        pbOwnershipClaimedMarshal := pbOwnershipClaimed is VarRef ? "int*" : "ptr"
        pchSizeMarshal := pchSize is VarRef ? "uint*" : "ptr"
        pdwSignatureCountMarshal := pdwSignatureCount is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pContextMarshal, pContext, "ptr", pExceptionInformation, pbOwnershipClaimedMarshal, pbOwnershipClaimed, "ptr", pwszEventName, pchSizeMarshal, pchSize, pdwSignatureCountMarshal, pdwSignatureCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
