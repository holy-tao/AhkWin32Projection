#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ResourceDictionary.ahk
#Include .\IColorPaletteResources.ahk
#Include .\IColorPaletteResourcesFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a specialized resource dictionary that contains color resources used by XAML elements.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ColorPaletteResources extends ResourceDictionary {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IColorPaletteResources

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IColorPaletteResources.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ColorPaletteResources} 
     */
    static CreateInstance() {
        if (!ColorPaletteResources.HasProp("__IColorPaletteResourcesFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.ColorPaletteResources")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorPaletteResourcesFactory.IID)
            ColorPaletteResources.__IColorPaletteResourcesFactory := IColorPaletteResourcesFactory(factoryPtr)
        }

        return ColorPaletteResources.__IColorPaletteResourcesFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the AltHigh color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.althigh
     * @type {IReference<Color>} 
     */
    AltHigh {
        get => this.get_AltHigh()
        set => this.put_AltHigh(value)
    }

    /**
     * Gets or sets the AltLow color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.altlow
     * @type {IReference<Color>} 
     */
    AltLow {
        get => this.get_AltLow()
        set => this.put_AltLow(value)
    }

    /**
     * Gets or sets the AltMedium color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.altmedium
     * @type {IReference<Color>} 
     */
    AltMedium {
        get => this.get_AltMedium()
        set => this.put_AltMedium(value)
    }

    /**
     * Gets or sets the AltMediumHigh color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.altmediumhigh
     * @type {IReference<Color>} 
     */
    AltMediumHigh {
        get => this.get_AltMediumHigh()
        set => this.put_AltMediumHigh(value)
    }

    /**
     * Gets or sets the AltMediumLow color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.altmediumlow
     * @type {IReference<Color>} 
     */
    AltMediumLow {
        get => this.get_AltMediumLow()
        set => this.put_AltMediumLow(value)
    }

    /**
     * Gets or sets the BaseHigh color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.basehigh
     * @type {IReference<Color>} 
     */
    BaseHigh {
        get => this.get_BaseHigh()
        set => this.put_BaseHigh(value)
    }

    /**
     * Gets or sets the BaseLow color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.baselow
     * @type {IReference<Color>} 
     */
    BaseLow {
        get => this.get_BaseLow()
        set => this.put_BaseLow(value)
    }

    /**
     * Gets or sets the BaseMedium color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.basemedium
     * @type {IReference<Color>} 
     */
    BaseMedium {
        get => this.get_BaseMedium()
        set => this.put_BaseMedium(value)
    }

    /**
     * Gets or sets the BaseMediumHigh color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.basemediumhigh
     * @type {IReference<Color>} 
     */
    BaseMediumHigh {
        get => this.get_BaseMediumHigh()
        set => this.put_BaseMediumHigh(value)
    }

    /**
     * Gets or sets the BaseMediumLow color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.basemediumlow
     * @type {IReference<Color>} 
     */
    BaseMediumLow {
        get => this.get_BaseMediumLow()
        set => this.put_BaseMediumLow(value)
    }

    /**
     * Gets or sets the ChromeAltLow color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.chromealtlow
     * @type {IReference<Color>} 
     */
    ChromeAltLow {
        get => this.get_ChromeAltLow()
        set => this.put_ChromeAltLow(value)
    }

    /**
     * Gets or sets the ChromeBlackHigh color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.chromeblackhigh
     * @type {IReference<Color>} 
     */
    ChromeBlackHigh {
        get => this.get_ChromeBlackHigh()
        set => this.put_ChromeBlackHigh(value)
    }

    /**
     * Gets or sets the ChromeBlackLow color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.chromeblacklow
     * @type {IReference<Color>} 
     */
    ChromeBlackLow {
        get => this.get_ChromeBlackLow()
        set => this.put_ChromeBlackLow(value)
    }

    /**
     * Gets or sets the ChromeBlackMediumLow color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.chromeblackmediumlow
     * @type {IReference<Color>} 
     */
    ChromeBlackMediumLow {
        get => this.get_ChromeBlackMediumLow()
        set => this.put_ChromeBlackMediumLow(value)
    }

    /**
     * Gets or sets the ChromeBlackMedium color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.chromeblackmedium
     * @type {IReference<Color>} 
     */
    ChromeBlackMedium {
        get => this.get_ChromeBlackMedium()
        set => this.put_ChromeBlackMedium(value)
    }

    /**
     * Gets or sets the ChromeDisabledHigh color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.chromedisabledhigh
     * @type {IReference<Color>} 
     */
    ChromeDisabledHigh {
        get => this.get_ChromeDisabledHigh()
        set => this.put_ChromeDisabledHigh(value)
    }

    /**
     * Gets or sets the ChromeDisabledLow color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.chromedisabledlow
     * @type {IReference<Color>} 
     */
    ChromeDisabledLow {
        get => this.get_ChromeDisabledLow()
        set => this.put_ChromeDisabledLow(value)
    }

    /**
     * Gets or sets the ChromeHigh color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.chromehigh
     * @type {IReference<Color>} 
     */
    ChromeHigh {
        get => this.get_ChromeHigh()
        set => this.put_ChromeHigh(value)
    }

    /**
     * Gets or sets the ChromeLow color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.chromelow
     * @type {IReference<Color>} 
     */
    ChromeLow {
        get => this.get_ChromeLow()
        set => this.put_ChromeLow(value)
    }

    /**
     * Gets or sets the ChromeMedium color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.chromemedium
     * @type {IReference<Color>} 
     */
    ChromeMedium {
        get => this.get_ChromeMedium()
        set => this.put_ChromeMedium(value)
    }

    /**
     * Gets or sets the ChromeMediumLow color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.chromemediumlow
     * @type {IReference<Color>} 
     */
    ChromeMediumLow {
        get => this.get_ChromeMediumLow()
        set => this.put_ChromeMediumLow(value)
    }

    /**
     * Gets or sets the ChromeWhite color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.chromewhite
     * @type {IReference<Color>} 
     */
    ChromeWhite {
        get => this.get_ChromeWhite()
        set => this.put_ChromeWhite(value)
    }

    /**
     * Gets or sets the ChromeGray color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.chromegray
     * @type {IReference<Color>} 
     */
    ChromeGray {
        get => this.get_ChromeGray()
        set => this.put_ChromeGray(value)
    }

    /**
     * Gets or sets the ListLow color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.listlow
     * @type {IReference<Color>} 
     */
    ListLow {
        get => this.get_ListLow()
        set => this.put_ListLow(value)
    }

    /**
     * Gets or sets the ListMedium color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.listmedium
     * @type {IReference<Color>} 
     */
    ListMedium {
        get => this.get_ListMedium()
        set => this.put_ListMedium(value)
    }

    /**
     * Gets or sets the ErrorText color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.errortext
     * @type {IReference<Color>} 
     */
    ErrorText {
        get => this.get_ErrorText()
        set => this.put_ErrorText(value)
    }

    /**
     * Gets or sets the Accent color value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.colorpaletteresources.accent
     * @type {IReference<Color>} 
     */
    Accent {
        get => this.get_Accent()
        set => this.put_Accent(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_AltHigh() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_AltHigh()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_AltHigh(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_AltHigh(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_AltLow() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_AltLow()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_AltLow(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_AltLow(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_AltMedium() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_AltMedium()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_AltMedium(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_AltMedium(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_AltMediumHigh() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_AltMediumHigh()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_AltMediumHigh(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_AltMediumHigh(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_AltMediumLow() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_AltMediumLow()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_AltMediumLow(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_AltMediumLow(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_BaseHigh() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_BaseHigh()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_BaseHigh(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_BaseHigh(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_BaseLow() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_BaseLow()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_BaseLow(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_BaseLow(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_BaseMedium() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_BaseMedium()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_BaseMedium(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_BaseMedium(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_BaseMediumHigh() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_BaseMediumHigh()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_BaseMediumHigh(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_BaseMediumHigh(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_BaseMediumLow() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_BaseMediumLow()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_BaseMediumLow(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_BaseMediumLow(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeAltLow() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_ChromeAltLow()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeAltLow(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_ChromeAltLow(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeBlackHigh() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_ChromeBlackHigh()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeBlackHigh(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_ChromeBlackHigh(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeBlackLow() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_ChromeBlackLow()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeBlackLow(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_ChromeBlackLow(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeBlackMediumLow() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_ChromeBlackMediumLow()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeBlackMediumLow(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_ChromeBlackMediumLow(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeBlackMedium() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_ChromeBlackMedium()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeBlackMedium(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_ChromeBlackMedium(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeDisabledHigh() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_ChromeDisabledHigh()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeDisabledHigh(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_ChromeDisabledHigh(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeDisabledLow() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_ChromeDisabledLow()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeDisabledLow(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_ChromeDisabledLow(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeHigh() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_ChromeHigh()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeHigh(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_ChromeHigh(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeLow() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_ChromeLow()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeLow(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_ChromeLow(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeMedium() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_ChromeMedium()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeMedium(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_ChromeMedium(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeMediumLow() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_ChromeMediumLow()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeMediumLow(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_ChromeMediumLow(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeWhite() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_ChromeWhite()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeWhite(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_ChromeWhite(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ChromeGray() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_ChromeGray()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ChromeGray(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_ChromeGray(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ListLow() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_ListLow()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ListLow(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_ListLow(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ListMedium() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_ListMedium()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ListMedium(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_ListMedium(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_ErrorText() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_ErrorText()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_ErrorText(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_ErrorText(value)
    }

    /**
     * 
     * @returns {IReference<Color>} 
     */
    get_Accent() {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.get_Accent()
    }

    /**
     * 
     * @param {IReference<Color>} value 
     * @returns {HRESULT} 
     */
    put_Accent(value) {
        if (!this.HasProp("__IColorPaletteResources")) {
            if ((queryResult := this.QueryInterface(IColorPaletteResources.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorPaletteResources := IColorPaletteResources(outPtr)
        }

        return this.__IColorPaletteResources.put_Accent(value)
    }

;@endregion Instance Methods
}
