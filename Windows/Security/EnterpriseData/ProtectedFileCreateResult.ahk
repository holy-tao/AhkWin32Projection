#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IProtectedFileCreateResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
  * >
  * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
  * 
  * Contains information about a newly created enterprise protected file.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectedfilecreateresult
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class ProtectedFileCreateResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IProtectedFileCreateResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IProtectedFileCreateResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * The newly created enterprise protected file.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectedfilecreateresult.file
     * @type {StorageFile} 
     */
    File {
        get => this.get_File()
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * The stream random access to the newly created enterprise protected file.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectedfilecreateresult.stream
     * @type {IRandomAccessStream} 
     */
    Stream {
        get => this.get_Stream()
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Information about the enterprise protected file.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.protectedfilecreateresult.protectioninfo
     * @type {FileProtectionInfo} 
     */
    ProtectionInfo {
        get => this.get_ProtectionInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {StorageFile} 
     */
    get_File() {
        if (!this.HasProp("__IProtectedFileCreateResult")) {
            if ((queryResult := this.QueryInterface(IProtectedFileCreateResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtectedFileCreateResult := IProtectedFileCreateResult(outPtr)
        }

        return this.__IProtectedFileCreateResult.get_File()
    }

    /**
     * 
     * @returns {IRandomAccessStream} 
     */
    get_Stream() {
        if (!this.HasProp("__IProtectedFileCreateResult")) {
            if ((queryResult := this.QueryInterface(IProtectedFileCreateResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtectedFileCreateResult := IProtectedFileCreateResult(outPtr)
        }

        return this.__IProtectedFileCreateResult.get_Stream()
    }

    /**
     * 
     * @returns {FileProtectionInfo} 
     */
    get_ProtectionInfo() {
        if (!this.HasProp("__IProtectedFileCreateResult")) {
            if ((queryResult := this.QueryInterface(IProtectedFileCreateResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IProtectedFileCreateResult := IProtectedFileCreateResult(outPtr)
        }

        return this.__IProtectedFileCreateResult.get_ProtectionInfo()
    }

;@endregion Instance Methods
}
