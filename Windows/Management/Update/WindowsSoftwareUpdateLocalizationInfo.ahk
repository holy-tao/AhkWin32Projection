#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsSoftwareUpdateLocalizationInfo.ahk
#Include .\IWindowsSoftwareUpdateLocalizationInfoFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsSoftwareUpdateLocalizationInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsSoftwareUpdateLocalizationInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsSoftwareUpdateLocalizationInfo.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {Integer} languageId 
     * @param {HSTRING} title 
     * @param {HSTRING} description 
     * @param {Uri} moreInfoUrl 
     * @returns {WindowsSoftwareUpdateLocalizationInfo} 
     */
    static CreateInstance(languageId, title, description, moreInfoUrl) {
        if (!WindowsSoftwareUpdateLocalizationInfo.HasProp("__IWindowsSoftwareUpdateLocalizationInfoFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsSoftwareUpdateLocalizationInfo")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsSoftwareUpdateLocalizationInfoFactory.IID)
            WindowsSoftwareUpdateLocalizationInfo.__IWindowsSoftwareUpdateLocalizationInfoFactory := IWindowsSoftwareUpdateLocalizationInfoFactory(factoryPtr)
        }

        return WindowsSoftwareUpdateLocalizationInfo.__IWindowsSoftwareUpdateLocalizationInfoFactory.CreateInstance(languageId, title, description, moreInfoUrl)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {Integer} 
     */
    LanguageId {
        get => this.get_LanguageId()
    }

    /**
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {Uri} 
     */
    MoreInfoUrl {
        get => this.get_MoreInfoUrl()
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
    get_LanguageId() {
        if (!this.HasProp("__IWindowsSoftwareUpdateLocalizationInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateLocalizationInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateLocalizationInfo := IWindowsSoftwareUpdateLocalizationInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateLocalizationInfo.get_LanguageId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IWindowsSoftwareUpdateLocalizationInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateLocalizationInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateLocalizationInfo := IWindowsSoftwareUpdateLocalizationInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateLocalizationInfo.get_Title()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IWindowsSoftwareUpdateLocalizationInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateLocalizationInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateLocalizationInfo := IWindowsSoftwareUpdateLocalizationInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateLocalizationInfo.get_Description()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_MoreInfoUrl() {
        if (!this.HasProp("__IWindowsSoftwareUpdateLocalizationInfo")) {
            if ((queryResult := this.QueryInterface(IWindowsSoftwareUpdateLocalizationInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsSoftwareUpdateLocalizationInfo := IWindowsSoftwareUpdateLocalizationInfo(outPtr)
        }

        return this.__IWindowsSoftwareUpdateLocalizationInfo.get_MoreInfoUrl()
    }

;@endregion Instance Methods
}
