#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!NOTE]
  * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
  * >
  * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
  * 
  * Describes the enterprise identity protection state of a buffer or stream.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.dataprotectionstatus
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class DataProtectionStatus extends Win32Enum{

    /**
     * The item is protected to another enterprise identity.
     * @type {Integer (Int32)}
     */
    static ProtectedToOtherIdentity => 0

    /**
     * The item is protected.
     * @type {Integer (Int32)}
     */
    static Protected => 1

    /**
     * The protection of the item has been revoked.
     * @type {Integer (Int32)}
     */
    static Revoked => 2

    /**
     * The item is not protected to an enterprise identity.
     * @type {Integer (Int32)}
     */
    static Unprotected => 3

    /**
     * The item's RMS license has expired. This value is not currently supported.
     * @type {Integer (Int32)}
     */
    static LicenseExpired => 4

    /**
     * The keys to access the protected item have been dropped while the device is locked.
     * @type {Integer (Int32)}
     */
    static AccessSuspended => 5
}
