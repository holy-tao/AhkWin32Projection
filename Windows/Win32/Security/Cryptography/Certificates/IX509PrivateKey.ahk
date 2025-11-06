#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509PublicKey.ahk
#Include .\ICspInformations.ahk
#Include .\ICspStatus.ahk
#Include .\IObjectId.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents an asymmetric private key that can be used for encryption, signing, and key agreement.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509privatekey
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509PrivateKey extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509PrivateKey
     * @type {Guid}
     */
    static IID => Guid("{728ab30c-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Create", "Close", "Delete", "Verify", "Import", "Export", "ExportPublicKey", "get_ContainerName", "put_ContainerName", "get_ContainerNamePrefix", "put_ContainerNamePrefix", "get_ReaderName", "put_ReaderName", "get_CspInformations", "put_CspInformations", "get_CspStatus", "put_CspStatus", "get_ProviderName", "put_ProviderName", "get_ProviderType", "put_ProviderType", "get_LegacyCsp", "put_LegacyCsp", "get_Algorithm", "put_Algorithm", "get_KeySpec", "put_KeySpec", "get_Length", "put_Length", "get_ExportPolicy", "put_ExportPolicy", "get_KeyUsage", "put_KeyUsage", "get_KeyProtection", "put_KeyProtection", "get_MachineContext", "put_MachineContext", "get_SecurityDescriptor", "put_SecurityDescriptor", "get_Certificate", "put_Certificate", "get_UniqueContainerName", "get_Opened", "get_DefaultContainer", "get_Existing", "put_Existing", "get_Silent", "put_Silent", "get_ParentWindow", "put_ParentWindow", "get_UIContextMessage", "put_UIContextMessage", "put_Pin", "get_FriendlyName", "put_FriendlyName", "get_Description", "put_Description"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-open
     */
    Open() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-create
     */
    Create() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-close
     */
    Close() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-delete
     */
    Delete() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} VerifyType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-verify
     */
    Verify(VerifyType) {
        result := ComCall(11, this, "int", VerifyType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strExportType 
     * @param {BSTR} strEncodedKey 
     * @param {Integer} Encoding 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-import
     */
    Import(strExportType, strEncodedKey, Encoding) {
        strExportType := strExportType is String ? BSTR.Alloc(strExportType).Value : strExportType
        strEncodedKey := strEncodedKey is String ? BSTR.Alloc(strEncodedKey).Value : strEncodedKey

        result := ComCall(12, this, "ptr", strExportType, "ptr", strEncodedKey, "int", Encoding, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strExportType 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-export
     */
    Export(strExportType, Encoding) {
        strExportType := strExportType is String ? BSTR.Alloc(strExportType).Value : strExportType

        pstrEncodedKey := BSTR()
        result := ComCall(13, this, "ptr", strExportType, "int", Encoding, "ptr", pstrEncodedKey, "HRESULT")
        return pstrEncodedKey
    }

    /**
     * 
     * @returns {IX509PublicKey} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-exportpublickey
     */
    ExportPublicKey() {
        result := ComCall(14, this, "ptr*", &ppPublicKey := 0, "HRESULT")
        return IX509PublicKey(ppPublicKey)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_containername
     */
    get_ContainerName() {
        pValue := BSTR()
        result := ComCall(15, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_containername
     */
    put_ContainerName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(16, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_containernameprefix
     */
    get_ContainerNamePrefix() {
        pValue := BSTR()
        result := ComCall(17, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_containernameprefix
     */
    put_ContainerNamePrefix(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(18, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_readername
     */
    get_ReaderName() {
        pValue := BSTR()
        result := ComCall(19, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_readername
     */
    put_ReaderName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(20, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ICspInformations} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_cspinformations
     */
    get_CspInformations() {
        result := ComCall(21, this, "ptr*", &ppValue := 0, "HRESULT")
        return ICspInformations(ppValue)
    }

    /**
     * 
     * @param {ICspInformations} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_cspinformations
     */
    put_CspInformations(pValue) {
        result := ComCall(22, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ICspStatus} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_cspstatus
     */
    get_CspStatus() {
        result := ComCall(23, this, "ptr*", &ppValue := 0, "HRESULT")
        return ICspStatus(ppValue)
    }

    /**
     * 
     * @param {ICspStatus} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_cspstatus
     */
    put_CspStatus(pValue) {
        result := ComCall(24, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_providername
     */
    get_ProviderName() {
        pValue := BSTR()
        result := ComCall(25, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_providername
     */
    put_ProviderName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(26, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_providertype
     */
    get_ProviderType() {
        result := ComCall(27, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_providertype
     */
    put_ProviderType(Value) {
        result := ComCall(28, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_legacycsp
     */
    get_LegacyCsp() {
        result := ComCall(29, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_legacycsp
     */
    put_LegacyCsp(Value) {
        result := ComCall(30, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IObjectId} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_algorithm
     */
    get_Algorithm() {
        result := ComCall(31, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * 
     * @param {IObjectId} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_algorithm
     */
    put_Algorithm(pValue) {
        result := ComCall(32, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_keyspec
     */
    get_KeySpec() {
        result := ComCall(33, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_keyspec
     */
    put_KeySpec(Value) {
        result := ComCall(34, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_length
     */
    get_Length() {
        result := ComCall(35, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_length
     */
    put_Length(Value) {
        result := ComCall(36, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_exportpolicy
     */
    get_ExportPolicy() {
        result := ComCall(37, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_exportpolicy
     */
    put_ExportPolicy(Value) {
        result := ComCall(38, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_keyusage
     */
    get_KeyUsage() {
        result := ComCall(39, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_keyusage
     */
    put_KeyUsage(Value) {
        result := ComCall(40, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_keyprotection
     */
    get_KeyProtection() {
        result := ComCall(41, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_keyprotection
     */
    put_KeyProtection(Value) {
        result := ComCall(42, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_machinecontext
     */
    get_MachineContext() {
        result := ComCall(43, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_machinecontext
     */
    put_MachineContext(Value) {
        result := ComCall(44, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_securitydescriptor
     */
    get_SecurityDescriptor() {
        pValue := BSTR()
        result := ComCall(45, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_securitydescriptor
     */
    put_SecurityDescriptor(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(46, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_certificate
     */
    get_Certificate(Encoding) {
        pValue := BSTR()
        result := ComCall(47, this, "int", Encoding, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_certificate
     */
    put_Certificate(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(48, this, "int", Encoding, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_uniquecontainername
     */
    get_UniqueContainerName() {
        pValue := BSTR()
        result := ComCall(49, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_opened
     */
    get_Opened() {
        result := ComCall(50, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_defaultcontainer
     */
    get_DefaultContainer() {
        result := ComCall(51, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_existing
     */
    get_Existing() {
        result := ComCall(52, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_existing
     */
    put_Existing(Value) {
        result := ComCall(53, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_silent
     */
    get_Silent() {
        result := ComCall(54, this, "short*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_silent
     */
    put_Silent(Value) {
        result := ComCall(55, this, "short", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_parentwindow
     */
    get_ParentWindow() {
        result := ComCall(56, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_parentwindow
     */
    put_ParentWindow(Value) {
        result := ComCall(57, this, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_uicontextmessage
     */
    get_UIContextMessage() {
        pValue := BSTR()
        result := ComCall(58, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_uicontextmessage
     */
    put_UIContextMessage(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(59, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_pin
     */
    put_Pin(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(60, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_friendlyname
     */
    get_FriendlyName() {
        pValue := BSTR()
        result := ComCall(61, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_friendlyname
     */
    put_FriendlyName(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(62, this, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-get_description
     */
    get_Description() {
        pValue := BSTR()
        result := ComCall(63, this, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/nf-certenroll-ix509privatekey-put_description
     */
    put_Description(Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(64, this, "ptr", Value, "HRESULT")
        return result
    }
}
