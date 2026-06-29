#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IWindowsMediaLibrarySharingDevice.ahk" { IWindowsMediaLibrarySharingDevice }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IWindowsMediaLibrarySharingDevices.
 * @remarks
 * To obtain an <b>IWindowsMediaLibrarySharingDevices</b> interface, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingservices-getalldevices">getAllDevices</a> method of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingservices">IWindowsMediaLibrarySharingServices</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdevices
 * @namespace Windows.Win32.Media.LibrarySharingServices
 */
export default struct IWindowsMediaLibrarySharingDevices extends IDispatch {
    /**
     * The interface identifier for IWindowsMediaLibrarySharingDevices
     * @type {Guid}
     */
    static IID := Guid("{1803f9d6-fe6d-4546-bf5b-992fe8ec12d1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWindowsMediaLibrarySharingDevices interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Item  : IntPtr
        get_Count : IntPtr
        GetDevice : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWindowsMediaLibrarySharingDevices.Vtbl()
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
     * The get_Item method retrieves an IWindowsMediaLibrarySharingDevice interface that represents an individual media device.
     * @param {Integer} index The zero-based index of the device in the collection of media devices on the home network.
     * @returns {IWindowsMediaLibrarySharingDevice} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdevice">IWindowsMediaLibrarySharingDevice</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdevices-get_item
     */
    get_Item(index) {
        result := ComCall(7, this, "int", index, "ptr*", &device := 0, "HRESULT")
        return IWindowsMediaLibrarySharingDevice(device)
    }

    /**
     * The get_Count method retrieves the number of media devices on the home network.
     * @returns {Integer} A pointer to a <b>LONG</b> that receives the number of devices.
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdevices-get_count
     */
    get_Count() {
        result := ComCall(8, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * The GetDevice method retrieves an IWindowsMediaLibrarySharingDevice interface that represents an individual media device.
     * @param {BSTR} deviceID A <b>BSTR</b> that specifies the device ID.
     * @returns {IWindowsMediaLibrarySharingDevice} A pointer to a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmlss/nn-wmlss-iwindowsmedialibrarysharingdevice">IWindowsMediaLibrarySharingDevice</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmlss/nf-wmlss-iwindowsmedialibrarysharingdevices-getdevice
     */
    GetDevice(deviceID) {
        deviceID := deviceID is String ? BSTR.Alloc(deviceID).Value : deviceID

        result := ComCall(9, this, BSTR, deviceID, "ptr*", &device := 0, "HRESULT")
        return IWindowsMediaLibrarySharingDevice(device)
    }

    Query(iid) {
        if (IWindowsMediaLibrarySharingDevices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 3)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.GetDevice := CallbackCreate(GetMethod(implObj, "GetDevice"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.GetDevice)
    }
}
