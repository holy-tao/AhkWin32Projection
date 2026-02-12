#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITextBoxInfo.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class TextBoxInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITextBoxInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITextBoxInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * @type {TextBoxId} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Integer} 
     */
    InputScope {
        get => this.get_InputScope()
    }

    /**
     * @type {HSTRING} 
     */
    AppName {
        get => this.get_AppName()
    }

    /**
     * @type {HSTRING} 
     */
    Url {
        get => this.get_Url()
    }

    /**
     * @type {Integer} 
     */
    Settings {
        get => this.get_Settings()
    }

    /**
     * @type {Integer} 
     */
    DisabledFeatures {
        get => this.get_DisabledFeatures()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TextBoxId} 
     */
    get_Id() {
        if (!this.HasProp("__ITextBoxInfo")) {
            if ((queryResult := this.QueryInterface(ITextBoxInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBoxInfo := ITextBoxInfo(outPtr)
        }

        return this.__ITextBoxInfo.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InputScope() {
        if (!this.HasProp("__ITextBoxInfo")) {
            if ((queryResult := this.QueryInterface(ITextBoxInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBoxInfo := ITextBoxInfo(outPtr)
        }

        return this.__ITextBoxInfo.get_InputScope()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_AppName() {
        if (!this.HasProp("__ITextBoxInfo")) {
            if ((queryResult := this.QueryInterface(ITextBoxInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBoxInfo := ITextBoxInfo(outPtr)
        }

        return this.__ITextBoxInfo.get_AppName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Url() {
        if (!this.HasProp("__ITextBoxInfo")) {
            if ((queryResult := this.QueryInterface(ITextBoxInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBoxInfo := ITextBoxInfo(outPtr)
        }

        return this.__ITextBoxInfo.get_Url()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Settings() {
        if (!this.HasProp("__ITextBoxInfo")) {
            if ((queryResult := this.QueryInterface(ITextBoxInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBoxInfo := ITextBoxInfo(outPtr)
        }

        return this.__ITextBoxInfo.get_Settings()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisabledFeatures() {
        if (!this.HasProp("__ITextBoxInfo")) {
            if ((queryResult := this.QueryInterface(ITextBoxInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITextBoxInfo := ITextBoxInfo(outPtr)
        }

        return this.__ITextBoxInfo.get_DisabledFeatures()
    }

;@endregion Instance Methods
}
