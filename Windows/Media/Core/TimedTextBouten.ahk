#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITimedTextBouten.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a bouten mark associated with a line of timed text.
 * @remarks
 * Get an instance of this class by accessing the [Bouten](timedtextstyle_bouten.md) property of a [TimedTextStyle](timedtextstyle.md) object.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextbouten
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class TimedTextBouten extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITimedTextBouten

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITimedTextBouten.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the type of bouten mark to be rendered in timed text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextbouten.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
        set => this.put_Type(value)
    }

    /**
     * Gets or sets the color of a bouten mark in timed text.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextbouten.color
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * Gets or sets the position of a bouten mark in the block progression dimension with respect to its associated ruby base.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.timedtextbouten.position
     * @type {Integer} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
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
    get_Type() {
        if (!this.HasProp("__ITimedTextBouten")) {
            if ((queryResult := this.QueryInterface(ITimedTextBouten.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextBouten := ITimedTextBouten(outPtr)
        }

        return this.__ITimedTextBouten.get_Type()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Type(value) {
        if (!this.HasProp("__ITimedTextBouten")) {
            if ((queryResult := this.QueryInterface(ITimedTextBouten.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextBouten := ITimedTextBouten(outPtr)
        }

        return this.__ITimedTextBouten.put_Type(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Color() {
        if (!this.HasProp("__ITimedTextBouten")) {
            if ((queryResult := this.QueryInterface(ITimedTextBouten.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextBouten := ITimedTextBouten(outPtr)
        }

        return this.__ITimedTextBouten.get_Color()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        if (!this.HasProp("__ITimedTextBouten")) {
            if ((queryResult := this.QueryInterface(ITimedTextBouten.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextBouten := ITimedTextBouten(outPtr)
        }

        return this.__ITimedTextBouten.put_Color(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Position() {
        if (!this.HasProp("__ITimedTextBouten")) {
            if ((queryResult := this.QueryInterface(ITimedTextBouten.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextBouten := ITimedTextBouten(outPtr)
        }

        return this.__ITimedTextBouten.get_Position()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Position(value) {
        if (!this.HasProp("__ITimedTextBouten")) {
            if ((queryResult := this.QueryInterface(ITimedTextBouten.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITimedTextBouten := ITimedTextBouten(outPtr)
        }

        return this.__ITimedTextBouten.put_Position(value)
    }

;@endregion Instance Methods
}
