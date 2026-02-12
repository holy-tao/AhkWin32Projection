#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintExtensionContextStatic.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides the context for the printer extension object.
 * @remarks
 * The following JavaScript code snippet retrieves the **PrinterExtensionContext** using a [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) ID, and then uses the context to create a helper object:
 * 
 * 
 * 
 * 
 * 
 * ```javascript
 * // This function runs when the user taps the Back button
 * function getInkStatus(deviceInformationId) {
 *     var responseString;
 *     try {
 *         var context = Windows.Devices.Printers.Extensions.
 *             PrintExtensionContext.fromDeviceId(deviceInformationId);
 *         var helper = new Microsoft.Samples.Printing.WwaDca.
 *             PrintHelperClass(context);
 *         var responseString = helper.getInkLevel(1);
 *     } catch (e) {
 *         responseString = "deviceInformationId: " + deviceInformationId + 
 *             " Message: " + e.message;
 *     }
 *     return responseString
 * }
 * 
 * ```
 * 
 * For more information about using the **PrinterExtensionContext** class, see the [UWP device apps for printers](/windows-hardware/drivers/devapps/windows-store-device-apps-for-printers) topic on the Hardware Dev Center.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.printextensioncontext
 * @namespace Windows.Devices.Printers.Extensions
 * @version WindowsRuntime 1.4
 */
class PrintExtensionContext extends IInspectable {
;@region Static Methods
    /**
     * Gets the context for the printer extension object based on the [DeviceInformation](../windows.devices.enumeration/deviceinformation.md) ID.
     * @param {HSTRING} deviceId The device information ID for the print device.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.printers.extensions.printextensioncontext.fromdeviceid
     */
    static FromDeviceId(deviceId) {
        if (!PrintExtensionContext.HasProp("__IPrintExtensionContextStatic")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Printers.Extensions.PrintExtensionContext")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPrintExtensionContextStatic.IID)
            PrintExtensionContext.__IPrintExtensionContextStatic := IPrintExtensionContextStatic(factoryPtr)
        }

        return PrintExtensionContext.__IPrintExtensionContextStatic.FromDeviceId(deviceId)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
