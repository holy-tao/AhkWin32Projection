#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILineDisplayStatusUpdatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides event data for power state changes in the line display device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaystatusupdatedeventargs
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class LineDisplayStatusUpdatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILineDisplayStatusUpdatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILineDisplayStatusUpdatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the current power status of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.linedisplaystatusupdatedeventargs.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
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
    get_Status() {
        if (!this.HasProp("__ILineDisplayStatusUpdatedEventArgs")) {
            if ((queryResult := this.QueryInterface(ILineDisplayStatusUpdatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILineDisplayStatusUpdatedEventArgs := ILineDisplayStatusUpdatedEventArgs(outPtr)
        }

        return this.__ILineDisplayStatusUpdatedEventArgs.get_Status()
    }

;@endregion Instance Methods
}
