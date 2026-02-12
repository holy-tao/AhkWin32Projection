#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * WER can call this function multiple times to get the report parameters that uniquely describe the problem.
 * @remarks
 * You must implement this function in your exception handler DLL.
 * 
 * To generate error reports for application-specific issues, the application must create a short description of the problem using a few basic pieces of information called report parameters. Report parameters include information such as the application name, application version, module name, module version, and error code. The combination of these report parameters describes a unique problem.
 * 
 * WER calls this callback function only if you set the <i>pbOwnershipClaimed</i> parameter of your <a href="https://docs.microsoft.com/windows/desktop/api/werapi/nc-werapi-pfn_wer_runtime_exception_event">OutOfProcessExceptionEventCallback</a> callback function to <b>TRUE</b>. The <i>pdwSignatureCount</i> parameter of <b>OutOfProcessExceptionEventCallback</b> determines the number of times that  WER will call  this callback function.
 * @see https://learn.microsoft.com/windows/win32/api//content/werapi/nc-werapi-pfn_wer_runtime_exception_event_signature
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class PFN_WER_RUNTIME_EXCEPTION_EVENT_SIGNATURE extends IUnknown {

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
     * @param {Integer} dwIndex 
     * @param {PWSTR} pwszName 
     * @param {Pointer<Integer>} pchName 
     * @param {PWSTR} pwszValue 
     * @param {Pointer<Integer>} pchValue 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pContext, pExceptionInformation, dwIndex, pwszName, pchName, pwszValue, pchValue) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName
        pwszValue := pwszValue is String ? StrPtr(pwszValue) : pwszValue

        pContextMarshal := pContext is VarRef ? "ptr" : "ptr"
        pchNameMarshal := pchName is VarRef ? "uint*" : "ptr"
        pchValueMarshal := pchValue is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pContextMarshal, pContext, "ptr", pExceptionInformation, "uint", dwIndex, "ptr", pwszName, pchNameMarshal, pchName, "ptr", pwszValue, pchValueMarshal, pchValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
