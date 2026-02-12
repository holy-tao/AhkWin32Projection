#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The RasDialFunc callback function is called by the RasDial function when a change of state occurs during a RAS connection process.
 * @remarks
 * A 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> connection operation is suspended during a call to a 
 * <b>RasDialFunc</b> callback function. For that reason, the 
 * <b>RasDialFunc</b> implementation should generally return as quickly as possible. There are two exceptions to that rule. Asynchronous (slow) devices such as modems often have time-out periods measured in seconds rather than milliseconds; a slow return from a 
 * <b>RasDialFunc</b> function is generally not a problem. The prompt return requirement also does not apply when <i>dwError</i> is nonzero, indicating that an error has occurred. It is safe, for example, to put up an error dialog box and wait for user input.
 * 
 * The 
 * <b>RasDialFunc</b> implementation should not depend on the order or occurrence of particular 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376727(v=vs.85)">RASCONNSTATE</a> connection states, because this may vary between platforms.
 * 
 * Do not call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> function from within a 
 * <b>RasDialFunc</b> callback function. Call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetconnectstatusa">RasGetConnectStatus</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasenumentriesa">RasEnumEntries</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasenumconnectionsa">RasEnumConnections</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgeterrorstringa">RasGetErrorString</a>, and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a> functions from within the callback function. For example, calling 
 * <b>RasGetConnectStatus</b> from within a callback function would be useful to  determine the name and type of the connecting device.
 * 
 * <div class="alert"><b>Note</b>  For convenience, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a> can be called from within a 
 * <b>RasDialFunc</b> callback function. However, much of the hang-up processing occurs after the 
 * <b>RasDialFunc</b> callback function has returned.</div>
 * <div> </div>
 * <div class="alert"><b>Note</b>  <b>RasDialFunc</b> is a placeholder for the application-defined or library-defined function name.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/ras/nc-ras-rasdialfunc
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RASDIALFUNC extends IUnknown {

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
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(param0, param1, param2) {
        ComCall(3, this, "uint", param0, "int", param1, "uint", param2)
    }
}
