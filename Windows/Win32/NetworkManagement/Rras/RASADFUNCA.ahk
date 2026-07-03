#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import ".\RASADPARAMS.ahk" { RASADPARAMS }

/**
 * The RASADFunc function is an application-defined callback function that is used to provide a customized user interface for autodialing. (ANSI)
 * @remarks
 * When the system starts an AutoDial operation for a phone-book entry with a custom AutoDial handler, it calls the specified 
 * <b>RASADFunc</b>. The 
 * <b>RASADFunc</b> can start a thread to perform the custom-dialing operation. The 
 * <b>RASADFunc</b> function returns <b>TRUE</b> to indicate that it took over the dialing, or <b>FALSE</b> to allow the system to perform the dialing.
 * 
 * If the 
 * <b>RASADFunc</b> function performs the dialing operation, it presents its own user interface for dialing and calls the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rasdiala">RasDial</a> function to do the actual dialing. The 
 * <b>RASADFunc</b> then returns <b>TRUE</b> to indicate that it took over the dialing. When the dialing operation has been completed, set the variable pointed to by the <i>lpdwRetCode</i> parameter to indicate success or failure.
 * 
 * The AutoDial DLL must provide both a <b>RASADFUNCA</b> (ANSI) and a <b>RASADFUNCW</b> (Unicode) version of the 
 * <b>RASADFunc</b> handler. To enable a 
 * <b>RASADFunc</b> AutoDial handler for a phone-book entry, use the 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa377274(v=vs.85)">RASENTRY</a> structure in a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ras/nf-ras-rassetentrypropertiesa">RasSetEntryProperties</a> function. The <b>szAutodialDll</b> member specifies the name of the DLL that contains the handler, and the <b>szAutodialFunc</b> member specifies the exported name of the handler. The <b>szAutodialFunc</b> member should not include the "A" or "W" suffix.
 * 
 * <b>RASADFunc</b> is a placeholder for the library-defined function name. The <b>RASADFUNC</b> type is a pointer to a 
 * <b>RASADFunc</b> function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The ras.h header defines RASADFUNC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/ras/nc-ras-rasadfunca
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @charset ANSI
 */
export default struct RASADFUNCA {
    value : IntPtr

    __value {
        set {
            if (value is RASADFUNCA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PSTR} param0 
     * @param {PSTR} param1 
     * @param {Pointer<RASADPARAMS>} param2 
     * @param {Pointer<Integer>} param3 
     * @returns {BOOL} If the application performs the dialing operation, return <b>TRUE</b>. Use the <i>lpdwRetCode</i> parameter to indicate the results of the dialing operation.
     * 
     * If the application does not perform the dialing operation, return <b>FALSE</b>. In this case, the system uses the default user interface for dialing.
     */
    Call(param0, param1, param2, param3) {
        param0 := param0 is String ? StrPtr(param0) : param0
        param1 := param1 is String ? StrPtr(param1) : param1

        param3Marshal := param3 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", param0, "ptr", param1, RASADPARAMS.Ptr, param2, param3Marshal, param3, BOOL)
        return result
    }

    /**
     * A RASADFUNCA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RASADFUNCA {
        /**
         * Creates a RASADFUNCA pointer that invokes the given AHK function when called.
         * @param {Func(PSTR, PSTR, RASADPARAMS, "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PSTR, PSTR, RASADPARAMS.Ptr, "uint*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
