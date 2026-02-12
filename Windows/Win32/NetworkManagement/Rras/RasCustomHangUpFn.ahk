#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The RasCustomHangUp function is an application-defined function that is exported by a third-party custom-dialing DLL. This function allows third-party vendors to implement custom connection hang-up routines.
 * @remarks
 * RAS  calls this entry point from 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a>, if the <b>szCustomDialDll</b> member of the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure for the entry being dialed specifies a custom-dialing DLL.
 * @see https://learn.microsoft.com/windows/win32/api//content/ras/nc-ras-rascustomhangupfn
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RasCustomHangUpFn extends IUnknown {

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
     * @param {HRASCONN} hRasConn_ 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hRasConn_) {
        hRasConn_ := hRasConn_ is Win32Handle ? NumGet(hRasConn_, "ptr") : hRasConn_

        result := ComCall(3, this, "ptr", hRasConn_, "uint")
        return result
    }
}
