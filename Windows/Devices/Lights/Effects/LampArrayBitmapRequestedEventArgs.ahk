#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILampArrayBitmapRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [BitmapRequested](lamparraybitmapeffect_bitmaprequested.md) event.
 * @remarks
 * Cannot call any methods on the object given by the event handler, outside of the event handler.
 * 
 * No effect progress can continue until the event handler has returned, so ensure the minimal time is spent within it.  (for example, do not load images from disk during the event handler).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraybitmaprequestedeventargs
 * @namespace Windows.Devices.Lights.Effects
 * @version WindowsRuntime 1.4
 */
class LampArrayBitmapRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILampArrayBitmapRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILampArrayBitmapRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time since the effect was started.
     * @remarks
     * Will always be 0 at the start of a playlist iteration.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraybitmaprequestedeventargs.sincestarted
     * @type {TimeSpan} 
     */
    SinceStarted {
        get => this.get_SinceStarted()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SinceStarted() {
        if (!this.HasProp("__ILampArrayBitmapRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ILampArrayBitmapRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBitmapRequestedEventArgs := ILampArrayBitmapRequestedEventArgs(outPtr)
        }

        return this.__ILampArrayBitmapRequestedEventArgs.get_SinceStarted()
    }

    /**
     * Sets previously specified lamp/s indexes according to the caller defined image.
     * @remarks
     * Images supplied that are not of the [SuggestedBitmapSize](lamparraybitmapeffect_suggestedbitmapsize.md) will incur a small performance penalty when resizing internally.
     * @param {SoftwareBitmap} bitmap_ The image form which to update the lamp/s.  If `null`, all lamps are to set off/[Black](../windows.ui/colors_black.md)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraybitmaprequestedeventargs.updatebitmap
     */
    UpdateBitmap(bitmap_) {
        if (!this.HasProp("__ILampArrayBitmapRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(ILampArrayBitmapRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBitmapRequestedEventArgs := ILampArrayBitmapRequestedEventArgs(outPtr)
        }

        return this.__ILampArrayBitmapRequestedEventArgs.UpdateBitmap(bitmap_)
    }

;@endregion Instance Methods
}
