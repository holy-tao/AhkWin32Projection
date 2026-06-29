#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWindowsMediaLibrarySharingDeviceProperty.ahk" { IWindowsMediaLibrarySharingDeviceProperty }

/**
 * The IWindowsMediaLibrarySharingDeviceProperties interface defines methods that provide access to the collection of all properties for an individual media device.
 * @remarks
 * To obtain an <b>IWindowsMediaLibrarySharingDeviceProperties</b> interface, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdevice-get_properties">get_Properties</a> method of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdevice">IWindowsMediaLibrarySharingDevice</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdeviceproperties
 * @namespace Windows.Win32.Media.LibrarySharingServices
 */
export default struct IWindowsMediaLibrarySharingDeviceProperties extends IDispatch {
    /**
     * The interface identifier for IWindowsMediaLibrarySharingDeviceProperties
     * @type {Guid}
     */
    static IID := Guid("{c4623214-6b06-40c5-a623-b2ff4c076bfd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWindowsMediaLibrarySharingDeviceProperties interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Item    : IntPtr
        get_Count   : IntPtr
        GetProperty : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWindowsMediaLibrarySharingDeviceProperties.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * The get_Item method retrieves an IWindowsMediaLibrarySharingDeviceProperty interface that represents an individual property for a media device.
     * @param {Integer} index The zero-based index of the property in the collection of all properties associated with the media device.
     * @returns {IWindowsMediaLibrarySharingDeviceProperty} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdeviceproperty">IWindowsMediaLibrarySharingDeviceProperty</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdeviceproperties-get_item
     */
    get_Item(index) {
        result := ComCall(7, this, "int", index, "ptr*", &_property := 0, "HRESULT")
        return IWindowsMediaLibrarySharingDeviceProperty(_property)
    }

    /**
     * The get_Count method retrieves the number of properties associated with an individual media device.
     * @returns {Integer} A pointer to a <b>LONG</b> that receives the number of properties.
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdeviceproperties-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * The GetProperty method retrieves an IWindowsMediaLibrarySharingDeviceProperty interface that represents an individual property for a media device.
     * @param {BSTR} name A <b>BSTR</b> that specifies the name of the property.
     * @returns {IWindowsMediaLibrarySharingDeviceProperty} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdeviceproperty">IWindowsMediaLibrarySharingDeviceProperty</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdeviceproperties-getproperty
     */
    GetProperty(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(9, this, BSTR, name, "ptr*", &_property := 0, "HRESULT")
        return IWindowsMediaLibrarySharingDeviceProperty(_property)
    }

    Query(iid) {
        if (IWindowsMediaLibrarySharingDeviceProperties.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.GetProperty := CallbackCreate(GetMethod(implObj, "GetProperty"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.GetProperty)
    }
}
