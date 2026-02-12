#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 * @version v4.0.30319
 */
class PFNTRUSTHELPER extends IUnknown {

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
     * @param {LPARAM} lCustData 
     * @param {BOOL} fLeafCertificate 
     * @param {Pointer<Integer>} pbTrustBlob 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pCertContext, lCustData, fLeafCertificate, pbTrustBlob) {
        lCustData := lCustData is Win32Handle ? NumGet(lCustData, "ptr") : lCustData

        pbTrustBlobMarshal := pbTrustBlob is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", pCertContext, "ptr", lCustData, "int", fLeafCertificate, pbTrustBlobMarshal, pbTrustBlob, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
