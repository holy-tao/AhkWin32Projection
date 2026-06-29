#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.System.Com.ChannelCredentials
 */
export default struct IChannelCredentials extends IDispatch {
    /**
     * The interface identifier for IChannelCredentials
     * @type {Guid}
     */
    static IID := Guid("{181b448c-c17c-4b17-ac6d-06699b93198f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IChannelCredentials interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        SetWindowsCredential                        : IntPtr
        SetUserNameCredential                       : IntPtr
        SetClientCertificateFromStore               : IntPtr
        SetClientCertificateFromStoreByName         : IntPtr
        SetClientCertificateFromFile                : IntPtr
        SetDefaultServiceCertificateFromStore       : IntPtr
        SetDefaultServiceCertificateFromStoreByName : IntPtr
        SetDefaultServiceCertificateFromFile        : IntPtr
        SetServiceCertificateAuthentication         : IntPtr
        SetIssuedToken                              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IChannelCredentials.Vtbl()
        }
        super.__New(implObj, flags)
    }

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

        result := ComCall(7, this, BSTR, domain, BSTR, username, BSTR, password, "int", impersonationLevel, BOOL, allowNtlm, "HRESULT")
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

        result := ComCall(8, this, BSTR, username, BSTR, password, "HRESULT")
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

        result := ComCall(9, this, BSTR, storeLocation, BSTR, storeName, BSTR, findYype, VARIANT, findValue, "HRESULT")
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

        result := ComCall(10, this, BSTR, subjectName, BSTR, storeLocation, BSTR, storeName, "HRESULT")
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

        result := ComCall(11, this, BSTR, filename, BSTR, password, BSTR, keystorageFlags, "HRESULT")
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

        result := ComCall(12, this, BSTR, storeLocation, BSTR, storeName, BSTR, findType, VARIANT, findValue, "HRESULT")
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

        result := ComCall(13, this, BSTR, subjectName, BSTR, storeLocation, BSTR, storeName, "HRESULT")
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

        result := ComCall(14, this, BSTR, filename, BSTR, password, BSTR, keystorageFlags, "HRESULT")
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

        result := ComCall(15, this, BSTR, storeLocation, BSTR, revocationMode, BSTR, certificateValidationMode, "HRESULT")
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

        result := ComCall(16, this, BSTR, localIssuerAddres, BSTR, localIssuerBindingType, BSTR, localIssuerBinding, "HRESULT")
        return result
    }

    Query(iid) {
        if (IChannelCredentials.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetWindowsCredential := CallbackCreate(GetMethod(implObj, "SetWindowsCredential"), flags, 6)
        this.vtbl.SetUserNameCredential := CallbackCreate(GetMethod(implObj, "SetUserNameCredential"), flags, 3)
        this.vtbl.SetClientCertificateFromStore := CallbackCreate(GetMethod(implObj, "SetClientCertificateFromStore"), flags, 5)
        this.vtbl.SetClientCertificateFromStoreByName := CallbackCreate(GetMethod(implObj, "SetClientCertificateFromStoreByName"), flags, 4)
        this.vtbl.SetClientCertificateFromFile := CallbackCreate(GetMethod(implObj, "SetClientCertificateFromFile"), flags, 4)
        this.vtbl.SetDefaultServiceCertificateFromStore := CallbackCreate(GetMethod(implObj, "SetDefaultServiceCertificateFromStore"), flags, 5)
        this.vtbl.SetDefaultServiceCertificateFromStoreByName := CallbackCreate(GetMethod(implObj, "SetDefaultServiceCertificateFromStoreByName"), flags, 4)
        this.vtbl.SetDefaultServiceCertificateFromFile := CallbackCreate(GetMethod(implObj, "SetDefaultServiceCertificateFromFile"), flags, 4)
        this.vtbl.SetServiceCertificateAuthentication := CallbackCreate(GetMethod(implObj, "SetServiceCertificateAuthentication"), flags, 4)
        this.vtbl.SetIssuedToken := CallbackCreate(GetMethod(implObj, "SetIssuedToken"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetWindowsCredential)
        CallbackFree(this.vtbl.SetUserNameCredential)
        CallbackFree(this.vtbl.SetClientCertificateFromStore)
        CallbackFree(this.vtbl.SetClientCertificateFromStoreByName)
        CallbackFree(this.vtbl.SetClientCertificateFromFile)
        CallbackFree(this.vtbl.SetDefaultServiceCertificateFromStore)
        CallbackFree(this.vtbl.SetDefaultServiceCertificateFromStoreByName)
        CallbackFree(this.vtbl.SetDefaultServiceCertificateFromFile)
        CallbackFree(this.vtbl.SetServiceCertificateAuthentication)
        CallbackFree(this.vtbl.SetIssuedToken)
    }
}
