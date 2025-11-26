#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains the properties that are available only from a Windows driver update.
 * @remarks
 * 
 * None of the IWindowsDriverUpdateEntry properties are expected to return any errors (other than E_POINTER if <b>NULL</b> is passed to the property).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iwindowsdriverupdateentry
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IWindowsDriverUpdateEntry extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsDriverUpdateEntry
     * @type {Guid}
     */
    static IID => Guid("{ed8bfe40-a60b-42ea-9652-817dfcfa23ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DriverClass", "get_DriverHardwareID", "get_DriverManufacturer", "get_DriverModel", "get_DriverProvider", "get_DriverVerDate", "get_DeviceProblemNumber", "get_DeviceStatus"]

    /**
     * @type {BSTR} 
     */
    DriverClass {
        get => this.get_DriverClass()
    }

    /**
     * @type {BSTR} 
     */
    DriverHardwareID {
        get => this.get_DriverHardwareID()
    }

    /**
     * @type {BSTR} 
     */
    DriverManufacturer {
        get => this.get_DriverManufacturer()
    }

    /**
     * @type {BSTR} 
     */
    DriverModel {
        get => this.get_DriverModel()
    }

    /**
     * @type {BSTR} 
     */
    DriverProvider {
        get => this.get_DriverProvider()
    }

    /**
     * @type {Float} 
     */
    DriverVerDate {
        get => this.get_DriverVerDate()
    }

    /**
     * @type {Integer} 
     */
    DeviceProblemNumber {
        get => this.get_DeviceProblemNumber()
    }

    /**
     * @type {Integer} 
     */
    DeviceStatus {
        get => this.get_DeviceStatus()
    }

    /**
     * Retrieves the class of the Windows driver update.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwindowsdriverupdateentry-get_driverclass
     */
    get_DriverClass() {
        retval := BSTR()
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets the hardware or the compatible identifier that the Windows driver update must match to be installable.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwindowsdriverupdateentry-get_driverhardwareid
     */
    get_DriverHardwareID() {
        retval := BSTR()
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets the language-invariant name of the manufacturer of the Windows driver update.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwindowsdriverupdateentry-get_drivermanufacturer
     */
    get_DriverManufacturer() {
        retval := BSTR()
        result := ComCall(9, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets the language-invariant model name of the device for which the Windows driver update is intended.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwindowsdriverupdateentry-get_drivermodel
     */
    get_DriverModel() {
        retval := BSTR()
        result := ComCall(10, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets the language-invariant name of the provider of the Windows driver update.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwindowsdriverupdateentry-get_driverprovider
     */
    get_DriverProvider() {
        retval := BSTR()
        result := ComCall(11, this, "ptr", retval, "HRESULT")
        return retval
    }

    /**
     * Gets the driver version date of the Windows driver update.
     * @returns {Float} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwindowsdriverupdateentry-get_driververdate
     */
    get_DriverVerDate() {
        result := ComCall(12, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the problem number of the matching device for the Windows driver update.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwindowsdriverupdateentry-get_deviceproblemnumber
     */
    get_DeviceProblemNumber() {
        result := ComCall(13, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the status of the matching device for the Windows driver update.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iwindowsdriverupdateentry-get_devicestatus
     */
    get_DeviceStatus() {
        result := ComCall(14, this, "int*", &retval := 0, "HRESULT")
        return retval
    }
}
