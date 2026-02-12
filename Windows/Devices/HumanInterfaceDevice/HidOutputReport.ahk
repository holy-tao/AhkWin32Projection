#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHidOutputReport.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a [HID Output Report](/windows-hardware/drivers/hid/introduction-to-hid-concepts#reports).
  * 
  * Hosts issue output reports to request changes on the device. For example, a host could issue a request to a keyboard to turn an LED on or off.
 * @remarks
 * The following example demonstrates how a UWP app built with XAML and C# uses the **CreateOutputReport** method to create an output report. This example then uses the **SendOutputReportAsync** method to send the report to the device.
 * 
 * ```csharp
 * using System;
 * using System.Collections.Generic;
 * using System.Linq;
 * using System.Text;
 * using System.Threading.Tasks;
 * 
 * using Windows.Devices.Enumeration;
 * using Windows.Devices.HumanInterfaceDevice;
 * using Windows.Storage;
 * using Windows.Storage.Streams;
 * 
 * namespace HidSampleCS
 * {
 *     class Vendor
 *     {
 *         private async void ReadWriteToHidDevice(HidDevice device)
 *         {
 *             if (device != null)
 *             {
 *                 // construct a HID output report to send to the device
 *                 HidOutputReport outReport = device.CreateOutputReport();
 * 
 *                 /// Initialize the data buffer and fill it in
 *                 byte[] buffer = new byte[] { 10, 20, 30, 40 };
 * 
 *                 DataWriter dataWriter = new DataWriter();
 *                 dataWriter.WriteBytes(buffer);
 * 
 *                 outReport.Data = dataWriter.DetachBuffer();
 * 
 *                 // Send the output report asynchronously
 *                 await device.SendOutputReportAsync(outReport);
 * 
 *                 //
 *                 // Sent output report successfully 
 *                 // Now lets try read an input report 
 *                 //
 *                 HidInputReport inReport = await device.GetInputReportAsync();
 * 
 *                 if (inReport != null)
 *                 {
 *                     UInt16 id = inReport.Id;
 *                     var bytes = new byte[4];
 *                     DataReader dataReader = DataReader.FromBuffer(inReport.Data);
 *                     dataReader.ReadBytes(bytes);
 *                 }
 *                 else
 *                 {
 *                     this.NotifyUser("Invalid input report received");
 *                 }
 *             }
 *             else
 *             {
 *                 this.NotifyUser("device is NULL");
 *             }
 *         }
 *     }
 * }
 * 
 * 
 * ```
 * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidoutputreport
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class HidOutputReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHidOutputReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHidOutputReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier associated with a given output report.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidoutputreport.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets or sets the data associated with a given output report.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidoutputreport.data
     * @type {IBuffer} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
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
    get_Id() {
        if (!this.HasProp("__IHidOutputReport")) {
            if ((queryResult := this.QueryInterface(IHidOutputReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidOutputReport := IHidOutputReport(outPtr)
        }

        return this.__IHidOutputReport.get_Id()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Data() {
        if (!this.HasProp("__IHidOutputReport")) {
            if ((queryResult := this.QueryInterface(IHidOutputReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidOutputReport := IHidOutputReport(outPtr)
        }

        return this.__IHidOutputReport.get_Data()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        if (!this.HasProp("__IHidOutputReport")) {
            if ((queryResult := this.QueryInterface(IHidOutputReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidOutputReport := IHidOutputReport(outPtr)
        }

        return this.__IHidOutputReport.put_Data(value)
    }

    /**
     * Retrieves the boolean control associated with the given *usagePage* and *usageId*.
     * @param {Integer} usagePage The usage page associated with the given control.
     * @param {Integer} usageId The usage identifier associated with the given control.
     * @returns {HidBooleanControl} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidoutputreport.getbooleancontrol
     */
    GetBooleanControl(usagePage, usageId) {
        if (!this.HasProp("__IHidOutputReport")) {
            if ((queryResult := this.QueryInterface(IHidOutputReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidOutputReport := IHidOutputReport(outPtr)
        }

        return this.__IHidOutputReport.GetBooleanControl(usagePage, usageId)
    }

    /**
     * Retrieves the boolean control associated with the given *controlDescription*.
     * @param {HidBooleanControlDescription} controlDescription Describes the Boolean control.
     * @returns {HidBooleanControl} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidoutputreport.getbooleancontrolbydescription
     */
    GetBooleanControlByDescription(controlDescription) {
        if (!this.HasProp("__IHidOutputReport")) {
            if ((queryResult := this.QueryInterface(IHidOutputReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidOutputReport := IHidOutputReport(outPtr)
        }

        return this.__IHidOutputReport.GetBooleanControlByDescription(controlDescription)
    }

    /**
     * Retrieves the numeric control associated with the given *usagePage* and *usageId*.
     * @param {Integer} usagePage The usage page associated with the given control.
     * @param {Integer} usageId The usage identifier associated with the given control.
     * @returns {HidNumericControl} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidoutputreport.getnumericcontrol
     */
    GetNumericControl(usagePage, usageId) {
        if (!this.HasProp("__IHidOutputReport")) {
            if ((queryResult := this.QueryInterface(IHidOutputReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidOutputReport := IHidOutputReport(outPtr)
        }

        return this.__IHidOutputReport.GetNumericControl(usagePage, usageId)
    }

    /**
     * Retrieves the numeric control associated with the given *controlDescription*.
     * @param {HidNumericControlDescription} controlDescription Describes the numeric control.
     * @returns {HidNumericControl} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidoutputreport.getnumericcontrolbydescription
     */
    GetNumericControlByDescription(controlDescription) {
        if (!this.HasProp("__IHidOutputReport")) {
            if ((queryResult := this.QueryInterface(IHidOutputReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidOutputReport := IHidOutputReport(outPtr)
        }

        return this.__IHidOutputReport.GetNumericControlByDescription(controlDescription)
    }

;@endregion Instance Methods
}
