#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\Certificate.ahk
#Include .\CertificateStore.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ICertificateStoresStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertificateStoresStatics
     * @type {Guid}
     */
    static IID => Guid("{fbecc739-c6fe-4de7-99cf-74c3e596e032}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindAllAsync", "FindAllWithQueryAsync", "get_TrustedRootCertificationAuthorities", "get_IntermediateCertificationAuthorities", "GetStoreByName"]

    /**
     * @type {CertificateStore} 
     */
    TrustedRootCertificationAuthorities {
        get => this.get_TrustedRootCertificationAuthorities()
    }

    /**
     * @type {CertificateStore} 
     */
    IntermediateCertificationAuthorities {
        get => this.get_IntermediateCertificationAuthorities()
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<Certificate>>} 
     */
    FindAllAsync() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, Certificate), value)
    }

    /**
     * 
     * @param {CertificateQuery} query 
     * @returns {IAsyncOperation<IVectorView<Certificate>>} 
     */
    FindAllWithQueryAsync(query) {
        result := ComCall(7, this, "ptr", query, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, Certificate), value)
    }

    /**
     * 
     * @returns {CertificateStore} 
     */
    get_TrustedRootCertificationAuthorities() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CertificateStore(value)
    }

    /**
     * 
     * @returns {CertificateStore} 
     */
    get_IntermediateCertificationAuthorities() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CertificateStore(value)
    }

    /**
     * 
     * @param {HSTRING} storeName 
     * @returns {CertificateStore} 
     */
    GetStoreByName(storeName) {
        if(storeName is String) {
            pin := HSTRING.Create(storeName)
            storeName := pin.Value
        }
        storeName := storeName is Win32Handle ? NumGet(storeName, "ptr") : storeName

        result := ComCall(10, this, "ptr", storeName, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CertificateStore(value)
    }
}
