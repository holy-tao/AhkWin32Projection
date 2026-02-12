#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include .\CertificateChain.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Foundation\DateTime.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Returns a BasicConstraints object that represents the basic constraints extension of the certificate.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/SecCrypto/certificate-basicconstraints
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICertificate extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificate
     * @type {Guid}
     */
    static IID => Guid("{333f740c-04d8-43b3-b278-8c5fcc9be5a0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BuildChainAsync", "BuildChainWithParametersAsync", "get_SerialNumber", "GetHashValue", "GetHashValueWithAlgorithm", "GetCertificateBlob", "get_Subject", "get_Issuer", "get_HasPrivateKey", "get_IsStronglyProtected", "get_ValidFrom", "get_ValidTo", "get_EnhancedKeyUsages", "put_FriendlyName", "get_FriendlyName"]

    /**
     */
    SerialNumber {
        get => this.get_SerialNumber()
    }

    /**
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
    }

    /**
     * @type {HSTRING} 
     */
    Issuer {
        get => this.get_Issuer()
    }

    /**
     * @type {Boolean} 
     */
    HasPrivateKey {
        get => this.get_HasPrivateKey()
    }

    /**
     * @type {Boolean} 
     */
    IsStronglyProtected {
        get => this.get_IsStronglyProtected()
    }

    /**
     * @type {DateTime} 
     */
    ValidFrom {
        get => this.get_ValidFrom()
    }

    /**
     * @type {DateTime} 
     */
    ValidTo {
        get => this.get_ValidTo()
    }

    /**
     * @type {IVectorView<HSTRING>} 
     */
    EnhancedKeyUsages {
        get => this.get_EnhancedKeyUsages()
    }

    /**
     * @type {HSTRING} 
     */
    FriendlyName {
        get => this.get_FriendlyName()
        set => this.put_FriendlyName(value)
    }

    /**
     * 
     * @param {IIterable<Certificate>} certificates 
     * @returns {IAsyncOperation<CertificateChain>} 
     */
    BuildChainAsync(certificates) {
        result := ComCall(6, this, "ptr", certificates, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CertificateChain, value)
    }

    /**
     * 
     * @param {IIterable<Certificate>} certificates 
     * @param {ChainBuildingParameters} parameters 
     * @returns {IAsyncOperation<CertificateChain>} 
     */
    BuildChainWithParametersAsync(certificates, parameters) {
        result := ComCall(7, this, "ptr", certificates, "ptr", parameters, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(CertificateChain, value)
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_SerialNumber(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    GetHashValue(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} hashAlgorithmName 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    GetHashValueWithAlgorithm(hashAlgorithmName, value) {
        if(hashAlgorithmName is String) {
            pin := HSTRING.Create(hashAlgorithmName)
            hashAlgorithmName := pin.Value
        }
        hashAlgorithmName := hashAlgorithmName is Win32Handle ? NumGet(hashAlgorithmName, "ptr") : hashAlgorithmName

        result := ComCall(10, this, "ptr", hashAlgorithmName, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    GetCertificateBlob() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Issuer() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasPrivateKey() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStronglyProtected() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ValidFrom() {
        value := DateTime()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ValidTo() {
        value := DateTime()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_EnhancedKeyUsages() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_FriendlyName(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FriendlyName() {
        value := HSTRING()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
