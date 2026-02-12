#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFileProtectionInfo.ahk
#Include .\IFileProtectionInfo2.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
  * >
  * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
  * 
  * Contains information about an enterprise protected file.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileprotectioninfo
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class FileProtectionInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFileProtectionInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFileProtectionInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * The protection status of the enterprise protected file.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileprotectioninfo.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Specifies if the protection of the enterprise protected file can be roamed to other devices.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileprotectioninfo.isroamable
     * @type {Boolean} 
     */
    IsRoamable {
        get => this.get_IsRoamable()
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * The enterprise identity of the enterprise protected file.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileprotectioninfo.identity
     * @type {HSTRING} 
     */
    Identity {
        get => this.get_Identity()
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Determines whether your app can protect a file while it is open.
     * @remarks
     * If this property returns **true**, you can protect a file while the file is open.
     * 
     * This can be useful if users open a file that is not protected and attempt to paste enterprise protected information into it. You can protect the open file and save users from having to respond to a prompt or, depending on the level of policy enforcement, save them from being blocked from pasting content completely.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileprotectioninfo.isprotectwhileopensupported
     * @type {Boolean} 
     */
    IsProtectWhileOpenSupported {
        get => this.get_IsProtectWhileOpenSupported()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IFileProtectionInfo")) {
            if ((queryResult := this.QueryInterface(IFileProtectionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileProtectionInfo := IFileProtectionInfo(outPtr)
        }

        return this.__IFileProtectionInfo.get_Status()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRoamable() {
        if (!this.HasProp("__IFileProtectionInfo")) {
            if ((queryResult := this.QueryInterface(IFileProtectionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileProtectionInfo := IFileProtectionInfo(outPtr)
        }

        return this.__IFileProtectionInfo.get_IsRoamable()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Identity() {
        if (!this.HasProp("__IFileProtectionInfo")) {
            if ((queryResult := this.QueryInterface(IFileProtectionInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileProtectionInfo := IFileProtectionInfo(outPtr)
        }

        return this.__IFileProtectionInfo.get_Identity()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsProtectWhileOpenSupported() {
        if (!this.HasProp("__IFileProtectionInfo2")) {
            if ((queryResult := this.QueryInterface(IFileProtectionInfo2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileProtectionInfo2 := IFileProtectionInfo2(outPtr)
        }

        return this.__IFileProtectionInfo2.get_IsProtectWhileOpenSupported()
    }

;@endregion Instance Methods
}
