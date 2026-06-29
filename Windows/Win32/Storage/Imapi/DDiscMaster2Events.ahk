#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Implement this interface to receive notification when a CD or DVD device is added to or removed from the computer.
 * @see https://learn.microsoft.com/windows/win32/api/imapi2/nn-imapi2-ddiscmaster2events
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct DDiscMaster2Events extends IDispatch {
    /**
     * The interface identifier for DDiscMaster2Events
     * @type {Guid}
     */
    static IID := Guid("{27354131-7f64-5b0f-8f00-5d77afbe261e}")

    /**
     * The class identifier for DDiscMaster2Events
     * @type {Guid}
     */
    static CLSID := Guid("{27354131-7f64-5b0f-8f00-5d77afbe261e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for DDiscMaster2Events interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        NotifyDeviceAdded   : IntPtr
        NotifyDeviceRemoved : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := DDiscMaster2Events.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Receives notification when an optical media device is added to the computer.
     * @param {IDispatch} _object An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscmaster2">IDiscMaster2</a> interface that you can use to enumerate the devices on the computer. 
     * 
     * This parameter is a <b>MsftDiscMaster2</b> object in script.
     * @param {BSTR} uniqueId String that contains an identifier that uniquely identifies the optical media device that was added to the computer.
     * @returns {HRESULT} Return values are ignored.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-ddiscmaster2events-notifydeviceadded
     */
    NotifyDeviceAdded(_object, uniqueId) {
        uniqueId := uniqueId is String ? BSTR.Alloc(uniqueId).Value : uniqueId

        result := ComCall(7, this, "ptr", _object, BSTR, uniqueId, "HRESULT")
        return result
    }

    /**
     * Receives notification when an optical media device is removed from the computer.
     * @param {IDispatch} _object An <a href="https://docs.microsoft.com/windows/desktop/api/imapi2/nn-imapi2-idiscmaster2">IDiscMaster2</a> interface that you can use to enumerate the devices on the computer. 
     * 
     * This parameter is a <b>MsftDiscMaster2</b> object in script.
     * @param {BSTR} uniqueId String that contains an identifier that uniquely identifies the optical media device that was added to the computer.
     * @returns {HRESULT} Return values are ignored.
     * @see https://learn.microsoft.com/windows/win32/api/imapi2/nf-imapi2-ddiscmaster2events-notifydeviceremoved
     */
    NotifyDeviceRemoved(_object, uniqueId) {
        uniqueId := uniqueId is String ? BSTR.Alloc(uniqueId).Value : uniqueId

        result := ComCall(8, this, "ptr", _object, BSTR, uniqueId, "HRESULT")
        return result
    }

    Query(iid) {
        if (DDiscMaster2Events.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.NotifyDeviceAdded := CallbackCreate(GetMethod(implObj, "NotifyDeviceAdded"), flags, 3)
        this.vtbl.NotifyDeviceRemoved := CallbackCreate(GetMethod(implObj, "NotifyDeviceRemoved"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.NotifyDeviceAdded)
        CallbackFree(this.vtbl.NotifyDeviceRemoved)
    }
}
