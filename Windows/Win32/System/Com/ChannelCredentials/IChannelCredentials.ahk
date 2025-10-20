#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.Com.ChannelCredentials
 * @version v4.0.30319
 */
class IChannelCredentials extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChannelCredentials
     * @type {Guid}
     */
    static IID => Guid("{181b448c-c17c-4b17-ac6d-06699b93198f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetWindowsCredential", "SetUserNameCredential", "SetClientCertificateFromStore", "SetClientCertificateFromStoreByName", "SetClientCertificateFromFile", "SetDefaultServiceCertificateFromStore", "SetDefaultServiceCertificateFromStoreByName", "SetDefaultServiceCertificateFromFile", "SetServiceCertificateAuthentication", "SetIssuedToken"]

    /**
     * 
     * @param {BSTR} domain 
     * @param {BSTR} username 
     * @param {BSTR} password 
     * @param {Integer} impersonationLevel 
     * @param {BOOL} allowNtlm 
     * @returns {HRESULT} 
     */
    SetWindowsCredential(domain, username, password, impersonationLevel, allowNtlm) {
        domain := domain is String ? BSTR.Alloc(domain).Value : domain
        username := username is String ? BSTR.Alloc(username).Value : username
        password := password is String ? BSTR.Alloc(password).Value : password

        result := ComCall(7, this, "ptr", domain, "ptr", username, "ptr", password, "int", impersonationLevel, "int", allowNtlm, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} username 
     * @param {BSTR} password 
     * @returns {HRESULT} 
     */
    SetUserNameCredential(username, password) {
        username := username is String ? BSTR.Alloc(username).Value : username
        password := password is String ? BSTR.Alloc(password).Value : password

        result := ComCall(8, this, "ptr", username, "ptr", password, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} storeLocation 
     * @param {BSTR} storeName 
     * @param {BSTR} findYype 
     * @param {VARIANT} findValue 
     * @returns {HRESULT} 
     */
    SetClientCertificateFromStore(storeLocation, storeName, findYype, findValue) {
        storeLocation := storeLocation is String ? BSTR.Alloc(storeLocation).Value : storeLocation
        storeName := storeName is String ? BSTR.Alloc(storeName).Value : storeName
        findYype := findYype is String ? BSTR.Alloc(findYype).Value : findYype

        result := ComCall(9, this, "ptr", storeLocation, "ptr", storeName, "ptr", findYype, "ptr", findValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} subjectName 
     * @param {BSTR} storeLocation 
     * @param {BSTR} storeName 
     * @returns {HRESULT} 
     */
    SetClientCertificateFromStoreByName(subjectName, storeLocation, storeName) {
        subjectName := subjectName is String ? BSTR.Alloc(subjectName).Value : subjectName
        storeLocation := storeLocation is String ? BSTR.Alloc(storeLocation).Value : storeLocation
        storeName := storeName is String ? BSTR.Alloc(storeName).Value : storeName

        result := ComCall(10, this, "ptr", subjectName, "ptr", storeLocation, "ptr", storeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} filename 
     * @param {BSTR} password 
     * @param {BSTR} keystorageFlags 
     * @returns {HRESULT} 
     */
    SetClientCertificateFromFile(filename, password, keystorageFlags) {
        filename := filename is String ? BSTR.Alloc(filename).Value : filename
        password := password is String ? BSTR.Alloc(password).Value : password
        keystorageFlags := keystorageFlags is String ? BSTR.Alloc(keystorageFlags).Value : keystorageFlags

        result := ComCall(11, this, "ptr", filename, "ptr", password, "ptr", keystorageFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} storeLocation 
     * @param {BSTR} storeName 
     * @param {BSTR} findType 
     * @param {VARIANT} findValue 
     * @returns {HRESULT} 
     */
    SetDefaultServiceCertificateFromStore(storeLocation, storeName, findType, findValue) {
        storeLocation := storeLocation is String ? BSTR.Alloc(storeLocation).Value : storeLocation
        storeName := storeName is String ? BSTR.Alloc(storeName).Value : storeName
        findType := findType is String ? BSTR.Alloc(findType).Value : findType

        result := ComCall(12, this, "ptr", storeLocation, "ptr", storeName, "ptr", findType, "ptr", findValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} subjectName 
     * @param {BSTR} storeLocation 
     * @param {BSTR} storeName 
     * @returns {HRESULT} 
     */
    SetDefaultServiceCertificateFromStoreByName(subjectName, storeLocation, storeName) {
        subjectName := subjectName is String ? BSTR.Alloc(subjectName).Value : subjectName
        storeLocation := storeLocation is String ? BSTR.Alloc(storeLocation).Value : storeLocation
        storeName := storeName is String ? BSTR.Alloc(storeName).Value : storeName

        result := ComCall(13, this, "ptr", subjectName, "ptr", storeLocation, "ptr", storeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} filename 
     * @param {BSTR} password 
     * @param {BSTR} keystorageFlags 
     * @returns {HRESULT} 
     */
    SetDefaultServiceCertificateFromFile(filename, password, keystorageFlags) {
        filename := filename is String ? BSTR.Alloc(filename).Value : filename
        password := password is String ? BSTR.Alloc(password).Value : password
        keystorageFlags := keystorageFlags is String ? BSTR.Alloc(keystorageFlags).Value : keystorageFlags

        result := ComCall(14, this, "ptr", filename, "ptr", password, "ptr", keystorageFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} storeLocation 
     * @param {BSTR} revocationMode 
     * @param {BSTR} certificateValidationMode 
     * @returns {HRESULT} 
     */
    SetServiceCertificateAuthentication(storeLocation, revocationMode, certificateValidationMode) {
        storeLocation := storeLocation is String ? BSTR.Alloc(storeLocation).Value : storeLocation
        revocationMode := revocationMode is String ? BSTR.Alloc(revocationMode).Value : revocationMode
        certificateValidationMode := certificateValidationMode is String ? BSTR.Alloc(certificateValidationMode).Value : certificateValidationMode

        result := ComCall(15, this, "ptr", storeLocation, "ptr", revocationMode, "ptr", certificateValidationMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} localIssuerAddres 
     * @param {BSTR} localIssuerBindingType 
     * @param {BSTR} localIssuerBinding 
     * @returns {HRESULT} 
     */
    SetIssuedToken(localIssuerAddres, localIssuerBindingType, localIssuerBinding) {
        localIssuerAddres := localIssuerAddres is String ? BSTR.Alloc(localIssuerAddres).Value : localIssuerAddres
        localIssuerBindingType := localIssuerBindingType is String ? BSTR.Alloc(localIssuerBindingType).Value : localIssuerBindingType
        localIssuerBinding := localIssuerBinding is String ? BSTR.Alloc(localIssuerBinding).Value : localIssuerBinding

        result := ComCall(16, this, "ptr", localIssuerAddres, "ptr", localIssuerBindingType, "ptr", localIssuerBinding, "HRESULT")
        return result
    }
}
