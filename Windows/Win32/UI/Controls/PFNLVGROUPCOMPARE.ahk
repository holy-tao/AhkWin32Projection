#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LVGroupCompare function is an application-defined callback function used with the LVM_INSERTGROUPSORTED and LVM_SORTGROUPS messages.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/nc-commctrl-pfnlvgroupcompare
 * @namespace Windows.Win32.UI.Controls
 */
export default struct PFNLVGROUPCOMPARE {
    value : IntPtr

    __value {
        set {
            if (value is PFNLVGROUPCOMPARE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} param0 Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * The ID of the first group.
     * @param {Integer} param1 Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * The ID of the second group.
     * @param {Pointer<Void>} param2 Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">VOID</a>*</b>
     * 
     * A pointer to the application-defined information. This comes from the message that was called; for <a href="https://docs.microsoft.com/windows/desktop/Controls/lvm-insertgroupsorted">LVM_INSERTGROUPSORTED</a> it is <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvinsertgroupsorted">LVINSERTGROUPSORTED.pvData</a>, and for <a href="https://docs.microsoft.com/windows/desktop/Controls/lvm-sortgroups">LVM_SORTGROUPS</a> it is the <i>plv</i> parameter.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * Returns a negative value if the data for <i>Group1_ID</i> is less than the data for <i>Group2_ID</i>, a positive value if it is greater, or zero if it is the same.
     */
    Call(param0, param1, param2) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, Int32, param0, Int32, param1, param2Marshal, param2, Int32)
        return result
    }

    /**
     * A PFNLVGROUPCOMPARE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNLVGROUPCOMPARE {
        /**
         * Creates a PFNLVGROUPCOMPARE pointer that invokes the given AHK function when called.
         * @param {Func(Int32, Int32, "ptr") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int32, Int32, "ptr", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
