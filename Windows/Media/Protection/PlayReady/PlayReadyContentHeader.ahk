#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayReadyContentHeader.ahk
#Include .\IPlayReadyContentHeader2.ahk
#Include .\IPlayReadyContentHeaderFactory2.ahk
#Include .\IPlayReadyContentHeaderFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents the information in a PlayReady content header.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadycontentheader
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadyContentHeader extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlayReadyContentHeader

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlayReadyContentHeader.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} contentKeyIds_length 
     * @param {Pointer<Guid>} contentKeyIds 
     * @param {Integer} contentKeyIdStrings_length 
     * @param {Pointer<HSTRING>} contentKeyIdStrings 
     * @param {Integer} contentEncryptionAlgorithm 
     * @param {Uri} licenseAcquisitionUrl 
     * @param {Uri} licenseAcquisitionUserInterfaceUrl 
     * @param {HSTRING} customAttributes 
     * @param {Guid} domainServiceId 
     * @returns {PlayReadyContentHeader} 
     */
    static CreateInstanceFromComponents2(dwFlags, contentKeyIds_length, contentKeyIds, contentKeyIdStrings_length, contentKeyIdStrings, contentEncryptionAlgorithm, licenseAcquisitionUrl, licenseAcquisitionUserInterfaceUrl, customAttributes, domainServiceId) {
        if (!PlayReadyContentHeader.HasProp("__IPlayReadyContentHeaderFactory2")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyContentHeader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyContentHeaderFactory2.IID)
            PlayReadyContentHeader.__IPlayReadyContentHeaderFactory2 := IPlayReadyContentHeaderFactory2(factoryPtr)
        }

        return PlayReadyContentHeader.__IPlayReadyContentHeaderFactory2.CreateInstanceFromComponents2(dwFlags, contentKeyIds_length, contentKeyIds, contentKeyIdStrings_length, contentKeyIdStrings, contentEncryptionAlgorithm, licenseAcquisitionUrl, licenseAcquisitionUserInterfaceUrl, customAttributes, domainServiceId)
    }

    /**
     * 
     * @param {Integer} headerBytes_length 
     * @param {Pointer<Integer>} headerBytes 
     * @param {Uri} licenseAcquisitionUrl 
     * @param {Uri} licenseAcquisitionUserInterfaceUrl 
     * @param {HSTRING} customAttributes 
     * @param {Guid} domainServiceId 
     * @returns {PlayReadyContentHeader} 
     */
    static CreateInstanceFromWindowsMediaDrmHeader(headerBytes_length, headerBytes, licenseAcquisitionUrl, licenseAcquisitionUserInterfaceUrl, customAttributes, domainServiceId) {
        if (!PlayReadyContentHeader.HasProp("__IPlayReadyContentHeaderFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyContentHeader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyContentHeaderFactory.IID)
            PlayReadyContentHeader.__IPlayReadyContentHeaderFactory := IPlayReadyContentHeaderFactory(factoryPtr)
        }

        return PlayReadyContentHeader.__IPlayReadyContentHeaderFactory.CreateInstanceFromWindowsMediaDrmHeader(headerBytes_length, headerBytes, licenseAcquisitionUrl, licenseAcquisitionUserInterfaceUrl, customAttributes, domainServiceId)
    }

    /**
     * Initializes a new instance of the [PlayReadyContentHeader](playreadycontentheader.md) class.
     * @remarks
     * The *contentKeyId* and *domainServiceId* parameters are sensitive to the underlying platform's endianness. Carefully test your app on all platforms you intend to support to ensure that correct endianness is used on each platform.
     * 
     * Starting with Windows 10, version 1709, you can specify [PlayReadyEncryptionAlgorithm.Aes128Cbc](/uwp/api/windows.media.protection.playready.playreadyencryptionalgorithm), for AES128CBC encryption, or [PlayReadyEncryptionAlgorithm.Unspecified](/uwp/api/windows.media.protection.playready.playreadyencryptionalgorithm), to allow the server backend to determine the encryption type, as the value for the *contentEncryptionAlgorithm* parameter. On previous versions of Windows 10, specifying either of these values will cause an exception to be thrown. For this reason, you should check for the presence of the enumeration value by calling **[ApiInformationIsApiContractPresent](/uwp/api/windows.foundation.metadata.apiinformation#Windows_Foundation_Metadata_ApiInformation_IsApiContractPresent_System_String_System_UInt16_)** and specifying major contract version 5 before using the new enum values in the constructor call.
     * 
     * ```csharp
     * bool supportsAes128CbcAndUnspecified = ApiInformation.IsApiContractPresent("Windows.Foundation.UniversalApiContract", 5);
     * 
     * if (supportsAes128CbcAndUnspecified)
     * {
     *     // Guid and URL below are known by app, obtaining them is out of scope
     *     PlayReadyContentHeader header = new PlayReadyContentHeader(
     *         new Guid("{6591a70e-06fc-4d1f-862a-80bb569f07da}"),
     *         null,
     *         PlayReadyEncryptionAlgorithm.Unspecified,
     *         new Uri("http://www.contoso.com/rightsmanager.aspx"),
     *         null,
     *         null,
     *         new Guid("{215304E7-9263-446A-B150-0754D5E18973}"));
     *   
     *     var request = PlayReadyContentResolver.ServiceRequest(header);
     *     await request.BeginServiceRequest();
     * }
     * else
     * {
     *     // Application chooses behavior, for example, picks different content
     *     // or tells user that their system doesn’t support the selected content
     * }
     * ```
     * @param {Guid} contentKeyId Identifier of the content encryption key.
     * @param {HSTRING} contentKeyIdString String representation of the content key. If the *contentKeyId* parameter is specified, then this parameter is ignored.
     * @param {Integer} contentEncryptionAlgorithm Encryption algorithm type used to encrypt the content.
     * @param {Uri} licenseAcquisitionUrl The URL for the silent (no user interaction) license acquisition Web service.
     * @param {Uri} licenseAcquisitionUserInterfaceUrl The URL for a non-silent license acquisition Web page.
     * @param {HSTRING} customAttributes Contains custom data used by the content provider. The content author can add arbitrary XML inside this element. Microsoft code does not act on any data contained inside this element.
     * @param {Guid} domainServiceId Service identifier for the domain service.
     * @returns {PlayReadyContentHeader} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadycontentheader.#ctor
     */
    static CreateInstanceFromComponents(contentKeyId, contentKeyIdString, contentEncryptionAlgorithm, licenseAcquisitionUrl, licenseAcquisitionUserInterfaceUrl, customAttributes, domainServiceId) {
        if (!PlayReadyContentHeader.HasProp("__IPlayReadyContentHeaderFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyContentHeader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyContentHeaderFactory.IID)
            PlayReadyContentHeader.__IPlayReadyContentHeaderFactory := IPlayReadyContentHeaderFactory(factoryPtr)
        }

        return PlayReadyContentHeader.__IPlayReadyContentHeaderFactory.CreateInstanceFromComponents(contentKeyId, contentKeyIdString, contentEncryptionAlgorithm, licenseAcquisitionUrl, licenseAcquisitionUserInterfaceUrl, customAttributes, domainServiceId)
    }

    /**
     * 
     * @param {Integer} headerBytes_length 
     * @param {Pointer<Integer>} headerBytes 
     * @returns {PlayReadyContentHeader} 
     */
    static CreateInstanceFromPlayReadyHeader(headerBytes_length, headerBytes) {
        if (!PlayReadyContentHeader.HasProp("__IPlayReadyContentHeaderFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyContentHeader")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyContentHeaderFactory.IID)
            PlayReadyContentHeader.__IPlayReadyContentHeaderFactory := IPlayReadyContentHeaderFactory(factoryPtr)
        }

        return PlayReadyContentHeader.__IPlayReadyContentHeaderFactory.CreateInstanceFromPlayReadyHeader(headerBytes_length, headerBytes)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the content key identifier value if it is set.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadycontentheader.keyid
     * @type {Guid} 
     */
    KeyId {
        get => this.get_KeyId()
    }

    /**
     * Gets the content key identifier string value if it is set.
     * @remarks
     * This property returns the KeyId value as a string. In most cases this value is a Base-64 encoding of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) KeyId. In some situations this value may be a non-GUID conforming string that is used for compatibility with Windows Media Digital Rights Management (WMDRM).
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadycontentheader.keyidstring
     * @type {HSTRING} 
     */
    KeyIdString {
        get => this.get_KeyIdString()
    }

    /**
     * Gets the license acquisition URL in the header if it is set.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadycontentheader.licenseacquisitionurl
     * @type {Uri} 
     */
    LicenseAcquisitionUrl {
        get => this.get_LicenseAcquisitionUrl()
    }

    /**
     * Gets the license acquisition user interface URL in the header if it is set.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadycontentheader.licenseacquisitionuserinterfaceurl
     * @type {Uri} 
     */
    LicenseAcquisitionUserInterfaceUrl {
        get => this.get_LicenseAcquisitionUserInterfaceUrl()
    }

    /**
     * Gets the domain service identifier in the header if it is set.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadycontentheader.domainserviceid
     * @type {Guid} 
     */
    DomainServiceId {
        get => this.get_DomainServiceId()
    }

    /**
     * Gets the content encryption type in the header if it is set.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadycontentheader.encryptiontype
     * @type {Integer} 
     */
    EncryptionType {
        get => this.get_EncryptionType()
    }

    /**
     * Gets the custom data used by the content provider.
     * @remarks
     * The content author can add arbitrary XML inside this element. Microsoft code does not act on any data contained inside this element.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadycontentheader.customattributes
     * @type {HSTRING} 
     */
    CustomAttributes {
        get => this.get_CustomAttributes()
    }

    /**
     * Gets the decryptor setup value in the header if it is set.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadycontentheader.decryptorsetup
     * @type {Integer} 
     */
    DecryptorSetup {
        get => this.get_DecryptorSetup()
    }

    /**
     * Gets a new content header that contains any embedded license updates that were available.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadycontentheader.headerwithembeddedupdates
     * @type {PlayReadyContentHeader} 
     */
    HeaderWithEmbeddedUpdates {
        get => this.get_HeaderWithEmbeddedUpdates()
    }

    /**
     * Gets the content key identifier values if they are set.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadycontentheader.keyids
     */
    KeyIds {
        get => this.get_KeyIds()
    }

    /**
     * Gets the content key identifier string values if they are set.
     * @remarks
     * This property returns the KeyId values as strings. In most cases these are a Base-64 encodings of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) KeyIds. In some situations they may be non-GUID conforming strings that for compatibility with WMDRM. The non-GUID case will never occur when more than one key identifier is present.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadycontentheader.keyidstrings
     */
    KeyIdStrings {
        get => this.get_KeyIdStrings()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_KeyId() {
        if (!this.HasProp("__IPlayReadyContentHeader")) {
            if ((queryResult := this.QueryInterface(IPlayReadyContentHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyContentHeader := IPlayReadyContentHeader(outPtr)
        }

        return this.__IPlayReadyContentHeader.get_KeyId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KeyIdString() {
        if (!this.HasProp("__IPlayReadyContentHeader")) {
            if ((queryResult := this.QueryInterface(IPlayReadyContentHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyContentHeader := IPlayReadyContentHeader(outPtr)
        }

        return this.__IPlayReadyContentHeader.get_KeyIdString()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_LicenseAcquisitionUrl() {
        if (!this.HasProp("__IPlayReadyContentHeader")) {
            if ((queryResult := this.QueryInterface(IPlayReadyContentHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyContentHeader := IPlayReadyContentHeader(outPtr)
        }

        return this.__IPlayReadyContentHeader.get_LicenseAcquisitionUrl()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_LicenseAcquisitionUserInterfaceUrl() {
        if (!this.HasProp("__IPlayReadyContentHeader")) {
            if ((queryResult := this.QueryInterface(IPlayReadyContentHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyContentHeader := IPlayReadyContentHeader(outPtr)
        }

        return this.__IPlayReadyContentHeader.get_LicenseAcquisitionUserInterfaceUrl()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DomainServiceId() {
        if (!this.HasProp("__IPlayReadyContentHeader")) {
            if ((queryResult := this.QueryInterface(IPlayReadyContentHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyContentHeader := IPlayReadyContentHeader(outPtr)
        }

        return this.__IPlayReadyContentHeader.get_DomainServiceId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EncryptionType() {
        if (!this.HasProp("__IPlayReadyContentHeader")) {
            if ((queryResult := this.QueryInterface(IPlayReadyContentHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyContentHeader := IPlayReadyContentHeader(outPtr)
        }

        return this.__IPlayReadyContentHeader.get_EncryptionType()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CustomAttributes() {
        if (!this.HasProp("__IPlayReadyContentHeader")) {
            if ((queryResult := this.QueryInterface(IPlayReadyContentHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyContentHeader := IPlayReadyContentHeader(outPtr)
        }

        return this.__IPlayReadyContentHeader.get_CustomAttributes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DecryptorSetup() {
        if (!this.HasProp("__IPlayReadyContentHeader")) {
            if ((queryResult := this.QueryInterface(IPlayReadyContentHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyContentHeader := IPlayReadyContentHeader(outPtr)
        }

        return this.__IPlayReadyContentHeader.get_DecryptorSetup()
    }

    /**
     * Retrieves the full PlayReady object as a byte array.
     * @param {Pointer<Pointer>} headerBytes 
     * @returns {HRESULT} The header containing the full PlayReady object.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadycontentheader.getserializedheader
     */
    GetSerializedHeader(headerBytes) {
        if (!this.HasProp("__IPlayReadyContentHeader")) {
            if ((queryResult := this.QueryInterface(IPlayReadyContentHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyContentHeader := IPlayReadyContentHeader(outPtr)
        }

        return this.__IPlayReadyContentHeader.GetSerializedHeader(headerBytes)
    }

    /**
     * 
     * @returns {PlayReadyContentHeader} 
     */
    get_HeaderWithEmbeddedUpdates() {
        if (!this.HasProp("__IPlayReadyContentHeader")) {
            if ((queryResult := this.QueryInterface(IPlayReadyContentHeader.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyContentHeader := IPlayReadyContentHeader(outPtr)
        }

        return this.__IPlayReadyContentHeader.get_HeaderWithEmbeddedUpdates()
    }

    /**
     * 
     * @param {Pointer<Pointer>} contentKeyIds 
     * @returns {HRESULT} 
     */
    get_KeyIds(contentKeyIds) {
        if (!this.HasProp("__IPlayReadyContentHeader2")) {
            if ((queryResult := this.QueryInterface(IPlayReadyContentHeader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyContentHeader2 := IPlayReadyContentHeader2(outPtr)
        }

        return this.__IPlayReadyContentHeader2.get_KeyIds(contentKeyIds)
    }

    /**
     * 
     * @param {Pointer<Pointer>} contentKeyIdStrings 
     * @returns {HRESULT} 
     */
    get_KeyIdStrings(contentKeyIdStrings) {
        if (!this.HasProp("__IPlayReadyContentHeader2")) {
            if ((queryResult := this.QueryInterface(IPlayReadyContentHeader2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlayReadyContentHeader2 := IPlayReadyContentHeader2(outPtr)
        }

        return this.__IPlayReadyContentHeader2.get_KeyIdStrings(contentKeyIdStrings)
    }

;@endregion Instance Methods
}
