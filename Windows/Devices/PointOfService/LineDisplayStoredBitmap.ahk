#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILineDisplayStoredBitmap.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an object used to store a bitmap via the LineDisplayWindow.StoreBitmapAsync method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaystoredbitmap
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplayStoredBitmap extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILineDisplayStoredBitmap

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILineDisplayStoredBitmap.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the UnifiedPOS escape sequence that is used to print images inline with text.
     * @remarks
     * Using this escape sequence after TryDeleteAsync has been called yields indeterminate results.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaystoredbitmap.escapesequence
     * @type {HSTRING} 
     */
    EscapeSequence {
        get => this.get_EscapeSequence()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EscapeSequence() {
        if (!this.HasProp("__ILineDisplayStoredBitmap")) {
            if ((queryResult := this.QueryInterface(ILineDisplayStoredBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayStoredBitmap := ILineDisplayStoredBitmap(outPtr)
        }

        return this.__ILineDisplayStoredBitmap.get_EscapeSequence()
    }

    /**
     * Attempts to asynchronously delete the stored bitmap.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaystoredbitmap.trydeleteasync
     */
    TryDeleteAsync() {
        if (!this.HasProp("__ILineDisplayStoredBitmap")) {
            if ((queryResult := this.QueryInterface(ILineDisplayStoredBitmap.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayStoredBitmap := ILineDisplayStoredBitmap(outPtr)
        }

        return this.__ILineDisplayStoredBitmap.TryDeleteAsync()
    }

;@endregion Instance Methods
}
