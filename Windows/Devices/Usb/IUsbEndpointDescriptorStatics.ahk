#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UsbEndpointDescriptor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbEndpointDescriptorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbEndpointDescriptorStatics
     * @type {Guid}
     */
    static IID => Guid("{c890b201-9a6a-495e-a82c-295b9e708106}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryParse", "Parse"]

    /**
     * 
     * @param {UsbDescriptor} descriptor 
     * @param {Pointer<UsbEndpointDescriptor>} parsed 
     * @returns {Boolean} 
     */
    TryParse(descriptor, parsed) {
        result := ComCall(6, this, "ptr", descriptor, "ptr", parsed, "int*", &success := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return success
    }

    /**
     * Parses a text value and returns its value in a given type using the culture of the application.
     * @remarks
     * Use **Parse** only for converting from string to date/time and number types. For general type conversions, use the **Convert** function. Keep in mind that there is a certain performance overhead in parsing the string value.
     * @param {UsbDescriptor} descriptor 
     * @returns {UsbEndpointDescriptor} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/access/parse-function-access-custom-web-app
     */
    Parse(descriptor) {
        result := ComCall(7, this, "ptr", descriptor, "ptr*", &parsed := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbEndpointDescriptor(parsed)
    }
}
