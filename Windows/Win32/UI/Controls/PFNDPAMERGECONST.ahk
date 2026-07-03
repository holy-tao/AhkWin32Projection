#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\DPAMM_MESSAGE.ahk" { DPAMM_MESSAGE }

/**
 * Defines the prototype for the merge function used by DPA_Merge, using constant values.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nc-dpa_dsa-pfndpamergeconst
 * @namespace Windows.Win32.UI.Controls
 */
export default struct PFNDPAMERGECONST {
    value : IntPtr

    __value {
        set {
            if (value is PFNDPAMERGECONST) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {DPAMM_MESSAGE} uMsg Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @param {Pointer<Void>} pvDest Type: <b>const void*</b>
     * 
     * A pointer to the destination item in the merge.
     * @param {Pointer<Void>} pvSrc Type: <b>const void*</b>
     * 
     * A pointer to the source item in the merge.
     * @param {LPARAM} _lParam Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Additional data that can be used by the merge callback.
     * @returns {Pointer<Void>} Type: <b>const void*</b>
     * 
     * A pointer to constant data which results from the merge, or <b>NULL</b> if there is a failure when DPAMM_MERGE or DPAMM_INSERT is used.
     */
    Call(uMsg, pvDest, pvSrc, _lParam) {
        pvDestMarshal := pvDest is VarRef ? "ptr" : "ptr"
        pvSrcMarshal := pvSrc is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DPAMM_MESSAGE, uMsg, pvDestMarshal, pvDest, pvSrcMarshal, pvSrc, LPARAM, _lParam, IntPtr)
        return result
    }

    /**
     * A PFNDPAMERGECONST that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNDPAMERGECONST {
        /**
         * Creates a PFNDPAMERGECONST pointer that invokes the given AHK function when called.
         * @param {Func(DPAMM_MESSAGE, "ptr", "ptr", LPARAM) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DPAMM_MESSAGE, "ptr", "ptr", LPARAM, "ptr"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
