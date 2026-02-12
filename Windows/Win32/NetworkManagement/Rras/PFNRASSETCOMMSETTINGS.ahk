#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Call RasSetCommSettings from a custom-scripting DLL to change the settings on the port for the connection.
 * @remarks
 * RAS passes the custom-scripting DLL a pointer to the 
 * <b>RasSetCommSettings</b> function when RAS calls 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nc-ras-rascustomscriptexecutefn">RasCustomScriptExecute</a>. The pointer is stored in the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376738(v=vs.85)">RASCUSTOMSCRIPTEXTENSIONS</a> structure that is passed as the last parameter of 
 * <b>RasCustomScriptExecute</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/ras/nc-ras-pfnrassetcommsettings
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class PFNRASSETCOMMSETTINGS extends IUnknown {

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
     * @param {HANDLE} hPort 
     * @param {Pointer<RASCOMMSETTINGS>} pRasCommSettings 
     * @param {Pointer<Void>} pvReserved 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hPort, pRasCommSettings, pvReserved) {
        hPort := hPort is Win32Handle ? NumGet(hPort, "ptr") : hPort

        pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", hPort, "ptr", pRasCommSettings, pvReservedMarshal, pvReserved, "uint")
        return result
    }
}
