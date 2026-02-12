#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\HDDEDATA.ahk
#Include ..\Com\IUnknown.ahk

/**
 * An application-defined callback function used with the Dynamic Data Exchange Management Library (DDEML) functions.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/ddeml/nc-ddeml-pfncallback
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class PFNCALLBACK extends IUnknown {

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
     * @param {Integer} wType 
     * @param {Integer} wFmt 
     * @param {HCONV} hConv_ 
     * @param {HSZ} hsz1 
     * @param {HSZ} hsz2 
     * @param {HDDEDATA} hData 
     * @param {Pointer} dwData1 
     * @param {Pointer} dwData2 
     * @returns {HDDEDATA} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(wType, wFmt, hConv_, hsz1, hsz2, hData, dwData1, dwData2) {
        hConv_ := hConv_ is Win32Handle ? NumGet(hConv_, "ptr") : hConv_
        hsz1 := hsz1 is Win32Handle ? NumGet(hsz1, "ptr") : hsz1
        hsz2 := hsz2 is Win32Handle ? NumGet(hsz2, "ptr") : hsz2
        hData := hData is Win32Handle ? NumGet(hData, "ptr") : hData

        result := ComCall(3, this, "uint", wType, "uint", wFmt, "ptr", hConv_, "ptr", hsz1, "ptr", hsz2, "ptr", hData, "ptr", dwData1, "ptr", dwData2, "ptr")
        resultHandle := HDDEDATA({Value: result}, True)
        return resultHandle
    }
}
