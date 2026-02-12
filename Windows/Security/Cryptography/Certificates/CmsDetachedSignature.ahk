#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICmsDetachedSignature.ahk
#Include .\ICmsDetachedSignatureFactory.ahk
#Include .\ICmsDetachedSignatureStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a detached signature for a signed CMS message.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmsdetachedsignature
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class CmsDetachedSignature extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICmsDetachedSignature

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICmsDetachedSignature.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of the [CmsDetachedSignature](cmsdetachedsignature.md) class for the specified signed CMS message.
     * @param {IBuffer} inputBlob A signed CMS message blob.
     * @returns {CmsDetachedSignature} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmsdetachedsignature.#ctor
     */
    static CreateCmsDetachedSignature(inputBlob) {
        if (!CmsDetachedSignature.HasProp("__ICmsDetachedSignatureFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CmsDetachedSignature")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICmsDetachedSignatureFactory.IID)
            CmsDetachedSignature.__ICmsDetachedSignatureFactory := ICmsDetachedSignatureFactory(factoryPtr)
        }

        return CmsDetachedSignature.__ICmsDetachedSignatureFactory.CreateCmsDetachedSignature(inputBlob)
    }

    /**
     * Signs the specified input data using the specified signer information and creates a detached signed CMS message.
     * @param {IInputStream} data The input data to be signed.
     * @param {IIterable<CmsSignerInfo>} signers The signer information used to compute the signature.
     * @param {IIterable<Certificate>} certificates The list of certificates to build the chain for the signer certificates.
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmsdetachedsignature.generatesignatureasync
     */
    static GenerateSignatureAsync(data, signers, certificates) {
        if (!CmsDetachedSignature.HasProp("__ICmsDetachedSignatureStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CmsDetachedSignature")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICmsDetachedSignatureStatics.IID)
            CmsDetachedSignature.__ICmsDetachedSignatureStatics := ICmsDetachedSignatureStatics(factoryPtr)
        }

        return CmsDetachedSignature.__ICmsDetachedSignatureStatics.GenerateSignatureAsync(data, signers, certificates)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the list of certificates that are used for chain building for the signer certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmsdetachedsignature.certificates
     * @type {IVectorView<Certificate>} 
     */
    Certificates {
        get => this.get_Certificates()
    }

    /**
     * Gets the list of signers that are used for creating or verifying the signature.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmsdetachedsignature.signers
     * @type {IVectorView<CmsSignerInfo>} 
     */
    Signers {
        get => this.get_Signers()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<Certificate>} 
     */
    get_Certificates() {
        if (!this.HasProp("__ICmsDetachedSignature")) {
            if ((queryResult := this.QueryInterface(ICmsDetachedSignature.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICmsDetachedSignature := ICmsDetachedSignature(outPtr)
        }

        return this.__ICmsDetachedSignature.get_Certificates()
    }

    /**
     * 
     * @returns {IVectorView<CmsSignerInfo>} 
     */
    get_Signers() {
        if (!this.HasProp("__ICmsDetachedSignature")) {
            if ((queryResult := this.QueryInterface(ICmsDetachedSignature.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICmsDetachedSignature := ICmsDetachedSignature(outPtr)
        }

        return this.__ICmsDetachedSignature.get_Signers()
    }

    /**
     * Verifies a signed CMS message against the original streaming input.
     * @param {IInputStream} data The original input stream for the signed CMS message.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmsdetachedsignature.verifysignatureasync
     */
    VerifySignatureAsync(data) {
        if (!this.HasProp("__ICmsDetachedSignature")) {
            if ((queryResult := this.QueryInterface(ICmsDetachedSignature.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICmsDetachedSignature := ICmsDetachedSignature(outPtr)
        }

        return this.__ICmsDetachedSignature.VerifySignatureAsync(data)
    }

;@endregion Instance Methods
}
