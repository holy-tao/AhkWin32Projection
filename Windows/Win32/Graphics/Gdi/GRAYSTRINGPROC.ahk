#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The OutputProc function is an application-defined callback function used with the GrayString function.
 * @remarks
 * The callback function must draw an image relative to the coordinates (0,0).
 * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nc-winuser-graystringproc
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class GRAYSTRINGPROC extends IUnknown {

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
     * @param {HDC} param0 
     * @param {LPARAM} param1 
     * @param {Integer} param2 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2) {
        param0 := param0 is Win32Handle ? NumGet(param0, "ptr") : param0
        param1 := param1 is Win32Handle ? NumGet(param1, "ptr") : param1

        result := ComCall(3, this, "ptr", param0, "ptr", param1, "int", param2, "int")
        return result
    }
}
