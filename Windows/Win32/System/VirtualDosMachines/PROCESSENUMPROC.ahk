#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * Implement this function to receive information for each virtual DOS machine (VDM) that VDMEnumProcessWOW enumerates.
 * @see https://learn.microsoft.com/windows/win32/api/vdmdbg/nc-vdmdbg-processenumproc
 * @namespace Windows.Win32.System.VirtualDosMachines
 */
export default struct PROCESSENUMPROC {
    value : IntPtr

    __value {
        set {
            if (value is PROCESSENUMPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwProcessId The process ID of the NTVDM.exe process. Use this ID when calling other VDM debug functions.
     * @param {Integer} dwAttributes The process attributes.
     * @param {LPARAM} lpUserDefined The user-defined data that was passed to the <a href="https://docs.microsoft.com/windows/desktop/api/vdmdbg/nf-vdmdbg-vdmenumprocesswow">VDMEnumProcessWOW</a> function.
     * @returns {BOOL} Return <b>TRUE</b> to stop the enumeration and <b>FALSE</b> to continue.
     */
    Call(dwProcessId, dwAttributes, lpUserDefined) {
        result := DllCall(this.value, UInt32, dwProcessId, UInt32, dwAttributes, LPARAM, lpUserDefined, BOOL)
        return result
    }

    /**
     * A PROCESSENUMPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PROCESSENUMPROC {
        /**
         * Creates a PROCESSENUMPROC pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, LPARAM) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, LPARAM, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
