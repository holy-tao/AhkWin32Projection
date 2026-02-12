#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\LRESULT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Processes driver messages for the installable driver. DriverProc is a driver-supplied function.
 * @remarks
 * When <i>msg</i> is <a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-open">DRV_OPEN</a>, <i>lParam1</i> is the string following the driver filename from the SYSTEM.INI file and <i>lParam2</i> is the value given as the <i>lParam</i> parameter in a call to the <a href="https://docs.microsoft.com/previous-versions/dd743639(v=vs.85)">OpenDriver</a> function.
 * 
 * When <i>msg</i> is <a href="https://docs.microsoft.com/windows/desktop/Multimedia/drv-close">DRV_CLOSE</a>, <i>lParam1</i> and <i>lParam2</i> are the same values as the <i>lParam1</i> and <i>lParam2</i> parameters in a call to the <a href="https://docs.microsoft.com/previous-versions/dd797785(v=vs.85)">CloseDriver</a> function.
 * @see https://learn.microsoft.com/windows/win32/api//content/mmiscapi/nc-mmiscapi-driverproc
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class DRIVERPROC extends IUnknown {

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
     * @param {Pointer} param0 
     * @param {HDRVR} param1 
     * @param {Integer} param2 
     * @param {LPARAM} param3 
     * @param {LPARAM} param4 
     * @returns {LRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2, param3, param4) {
        param1 := param1 is Win32Handle ? NumGet(param1, "ptr") : param1
        param3 := param3 is Win32Handle ? NumGet(param3, "ptr") : param3
        param4 := param4 is Win32Handle ? NumGet(param4, "ptr") : param4

        result := ComCall(3, this, "ptr", param0, "ptr", param1, "uint", param2, "ptr", param3, "ptr", param4, "ptr")
        resultHandle := LRESULT({Value: result}, True)
        return resultHandle
    }
}
