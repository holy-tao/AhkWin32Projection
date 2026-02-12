#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFileUnprotectOptions.ahk
#Include .\IFileUnprotectOptionsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
  * >
  * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
  * 
  * Contains options that apply to removing protection from an enterprise-protected file.
 * @remarks
 * You can pass an instance of this class to the [UnprotectAsync](/uwp/api/windows.security.enterprisedata.fileprotectionmanager.UnprotectAsync) method.
 * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileunprotectoptions
 * @namespace Windows.Security.EnterpriseData
 * @version WindowsRuntime 1.4
 */
class FileUnprotectOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFileUnprotectOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFileUnprotectOptions.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Creates an instance of the [FileUnprotectOptions](fileunprotectoptions.md) class.
     * @param {Boolean} audit Specifies whether to log this action for audit.
     * @returns {FileUnprotectOptions} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileunprotectoptions.#ctor
     */
    static Create(audit) {
        if (!FileUnprotectOptions.HasProp("__IFileUnprotectOptionsFactory")) {
            activatableClassId := HSTRING.Create("Windows.Security.EnterpriseData.FileUnprotectOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFileUnprotectOptionsFactory.IID)
            FileUnprotectOptions.__IFileUnprotectOptionsFactory := IFileUnprotectOptionsFactory(factoryPtr)
        }

        return FileUnprotectOptions.__IFileUnprotectOptionsFactory.Create(audit)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!NOTE]
     * > Starting in July 2022, Microsoft is deprecating Windows Information Protection (WIP) and the APIs that support WIP. Microsoft will continue to support WIP on supported versions of Windows. New versions of Windows won't include new capabilities for WIP, and it won't be supported in future versions of Windows. For more information, see [Announcing sunset of Windows Information Protection](https://techcommunity.microsoft.com/t5/windows-it-pro-blog/announcing-the-sunset-of-windows-information-protection-wip/ba-p/3579282).
     * >
     * > For your data protection needs, Microsoft recommends that you use [Microsoft Purview Information Protection](/microsoft-365/compliance/information-protection) and [Microsoft Purview Data Loss Prevention](/microsoft-365/compliance/dlp-learn-about-dlp). Purview simplifies the configuration set-up and provides an advanced set of capabilities.
     * 
     * Specifies whether to log the unprotect action for audit.
     * @see https://learn.microsoft.com/uwp/api/windows.security.enterprisedata.fileunprotectoptions.audit
     * @type {Boolean} 
     */
    Audit {
        get => this.get_Audit()
        set => this.put_Audit(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Audit(value) {
        if (!this.HasProp("__IFileUnprotectOptions")) {
            if ((queryResult := this.QueryInterface(IFileUnprotectOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileUnprotectOptions := IFileUnprotectOptions(outPtr)
        }

        return this.__IFileUnprotectOptions.put_Audit(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Audit() {
        if (!this.HasProp("__IFileUnprotectOptions")) {
            if ((queryResult := this.QueryInterface(IFileUnprotectOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileUnprotectOptions := IFileUnprotectOptions(outPtr)
        }

        return this.__IFileUnprotectOptions.get_Audit()
    }

;@endregion Instance Methods
}
