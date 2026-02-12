#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITwoPanelHingedDevicePosturePreviewReading.ahk
#Include ..\..\..\Guid.ahk

/**
 * A snapshot of the device's posture information at a moment in time.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.preview.twopanelhingeddeviceposturepreviewreading
 * @namespace Windows.System.Preview
 * @version WindowsRuntime 1.4
 */
class TwoPanelHingedDevicePosturePreviewReading extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITwoPanelHingedDevicePosturePreviewReading

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITwoPanelHingedDevicePosturePreviewReading.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Describes when a [TwoPanelHingedDevicePosturePreviewReading](twopanelhingeddeviceposturepreviewreading.md) was taken.
     * @see https://learn.microsoft.com/uwp/api/windows.system.preview.twopanelhingeddeviceposturepreviewreading.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * The [hinge state](hingestate.md) of the device.
     * @see https://learn.microsoft.com/uwp/api/windows.system.preview.twopanelhingeddeviceposturepreviewreading.hingestate
     * @type {Integer} 
     */
    HingeState {
        get => this.get_HingeState()
    }

    /**
     * Describes the orientation of the device's first panel at the time the reading was taken.
     * @see https://learn.microsoft.com/uwp/api/windows.system.preview.twopanelhingeddeviceposturepreviewreading.panel1orientation
     * @type {Integer} 
     */
    Panel1Orientation {
        get => this.get_Panel1Orientation()
    }

    /**
     * Describes the id of the device's 1st panel.
     * @see https://learn.microsoft.com/uwp/api/windows.system.preview.twopanelhingeddeviceposturepreviewreading.panel1id
     * @type {HSTRING} 
     */
    Panel1Id {
        get => this.get_Panel1Id()
    }

    /**
     * Describes the orientation of the device's second panel at the time the reading was taken.
     * @see https://learn.microsoft.com/uwp/api/windows.system.preview.twopanelhingeddeviceposturepreviewreading.panel2orientation
     * @type {Integer} 
     */
    Panel2Orientation {
        get => this.get_Panel2Orientation()
    }

    /**
     * Describes the id of the device's second panel.
     * @see https://learn.microsoft.com/uwp/api/windows.system.preview.twopanelhingeddeviceposturepreviewreading.panel2id
     * @type {HSTRING} 
     */
    Panel2Id {
        get => this.get_Panel2Id()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__ITwoPanelHingedDevicePosturePreviewReading")) {
            if ((queryResult := this.QueryInterface(ITwoPanelHingedDevicePosturePreviewReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPanelHingedDevicePosturePreviewReading := ITwoPanelHingedDevicePosturePreviewReading(outPtr)
        }

        return this.__ITwoPanelHingedDevicePosturePreviewReading.get_Timestamp()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HingeState() {
        if (!this.HasProp("__ITwoPanelHingedDevicePosturePreviewReading")) {
            if ((queryResult := this.QueryInterface(ITwoPanelHingedDevicePosturePreviewReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPanelHingedDevicePosturePreviewReading := ITwoPanelHingedDevicePosturePreviewReading(outPtr)
        }

        return this.__ITwoPanelHingedDevicePosturePreviewReading.get_HingeState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Panel1Orientation() {
        if (!this.HasProp("__ITwoPanelHingedDevicePosturePreviewReading")) {
            if ((queryResult := this.QueryInterface(ITwoPanelHingedDevicePosturePreviewReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPanelHingedDevicePosturePreviewReading := ITwoPanelHingedDevicePosturePreviewReading(outPtr)
        }

        return this.__ITwoPanelHingedDevicePosturePreviewReading.get_Panel1Orientation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Panel1Id() {
        if (!this.HasProp("__ITwoPanelHingedDevicePosturePreviewReading")) {
            if ((queryResult := this.QueryInterface(ITwoPanelHingedDevicePosturePreviewReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPanelHingedDevicePosturePreviewReading := ITwoPanelHingedDevicePosturePreviewReading(outPtr)
        }

        return this.__ITwoPanelHingedDevicePosturePreviewReading.get_Panel1Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Panel2Orientation() {
        if (!this.HasProp("__ITwoPanelHingedDevicePosturePreviewReading")) {
            if ((queryResult := this.QueryInterface(ITwoPanelHingedDevicePosturePreviewReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPanelHingedDevicePosturePreviewReading := ITwoPanelHingedDevicePosturePreviewReading(outPtr)
        }

        return this.__ITwoPanelHingedDevicePosturePreviewReading.get_Panel2Orientation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Panel2Id() {
        if (!this.HasProp("__ITwoPanelHingedDevicePosturePreviewReading")) {
            if ((queryResult := this.QueryInterface(ITwoPanelHingedDevicePosturePreviewReading.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITwoPanelHingedDevicePosturePreviewReading := ITwoPanelHingedDevicePosturePreviewReading(outPtr)
        }

        return this.__ITwoPanelHingedDevicePosturePreviewReading.get_Panel2Id()
    }

;@endregion Instance Methods
}
