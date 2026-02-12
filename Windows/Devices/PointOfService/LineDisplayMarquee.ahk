#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILineDisplayMarquee.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an object containing properties describing and allowing control of marquee scrolling on a line display.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaymarquee
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplayMarquee extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILineDisplayMarquee

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILineDisplayMarquee.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the current format of the marquee.
     * @remarks
     * When set to None, marquee scrolling is disabled. Changes to this property are committed to the device on the next call to [LineDisplayMarquee.TryStartScrollingAsync()](linedisplaymarquee_trystartscrollingasync_221236205.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaymarquee.format
     * @type {Integer} 
     */
    Format {
        get => this.get_Format()
        set => this.put_Format(value)
    }

    /**
     * Gets or sets the marquee repeat wait period.
     * @remarks
     * The default value of this property is 0. Changes to this property are committed to the device on the next call to [LineDisplayMarquee.TryStartScrollingAsync()](linedisplaymarquee_trystartscrollingasync_221236205.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaymarquee.repeatwaitinterval
     * @type {TimeSpan} 
     */
    RepeatWaitInterval {
        get => this.get_RepeatWaitInterval()
        set => this.put_RepeatWaitInterval(value)
    }

    /**
     * Gets or sets the scroll wait interval.
     * @remarks
     * The default value of this property is 0. Changes to this property are committed to the device on the next call to [LineDisplayMarquee.TryStartScrollingAsync()](linedisplaymarquee_trystartscrollingasync_221236205.md).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaymarquee.scrollwaitinterval
     * @type {TimeSpan} 
     */
    ScrollWaitInterval {
        get => this.get_ScrollWaitInterval()
        set => this.put_ScrollWaitInterval(value)
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
    get_Format() {
        if (!this.HasProp("__ILineDisplayMarquee")) {
            if ((queryResult := this.QueryInterface(ILineDisplayMarquee.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayMarquee := ILineDisplayMarquee(outPtr)
        }

        return this.__ILineDisplayMarquee.get_Format()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Format(value) {
        if (!this.HasProp("__ILineDisplayMarquee")) {
            if ((queryResult := this.QueryInterface(ILineDisplayMarquee.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayMarquee := ILineDisplayMarquee(outPtr)
        }

        return this.__ILineDisplayMarquee.put_Format(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_RepeatWaitInterval() {
        if (!this.HasProp("__ILineDisplayMarquee")) {
            if ((queryResult := this.QueryInterface(ILineDisplayMarquee.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayMarquee := ILineDisplayMarquee(outPtr)
        }

        return this.__ILineDisplayMarquee.get_RepeatWaitInterval()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_RepeatWaitInterval(value) {
        if (!this.HasProp("__ILineDisplayMarquee")) {
            if ((queryResult := this.QueryInterface(ILineDisplayMarquee.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayMarquee := ILineDisplayMarquee(outPtr)
        }

        return this.__ILineDisplayMarquee.put_RepeatWaitInterval(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_ScrollWaitInterval() {
        if (!this.HasProp("__ILineDisplayMarquee")) {
            if ((queryResult := this.QueryInterface(ILineDisplayMarquee.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayMarquee := ILineDisplayMarquee(outPtr)
        }

        return this.__ILineDisplayMarquee.get_ScrollWaitInterval()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_ScrollWaitInterval(value) {
        if (!this.HasProp("__ILineDisplayMarquee")) {
            if ((queryResult := this.QueryInterface(ILineDisplayMarquee.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayMarquee := ILineDisplayMarquee(outPtr)
        }

        return this.__ILineDisplayMarquee.put_ScrollWaitInterval(value)
    }

    /**
     * Attempts to asynchronously cause the window which owns this marquee to enter Marquee Mode and start scrolling.
     * @param {Integer} direction_ The direction in which to start scrolling.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaymarquee.trystartscrollingasync
     */
    TryStartScrollingAsync(direction_) {
        if (!this.HasProp("__ILineDisplayMarquee")) {
            if ((queryResult := this.QueryInterface(ILineDisplayMarquee.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayMarquee := ILineDisplayMarquee(outPtr)
        }

        return this.__ILineDisplayMarquee.TryStartScrollingAsync(direction_)
    }

    /**
     * Attempts to asynchronously exit Marquee mode and/or Marquee Init mode. Format is set to None.
     * @remarks
     * If the device is not already claimed when this method is called, this method will claim the device (without delay) and enable the device. If the device is already claimed by another process the call will fail.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaymarquee.trystopscrollingasync
     */
    TryStopScrollingAsync() {
        if (!this.HasProp("__ILineDisplayMarquee")) {
            if ((queryResult := this.QueryInterface(ILineDisplayMarquee.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayMarquee := ILineDisplayMarquee(outPtr)
        }

        return this.__ILineDisplayMarquee.TryStopScrollingAsync()
    }

;@endregion Instance Methods
}
