#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBufferProtectUnprotectResult.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
  * >
  * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
  * 
  * Contains information about the result from protecting or unprotecting an enterprise protected buffer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.bufferprotectunprotectresult
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class BufferProtectUnprotectResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBufferProtectUnprotectResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBufferProtectUnprotectResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Gets the enterprise protected buffer that has been protected or unprotected.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.bufferprotectunprotectresult.buffer
     * @type {IBuffer} 
     */
    Buffer {
        get => this.get_Buffer()
    }

    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Gets the [DataProtectionInfo](dataprotectioninfo.md) object concerning the enterprise protected buffer that has been protected or unprotected.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.bufferprotectunprotectresult.protectioninfo
     * @type {DataProtectionInfo} 
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
     * @returns {IBuffer} 
     */
    get_Buffer() {
        if (!this.HasProp("__IBufferProtectUnprotectResult")) {
            if ((queryResult := this.QueryInterface(IBufferProtectUnprotectResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBufferProtectUnprotectResult := IBufferProtectUnprotectResult(outPtr)
        }

        return this.__IBufferProtectUnprotectResult.get_Buffer()
    }

    /**
     * 
     * @returns {DataProtectionInfo} 
     */
    get_ProtectionInfo() {
        if (!this.HasProp("__IBufferProtectUnprotectResult")) {
            if ((queryResult := this.QueryInterface(IBufferProtectUnprotectResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBufferProtectUnprotectResult := IBufferProtectUnprotectResult(outPtr)
        }

        return this.__IBufferProtectUnprotectResult.get_ProtectionInfo()
    }

;@endregion Instance Methods
}
