#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\UsbInterfaceDescriptor.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Usb
 * @version WindowsRuntime 1.4
 */
class IUsbInterfaceDescriptorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUsbInterfaceDescriptorStatics
     * @type {Guid}
     */
    static IID => Guid("{e34a9ff5-77d6-48b6-b0be-16c6422316fe}")

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
     * @param {Pointer<UsbInterfaceDescriptor>} parsed 
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
     * @returns {UsbInterfaceDescriptor} 
     * @see https://learn.microsoft.com/office/client-developer/ocs/docs/access/parse-function-access-custom-web-app
     */
    Parse(descriptor) {
        result := ComCall(7, this, "ptr", descriptor, "ptr*", &parsed := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UsbInterfaceDescriptor(parsed)
    }
}
