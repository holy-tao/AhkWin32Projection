#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of encryption algorithm specified in a PlayReady content header.
 * @remarks
 * Starting with Windows 10, version 1709, this enumeration supports the values **Aes128Cbc** and **Unspecified**. On previous versions of Windows 10, some PlayReady APIs will thrown an exception if these values are used. For this reason, you should check for the presence of the enumeration value by calling **[ApiInformationIsApiContractPresent](/uwp/api/windows.foundation.metadata.apiinformation#Windows_Foundation_Metadata_ApiInformation_IsApiContractPresent_System_String_System_UInt16_)** and specifying major contract version 5 before using the new enum values. For more information, see [PlayReadyContentHeader](playreadycontentheader_playreadycontentheader_40363517.md) and [PlayReadyStatics.CheckSupportedHardware](playreadystatics_checksupportedhardware_389210608.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.playreadyencryptionalgorithm
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class PlayReadyEncryptionAlgorithm extends Win32Enum{

    /**
     * Content is not encrypted.
     * @type {Integer (Int32)}
     */
    static Unprotected => 0

    /**
     * AES-128 Counter-mode encryption.
     * @type {Integer (Int32)}
     */
    static Aes128Ctr => 1

    /**
     * Cocktail encryption.
     * @type {Integer (Int32)}
     */
    static Cocktail => 4

    /**
     * AES128CBC encryption.
     * @type {Integer (Int32)}
     */
    static Aes128Cbc => 5

    /**
     * The encryption method is unspecified.
     * @type {Integer (Int32)}
     */
    static Unspecified => 65535

    /**
     * The encryption method has not been set.
     * @type {Integer (Int32)}
     */
    static Uninitialized => 2147483647
}
