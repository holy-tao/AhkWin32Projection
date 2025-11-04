#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
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
     * 
     * @param {HWND} window 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} result 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.capture.interop/nf-windows-graphics-capture-interop-igraphicscaptureiteminterop-createforwindow
     */
    CreateForWindow(window, riid, result) {
        window := window is Win32Handle ? NumGet(window, "ptr") : window

        resultMarshal := result is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", window, "ptr", riid, resultMarshal, result, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HMONITOR} monitor 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} result 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.capture.interop/nf-windows-graphics-capture-interop-igraphicscaptureiteminterop-createformonitor
     */
    CreateForMonitor(monitor, riid, result) {
        monitor := monitor is Win32Handle ? NumGet(monitor, "ptr") : monitor

        resultMarshal := result is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", monitor, "ptr", riid, resultMarshal, result, "HRESULT")
        return result
    }
}
