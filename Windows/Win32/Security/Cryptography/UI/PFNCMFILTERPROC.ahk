#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Filters each certificate to determine whether it will appear in the certificate selection dialog box that is displayed by the CertSelectCertificate function.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/cryptdlg/nc-cryptdlg-pfncmfilterproc
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class PFNCMFILTERPROC extends IUnknown {

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
     * @param {Pointer<CERT_CONTEXT>} pCertContext 
     * @param {LPARAM} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pCertContext, param1, param2, param3) {
        param1 := param1 is Win32Handle ? NumGet(param1, "ptr") : param1

        result := ComCall(3, this, "ptr", pCertContext, "ptr", param1, "uint", param2, "uint", param3, "int")
        return result
    }
}
