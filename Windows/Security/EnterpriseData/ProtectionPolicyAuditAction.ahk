#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!NOTE]
  * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
  * >
  * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
  * 
  * Defines constants that specify the audit action.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyauditaction
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class ProtectionPolicyAuditAction extends Win32Enum{

    /**
     * Indicates a decryption action.
     * @type {Integer (Int32)}
     */
    static Decrypt => 0

    /**
     * Indicates that data is being copied to a location.
     * @type {Integer (Int32)}
     */
    static CopyToLocation => 1

    /**
     * Indicates that data is being sent to a recipient.
     * @type {Integer (Int32)}
     */
    static SendToRecipient => 2

    /**
     * Indicates another action.
     * @type {Integer (Int32)}
     */
    static Other => 3
}
