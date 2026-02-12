#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A MonitorEnumProc function is an application-defined callback function that is called by the EnumDisplayMonitors function.
 * @remarks
 * You can use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaymonitors">EnumDisplayMonitors</a> function to enumerate the set of display monitors that intersect the visible region of a specified device context and, optionally, a clipping rectangle. To do this, set the <i>hdc</i> parameter to a non-<b>NULL</b> value, and set the <i>lprcClip</i> parameter as needed.
 * 
 * You can also use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaymonitors">EnumDisplayMonitors</a> function to enumerate one or more of the display monitors on the desktop, without supplying a device context. To do this, set the <i>hdc</i> parameter of <b>EnumDisplayMonitors</b> to <b>NULL</b> and set the <i>lprcClip</i> parameter as needed.
 * 
 * In all cases, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaymonitors">EnumDisplayMonitors</a> calls a specified <b>MonitorEnumProc</b> function once for each display monitor in the calculated enumeration set. The <b>MonitorEnumProc</b> function always receives a handle to the display monitor.
 * 
 * If the <i>hdc</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-enumdisplaymonitors">EnumDisplayMonitors</a> is non-<b>NULL</b>, the <b>MonitorEnumProc</b> function also receives a handle to a device context whose color format is appropriate for the display monitor. You can then paint into the device context in a manner that is optimal for the display monitor.
 * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nc-winuser-monitorenumproc
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class MONITORENUMPROC extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HMONITOR} param0 
     * @param {HDC} param1 
     * @param {Pointer<RECT>} param2 
     * @param {LPARAM} param3 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param1 := param1 is Win32Handle ? NumGet(param1, "ptr") : param1
        param3 := param3 is Win32Handle ? NumGet(param3, "ptr") : param3

        result := ComCall(3, this, "ptr", param0, "ptr", param1, "ptr", param2, "ptr", param3, "int")
        return result
    }
}
