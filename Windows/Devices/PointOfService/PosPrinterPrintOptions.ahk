#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPosPrinterPrintOptions.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the print options of the text that you want to print to a point-of-service printer.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterprintoptions
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class PosPrinterPrintOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPosPrinterPrintOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPosPrinterPrintOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a string value that indicates the typeface that the application wants to use for printing characters.
     * @remarks
     * The typeface that the application wants to use for printing characters. The value must be **null** or one of the supported typeface values of the point-of-service printer.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterprintoptions.typeface
     * @type {HSTRING} 
     */
    TypeFace {
        get => this.get_TypeFace()
        set => this.put_TypeFace(value)
    }

    /**
     * Gets or sets a numeric value that indicates the character height that the application wants to use for printing characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterprintoptions.characterheight
     * @type {Integer} 
     */
    CharacterHeight {
        get => this.get_CharacterHeight()
        set => this.put_CharacterHeight(value)
    }

    /**
     * Gets or sets a value that indicates if the application wants to print characters in bold style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterprintoptions.bold
     * @type {Boolean} 
     */
    Bold {
        get => this.get_Bold()
        set => this.put_Bold(value)
    }

    /**
     * Gets or sets a value that indicates if the application wants to print characters in italic style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterprintoptions.italic
     * @type {Boolean} 
     */
    Italic {
        get => this.get_Italic()
        set => this.put_Italic(value)
    }

    /**
     * Gets or sets a value that indicates if the application wants to print characters in underline style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterprintoptions.underline
     * @type {Boolean} 
     */
    Underline {
        get => this.get_Underline()
        set => this.put_Underline(value)
    }

    /**
     * Gets or sets a value that indicates if the application wants to print characters in reverse-video style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterprintoptions.reversevideo
     * @type {Boolean} 
     */
    ReverseVideo {
        get => this.get_ReverseVideo()
        set => this.put_ReverseVideo(value)
    }

    /**
     * Gets or sets a value that indicates if the application wants to print characters in strikethrough style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterprintoptions.strikethrough
     * @type {Boolean} 
     */
    Strikethrough {
        get => this.get_Strikethrough()
        set => this.put_Strikethrough(value)
    }

    /**
     * Gets or sets a value that indicates if the application wants to print characters in superscript style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterprintoptions.superscript
     * @type {Boolean} 
     */
    Superscript {
        get => this.get_Superscript()
        set => this.put_Superscript(value)
    }

    /**
     * Gets or sets a value that indicates if the application wants to print characters in subscript style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterprintoptions.subscript
     * @type {Boolean} 
     */
    Subscript {
        get => this.get_Subscript()
        set => this.put_Subscript(value)
    }

    /**
     * Gets or sets a value that indicates if the application wants to print characters in double-wide style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterprintoptions.doublewide
     * @type {Boolean} 
     */
    DoubleWide {
        get => this.get_DoubleWide()
        set => this.put_DoubleWide(value)
    }

    /**
     * Gets or sets a value that indicates if the application wants to print characters in double-high style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterprintoptions.doublehigh
     * @type {Boolean} 
     */
    DoubleHigh {
        get => this.get_DoubleHigh()
        set => this.put_DoubleHigh(value)
    }

    /**
     * Gets or sets a value that indicates the alignment that the application wants to use for printing text.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterprintoptions.alignment
     * @type {Integer} 
     */
    Alignment {
        get => this.get_Alignment()
        set => this.put_Alignment(value)
    }

    /**
     * Gets or sets a numeric value that indicates the character set that the application wants to use for printing characters.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.posprinterprintoptions.characterset
     * @type {Integer} 
     */
    CharacterSet {
        get => this.get_CharacterSet()
        set => this.put_CharacterSet(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of [PosPrinterPrintOptions](posprinterprintoptions.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.PointOfService.PosPrinterPrintOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TypeFace() {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.get_TypeFace()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_TypeFace(value) {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.put_TypeFace(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacterHeight() {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.get_CharacterHeight()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CharacterHeight(value) {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.put_CharacterHeight(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Bold() {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.get_Bold()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Bold(value) {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.put_Bold(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Italic() {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.get_Italic()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Italic(value) {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.put_Italic(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Underline() {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.get_Underline()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Underline(value) {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.put_Underline(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ReverseVideo() {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.get_ReverseVideo()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ReverseVideo(value) {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.put_ReverseVideo(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Strikethrough() {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.get_Strikethrough()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Strikethrough(value) {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.put_Strikethrough(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Superscript() {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.get_Superscript()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Superscript(value) {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.put_Superscript(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Subscript() {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.get_Subscript()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Subscript(value) {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.put_Subscript(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DoubleWide() {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.get_DoubleWide()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DoubleWide(value) {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.put_DoubleWide(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DoubleHigh() {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.get_DoubleHigh()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DoubleHigh(value) {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.put_DoubleHigh(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Alignment() {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.get_Alignment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Alignment(value) {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.put_Alignment(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacterSet() {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.get_CharacterSet()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CharacterSet(value) {
        if (!this.HasProp("__IPosPrinterPrintOptions")) {
            if ((queryResult := this.QueryInterface(IPosPrinterPrintOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPosPrinterPrintOptions := IPosPrinterPrintOptions(outPtr)
        }

        return this.__IPosPrinterPrintOptions.put_CharacterSet(value)
    }

;@endregion Instance Methods
}
