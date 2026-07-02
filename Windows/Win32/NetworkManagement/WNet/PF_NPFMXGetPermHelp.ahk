#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPFMXGetPermHelp {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPFMXGetPermHelp) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpDriveName 
     * @param {Integer} nDialogType 
     * @param {BOOL} fDirectory 
     * @param {Pointer<Void>} lpFileNameBuffer 
     * @param {Pointer<Integer>} lpBufferSize 
     * @param {Pointer<Integer>} lpnHelpContext 
     * @returns {Integer} 
     */
    Call(lpDriveName, nDialogType, fDirectory, lpFileNameBuffer, lpBufferSize, lpnHelpContext) {
        lpDriveName := lpDriveName is String ? StrPtr(lpDriveName) : lpDriveName

        lpFileNameBufferMarshal := lpFileNameBuffer is VarRef ? "ptr" : "ptr"
        lpBufferSizeMarshal := lpBufferSize is VarRef ? "uint*" : "ptr"
        lpnHelpContextMarshal := lpnHelpContext is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, "ptr", lpDriveName, UInt32, nDialogType, BOOL, fDirectory, lpFileNameBufferMarshal, lpFileNameBuffer, lpBufferSizeMarshal, lpBufferSize, lpnHelpContextMarshal, lpnHelpContext, UInt32)
        return result
    }

    /**
     * A PF_NPFMXGetPermHelp that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPFMXGetPermHelp {
        /**
         * Creates a PF_NPFMXGetPermHelp pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, UInt32, BOOL, "ptr", "uint*", "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32, BOOL, "ptr", "uint*", "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
