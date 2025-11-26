#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509PrivateKey.ahk
#Include .\IX509SignatureInformation.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents a signing certificate that enables you to sign a certificate request.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-isignercertificate
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class ISignerCertificate extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISignerCertificate
     * @type {Guid}
     */
    static IID => Guid("{728ab33d-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "get_Certificate", "get_PrivateKey", "get_Silent", "put_Silent", "get_ParentWindow", "put_ParentWindow", "get_UIContextMessage", "put_UIContextMessage", "put_Pin", "get_SignatureInformation"]

    /**
     * @type {IX509PrivateKey} 
     */
    PrivateKey {
        get => this.get_PrivateKey()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Silent {
        get => this.get_Silent()
        set => this.put_Silent(value)
    }

    /**
     * @type {Integer} 
     */
    ParentWindow {
        get => this.get_ParentWindow()
        set => this.put_ParentWindow(value)
    }

    /**
     * @type {BSTR} 
     */
    UIContextMessage {
        get => this.get_UIContextMessage()
        set => this.put_UIContextMessage(value)
    }

    /**
     * @type {HRESULT} 
     */
    Pin {
        set => this.put_Pin(value)
    }

    /**
     * @type {IX509SignatureInformation} 
     */
    SignatureInformation {
        get => this.get_SignatureInformation()
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {VARIANT_BOOL} MachineContext 
     * @param {Integer} VerifyType 
     * @param {Integer} Encoding 
     * @param {BSTR} strCertificate 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(MachineContext, VerifyType, Encoding, strCertificate) {
        strCertificate := strCertificate is String ? BSTR.Alloc(strCertificate).Value : strCertificate

        result := ComCall(7, this, "short", MachineContext, "int", VerifyType, "int", Encoding, "ptr", strCertificate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-get_certificate
     */
    get_Certificate(Encoding) {
        pValue := BSTR()
        result := ComCall(8, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {IX509PrivateKey} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-get_privatekey
     */
    get_PrivateKey() {
        result := ComCall(9, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509PrivateKey(ppValue)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-get_silent
     */
    get_Silent() {
        result := ComCall(10, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-put_silent
     */
    put_Silent(Value) {
        result := ComCall(11, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-get_parentwindow
     */
    get_ParentWindow() {
        result := ComCall(12, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-put_parentwindow
     */
    put_ParentWindow(Value) {
        result := ComCall(13, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-get_uicontextmessage
     */
    get_UIContextMessage() {
        pValue := BSTR()
        result := ComCall(14, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-put_uicontextmessage
     */
    put_UIContextMessage(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(15, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-put_pin
     */
    put_Pin(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(16, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IX509SignatureInformation} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-isignercertificate-get_signatureinformation
     */
    get_SignatureInformation() {
        result := ComCall(17, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509SignatureInformation(ppValue)
    }
}
