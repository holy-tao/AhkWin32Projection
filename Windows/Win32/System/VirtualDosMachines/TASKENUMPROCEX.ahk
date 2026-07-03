#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * Implement this function to receive information for each task that VDMEnumTaskWOWEx enumerates.
 * @remarks
 * You can use the value of the <i>hTask16</i> parameter in a call to terminate the task.
 * @see https://learn.microsoft.com/windows/win32/api/vdmdbg/nc-vdmdbg-taskenumprocex
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct TASKENUMPROCEX {
    value : IntPtr

    __value {
        set {
            if (value is TASKENUMPROCEX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwThreadId The thread ID.
     * @param {Integer} hMod16 The module handle.
     * @param {Integer} hTask16 The task handle.
     * @param {Pointer<Integer>} pszModName The module name.
     * @param {Pointer<Integer>} pszFileName The file name.
     * @param {LPARAM} lpUserDefined The user-defined data that was passed to the <a href="https://docs.microsoft.com/windows/desktop/api/vdmdbg/nf-vdmdbg-vdmenumtaskwowex">VDMEnumTaskWOWEx</a> function.
     * @returns {BOOL} Return <b>TRUE</b> to stop the enumeration and <b>FALSE</b> to continue.
     */
    Call(dwThreadId, hMod16, hTask16, pszModName, pszFileName, lpUserDefined) {
        pszModNameMarshal := pszModName is VarRef ? "char*" : "ptr"
        pszFileNameMarshal := pszFileName is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, UInt32, dwThreadId, UInt16, hMod16, UInt16, hTask16, pszModNameMarshal, pszModName, pszFileNameMarshal, pszFileName, LPARAM, lpUserDefined, BOOL)
        return result
    }

    /**
     * A TASKENUMPROCEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends TASKENUMPROCEX {
        /**
         * Creates a TASKENUMPROCEX pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt16, UInt16, "char*", "char*", LPARAM) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt16, UInt16, "char*", "char*", LPARAM, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
