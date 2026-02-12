#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHidInputReportReceivedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the arguments which the HID API sends as part of an input-report event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidinputreportreceivedeventargs
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class HidInputReportReceivedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHidInputReportReceivedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHidInputReportReceivedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the input report.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidinputreportreceivedeventargs.report
     * @type {HidInputReport} 
     */
    Report {
        get => this.get_Report()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HidInputReport} 
     */
    get_Report() {
        if (!this.HasProp("__IHidInputReportReceivedEventArgs")) {
            if ((queryResult := this.QueryInterface(IHidInputReportReceivedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidInputReportReceivedEventArgs := IHidInputReportReceivedEventArgs(outPtr)
        }

        return this.__IHidInputReportReceivedEventArgs.get_Report()
    }

;@endregion Instance Methods
}
