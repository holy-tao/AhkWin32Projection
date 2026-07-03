#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
export default struct PFN_HANDLE_CMD {
    value : IntPtr

    __value {
        set {
            if (value is PFN_HANDLE_CMD) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pwszMachine 
     * @param {Pointer<PWSTR>} ppwcArguments 
     * @param {Integer} dwCurrentIndex 
     * @param {Integer} dwArgCount 
     * @param {Integer} dwFlags 
     * @param {Pointer<Void>} pvData 
     * @param {Pointer<BOOL>} pbDone 
     * @returns {Integer} 
     */
    Call(pwszMachine, ppwcArguments, dwCurrentIndex, dwArgCount, dwFlags, pvData, pbDone) {
        pwszMachine := pwszMachine is String ? StrPtr(pwszMachine) : pwszMachine

        ppwcArgumentsMarshal := ppwcArguments is VarRef ? "ptr*" : "ptr"
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"
        pbDoneMarshal := pbDone is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, "ptr", pwszMachine, ppwcArgumentsMarshal, ppwcArguments, UInt32, dwCurrentIndex, UInt32, dwArgCount, UInt32, dwFlags, pvDataMarshal, pvData, pbDoneMarshal, pbDone, UInt32)
        return result
    }

    /**
     * A PFN_HANDLE_CMD that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_HANDLE_CMD {
        /**
         * Creates a PFN_HANDLE_CMD pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, PWSTR, UInt32, UInt32, UInt32, "ptr", BOOL) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, PWSTR.Ptr, UInt32, UInt32, UInt32, "ptr", BOOL.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
