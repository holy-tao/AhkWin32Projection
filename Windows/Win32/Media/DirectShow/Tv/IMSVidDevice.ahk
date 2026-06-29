#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IMSVidDevice interface is the base interface for all the devices and features that the Video Control supports.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidDevice)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsviddevice
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidDevice extends IDispatch {
    /**
     * The interface identifier for IMSVidDevice
     * @type {Guid}
     */
    static IID := Guid("{1c15d47c-911d-11d2-b632-00c04f79498e}")

    /**
     * The class identifier for MSVidDevice
     * @type {Guid}
     */
    static CLSID := Guid("{6e40476f-9c49-4c3e-8bb9-8587958eff74}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidDevice interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name      : IntPtr
        get_Status    : IntPtr
        put_Power     : IntPtr
        get_Power     : IntPtr
        get_Category  : IntPtr
        get_ClassID   : IntPtr
        get__Category : IntPtr
        get__ClassID  : IntPtr
        IsEqualDevice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Power {
        get => this.get_Power()
        set => this.put_Power(value)
    }

    /**
     * @type {BSTR} 
     */
    Category {
        get => this.get_Category()
    }

    /**
     * @type {BSTR} 
     */
    ClassID {
        get => this.get_ClassID()
    }

    /**
     * @type {Guid} 
     */
    _Category {
        get => this.get__Category()
    }

    /**
     * @type {Guid} 
     */
    _ClassID {
        get => this.get__ClassID()
    }

    /**
     * The get_Name method retrieves the friendly name of the device.
     * @remarks
     * The caller must free the returned string, using the <b>SysFreeString</b> function.
     * @returns {BSTR} Pointer to a variable that receives the friendly name.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get_name
     */
    get_Name() {
        Name := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, Name, "HRESULT")
        return Name
    }

    /**
     * The get_Status method retrieves status information about the device.
     * @remarks
     * Not all device types implement this method.
     * @returns {Integer} Pointer to a variable of that receives the current status.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get_status
     */
    get_Status() {
        result := ComCall(8, this, "int*", &_Status := 0, "HRESULT")
        return _Status
    }

    /**
     * The put_Power method turns the device on or off.
     * @remarks
     * Not all device types implement this method.
     * @param {VARIANT_BOOL} Power 
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-put_power
     */
    put_Power(Power) {
        result := ComCall(9, this, VARIANT_BOOL, Power, "HRESULT")
        return result
    }

    /**
     * The get_Power method queries whether the device is off or on.
     * @remarks
     * Not all device types implement this method.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get_power
     */
    get_Power() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &Power := 0, "HRESULT")
        return Power
    }

    /**
     * The get_Category method retrieves the category of the device as a BSTR.
     * @remarks
     * The device category is identified by a <b>GUID</b>. This method returns a string representation of the <b>GUID</b>.
     * 
     * This method is provided for Automation clients. C++ applications can use the <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsviddevice-get__category">IMSVidDevice::get__Category</a> method, which returns a <b>GUID</b> rather than a <b>BSTR</b>.
     * 
     * The caller must free the returned string, using the <b>SysFreeString</b> function.
     * @returns {BSTR} <b>BSTR</b> that receives the device category.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get_category
     */
    get_Category() {
        Guid := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, Guid, "HRESULT")
        return Guid
    }

    /**
     * The get_ClassID method retrieves the device's class identifier (CLSID) as a BSTR.
     * @remarks
     * This method is provided for Automation clients. C++ applications can use the <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsviddevice-get__classid">IMSVidDevice::get__ClassID</a> method, which returns a <b>GUID</b> rather than a <b>BSTR</b>.
     * 
     * The caller must free the returned string, using the <b>SysFreeString</b> function.
     * @returns {BSTR} Pointer to a variable that receives a string representation of the CLSID.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get_classid
     */
    get_ClassID() {
        Clsid := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, Clsid, "HRESULT")
        return Clsid
    }

    /**
     * The get__Category method retrieves the category of the device as a GUID.
     * @returns {Guid} Pointer to a variable of type <b>GUID</b> that receives the device category.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get__category
     */
    get__Category() {
        Guid := Guid()
        result := ComCall(13, this, Guid.Ptr, Guid, "HRESULT")
        return Guid
    }

    /**
     * The get__ClassID method retrieves the device's class identifier (CLSID) as a GUID.
     * @returns {Guid} Pointer to a variable of type <b>GUID</b> that receives the CLSID.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-get__classid
     */
    get__ClassID() {
        Clsid := Guid()
        result := ComCall(14, this, Guid.Ptr, Clsid, "HRESULT")
        return Clsid
    }

    /**
     * The IsEqualDevice method queries whether this device and another device represent the same underlying hardware.
     * @param {IMSVidDevice} Device Pointer to the other device's <a href="https://docs.microsoft.com/windows/desktop/api/segment/nn-segment-imsviddevice">IMSVidDevice</a> interface.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsviddevice-isequaldevice
     */
    IsEqualDevice(Device) {
        result := ComCall(15, this, "ptr", Device, VARIANT_BOOL.Ptr, &IsEqual := 0, "HRESULT")
        return IsEqual
    }

    Query(iid) {
        if (IMSVidDevice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Status := CallbackCreate(GetMethod(implObj, "get_Status"), flags, 2)
        this.vtbl.put_Power := CallbackCreate(GetMethod(implObj, "put_Power"), flags, 2)
        this.vtbl.get_Power := CallbackCreate(GetMethod(implObj, "get_Power"), flags, 2)
        this.vtbl.get_Category := CallbackCreate(GetMethod(implObj, "get_Category"), flags, 2)
        this.vtbl.get_ClassID := CallbackCreate(GetMethod(implObj, "get_ClassID"), flags, 2)
        this.vtbl.get__Category := CallbackCreate(GetMethod(implObj, "get__Category"), flags, 2)
        this.vtbl.get__ClassID := CallbackCreate(GetMethod(implObj, "get__ClassID"), flags, 2)
        this.vtbl.IsEqualDevice := CallbackCreate(GetMethod(implObj, "IsEqualDevice"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Status)
        CallbackFree(this.vtbl.put_Power)
        CallbackFree(this.vtbl.get_Power)
        CallbackFree(this.vtbl.get_Category)
        CallbackFree(this.vtbl.get_ClassID)
        CallbackFree(this.vtbl.get__Category)
        CallbackFree(this.vtbl.get__ClassID)
        CallbackFree(this.vtbl.IsEqualDevice)
    }
}
