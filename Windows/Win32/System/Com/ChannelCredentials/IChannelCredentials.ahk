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
        if(domain is String) {
            pin := BSTR.Alloc(domain)
            domain := pin.Value
        }
        if(username is String) {
            pin := BSTR.Alloc(username)
            username := pin.Value
        }
        if(password is String) {
            pin := BSTR.Alloc(password)
            password := pin.Value
        }

        result := ComCall(7, this, "ptr", domain, "ptr", username, "ptr", password, "int", impersonationLevel, "int", allowNtlm, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} username 
     * @param {BSTR} password 
     * @returns {HRESULT} 
     */
    SetUserNameCredential(username, password) {
        if(username is String) {
            pin := BSTR.Alloc(username)
            username := pin.Value
        }
        if(password is String) {
            pin := BSTR.Alloc(password)
            password := pin.Value
        }

        result := ComCall(8, this, "ptr", username, "ptr", password, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(storeLocation is String) {
            pin := BSTR.Alloc(storeLocation)
            storeLocation := pin.Value
        }
        if(storeName is String) {
            pin := BSTR.Alloc(storeName)
            storeName := pin.Value
        }
        if(findYype is String) {
            pin := BSTR.Alloc(findYype)
            findYype := pin.Value
        }

        result := ComCall(9, this, "ptr", storeLocation, "ptr", storeName, "ptr", findYype, "ptr", findValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(subjectName is String) {
            pin := BSTR.Alloc(subjectName)
            subjectName := pin.Value
        }
        if(storeLocation is String) {
            pin := BSTR.Alloc(storeLocation)
            storeLocation := pin.Value
        }
        if(storeName is String) {
            pin := BSTR.Alloc(storeName)
            storeName := pin.Value
        }

        result := ComCall(10, this, "ptr", subjectName, "ptr", storeLocation, "ptr", storeName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(filename is String) {
            pin := BSTR.Alloc(filename)
            filename := pin.Value
        }
        if(password is String) {
            pin := BSTR.Alloc(password)
            password := pin.Value
        }
        if(keystorageFlags is String) {
            pin := BSTR.Alloc(keystorageFlags)
            keystorageFlags := pin.Value
        }

        result := ComCall(11, this, "ptr", filename, "ptr", password, "ptr", keystorageFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(storeLocation is String) {
            pin := BSTR.Alloc(storeLocation)
            storeLocation := pin.Value
        }
        if(storeName is String) {
            pin := BSTR.Alloc(storeName)
            storeName := pin.Value
        }
        if(findType is String) {
            pin := BSTR.Alloc(findType)
            findType := pin.Value
        }

        result := ComCall(12, this, "ptr", storeLocation, "ptr", storeName, "ptr", findType, "ptr", findValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(subjectName is String) {
            pin := BSTR.Alloc(subjectName)
            subjectName := pin.Value
        }
        if(storeLocation is String) {
            pin := BSTR.Alloc(storeLocation)
            storeLocation := pin.Value
        }
        if(storeName is String) {
            pin := BSTR.Alloc(storeName)
            storeName := pin.Value
        }

        result := ComCall(13, this, "ptr", subjectName, "ptr", storeLocation, "ptr", storeName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(filename is String) {
            pin := BSTR.Alloc(filename)
            filename := pin.Value
        }
        if(password is String) {
            pin := BSTR.Alloc(password)
            password := pin.Value
        }
        if(keystorageFlags is String) {
            pin := BSTR.Alloc(keystorageFlags)
            keystorageFlags := pin.Value
        }

        result := ComCall(14, this, "ptr", filename, "ptr", password, "ptr", keystorageFlags, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(storeLocation is String) {
            pin := BSTR.Alloc(storeLocation)
            storeLocation := pin.Value
        }
        if(revocationMode is String) {
            pin := BSTR.Alloc(revocationMode)
            revocationMode := pin.Value
        }
        if(certificateValidationMode is String) {
            pin := BSTR.Alloc(certificateValidationMode)
            certificateValidationMode := pin.Value
        }

        result := ComCall(15, this, "ptr", storeLocation, "ptr", revocationMode, "ptr", certificateValidationMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
        if(localIssuerAddres is String) {
            pin := BSTR.Alloc(localIssuerAddres)
            localIssuerAddres := pin.Value
        }
        if(localIssuerBindingType is String) {
            pin := BSTR.Alloc(localIssuerBindingType)
            localIssuerBindingType := pin.Value
        }
        if(localIssuerBinding is String) {
            pin := BSTR.Alloc(localIssuerBinding)
            localIssuerBinding := pin.Value
        }

        result := ComCall(16, this, "ptr", localIssuerAddres, "ptr", localIssuerBindingType, "ptr", localIssuerBinding, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
