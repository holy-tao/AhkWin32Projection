#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * > [!NOTE]
  * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
  * >
  * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
  * 
  * Possible results when access to protected content is requested or queried.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectionpolicyevaluationresult
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class ProtectionPolicyEvaluationResult extends Win32Enum{

    /**
     * Access is allowed.
     * @type {Integer (Int32)}
     */
    static Allowed => 0

    /**
     * Access is blocked.
     * @type {Integer (Int32)}
     */
    static Blocked => 1

    /**
     * Consent is required for access.
     * @type {Integer (Int32)}
     */
    static ConsentRequired => 2
}
