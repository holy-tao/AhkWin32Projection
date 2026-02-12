#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITimedTextSubformat.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines a [TimedTextStyle](timedtextstyle.md) for a substring in a [TimedTextLine](timedtextline.md). of the cue, which defines the style of the rendered text.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextsubformat
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextSubformat extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimedTextSubformat

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimedTextSubformat.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the staring index of the substring to which the [SubformatStyle](timedtextsubformat_subformatstyle.md) applies.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextsubformat.startindex
     * @type {Integer} 
     */
    StartIndex {
        get => this.get_StartIndex()
        set => this.put_StartIndex(value)
    }

    /**
     * Gets or sets the length of the substring to which the [SubformatStyle](timedtextsubformat_subformatstyle.md) applies.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextsubformat.length
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
        set => this.put_Length(value)
    }

    /**
     * Gets or sets the [TimedTextStyle](timedtextstyle.md) object that conveys the formatting of a substring in a [TimedTextLine](timedtextline.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextsubformat.subformatstyle
     * @type {TimedTextStyle} 
     */
    SubformatStyle {
        get => this.get_SubformatStyle()
        set => this.put_SubformatStyle(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [TimedTextSubformat](timedtextsubformat.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.TimedTextSubformat")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StartIndex() {
        if (!this.HasProp("__ITimedTextSubformat")) {
            if ((queryResult := this.QueryInterface(ITimedTextSubformat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextSubformat := ITimedTextSubformat(outPtr)
        }

        return this.__ITimedTextSubformat.get_StartIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StartIndex(value) {
        if (!this.HasProp("__ITimedTextSubformat")) {
            if ((queryResult := this.QueryInterface(ITimedTextSubformat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextSubformat := ITimedTextSubformat(outPtr)
        }

        return this.__ITimedTextSubformat.put_StartIndex(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        if (!this.HasProp("__ITimedTextSubformat")) {
            if ((queryResult := this.QueryInterface(ITimedTextSubformat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextSubformat := ITimedTextSubformat(outPtr)
        }

        return this.__ITimedTextSubformat.get_Length()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Length(value) {
        if (!this.HasProp("__ITimedTextSubformat")) {
            if ((queryResult := this.QueryInterface(ITimedTextSubformat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextSubformat := ITimedTextSubformat(outPtr)
        }

        return this.__ITimedTextSubformat.put_Length(value)
    }

    /**
     * 
     * @returns {TimedTextStyle} 
     */
    get_SubformatStyle() {
        if (!this.HasProp("__ITimedTextSubformat")) {
            if ((queryResult := this.QueryInterface(ITimedTextSubformat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextSubformat := ITimedTextSubformat(outPtr)
        }

        return this.__ITimedTextSubformat.get_SubformatStyle()
    }

    /**
     * 
     * @param {TimedTextStyle} value 
     * @returns {HRESULT} 
     */
    put_SubformatStyle(value) {
        if (!this.HasProp("__ITimedTextSubformat")) {
            if ((queryResult := this.QueryInterface(ITimedTextSubformat.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextSubformat := ITimedTextSubformat(outPtr)
        }

        return this.__ITimedTextSubformat.put_SubformatStyle(value)
    }

;@endregion Instance Methods
}
