#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HRASCONN.ahk" { HRASCONN }

/**
 * The RasCustomHangUp function is an application-defined function that is exported by a third-party custom-dialing DLL. This function allows third-party vendors to implement custom connection hang-up routines.
 * @remarks
 * RAS  calls this entry point from 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rashangupa">RasHangUp</a>, if the <b>szCustomDialDll</b> member of the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure for the entry being dialed specifies a custom-dialing DLL.
 * @see https://learn.microsoft.com/windows/win32/api/ras/nc-ras-rascustomhangupfn
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RasCustomHangUpFn {
    value : IntPtr

    __value {
        set {
            if (value is RasCustomHangUpFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HRASCONN} _hRasConn Handle to the RAS connection to hang up.
     * @returns {Integer} If the function succeeds, the return value should be <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value should be a value from <a href="https://docs.microsoft.com/windows/desktop/RRAS/routing-and-remote-access-error-codes">Routing and Remote Access Error Codes</a> or Winerror.h.
     */
    Call(_hRasConn) {
        result := DllCall(this.value, HRASCONN, _hRasConn, UInt32)
        return result
    }

    /**
     * A RasCustomHangUpFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RasCustomHangUpFn {
        /**
         * Creates a RasCustomHangUpFn pointer that invokes the given AHK function when called.
         * @param {Func(HRASCONN) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRASCONN, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
