#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICertificateStore.ahk
#Include .\ICertificateStore2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a certificate store for an app.
 * @remarks
 * You can retrieve certificates from the certificate store using the [FindAllAsync](certificatestores_findallasync_1029446703.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatestore
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class CertificateStore extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICertificateStore

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICertificateStore.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the certificate store.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatestore.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Adds a certificate to the certificate store.
     * @param {Certificate} certificate_ The certificate to add to the certificate store.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatestore.add
     */
    Add(certificate_) {
        if (!this.HasProp("__ICertificateStore")) {
            if ((queryResult := this.QueryInterface(ICertificateStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateStore := ICertificateStore(outPtr)
        }

        return this.__ICertificateStore.Add(certificate_)
    }

    /**
     * Deletes a certificate from the certificate store.
     * @param {Certificate} certificate_ The certificate to delete from the certificate store.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.certificatestore.delete
     */
    Delete(certificate_) {
        if (!this.HasProp("__ICertificateStore")) {
            if ((queryResult := this.QueryInterface(ICertificateStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateStore := ICertificateStore(outPtr)
        }

        return this.__ICertificateStore.Delete(certificate_)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__ICertificateStore2")) {
            if ((queryResult := this.QueryInterface(ICertificateStore2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICertificateStore2 := ICertificateStore2(outPtr)
        }

        return this.__ICertificateStore2.get_Name()
    }

;@endregion Instance Methods
}
