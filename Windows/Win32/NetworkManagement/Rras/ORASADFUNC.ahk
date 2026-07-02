#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * The ORASADFunc function is an application-defined callback function that is used to provide a customized user interface for autodialing.
 * @remarks
 * If the 
 * <b>ORASADFunc</b> function performs the dialing operation, it presents its own user interface for dialing and calls the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> function to do the actual dialing. The 
 * <b>ORASADFunc</b> then returns <b>TRUE</b> to indicate that it took over the dialing. When the dialing operation has been completed, set the variable pointed to by <i>lpdwRetCode</i> to indicate success or failure.
 * 
 * To enable an 
 * <b>ORASADFunc</b> handler for a phone-book entry, use the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure in a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetentrypropertiesa">RasSetEntryProperties</a> function. The <b>szAutodialDll</b> member specifies the name of the DLL that contains the handler, and the <b>szAutodialDll</b> member specifies the exported name of the handler.
 * 
 * The 
 * <b>ORASADFunc</b> function is a placeholder for the library-defined function name. The <b>ORASADFUNC</b> type is a pointer to an 
 * <b>ORASADFunc</b> function.
 * @see https://learn.microsoft.com/windows/win32/api/ras/nc-ras-orasadfunc
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct ORASADFUNC {
    value : IntPtr

    __value {
        set {
            if (value is ORASADFUNC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} param0 
     * @param {PSTR} param1 
     * @param {Integer} param2 
     * @param {Pointer<Integer>} param3 
     * @returns {BOOL} If the callback function performs the dialing operation, return <b>TRUE</b>. Use the <i>lpdwRetCode</i> parameter to indicate the results of the dialing operation.
     * 
     * If the callback function does not perform the dialing operation, return <b>FALSE</b>. In this case, the system uses the default user interface for dialing.
     */
    Call(param0, param1, param2, param3) {
        param1 := param1 is String ? StrPtr(param1) : param1

        param3Marshal := param3 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HWND, param0, "ptr", param1, UInt32, param2, param3Marshal, param3, BOOL)
        return result
    }

    /**
     * A ORASADFUNC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ORASADFUNC {
        /**
         * Creates a ORASADFUNC pointer that invokes the given AHK function when called.
         * @param {Func(HWND, PSTR, UInt32, "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, PSTR, UInt32, "uint*", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
