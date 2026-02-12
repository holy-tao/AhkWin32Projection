#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the valid list of hardware digital rights management (DRM) feature values that can be queried.
 * @remarks
 * Starting with Windows 10, version 1709, you can detect support for AES128CBC hardware encryption on a device by calling **[PlayReadyStatics.CheckSupportedHardware](/uwp/api/windows.media.protection.playready.playreadystatics.checksupportedhardware)** and specifying the enumeration value **Aes128Cbc**. On previous versions of Windows 10, specifying this value will cause an exception to be thrown. For this reason, you should check for the presence of the enumeration value by calling **[ApiInformationIsApiContractPresent](/uwp/api/windows.foundation.metadata.apiinformation#Windows_Foundation_Metadata_ApiInformation_IsApiContractPresent_System_String_System_UInt16_)** and specifying major contract version 5 before calling **CheckSupportedHardware**.
 * 
 * ```csharp
 * bool supportsAes128Cbc = ApiInformation.IsApiContractPresent("Windows.Foundation.UniversalApiContract", 5);
 * 
 * if (supportsAes128Cbc)
 * {
 *     supportsAes128Cbc = PlayReadyStatics.CheckSupportedHardware(PlayReadyHardwareDRMFeatures.Aes128Cbc);
 * }
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadyhardwaredrmfeatures
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadyHardwareDRMFeatures extends Win32Enum{

    /**
     * Hardware DRM is supported on the machine.
     * @type {Integer (Int32)}
     */
    static HardwareDRM => 1

    /**
     * Indicates the hardware supports High Efficiency Video Coding (HEVC)/H.265 codec.
     * @type {Integer (Int32)}
     */
    static HEVC => 2

    /**
     * Indicates the hardware supports AES128CBC encryption.
     * @type {Integer (Int32)}
     */
    static Aes128Cbc => 3
}
