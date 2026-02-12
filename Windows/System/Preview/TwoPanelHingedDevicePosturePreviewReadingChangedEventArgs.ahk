#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about a TwoPanelHingedDevicePosturePreviewReadingChanged event
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.preview.twopanelhingeddeviceposturepreviewreadingchangedeventargs
 * @namespace Windows.System.Preview
 * @version WindowsRuntime 1.4
 */
class TwoPanelHingedDevicePosturePreviewReadingChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The [TwoPanelHingedDevicePosturePreviewReading](twopanelhingeddeviceposturepreviewreading.md) that is passed along with the TwoPanelHingedDevicePosturePreviewReadingChangedEvent.
     * @see https://learn.microsoft.com/uwp/api/windows.system.preview.twopanelhingeddeviceposturepreviewreadingchangedeventargs.reading
     * @type {TwoPanelHingedDevicePosturePreviewReading} 
     */
    Reading {
        get => this.get_Reading()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TwoPanelHingedDevicePosturePreviewReading} 
     */
    get_Reading() {
        if (!this.HasProp("__ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs := ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs(outPtr)
        }

        return this.__ITwoPanelHingedDevicePosturePreviewReadingChangedEventArgs.get_Reading()
    }

;@endregion Instance Methods
}
