#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Contains the properties that are available only from a Windows driver update.
 * @remarks
 * None of the IWindowsDriverUpdateEntry properties are expected to return any errors (other than E_POINTER if <b>NULL</b> is passed to the property).
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iwindowsdriverupdateentry
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IWindowsDriverUpdateEntry extends IDispatch {
    /**
     * The interface identifier for IWindowsDriverUpdateEntry
     * @type {Guid}
     */
    static IID := Guid("{ed8bfe40-a60b-42ea-9652-817dfcfa23ec}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWindowsDriverUpdateEntry interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
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
            this.vtbl := IWindowsDriverUpdateEntry.Vtbl()
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
     * Retrieves the class of the Windows driver update.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdateentry-get_driverclass
     */
    get_DriverClass() {
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the hardware or the compatible identifier that the Windows driver update must match to be installable.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdateentry-get_driverhardwareid
     */
    get_DriverHardwareID() {
        retval := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the language-invariant name of the manufacturer of the Windows driver update. (IWindowsDriverUpdateEntry.get_DriverManufacturer)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdateentry-get_drivermanufacturer
     */
    get_DriverManufacturer() {
        retval := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the language-invariant model name of the device for which the Windows driver update is intended. (IWindowsDriverUpdateEntry.get_DriverModel)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdateentry-get_drivermodel
     */
    get_DriverModel() {
        retval := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the language-invariant name of the provider of the Windows driver update. (IWindowsDriverUpdateEntry.get_DriverProvider)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdateentry-get_driverprovider
     */
    get_DriverProvider() {
        retval := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * Gets the driver version date of the Windows driver update. (IWindowsDriverUpdateEntry.get_DriverVerDate)
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdateentry-get_driververdate
     */
    get_DriverVerDate() {
        result := ComCall(12, this, "double*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the problem number of the matching device for the Windows driver update. (IWindowsDriverUpdateEntry.get_DeviceProblemNumber)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdateentry-get_deviceproblemnumber
     */
    get_DeviceProblemNumber() {
        result := ComCall(13, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets the status of the matching device for the Windows driver update. (IWindowsDriverUpdateEntry.get_DeviceStatus)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdateentry-get_devicestatus
     */
    get_DeviceStatus() {
        result := ComCall(14, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IWindowsDriverUpdateEntry.IID.Equals(iid)) {
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
