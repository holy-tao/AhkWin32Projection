#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUserCertificateStore.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a user certificate store.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.usercertificatestore
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class UserCertificateStore extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUserCertificateStore

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUserCertificateStore.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the name of the store.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.usercertificatestore.name
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
     * Requests to add a certificate to the store.
     * @param {Certificate} certificate_ The certificate to add.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.usercertificatestore.requestaddasync
     */
    RequestAddAsync(certificate_) {
        if (!this.HasProp("__IUserCertificateStore")) {
            if ((queryResult := this.QueryInterface(IUserCertificateStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserCertificateStore := IUserCertificateStore(outPtr)
        }

        return this.__IUserCertificateStore.RequestAddAsync(certificate_)
    }

    /**
     * Requests to delete a certificate from the store.
     * @param {Certificate} certificate_ The certificate to delete.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.usercertificatestore.requestdeleteasync
     */
    RequestDeleteAsync(certificate_) {
        if (!this.HasProp("__IUserCertificateStore")) {
            if ((queryResult := this.QueryInterface(IUserCertificateStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserCertificateStore := IUserCertificateStore(outPtr)
        }

        return this.__IUserCertificateStore.RequestDeleteAsync(certificate_)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IUserCertificateStore")) {
            if ((queryResult := this.QueryInterface(IUserCertificateStore.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUserCertificateStore := IUserCertificateStore(outPtr)
        }

        return this.__IUserCertificateStore.get_Name()
    }

;@endregion Instance Methods
}
