#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!NOTE]
  * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
  * >
  * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
  * 
  * Possible status values for an enterprise protected file that has been imported from or exported to a container file.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectedimportexportstatus
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class ProtectedImportExportStatus extends Win32Enum{

    /**
     * The file's protection is OK.
     * @type {Integer (Int32)}
     */
    static Ok => 0

    /**
     * The file's protection can not be determined.
     * @type {Integer (Int32)}
     */
    static Undetermined => 1

    /**
     * The file is not protected.
     * @type {Integer (Int32)}
     */
    static Unprotected => 2

    /**
     * The file's protection has been revoked, and it is inaccessible.
     * @type {Integer (Int32)}
     */
    static Revoked => 3

    /**
     * The file cannot be roamed to another device.
     * @type {Integer (Int32)}
     */
    static NotRoamable => 4

    /**
     * The file is inaccessible, as it is protected to a different enterprise identity.
     * @type {Integer (Int32)}
     */
    static ProtectedToOtherIdentity => 5

    /**
     * The file's RMS license has expired.
     * @type {Integer (Int32)}
     */
    static LicenseExpired => 6

    /**
     * The keys to access the protected file have been dropped while the device is locked.
     * @type {Integer (Int32)}
     */
    static AccessSuspended => 7
}
