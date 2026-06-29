#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IUpdate.ahk" { IUpdate }

/**
 * Contains the properties and the methods that are available only from a Windows driver update.
 * @remarks
 * This interface can be obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method on an <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a> interface only if the interface represents a Windows driver update.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iwindowsdriverupdate
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IWindowsDriverUpdate extends IUpdate {
    /**
     * The interface identifier for IWindowsDriverUpdate
     * @type {Guid}
     */
    static IID := Guid("{b383cd1a-5ce9-4504-9f63-764b1236f191}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWindowsDriverUpdate interfaces
    */
    struct Vtbl extends IUpdate.Vtbl {
        get_DriverClass         : IntPtr
        get_DriverHardwareID    : IntPtr
        get_DriverManufacturer  : IntPtr
        get_DriverModel         : IntPtr
        get_DriverProvider      : IntPtr
        get_DriverVerDate       : IntPtr
        get_DeviceProblemNumber : IntPtr
        get_DeviceStatus        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWindowsDriverUpdate.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * Gets the class of the Windows driver update.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate-get_driverclass
     */
    get_DriverClass() {
        retval := BSTR.Owned()
        result := ComCall(52, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the hardware ID or compatible ID that the Windows driver update must match to be installable.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate-get_driverhardwareid
     */
    get_DriverHardwareID() {
        retval := BSTR.Owned()
        result := ComCall(53, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the language-invariant name of the manufacturer of the Windows driver update. (IWindowsDriverUpdate.get_DriverManufacturer)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate-get_drivermanufacturer
     */
    get_DriverManufacturer() {
        retval := BSTR.Owned()
        result := ComCall(54, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the language-invariant model name of the device for which the Windows driver update is intended. (IWindowsDriverUpdate.get_DriverModel)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate-get_drivermodel
     */
    get_DriverModel() {
        retval := BSTR.Owned()
        result := ComCall(55, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the language-invariant name of the provider of the Windows driver update. (IWindowsDriverUpdate.get_DriverProvider)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate-get_driverprovider
     */
    get_DriverProvider() {
        retval := BSTR.Owned()
        result := ComCall(56, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the driver version date of the Windows driver update. (IWindowsDriverUpdate.get_DriverVerDate)
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate-get_driververdate
     */
    get_DriverVerDate() {
        result := ComCall(57, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the problem number of the matching device for the Windows driver update. (IWindowsDriverUpdate.get_DeviceProblemNumber)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate-get_deviceproblemnumber
     */
    get_DeviceProblemNumber() {
        result := ComCall(58, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the status of the matching device for the Windows driver update. (IWindowsDriverUpdate.get_DeviceStatus)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdate-get_devicestatus
     */
    get_DeviceStatus() {
        result := ComCall(59, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IWindowsDriverUpdate.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DriverClass := CallbackCreate(GetMethod(implObj, "get_DriverClass"), flags, 2)
        this.vtbl.get_DriverHardwareID := CallbackCreate(GetMethod(implObj, "get_DriverHardwareID"), flags, 2)
        this.vtbl.get_DriverManufacturer := CallbackCreate(GetMethod(implObj, "get_DriverManufacturer"), flags, 2)
        this.vtbl.get_DriverModel := CallbackCreate(GetMethod(implObj, "get_DriverModel"), flags, 2)
        this.vtbl.get_DriverProvider := CallbackCreate(GetMethod(implObj, "get_DriverProvider"), flags, 2)
        this.vtbl.get_DriverVerDate := CallbackCreate(GetMethod(implObj, "get_DriverVerDate"), flags, 2)
        this.vtbl.get_DeviceProblemNumber := CallbackCreate(GetMethod(implObj, "get_DeviceProblemNumber"), flags, 2)
        this.vtbl.get_DeviceStatus := CallbackCreate(GetMethod(implObj, "get_DeviceStatus"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DriverClass)
        CallbackFree(this.vtbl.get_DriverHardwareID)
        CallbackFree(this.vtbl.get_DriverManufacturer)
        CallbackFree(this.vtbl.get_DriverModel)
        CallbackFree(this.vtbl.get_DriverProvider)
        CallbackFree(this.vtbl.get_DriverVerDate)
        CallbackFree(this.vtbl.get_DeviceProblemNumber)
        CallbackFree(this.vtbl.get_DeviceStatus)
    }
}
