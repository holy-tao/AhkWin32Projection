#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICmsAttachedSignature.ahk
#Include .\ICmsAttachedSignatureStatics.ahk
#Include .\ICmsAttachedSignatureFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a signature attached to a signed CMS message.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmsattachedsignature
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class CmsAttachedSignature extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICmsAttachedSignature

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICmsAttachedSignature.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Signs the specified input data using the specified signer information and creates an attached signed CMS message.
     * @param {IBuffer} data The input data to be signed.
     * @param {IIterable<CmsSignerInfo>} signers The signer information used to compute the signature.
     * @param {IIterable<Certificate>} certificates The list of certificates to build the chain for the signer certificates.
     * @returns {IAsyncOperation<IBuffer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmsattachedsignature.generatesignatureasync
     */
    static GenerateSignatureAsync(data, signers, certificates) {
        if (!CmsAttachedSignature.HasProp("__ICmsAttachedSignatureStatics")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CmsAttachedSignature")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICmsAttachedSignatureStatics.IID)
            CmsAttachedSignature.__ICmsAttachedSignatureStatics := ICmsAttachedSignatureStatics(factoryPtr)
        }

        return CmsAttachedSignature.__ICmsAttachedSignatureStatics.GenerateSignatureAsync(data, signers, certificates)
    }

    /**
     * Creates a new instance of the [CmsAttachedSignature](cmsattachedsignature.md) class for the specified signed CMS message.
     * @param {IBuffer} inputBlob A signed CMS message blob.
     * @returns {CmsAttachedSignature} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmsattachedsignature.#ctor
     */
    static CreateCmsAttachedSignature(inputBlob) {
        if (!CmsAttachedSignature.HasProp("__ICmsAttachedSignatureFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.Cryptography.Certificates.CmsAttachedSignature")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICmsAttachedSignatureFactory.IID)
            CmsAttachedSignature.__ICmsAttachedSignatureFactory := ICmsAttachedSignatureFactory(factoryPtr)
        }

        return CmsAttachedSignature.__ICmsAttachedSignatureFactory.CreateCmsAttachedSignature(inputBlob)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the list of certificates that are used for chain building for the signer certificate.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmsattachedsignature.certificates
     * @type {IVectorView<Certificate>} 
     */
    Certificates {
        get => this.get_Certificates()
    }

    /**
     * Gets the content of the signed CMS message.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmsattachedsignature.content
     */
    Content {
        get => this.get_Content()
    }

    /**
     * Gets the list of signers that are used for creating or verifying the signature.
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmsattachedsignature.signers
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
        if (!this.HasProp("__ICmsAttachedSignature")) {
            if ((queryResult := this.QueryInterface(ICmsAttachedSignature.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICmsAttachedSignature := ICmsAttachedSignature(outPtr)
        }

        return this.__ICmsAttachedSignature.get_Certificates()
    }

    /**
     * 
     * @param {Pointer<Pointer>} value 
     * @returns {HRESULT} 
     */
    get_Content(value) {
        if (!this.HasProp("__ICmsAttachedSignature")) {
            if ((queryResult := this.QueryInterface(ICmsAttachedSignature.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICmsAttachedSignature := ICmsAttachedSignature(outPtr)
        }

        return this.__ICmsAttachedSignature.get_Content(value)
    }

    /**
     * 
     * @returns {IVectorView<CmsSignerInfo>} 
     */
    get_Signers() {
        if (!this.HasProp("__ICmsAttachedSignature")) {
            if ((queryResult := this.QueryInterface(ICmsAttachedSignature.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICmsAttachedSignature := ICmsAttachedSignature(outPtr)
        }

        return this.__ICmsAttachedSignature.get_Signers()
    }

    /**
     * Verifies the signature contained in the signed CMS message.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.cmsattachedsignature.verifysignature
     */
    VerifySignature() {
        if (!this.HasProp("__ICmsAttachedSignature")) {
            if ((queryResult := this.QueryInterface(ICmsAttachedSignature.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICmsAttachedSignature := ICmsAttachedSignature(outPtr)
        }

        return this.__ICmsAttachedSignature.VerifySignature()
    }

;@endregion Instance Methods
}
