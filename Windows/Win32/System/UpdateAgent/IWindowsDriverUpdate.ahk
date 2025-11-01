#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdate.ahk

/**
 * Contains the properties and the methods that are available only from a Windows driver update.
 * @remarks
 * 
  * This interface can be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method on an <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> interface only if the interface represents a Windows driver update.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iwindowsdriverupdate
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IWindowsDriverUpdate extends IUpdate{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsDriverUpdate
     * @type {Guid}
     */
    static IID => Guid("{b383cd1a-5ce9-4504-9f63-764b1236f191}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 52

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DriverClass", "get_DriverHardwareID", "get_DriverManufacturer", "get_DriverModel", "get_DriverProvider", "get_DriverVerDate", "get_DeviceProblemNumber", "get_DeviceStatus"]

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate-get_driverclass
     */
    get_DriverClass(retval) {
        result := ComCall(52, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate-get_driverhardwareid
     */
    get_DriverHardwareID(retval) {
        result := ComCall(53, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate-get_drivermanufacturer
     */
    get_DriverManufacturer(retval) {
        result := ComCall(54, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate-get_drivermodel
     */
    get_DriverModel(retval) {
        result := ComCall(55, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate-get_driverprovider
     */
    get_DriverProvider(retval) {
        result := ComCall(56, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate-get_driververdate
     */
    get_DriverVerDate(retval) {
        retvalMarshal := retval is VarRef ? "double*" : "ptr"

        result := ComCall(57, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate-get_deviceproblemnumber
     */
    get_DeviceProblemNumber(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(58, this, retvalMarshal, retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate-get_devicestatus
     */
    get_DeviceStatus(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(59, this, retvalMarshal, retval, "HRESULT")
        return result
    }
}
