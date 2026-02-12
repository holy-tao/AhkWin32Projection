#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class FNIMPORTPFXTOPROVIDER extends IUnknown {

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
     * @param {HWND} hWndParent 
     * @param {Pointer} pbPFX 
     * @param {Integer} cbPFX 
     * @param {Integer} ImportFlags 
     * @param {PWSTR} pwszPassword 
     * @param {PWSTR} pwszProviderName 
     * @param {PWSTR} pwszReaderName 
     * @param {PWSTR} pwszContainerNamePrefix 
     * @param {PWSTR} pwszPin 
     * @param {PWSTR} pwszFriendlyName 
     * @param {Pointer<Integer>} pcCertOut 
     * @param {Pointer<Pointer<Pointer<CERT_CONTEXT>>>} prgpCertOut 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hWndParent, pbPFX, cbPFX, ImportFlags, pwszPassword, pwszProviderName, pwszReaderName, pwszContainerNamePrefix, pwszPin, pwszFriendlyName, pcCertOut, prgpCertOut) {
        hWndParent := hWndParent is Win32Handle ? NumGet(hWndParent, "ptr") : hWndParent
        pwszPassword := pwszPassword is String ? StrPtr(pwszPassword) : pwszPassword
        pwszProviderName := pwszProviderName is String ? StrPtr(pwszProviderName) : pwszProviderName
        pwszReaderName := pwszReaderName is String ? StrPtr(pwszReaderName) : pwszReaderName
        pwszContainerNamePrefix := pwszContainerNamePrefix is String ? StrPtr(pwszContainerNamePrefix) : pwszContainerNamePrefix
        pwszPin := pwszPin is String ? StrPtr(pwszPin) : pwszPin
        pwszFriendlyName := pwszFriendlyName is String ? StrPtr(pwszFriendlyName) : pwszFriendlyName

        pcCertOutMarshal := pcCertOut is VarRef ? "uint*" : "ptr"
        prgpCertOutMarshal := prgpCertOut is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", hWndParent, "ptr", pbPFX, "uint", cbPFX, "int", ImportFlags, "ptr", pwszPassword, "ptr", pwszProviderName, "ptr", pwszReaderName, "ptr", pwszContainerNamePrefix, "ptr", pwszPin, "ptr", pwszFriendlyName, pcCertOutMarshal, pcCertOut, prgpCertOutMarshal, prgpCertOut, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
