#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILineDisplayCursorAttributes.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the attributes of a line display cursor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycursorattributes
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplayCursorAttributes extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILineDisplayCursorAttributes

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILineDisplayCursorAttributes.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets whether blinking is enabled on the cursor.
     * @remarks
     * Changes to this property are committed to the device on the next call to [LineDisplayCursor.TryUpdateAttributesAsync(LineDisplayCursorAttributes)](linedisplaycursor_tryupdateattributesasync_248842415.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycursorattributes.isblinkenabled
     * @type {Boolean} 
     */
    IsBlinkEnabled {
        get => this.get_IsBlinkEnabled()
        set => this.put_IsBlinkEnabled(value)
    }

    /**
     * Gets or sets the type of cursor used by the line display.
     * @remarks
     * Changes to this property are committed to the device on the next call to [LineDisplayCursor.TryUpdateAttributesAsync(LineDisplayCursorAttributes)](linedisplaycursor_tryupdateattributesasync_248842415.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycursorattributes.cursortype
     * @type {Integer} 
     */
    CursorType {
        get => this.get_CursorType()
        set => this.put_CursorType(value)
    }

    /**
     * Gets or sets whether automatic advancing of the cursor is enabled.
     * @remarks
     * When set to True, the cursor’s Position will be automatically updated to point to the next character to be displayed, whenever text is displayed. When False, the cursor position will not be automatically updated when characters are displayed.
     * 
     * Changes to this property are committed to the device on the next call to [LineDisplayCursor.TryUpdateAttributesAsync(LineDisplayCursorAttributes)](linedisplaycursor_tryupdateattributesasync_248842415.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycursorattributes.isautoadvanceenabled
     * @type {Boolean} 
     */
    IsAutoAdvanceEnabled {
        get => this.get_IsAutoAdvanceEnabled()
        set => this.put_IsAutoAdvanceEnabled(value)
    }

    /**
     * Gets or sets the position of the cursor.
     * @remarks
     * The maximum cursor position is described by the cursor owner’s LineDisplayWindow.Size property. 
     * 
     * The default value of this property is {0,0}.
     * 
     * Changes to this property are committed to the device on the next call to [LineDisplayCursor.TryUpdateAttributesAsync(LineDisplayCursorAttributes)](linedisplaycursor_tryupdateattributesasync_248842415.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycursorattributes.position
     * @type {POINT} 
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
     * @returns {Boolean} 
     */
    get_IsBlinkEnabled() {
        if (!this.HasProp("__ILineDisplayCursorAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCursorAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCursorAttributes := ILineDisplayCursorAttributes(outPtr)
        }

        return this.__ILineDisplayCursorAttributes.get_IsBlinkEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsBlinkEnabled(value) {
        if (!this.HasProp("__ILineDisplayCursorAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCursorAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCursorAttributes := ILineDisplayCursorAttributes(outPtr)
        }

        return this.__ILineDisplayCursorAttributes.put_IsBlinkEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CursorType() {
        if (!this.HasProp("__ILineDisplayCursorAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCursorAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCursorAttributes := ILineDisplayCursorAttributes(outPtr)
        }

        return this.__ILineDisplayCursorAttributes.get_CursorType()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CursorType(value) {
        if (!this.HasProp("__ILineDisplayCursorAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCursorAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCursorAttributes := ILineDisplayCursorAttributes(outPtr)
        }

        return this.__ILineDisplayCursorAttributes.put_CursorType(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAutoAdvanceEnabled() {
        if (!this.HasProp("__ILineDisplayCursorAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCursorAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCursorAttributes := ILineDisplayCursorAttributes(outPtr)
        }

        return this.__ILineDisplayCursorAttributes.get_IsAutoAdvanceEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAutoAdvanceEnabled(value) {
        if (!this.HasProp("__ILineDisplayCursorAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCursorAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCursorAttributes := ILineDisplayCursorAttributes(outPtr)
        }

        return this.__ILineDisplayCursorAttributes.put_IsAutoAdvanceEnabled(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__ILineDisplayCursorAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCursorAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCursorAttributes := ILineDisplayCursorAttributes(outPtr)
        }

        return this.__ILineDisplayCursorAttributes.get_Position()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_Position(value) {
        if (!this.HasProp("__ILineDisplayCursorAttributes")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCursorAttributes.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCursorAttributes := ILineDisplayCursorAttributes(outPtr)
        }

        return this.__ILineDisplayCursorAttributes.put_Position(value)
    }

;@endregion Instance Methods
}
