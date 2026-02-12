#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProtectedAccessSuspendingEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
  * >
  * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
  * 
  * Provides data when content protection is being suspended.
 * @remarks
 * This object is accessed when you implement an event handler for the [ProtectionPolicyManager.ProtectedAccessSuspending](protectionpolicymanager_protectedaccesssuspending.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectedaccesssuspendingeventargs
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class ProtectedAccessSuspendingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProtectedAccessSuspendingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProtectedAccessSuspendingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Contains the enterprise identities for which content protection is being suspended.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectedaccesssuspendingeventargs.identities
     * @type {IVectorView<HSTRING>} 
     */
    Identities {
        get => this.get_Identities()
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * [DateTime](../windows.foundation/datetime.md) at which content protection will be suspended. The app can subtract **DateTime.Now** from this value to determine how much time there is to perform any processing before the suspension occurs.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectedaccesssuspendingeventargs.deadline
     * @type {DateTime} 
     */
    Deadline {
        get => this.get_Deadline()
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
        if (!this.HasProp("__IProtectedAccessSuspendingEventArgs")) {
            if ((queryResult := this.QueryInterface(IProtectedAccessSuspendingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtectedAccessSuspendingEventArgs := IProtectedAccessSuspendingEventArgs(outPtr)
        }

        return this.__IProtectedAccessSuspendingEventArgs.get_Identities()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Deadline() {
        if (!this.HasProp("__IProtectedAccessSuspendingEventArgs")) {
            if ((queryResult := this.QueryInterface(IProtectedAccessSuspendingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtectedAccessSuspendingEventArgs := IProtectedAccessSuspendingEventArgs(outPtr)
        }

        return this.__IProtectedAccessSuspendingEventArgs.get_Deadline()
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Gets the [Deferral](../windows.foundation/deferral.md) object that manages the protection suspension. The app must call **Deferral.Complete** before it returns from the event handler.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectedaccesssuspendingeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IProtectedAccessSuspendingEventArgs")) {
            if ((queryResult := this.QueryInterface(IProtectedAccessSuspendingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtectedAccessSuspendingEventArgs := IProtectedAccessSuspendingEventArgs(outPtr)
        }

        return this.__IProtectedAccessSuspendingEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
