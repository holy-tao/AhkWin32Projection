#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TabletDeviceKind.ahk" { TabletDeviceKind }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Extends the IInkTablet interface.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nn-msinkaut-iinktablet2
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct IInkTablet2 extends IDispatch {
    /**
     * The interface identifier for IInkTablet2
     * @type {Guid}
     */
    static IID := Guid("{90c91ad2-fa36-49d6-9516-ce8d570f6f85}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInkTablet2 interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_DeviceKind : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInkTablet2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {TabletDeviceKind} 
     */
    DeviceKind {
        get => this.get_DeviceKind()
    }

    /**
     * Gets the type of Tablet device being used.
     * @returns {TabletDeviceKind} 
     * @see https://learn.microsoft.com/windows/win32/api/msinkaut/nf-msinkaut-iinktablet2-get_devicekind
     */
    get_DeviceKind() {
        result := ComCall(7, this, "int*", &Kind := 0, "HRESULT")
        return Kind
    }

    Query(iid) {
        if (IInkTablet2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DeviceKind := CallbackCreate(GetMethod(implObj, "get_DeviceKind"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DeviceKind)
    }
}
