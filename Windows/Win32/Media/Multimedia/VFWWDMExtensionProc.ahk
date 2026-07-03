#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct VFWWDMExtensionProc {
    value : IntPtr

    __value {
        set {
            if (value is VFWWDMExtensionProc) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pfnDeviceIoControl 
     * @param {Pointer<LPFNSVADDPROPSHEETPAGE>} pfnAddPropertyPage 
     * @param {LPARAM} _lParam 
     * @returns {Integer} 
     */
    Call(pfnDeviceIoControl, pfnAddPropertyPage, _lParam) {
        pfnDeviceIoControlMarshal := pfnDeviceIoControl is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pfnDeviceIoControlMarshal, pfnDeviceIoControl, "ptr", pfnAddPropertyPage, LPARAM, _lParam, UInt32)
        return result
    }

    /**
     * A VFWWDMExtensionProc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends VFWWDMExtensionProc {
        /**
         * Creates a VFWWDMExtensionProc pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", LPARAM) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", LPARAM, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
