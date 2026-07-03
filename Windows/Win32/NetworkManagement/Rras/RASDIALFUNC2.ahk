#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRASCONN.ahk" { HRASCONN }
#Import ".\RASCONNSTATE.ahk" { RASCONNSTATE }

/**
 * A RasDialFunc2 callback function is called by the RasDial function calls when a change of state occurs during a remote access connection process.
 * @remarks
 * A 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> connection operation is suspended during a call to a 
 * <b>RasDialFunc2</b> callback function. For that reason, the 
 * <b>RasDialFunc2</b> implementation generally returns as quickly as possible. There are two exceptions to that rule. Asynchronous (slow) devices such as modems often have time-out periods measured in seconds rather than milliseconds; a slow return from a 
 * <b>RasDialFunc2</b> function is generally not a problem. The prompt return requirement also does not apply when <i>dwError</i> is nonzero, indicating that an error has occurred. It is safe, for example, to put up an error dialog box and wait for user input.
 * 
 * The 
 * <b>RasDialFunc2</b> implementation should not depend on the order or occurrence of particular 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376727(v=vs.85)">RASCONNSTATE</a> connection states, because this may vary between platforms.
 * 
 * Do not call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> function from within a 
 * <b>RasDialFunc2</b> callback function. Call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetconnectstatusa">RasGetConnectStatus</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasenumentriesa">RasEnumEntries</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasenumconnectionsa">RasEnumConnections</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgeterrorstringa">RasGetErrorString</a>, and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a> functions from within the callback function. For example, calling 
 * <b>RasGetConnectStatus</b> from within a callback function would be useful for determining the name and type of the connecting device.
 * 
 * <div class="alert"><b>Note</b>  For convenience, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a> can be called from within a 
 * <b>RasDialFunc2</b> callback function. However, much of the hang-up processing occurs after the 
 * <b>RasDialFunc2</b> callback function has returned.</div>
 * <div> </div>
 * <div class="alert"><b>Note</b>  <b>RasDialFunc2</b> is a placeholder for the application-defined or library-defined function name.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/ras/nc-ras-rasdialfunc2
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASDIALFUNC2 {
    value : IntPtr

    __value {
        set {
            if (value is RASDIALFUNC2) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} param0 
     * @param {Integer} param1 
     * @param {HRASCONN} param2 
     * @param {Integer} param3 
     * @param {RASCONNSTATE} param4 
     * @param {Integer} param5 
     * @param {Integer} param6 
     * @returns {Integer} If the 
     * <b>RasDialFunc2</b> function returns a nonzero value, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> continues to send callback notifications.
     * 
     * If the 
     * <b>RasDialFunc2</b> function returns zero, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> stops sending callback notifications for all subentries.
     */
    Call(param0, param1, param2, param3, param4, param5, param6) {
        result := DllCall(this.value, IntPtr, param0, UInt32, param1, HRASCONN, param2, UInt32, param3, RASCONNSTATE, param4, UInt32, param5, UInt32, param6, UInt32)
        return result
    }

    /**
     * A RASDIALFUNC2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RASDIALFUNC2 {
        /**
         * Creates a RASDIALFUNC2 pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, HRASCONN, UInt32, RASCONNSTATE, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, HRASCONN, UInt32, RASCONNSTATE, UInt32, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
