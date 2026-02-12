#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The DrawStateProc function is an application-defined callback function that renders a complex image for the DrawState function.
 * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nc-winuser-drawstateproc
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class DRAWSTATEPROC extends IUnknown {

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
     * @param {HDC} hdc_ 
     * @param {LPARAM} lData 
     * @param {WPARAM} wData 
     * @param {Integer} cx 
     * @param {Integer} cy_ 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hdc_, lData, wData, cx, cy_) {
        hdc_ := hdc_ is Win32Handle ? NumGet(hdc_, "ptr") : hdc_
        lData := lData is Win32Handle ? NumGet(lData, "ptr") : lData
        wData := wData is Win32Handle ? NumGet(wData, "ptr") : wData

        result := ComCall(3, this, "ptr", hdc_, "ptr", lData, "ptr", wData, "int", cx, "int", cy_, "int")
        return result
    }
}
