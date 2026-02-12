#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILineDisplayCursor.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a line display cursor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycursor
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplayCursor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILineDisplayCursor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILineDisplayCursor.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether the line display device supports customizing the cursor style.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycursor.cancustomize
     * @type {Boolean} 
     */
    CanCustomize {
        get => this.get_CanCustomize()
    }

    /**
     * Gets whether cursor blinking is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycursor.isblinksupported
     * @type {Boolean} 
     */
    IsBlinkSupported {
        get => this.get_IsBlinkSupported()
    }

    /**
     * Gets whether a block cursor is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycursor.isblocksupported
     * @type {Boolean} 
     */
    IsBlockSupported {
        get => this.get_IsBlockSupported()
    }

    /**
     * Gets whether a half-block cursor is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycursor.ishalfblocksupported
     * @type {Boolean} 
     */
    IsHalfBlockSupported {
        get => this.get_IsHalfBlockSupported()
    }

    /**
     * Gets whether an underlined cursor is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycursor.isunderlinesupported
     * @type {Boolean} 
     */
    IsUnderlineSupported {
        get => this.get_IsUnderlineSupported()
    }

    /**
     * Gets whether an inverted cursor is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycursor.isreversesupported
     * @type {Boolean} 
     */
    IsReverseSupported {
        get => this.get_IsReverseSupported()
    }

    /**
     * Gets whether another type (unknown as per UnifiedPOS) of cursor is supported.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycursor.isothersupported
     * @type {Boolean} 
     */
    IsOtherSupported {
        get => this.get_IsOtherSupported()
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
    get_CanCustomize() {
        if (!this.HasProp("__ILineDisplayCursor")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCursor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCursor := ILineDisplayCursor(outPtr)
        }

        return this.__ILineDisplayCursor.get_CanCustomize()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBlinkSupported() {
        if (!this.HasProp("__ILineDisplayCursor")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCursor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCursor := ILineDisplayCursor(outPtr)
        }

        return this.__ILineDisplayCursor.get_IsBlinkSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBlockSupported() {
        if (!this.HasProp("__ILineDisplayCursor")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCursor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCursor := ILineDisplayCursor(outPtr)
        }

        return this.__ILineDisplayCursor.get_IsBlockSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHalfBlockSupported() {
        if (!this.HasProp("__ILineDisplayCursor")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCursor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCursor := ILineDisplayCursor(outPtr)
        }

        return this.__ILineDisplayCursor.get_IsHalfBlockSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUnderlineSupported() {
        if (!this.HasProp("__ILineDisplayCursor")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCursor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCursor := ILineDisplayCursor(outPtr)
        }

        return this.__ILineDisplayCursor.get_IsUnderlineSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReverseSupported() {
        if (!this.HasProp("__ILineDisplayCursor")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCursor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCursor := ILineDisplayCursor(outPtr)
        }

        return this.__ILineDisplayCursor.get_IsReverseSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOtherSupported() {
        if (!this.HasProp("__ILineDisplayCursor")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCursor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCursor := ILineDisplayCursor(outPtr)
        }

        return this.__ILineDisplayCursor.get_IsOtherSupported()
    }

    /**
     * Gets the attributes of the line display cursor.
     * @returns {LineDisplayCursorAttributes} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycursor.getattributes
     */
    GetAttributes() {
        if (!this.HasProp("__ILineDisplayCursor")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCursor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCursor := ILineDisplayCursor(outPtr)
        }

        return this.__ILineDisplayCursor.GetAttributes()
    }

    /**
     * Attempts to asynchronously update the attributes of the line display curor.
     * @param {LineDisplayCursorAttributes} attributes The attributes to be applied to the cursor.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaycursor.tryupdateattributesasync
     */
    TryUpdateAttributesAsync(attributes) {
        if (!this.HasProp("__ILineDisplayCursor")) {
            if ((queryResult := this.QueryInterface(ILineDisplayCursor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayCursor := ILineDisplayCursor(outPtr)
        }

        return this.__ILineDisplayCursor.TryUpdateAttributesAsync(attributes)
    }

;@endregion Instance Methods
}
