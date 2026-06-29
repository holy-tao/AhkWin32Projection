#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IWindowsMediaLibrarySharingDeviceProperty interface defines methods that provide access to the name and value of an individual property of a media device.
 * @remarks
 * To obtain an <b>IWindowsMediaLibrarySharingDeviceProperty</b> interface, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdeviceproperties-getproperty">GetProperty</a> method or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdeviceproperties-get_item">get_Item</a> method of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdeviceproperties">IWindowsMediaLibrarySharingDeviceProperties</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdeviceproperty
 * @namespace Windows.Win32.Media.LibrarySharingServices
 */
export default struct IWindowsMediaLibrarySharingDeviceProperty extends IDispatch {
    /**
     * The interface identifier for IWindowsMediaLibrarySharingDeviceProperty
     * @type {Guid}
     */
    static IID := Guid("{81e26927-7a7d-40a7-81d4-bddc02960e3e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWindowsMediaLibrarySharingDeviceProperty interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name  : IntPtr
        get_Value : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWindowsMediaLibrarySharingDeviceProperty.Vtbl()
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
     * @type {VARIANT} 
     */
    Value {
        get => this.get_Value()
    }

    /**
     * The get_Name method retrieves the name of an individual property of a media device.
     * @returns {BSTR} A pointer to a <b>BSTR</b> that receives the property name.
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdeviceproperty-get_name
     */
    get_Name() {
        name := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * The get_Value method retrieves the value of an individual property of a media device.
     * @returns {VARIANT} A pointer to a <b>VARIANT</b> that receives the property value.
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdeviceproperty-get_value
     */
    get_Value() {
        value := VARIANT()
        result := ComCall(8, this, VARIANT.Ptr, value, "HRESULT")
        return value
    }

    Query(iid) {
        if (IWindowsMediaLibrarySharingDeviceProperty.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_Value := CallbackCreate(GetMethod(implObj, "get_Value"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_Value)
    }
}
