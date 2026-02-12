#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlayReadyStatics5.ahk
#Include .\IPlayReadyStatics4.ahk
#Include .\IPlayReadyStatics3.ahk
#Include .\IPlayReadyStatics.ahk
#Include .\IPlayReadyStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides support for returning static or constant data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadystatics
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadyStatics extends IInspectable {
;@region Static Properties
    /**
     * Queries the date and time at which hardware digital rights management (DRM) was temporarily disabled on the system.
     * @remarks
     * When the CheckSupportedHardware property returns false when querying the HardwareDRM feature, it is possible that this occurs because the feature was temporarily disabled due to a system component requiring an update, for example, a graphics driver.  This property indicates whether this occurred and, if so, when it occurred.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadystatics.hardwaredrmdisabledattime
     * @type {IReference<DateTime>} 
     */
    static HardwareDRMDisabledAtTime {
        get => PlayReadyStatics.get_HardwareDRMDisabledAtTime()
    }

    /**
     * Queries the date and time at which hardware digital rights management (DRM) will be re-enabled after it was temporarily disabled on the system.
     * @remarks
     * When the CheckSupportedHardware property returns false when querying the HardwareDRM feature, it is possible that this occurs because the feature was temporarily disabled due to a system component requiring an update, for example, a graphics driver.  This property indicates whether this occurred and, if so, when it will automatically be re-enabled.  If the system component has not been updated, it will automatically get re-disabled and both this property and the HardwareDRMDisabledAtTime property will begin returning updated values.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadystatics.hardwaredrmdisableduntiltime
     * @type {IReference<DateTime>} 
     */
    static HardwareDRMDisabledUntilTime {
        get => PlayReadyStatics.get_HardwareDRMDisabledUntilTime()
    }

    /**
     * Gets the PlayReady Trusted Input activation string.
     * @remarks
     * Previous releases of the PlayReady API required callers to hard-code a well-known string and [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) in their code. These APIs provide those values to the caller so they can request them rather than hard-coding them.
     * 
     * In the [MediaProtectionManager.Properties](/uwp/api/windows.media.protection.mediaprotectionmanager.properties) property (a [PropertySet](/uwp/api/windows.foundation.collections.propertyset) object), the "Windows.Media.Protection.MediaProtectionSystemIdMapping" string maps to another **PropertySet**. This in turn will typically have the string "Windows.Media.Protection.PlayReady.PlayReadyStatics.MediaProtectionSystemId" map to **Windows.Media.Protection.PlayReady.PlayReadyStatics.InputTrustAuthorityToCreate**.
     * 
     * [!code-csharp[SnippetSetUpMediaProtectionManager](../windows.media.protection.playready/code/PlayReadyStatics/csharp/MainPage.xaml.cs#SnippetSetUpMediaProtectionManager)]
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadystatics.inputtrustauthoritytocreate
     * @type {HSTRING} 
     */
    static InputTrustAuthorityToCreate {
        get => PlayReadyStatics.get_InputTrustAuthorityToCreate()
    }

    /**
     * Gets the PlayReady content protection system ID inside a PSSH box.
     * @remarks
     * Previous releases of the PlayReady API required callers to hard-code a well-known string and [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) in their code. These APIs provide those values to the caller so they can request them rather than hard-coding them.
     * 
     * 
     * In the [MediaProtectionManager.Properties](/uwp/api/windows.media.protection.mediaprotectionmanager.properties) property (a [PropertySet](/uwp/api/windows.foundation.collections.propertyset) object), the "Windows.Media.Protection.MediaProtectionContainerGuid" string maps to a GUID, which will typically be the following string: ```csharp
     * "{" +  Windows.Media.Protection.PlayReady.PlayReadyStatics.ProtectionSystemId.ToString().ToUpper() + "}"
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadystatics.protectionsystemid
     * @type {Guid} 
     */
    static ProtectionSystemId {
        get => PlayReadyStatics.get_ProtectionSystemId()
    }

    /**
     * Gets the type of a PlayReady secure stop service request.
     * @remarks
     * This type can be compared to [IMediaProtectionServiceRequest.type](../windows.media.protection/imediaprotectionservicerequest_type.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadystatics.securestopservicerequesttype
     * @type {Guid} 
     */
    static SecureStopServiceRequestType {
        get => PlayReadyStatics.get_SecureStopServiceRequestType()
    }

    /**
     * Gets the type of a PlayReady domain join service request.
     * @remarks
     * This type can be compared to [IMediaProtectionServiceRequest.type](../windows.media.protection/imediaprotectionservicerequest_type.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadystatics.domainjoinservicerequesttype
     * @type {Guid} 
     */
    static DomainJoinServiceRequestType {
        get => PlayReadyStatics.get_DomainJoinServiceRequestType()
    }

    /**
     * Gets the type of a PlayReady domain leave service request.
     * @remarks
     * This type can be compared to [IMediaProtectionServiceRequest.type](../windows.media.protection/imediaprotectionservicerequest_type.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadystatics.domainleaveservicerequesttype
     * @type {Guid} 
     */
    static DomainLeaveServiceRequestType {
        get => PlayReadyStatics.get_DomainLeaveServiceRequestType()
    }

    /**
     * Gets the type of a PlayReady individualization service request.
     * @remarks
     * This type can be compared to [IMediaProtectionServiceRequest.type](../windows.media.protection/imediaprotectionservicerequest_type.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadystatics.individualizationservicerequesttype
     * @type {Guid} 
     */
    static IndividualizationServiceRequestType {
        get => PlayReadyStatics.get_IndividualizationServiceRequestType()
    }

    /**
     * Gets the type of a PlayReady license acquisition service request.
     * @remarks
     * This type can be compared to [IMediaProtectionServiceRequest.type](../windows.media.protection/imediaprotectionservicerequest_type.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadystatics.licenseacquirerservicerequesttype
     * @type {Guid} 
     */
    static LicenseAcquirerServiceRequestType {
        get => PlayReadyStatics.get_LicenseAcquirerServiceRequestType()
    }

    /**
     * Gets the type of a PlayReady metering service request.
     * @remarks
     * This type can be compared to [IMediaProtectionServiceRequest.type](../windows.media.protection/imediaprotectionservicerequest_type.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadystatics.meteringreportservicerequesttype
     * @type {Guid} 
     */
    static MeteringReportServiceRequestType {
        get => PlayReadyStatics.get_MeteringReportServiceRequestType()
    }

    /**
     * Gets the type of a PlayReady revocation service request.
     * @remarks
     * This type can be compared to [IMediaProtectionServiceRequest.type](../windows.media.protection/imediaprotectionservicerequest_type.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadystatics.revocationservicerequesttype
     * @type {Guid} 
     */
    static RevocationServiceRequestType {
        get => PlayReadyStatics.get_RevocationServiceRequestType()
    }

    /**
     * Gets the PlayReady media protection system identifier.
     * @remarks
     * This type can be compared to [IMediaProtectionServiceRequest.ProtectionSystem](../windows.media.protection/imediaprotectionservicerequest_protectionsystem.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadystatics.mediaprotectionsystemid
     * @type {Guid} 
     */
    static MediaProtectionSystemId {
        get => PlayReadyStatics.get_MediaProtectionSystemId()
    }

    /**
     * Gets the PlayReady runtime security version.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadystatics.playreadysecurityversion
     * @type {Integer} 
     */
    static PlayReadySecurityVersion {
        get => PlayReadyStatics.get_PlayReadySecurityVersion()
    }

    /**
     * Gets the current certificate security level.
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadystatics.playreadycertificatesecuritylevel
     * @type {Integer} 
     */
    static PlayReadyCertificateSecurityLevel {
        get => PlayReadyStatics.get_PlayReadyCertificateSecurityLevel()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    static get_HardwareDRMDisabledAtTime() {
        if (!PlayReadyStatics.HasProp("__IPlayReadyStatics5")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyStatics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyStatics5.IID)
            PlayReadyStatics.__IPlayReadyStatics5 := IPlayReadyStatics5(factoryPtr)
        }

        return PlayReadyStatics.__IPlayReadyStatics5.get_HardwareDRMDisabledAtTime()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    static get_HardwareDRMDisabledUntilTime() {
        if (!PlayReadyStatics.HasProp("__IPlayReadyStatics5")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyStatics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyStatics5.IID)
            PlayReadyStatics.__IPlayReadyStatics5 := IPlayReadyStatics5(factoryPtr)
        }

        return PlayReadyStatics.__IPlayReadyStatics5.get_HardwareDRMDisabledUntilTime()
    }

    /**
     * Explicitly resets any temporary disablement of hardware digital rights management (DRM), if any.
     * @remarks
     * When the CheckSupportedHardware property returns false when querying the HardwareDRM feature, it is possible that this occurs because the feature was temporarily disabled due to a system component requiring an update, for example, a graphics driver.  This method explicitly resets the temporary disablement state.  An application could call this method when it is able to determine that a system component which may allow HardwareDRM to succeed has been updated in order to attempt hardware DRM before the date and time returned by HardwareDRMDisabledUntilTime.  If the system component has not been updated, it will automatically get re-disabled and the HardwareDRMDisabledAtTime and HardwareDRMDisabledUntilTime properties will begin returning updated values.  If it is not currently temporarily disabled, this method performs no action.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadystatics.resethardwaredrmdisabled
     */
    static ResetHardwareDRMDisabled() {
        if (!PlayReadyStatics.HasProp("__IPlayReadyStatics5")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyStatics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyStatics5.IID)
            PlayReadyStatics.__IPlayReadyStatics5 := IPlayReadyStatics5(factoryPtr)
        }

        return PlayReadyStatics.__IPlayReadyStatics5.ResetHardwareDRMDisabled()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_InputTrustAuthorityToCreate() {
        if (!PlayReadyStatics.HasProp("__IPlayReadyStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyStatics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyStatics4.IID)
            PlayReadyStatics.__IPlayReadyStatics4 := IPlayReadyStatics4(factoryPtr)
        }

        return PlayReadyStatics.__IPlayReadyStatics4.get_InputTrustAuthorityToCreate()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_ProtectionSystemId() {
        if (!PlayReadyStatics.HasProp("__IPlayReadyStatics4")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyStatics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyStatics4.IID)
            PlayReadyStatics.__IPlayReadyStatics4 := IPlayReadyStatics4(factoryPtr)
        }

        return PlayReadyStatics.__IPlayReadyStatics4.get_ProtectionSystemId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_SecureStopServiceRequestType() {
        if (!PlayReadyStatics.HasProp("__IPlayReadyStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyStatics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyStatics3.IID)
            PlayReadyStatics.__IPlayReadyStatics3 := IPlayReadyStatics3(factoryPtr)
        }

        return PlayReadyStatics.__IPlayReadyStatics3.get_SecureStopServiceRequestType()
    }

    /**
     * Queries whether the specified hardware digital rights management (DRM) feature is supported on the system.
     * @remarks
     * Starting with Windows 10, version 1709, you can detect support for AES128CBC hardware encryption on a device by calling **CheckSupportedHardware** and specifying the enumeration value [**PlayReadyHardwareDRMFeatures.Aes128Cbc**](/uwp/api/Windows.Media.Protection.PlayReady.PlayReadyHardwareDRMFeatures). On previous versions of Windows 10, specifying this value will cause an exception to be thrown. For this reason, you should check for the presence of the enumeration value by calling **[ApiInformationIsApiContractPresent](/uwp/api/windows.foundation.metadata.apiinformation#Windows_Foundation_Metadata_ApiInformation_IsApiContractPresent_System_String_System_UInt16_)** and specifying major contract version 5 before calling **CheckSupportedHardware**.
     * 
     * ```csharp
     * bool supportsAes128Cbc = ApiInformation.IsApiContractPresent("Windows.Foundation.UniversalApiContract", 5);
     * 
     * if (supportsAes128Cbc)
     * {
     *     supportsAes128Cbc = PlayReadyStatics.CheckSupportedHardware(PlayReadyHardwareDRMFeatures.Aes128Cbc);
     * }
     * ```
     * @param {Integer} hwdrmFeature The hardware DRM feature to query.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadystatics.checksupportedhardware
     */
    static CheckSupportedHardware(hwdrmFeature) {
        if (!PlayReadyStatics.HasProp("__IPlayReadyStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyStatics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyStatics3.IID)
            PlayReadyStatics.__IPlayReadyStatics3 := IPlayReadyStatics3(factoryPtr)
        }

        return PlayReadyStatics.__IPlayReadyStatics3.CheckSupportedHardware(hwdrmFeature)
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_DomainJoinServiceRequestType() {
        if (!PlayReadyStatics.HasProp("__IPlayReadyStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyStatics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyStatics.IID)
            PlayReadyStatics.__IPlayReadyStatics := IPlayReadyStatics(factoryPtr)
        }

        return PlayReadyStatics.__IPlayReadyStatics.get_DomainJoinServiceRequestType()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_DomainLeaveServiceRequestType() {
        if (!PlayReadyStatics.HasProp("__IPlayReadyStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyStatics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyStatics.IID)
            PlayReadyStatics.__IPlayReadyStatics := IPlayReadyStatics(factoryPtr)
        }

        return PlayReadyStatics.__IPlayReadyStatics.get_DomainLeaveServiceRequestType()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_IndividualizationServiceRequestType() {
        if (!PlayReadyStatics.HasProp("__IPlayReadyStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyStatics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyStatics.IID)
            PlayReadyStatics.__IPlayReadyStatics := IPlayReadyStatics(factoryPtr)
        }

        return PlayReadyStatics.__IPlayReadyStatics.get_IndividualizationServiceRequestType()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_LicenseAcquirerServiceRequestType() {
        if (!PlayReadyStatics.HasProp("__IPlayReadyStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyStatics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyStatics.IID)
            PlayReadyStatics.__IPlayReadyStatics := IPlayReadyStatics(factoryPtr)
        }

        return PlayReadyStatics.__IPlayReadyStatics.get_LicenseAcquirerServiceRequestType()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_MeteringReportServiceRequestType() {
        if (!PlayReadyStatics.HasProp("__IPlayReadyStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyStatics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyStatics.IID)
            PlayReadyStatics.__IPlayReadyStatics := IPlayReadyStatics(factoryPtr)
        }

        return PlayReadyStatics.__IPlayReadyStatics.get_MeteringReportServiceRequestType()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_RevocationServiceRequestType() {
        if (!PlayReadyStatics.HasProp("__IPlayReadyStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyStatics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyStatics.IID)
            PlayReadyStatics.__IPlayReadyStatics := IPlayReadyStatics(factoryPtr)
        }

        return PlayReadyStatics.__IPlayReadyStatics.get_RevocationServiceRequestType()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_MediaProtectionSystemId() {
        if (!PlayReadyStatics.HasProp("__IPlayReadyStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyStatics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyStatics.IID)
            PlayReadyStatics.__IPlayReadyStatics := IPlayReadyStatics(factoryPtr)
        }

        return PlayReadyStatics.__IPlayReadyStatics.get_MediaProtectionSystemId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_PlayReadySecurityVersion() {
        if (!PlayReadyStatics.HasProp("__IPlayReadyStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyStatics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyStatics.IID)
            PlayReadyStatics.__IPlayReadyStatics := IPlayReadyStatics(factoryPtr)
        }

        return PlayReadyStatics.__IPlayReadyStatics.get_PlayReadySecurityVersion()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_PlayReadyCertificateSecurityLevel() {
        if (!PlayReadyStatics.HasProp("__IPlayReadyStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.Protection.PlayReady.PlayReadyStatics")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlayReadyStatics2.IID)
            PlayReadyStatics.__IPlayReadyStatics2 := IPlayReadyStatics2(factoryPtr)
        }

        return PlayReadyStatics.__IPlayReadyStatics2.get_PlayReadyCertificateSecurityLevel()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
