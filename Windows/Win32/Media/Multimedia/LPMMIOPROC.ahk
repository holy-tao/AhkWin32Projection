#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\LRESULT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class LPMMIOPROC extends IUnknown {

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
     * @param {PSTR} lpmmioinfo 
     * @param {Integer} uMsg 
     * @param {LPARAM} lParam1 
     * @param {LPARAM} lParam2 
     * @returns {LRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpmmioinfo, uMsg, lParam1, lParam2) {
        lpmmioinfo := lpmmioinfo is String ? StrPtr(lpmmioinfo) : lpmmioinfo
        lParam1 := lParam1 is Win32Handle ? NumGet(lParam1, "ptr") : lParam1
        lParam2 := lParam2 is Win32Handle ? NumGet(lParam2, "ptr") : lParam2

        result := ComCall(3, this, "ptr", lpmmioinfo, "uint", uMsg, "ptr", lParam1, "ptr", lParam2, "ptr")
        resultHandle := LRESULT({Value: result}, True)
        return resultHandle
    }
}
