#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * Defines the prototype for the compare function used by DSA_Sort when the items being compared are constant objects.
 * @remarks
 * Alternate names for this callback are <b>PFNDPACOMPARECONST</b> and <b>PFNDSACOMPARECONST</b>.
 * @see https://learn.microsoft.com/windows/win32/api/dpa_dsa/nc-dpa_dsa-pfndacompareconst
 * @namespace Windows.Win32.UI.Controls
 */
export default struct PFNDACOMPARECONST {
    value : IntPtr

    __value {
        set {
            if (value is PFNDACOMPARECONST) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} p1 Type: <b>const void*</b>
     * 
     * A pointer to the first item in the comparison.
     * @param {Pointer<Void>} p2 Type: <b>const void*</b>
     * 
     * A pointer to the second item in the comparison.
     * @param {LPARAM} _lParam Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPARAM</a></b>
     * 
     * Additional data passed to <i>pfnCmp</i>.
     * @returns {Integer} Type: <b>int</b>
     * 
     * The meaning of the return values depends on the function that uses this callback prototype. The return values for <a href="https://docs.microsoft.com/windows/desktop/api/dpa_dsa/nf-dpa_dsa-dsa_sort">DSA_Sort</a> are as follows:                
     *                     
     * 
     * 
     * <table class="clsStd">
     * <tr>
     * <td>less than 0</td>
     * <td>If <i>p1</i> should be sorted ahead of <i>p2</i>.</td>
     * </tr>
     * <tr>
     * <td>equal to 0</td>
     * <td>If <i>p1</i> and <i>p2</i> should be sorted together.</td>
     * </tr>
     * <tr>
     * <td>greater than 0</td>
     * <td>If <i>p1</i> should be sorted after <i>p2</i>.</td>
     * </tr>
     * </table>
     */
    Call(p1, p2, _lParam) {
        p1Marshal := p1 is VarRef ? "ptr" : "ptr"
        p2Marshal := p2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, p1Marshal, p1, p2Marshal, p2, LPARAM, _lParam, Int32)
        return result
    }

    /**
     * A PFNDACOMPARECONST that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNDACOMPARECONST {
        /**
         * Creates a PFNDACOMPARECONST pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", LPARAM) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", LPARAM, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
