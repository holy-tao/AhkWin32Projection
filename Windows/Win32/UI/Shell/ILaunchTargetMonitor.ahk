#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Graphics\Gdi\HMONITOR.ahk" { HMONITOR }

/**
 * . (ILaunchTargetMonitor)
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-ilaunchtargetmonitor
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ILaunchTargetMonitor extends IUnknown {
    /**
     * The interface identifier for ILaunchTargetMonitor
     * @type {Guid}
     */
    static IID := Guid("{266fbc7e-490d-46ed-a96b-2274db252003}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ILaunchTargetMonitor interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetMonitor : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ILaunchTargetMonitor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the target monitor for the application being launched.
     * @returns {HMONITOR} Type: <b>HMONITOR*</b>
     * 
     * Contains the address of a pointer to the target  monitor's handle.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ilaunchtargetmonitor-getmonitor
     */
    GetMonitor() {
        _monitor := HMONITOR()
        result := ComCall(3, this, HMONITOR.Ptr, _monitor, "HRESULT")
        return _monitor
    }

    Query(iid) {
        if (ILaunchTargetMonitor.IID.Equals(iid)) {
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
