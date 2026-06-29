#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Graphics\Gdi\HMONITOR.ahk" { HMONITOR }

/**
 * @namespace Windows.Win32.System.WinRT.Graphics.Capture
 */
export default struct IGraphicsCaptureItemInterop extends IUnknown {
    /**
     * The interface identifier for IGraphicsCaptureItemInterop
     * @type {Guid}
     */
    static IID := Guid("{3628e81b-3cac-4c60-b7f4-23ce0e0c3356}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGraphicsCaptureItemInterop interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateForWindow  : IntPtr
        CreateForMonitor : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGraphicsCaptureItemInterop.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Targets a single window for the creation of a graphics capture item.
     * @param {HWND} window Type: **HWND**
     * 
     * The window handle that represents the window to capture.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * GUID for the type returned. Supported value: [GraphicsCaptureItem](/uwp/api/windows.graphics.capture.graphicscaptureitem).
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * Out pointer for the object to receive.
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.capture.interop/nf-windows-graphics-capture-interop-igraphicscaptureiteminterop-createforwindow
     */
    CreateForWindow(window, riid) {
        result := ComCall(3, this, HWND, window, Guid.Ptr, riid, "ptr*", &result := 0, "HRESULT")
        return result
    }

    /**
     * Targets a monitor(s) for the creation of a graphics capture item.
     * @param {HMONITOR} _monitor Type: **HMONITOR**
     * 
     * The monitor handle that represents the monitor to capture.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * GUID for the type returned. Supported value: [GraphicsCaptureItem](/uwp/api/windows.graphics.capture.graphicscaptureitem).
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * Out pointer for the object to receive.
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.capture.interop/nf-windows-graphics-capture-interop-igraphicscaptureiteminterop-createformonitor
     */
    CreateForMonitor(_monitor, riid) {
        result := ComCall(4, this, HMONITOR, _monitor, Guid.Ptr, riid, "ptr*", &result := 0, "HRESULT")
        return result
    }

    Query(iid) {
        if (IGraphicsCaptureItemInterop.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateForWindow := CallbackCreate(GetMethod(implObj, "CreateForWindow"), flags, 4)
        this.vtbl.CreateForMonitor := CallbackCreate(GetMethod(implObj, "CreateForMonitor"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateForWindow)
        CallbackFree(this.vtbl.CreateForMonitor)
    }
}
