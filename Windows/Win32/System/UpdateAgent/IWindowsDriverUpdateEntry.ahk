#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdateentry-get_driverclass
     */
    get_DriverClass(retval) {
        result := ComCall(7, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdateentry-get_driverhardwareid
     */
    get_DriverHardwareID(retval) {
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdateentry-get_drivermanufacturer
     */
    get_DriverManufacturer(retval) {
        result := ComCall(9, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdateentry-get_drivermodel
     */
    get_DriverModel(retval) {
        result := ComCall(10, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdateentry-get_driverprovider
     */
    get_DriverProvider(retval) {
        result := ComCall(11, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdateentry-get_driververdate
     */
    get_DriverVerDate(retval) {
        result := ComCall(12, this, "double*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdateentry-get_deviceproblemnumber
     */
    get_DeviceProblemNumber(retval) {
        result := ComCall(13, this, "int*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdateentry-get_devicestatus
     */
    get_DeviceStatus(retval) {
        result := ComCall(14, this, "int*", retval, "HRESULT")
        return result
    }
}
