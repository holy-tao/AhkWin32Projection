#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHidInputReport.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a [HID Input Report](/windows-hardware/drivers/hid/introduction-to-hid-concepts#reports).
  * 
  * Devices issue input reports to describe state changes, user-input, and other device-specific data. For example, a HID keyboard device would use an input report to signal a key press. A HID presence-sensor would use an input report to signal a presence detection event.
 * @remarks
 * The following example demonstrates how a UWP app built with XAML and C# uses the **GetInputReportAsync** method to obtain an input report.
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
 * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidinputreport
 * @namespace Windows.Devices.HumanInterfaceDevice
 * @version WindowsRuntime 1.4
 */
class HidInputReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHidInputReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHidInputReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier associated with a given input report.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidinputreport.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the data associated with a given input report.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidinputreport.data
     * @type {IBuffer} 
     */
    Data {
        get => this.get_Data()
    }

    /**
     * Gets the currently activated Boolean controls for the given HID device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidinputreport.activatedbooleancontrols
     * @type {IVectorView<HidBooleanControl>} 
     */
    ActivatedBooleanControls {
        get => this.get_ActivatedBooleanControls()
    }

    /**
     * Gets the recently transitioned Boolean controls for the given HID device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidinputreport.transitionedbooleancontrols
     * @type {IVectorView<HidBooleanControl>} 
     */
    TransitionedBooleanControls {
        get => this.get_TransitionedBooleanControls()
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
        if (!this.HasProp("__IHidInputReport")) {
            if ((queryResult := this.QueryInterface(IHidInputReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidInputReport := IHidInputReport(outPtr)
        }

        return this.__IHidInputReport.get_Id()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Data() {
        if (!this.HasProp("__IHidInputReport")) {
            if ((queryResult := this.QueryInterface(IHidInputReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidInputReport := IHidInputReport(outPtr)
        }

        return this.__IHidInputReport.get_Data()
    }

    /**
     * 
     * @returns {IVectorView<HidBooleanControl>} 
     */
    get_ActivatedBooleanControls() {
        if (!this.HasProp("__IHidInputReport")) {
            if ((queryResult := this.QueryInterface(IHidInputReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidInputReport := IHidInputReport(outPtr)
        }

        return this.__IHidInputReport.get_ActivatedBooleanControls()
    }

    /**
     * 
     * @returns {IVectorView<HidBooleanControl>} 
     */
    get_TransitionedBooleanControls() {
        if (!this.HasProp("__IHidInputReport")) {
            if ((queryResult := this.QueryInterface(IHidInputReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidInputReport := IHidInputReport(outPtr)
        }

        return this.__IHidInputReport.get_TransitionedBooleanControls()
    }

    /**
     * Retrieves the Boolean control associated with the *usagePage* and *usageId* parameter and found in the given input report.
     * @param {Integer} usagePage The usage page of the top-level collection for the given HID device.
     * @param {Integer} usageId The usage identifier of the top-level collection for the given HID device.
     * @returns {HidBooleanControl} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidinputreport.getbooleancontrol
     */
    GetBooleanControl(usagePage, usageId) {
        if (!this.HasProp("__IHidInputReport")) {
            if ((queryResult := this.QueryInterface(IHidInputReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidInputReport := IHidInputReport(outPtr)
        }

        return this.__IHidInputReport.GetBooleanControl(usagePage, usageId)
    }

    /**
     * Retrieves the Boolean control described by the *controlDescription* parameter and found in the given input report.
     * @param {HidBooleanControlDescription} controlDescription A **HidBooleanControlDescription** object.
     * @returns {HidBooleanControl} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidinputreport.getbooleancontrolbydescription
     */
    GetBooleanControlByDescription(controlDescription) {
        if (!this.HasProp("__IHidInputReport")) {
            if ((queryResult := this.QueryInterface(IHidInputReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidInputReport := IHidInputReport(outPtr)
        }

        return this.__IHidInputReport.GetBooleanControlByDescription(controlDescription)
    }

    /**
     * Retrieves the numeric control associated with the *usagePage* and *usageId* parameters and found in the given input report.
     * @param {Integer} usagePage The usage page of the top-level collection for the given HID device.
     * @param {Integer} usageId The usage identifier of the top-level collection for the given HID device.
     * @returns {HidNumericControl} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidinputreport.getnumericcontrol
     */
    GetNumericControl(usagePage, usageId) {
        if (!this.HasProp("__IHidInputReport")) {
            if ((queryResult := this.QueryInterface(IHidInputReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidInputReport := IHidInputReport(outPtr)
        }

        return this.__IHidInputReport.GetNumericControl(usagePage, usageId)
    }

    /**
     * Retrieves the numeric control described by the *controlDescription* parameter and found in the given input report.
     * @param {HidNumericControlDescription} controlDescription A **HidNumericControlDescription** object.
     * @returns {HidNumericControl} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.humaninterfacedevice.hidinputreport.getnumericcontrolbydescription
     */
    GetNumericControlByDescription(controlDescription) {
        if (!this.HasProp("__IHidInputReport")) {
            if ((queryResult := this.QueryInterface(IHidInputReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHidInputReport := IHidInputReport(outPtr)
        }

        return this.__IHidInputReport.GetNumericControlByDescription(controlDescription)
    }

;@endregion Instance Methods
}
