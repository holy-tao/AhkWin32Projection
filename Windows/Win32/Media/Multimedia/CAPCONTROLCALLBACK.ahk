#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\LRESULT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The capControlCallback function is the callback function used for precision control to begin and end streaming capture. The name capControlCallback is a placeholder for the application-supplied function name.
 * @remarks
 * The first message sent to the callback procedure sets the <i>nState</i> parameter to CONTROLCALLBACK_PREROLL after allocating all buffers and all other capture preparations are complete.
 * @see https://learn.microsoft.com/windows/win32/api//content/vfw/nc-vfw-capcontrolcallback
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class CAPCONTROLCALLBACK extends IUnknown {

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
     * @param {HWND} hWnd_ 
     * @param {Integer} nState 
     * @returns {LRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hWnd_, nState) {
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_

        result := ComCall(3, this, "ptr", hWnd_, "int", nState, "ptr")
        resultHandle := LRESULT({Value: result}, True)
        return resultHandle
    }
}
