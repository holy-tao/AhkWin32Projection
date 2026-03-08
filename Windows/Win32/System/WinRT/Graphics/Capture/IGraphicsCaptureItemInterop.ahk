#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * Targets a monitor(s) for the creation of a graphics capture item.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.capture.interop/nf-windows-graphics-capture-interop-igraphicscaptureiteminterop-createformonitor
 * @namespace Windows.Win32.System.WinRT.Graphics.Capture
 * @version v4.0.30319
 */
class IGraphicsCaptureItemInterop extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGraphicsCaptureItemInterop
     * @type {Guid}
     */
    static IID => Guid("{3628e81b-3cac-4c60-b7f4-23ce0e0c3356}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateForWindow", "CreateForMonitor"]

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
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        result := ComCall(3, this, "ptr", window, "ptr", riid, "ptr*", &result := 0, "HRESULT")
        return result
    }

    /**
     * Targets a monitor(s) for the creation of a graphics capture item.
     * @param {HMONITOR} monitor Type: **HMONITOR**
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
    CreateForMonitor(monitor, riid) {
        monitor := monitor is Win32Handle ? NumGet(monitor, "ptr") : monitor

        result := ComCall(4, this, "ptr", monitor, "ptr", riid, "ptr*", &result := 0, "HRESULT")
        return result
    }
}
