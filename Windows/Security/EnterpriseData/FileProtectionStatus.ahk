#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!NOTE]
  * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
  * >
  * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
  * 
  * Describes the enterprise protection state of a file or folder.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileprotectionstatus
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class FileProtectionStatus extends Win32Enum{

    /**
     * > [!NOTE]
     * > **Undetermined** may be unavailable for releases after Windows 10. Instead, use **Unknown**.
     * 
     * The item is either encrypting or decrypting and the enterprise protection status cannot be determined. Check again later.
     * @type {Integer (Int32)}
     */
    static Undetermined => 0

    /**
     * The item is either encrypting or decrypting and the enterprise protection status cannot be determined. Check again later.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The item is not protected using enterprise protection.
     * @type {Integer (Int32)}
     */
    static Unprotected => 1

    /**
     * The item has been revoked using enterprise protection.
     * @type {Integer (Int32)}
     */
    static Revoked => 2

    /**
     * The item is protected using enterprise protection and you're app can open this file because it is on the allowed list of the policy.
     * @type {Integer (Int32)}
     */
    static Protected => 3

    /**
     * > [!NOTE]
     * > **ProtectedByOtherUser** may be unavailable for releases after Windows 10. Instead, use **ProtectedToOtherIdentity**.
     * 
     * Another user has protected the item using enterprise protection.
     * @type {Integer (Int32)}
     */
    static ProtectedByOtherUser => 4

    /**
     * > [!NOTE]
     * > **ProtectedToOtherEnterprise** may be unavailable for releases after Windows 10. Instead, use **ProtectedToOtherIdentity**.
     * 
     * The item is protected for another enterprise id using enterprise protection.
     * @type {Integer (Int32)}
     */
    static ProtectedToOtherEnterprise => 5

    /**
     * The item is encrypted or is a system file and cannot be protected using enterprise protection.
     * @type {Integer (Int32)}
     */
    static NotProtectable => 6

    /**
     * The item is protected for another enterprise identity using enterprise protection.
     * @type {Integer (Int32)}
     */
    static ProtectedToOtherIdentity => 7

    /**
     * The item's RMS license has expired.
     * @type {Integer (Int32)}
     */
    static LicenseExpired => 8

    /**
     * The keys to access the protected item have been dropped while the device is locked.
     * @type {Integer (Int32)}
     */
    static AccessSuspended => 9

    /**
     * The item is being used by another process. You can apply enterprise protection to it only after it becomes exclusively available.
     * @type {Integer (Int32)}
     */
    static FileInUse => 10
}
