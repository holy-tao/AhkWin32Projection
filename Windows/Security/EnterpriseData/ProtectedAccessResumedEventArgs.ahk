#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProtectedAccessResumedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
  * >
  * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
  * 
  * Provides data when content protection is resumed.
 * @remarks
 * This object is accessed when you implement an event handler for the [ProtectionPolicyManager.ProtectedAccessResumed](protectionpolicymanager_protectedaccessresumed.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectedaccessresumedeventargs
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class ProtectedAccessResumedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProtectedAccessResumedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProtectedAccessResumedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Contains the enterprise identities for which content protection is being resumed.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectedaccessresumedeventargs.identities
     * @type {IVectorView<HSTRING>} 
     */
    Identities {
        get => this.get_Identities()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_Identities() {
        if (!this.HasProp("__IProtectedAccessResumedEventArgs")) {
            if ((queryResult := this.QueryInterface(IProtectedAccessResumedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtectedAccessResumedEventArgs := IProtectedAccessResumedEventArgs(outPtr)
        }

        return this.__IProtectedAccessResumedEventArgs.get_Identities()
    }

;@endregion Instance Methods
}
