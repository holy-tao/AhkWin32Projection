#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Graphics\Gdi\HMONITOR.ahk" { HMONITOR }

/**
 * @namespace Windows.Win32.System.WinRT.Graphics.Capture
 */
export default struct IMonitorGraphicsCaptureItemInterop extends IUnknown {
    /**
     * The interface identifier for IMonitorGraphicsCaptureItemInterop
     * @type {Guid}
     */
    static IID := Guid("{33274d14-a076-4048-8416-747e9b04db7b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMonitorGraphicsCaptureItemInterop interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMonitor : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMonitorGraphicsCaptureItemInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<HMONITOR>} _monitor 
     * @returns {HRESULT} 
     */
    GetMonitor(_monitor) {
        result := ComCall(3, this, HMONITOR.Ptr, _monitor, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMonitorGraphicsCaptureItemInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetMonitor := CallbackCreate(GetMethod(implObj, "GetMonitor"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetMonitor)
    }
}
