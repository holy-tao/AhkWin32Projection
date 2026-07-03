#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRASCONN.ahk" { HRASCONN }
#Import ".\RASCONNSTATE.ahk" { RASCONNSTATE }

/**
 * A RasDialFunc1 function is called by the RasDial function when a change of state occurs during a remote access connection process.
 * @remarks
 * A 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> connection operation is suspended during a call to a 
 * <b>RasDialFunc1</b> callback function. For that reason, the 
 * <b>RasDialFunc1</b> implementation generally returns as quickly as possible. There are two exceptions to that rule. Asynchronous (slow) devices such as modems often have time-out periods measured in seconds rather than milliseconds; a slow return from a 
 * <b>RasDialFunc1</b> function is generally not a problem. The prompt return requirement also does not apply when <i>dwError</i> is nonzero, indicating that an error has occurred. It is safe, for example, to put up an error dialog box and wait for user input.
 * 
 * The 
 * <b>RasDialFunc1</b> implementation should not depend on the order or occurrence of particular 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa376727(v=vs.85)">RASCONNSTATE</a> connection states, because this may vary between platforms.
 * 
 * Do not call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> function from within a 
 * <b>RasDialFunc1</b> callback function. Call the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgetconnectstatusa">RasGetConnectStatus</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasenumentriesa">RasEnumEntries</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasenumconnectionsa">RasEnumConnections</a>, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasgeterrorstringa">RasGetErrorString</a>, and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a> functions from within the callback function. For example, calling 
 * <b>RasGetConnectStatus</b> from within a callback function would be useful for determining the name and type of the connecting device.
 * 
 * Note that, for convenience, 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a> can be called from within a 
 * <b>RasDialFunc1</b> callback function. However, much of the hang-up processing occurs after the 
 * <b>RasDialFunc1</b> callback function has returned.
 * 
 * <b>RasDialFunc1</b> is a placeholder for the application-defined or library-defined function name.
 * @see https://learn.microsoft.com/windows/win32/api/ras/nc-ras-rasdialfunc1
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASDIALFUNC1 {
    value : IntPtr

    __value {
        set {
            if (value is RASDIALFUNC1) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HRASCONN} param0 
     * @param {Integer} param1 
     * @param {RASCONNSTATE} param2 
     * @param {Integer} param3 
     * @param {Integer} param4 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1, param2, param3, param4) {
        DllCall(this.value, HRASCONN, param0, UInt32, param1, RASCONNSTATE, param2, UInt32, param3, UInt32, param4)
    }

    /**
     * A RASDIALFUNC1 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RASDIALFUNC1 {
        /**
         * Creates a RASDIALFUNC1 pointer that invokes the given AHK function when called.
         * @param {Func(HRASCONN, UInt32, RASCONNSTATE, UInt32, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRASCONN, UInt32, RASCONNSTATE, UInt32, UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
