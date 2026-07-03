#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXDEVVIRTUALDEVICECREATION {
    value : IntPtr

    __value {
        set {
            if (value is PFAXDEVVIRTUALDEVICECREATION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} DeviceCount 
     * @param {PWSTR} DeviceNamePrefix 
     * @param {Pointer<Integer>} DeviceIdPrefix 
     * @param {HANDLE} CompletionPort 
     * @param {Pointer} CompletionKey 
     * @returns {BOOL} 
     */
    Call(DeviceCount, DeviceNamePrefix, DeviceIdPrefix, CompletionPort, CompletionKey) {
        DeviceNamePrefix := DeviceNamePrefix is String ? StrPtr(DeviceNamePrefix) : DeviceNamePrefix

        DeviceCountMarshal := DeviceCount is VarRef ? "uint*" : "ptr"
        DeviceIdPrefixMarshal := DeviceIdPrefix is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, DeviceCountMarshal, DeviceCount, "ptr", DeviceNamePrefix, DeviceIdPrefixMarshal, DeviceIdPrefix, HANDLE, CompletionPort, IntPtr, CompletionKey, BOOL)
        return result
    }

    /**
     * A PFAXDEVVIRTUALDEVICECREATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXDEVVIRTUALDEVICECREATION {
        /**
         * Creates a PFAXDEVVIRTUALDEVICECREATION pointer that invokes the given AHK function when called.
         * @param {Func("uint*", PWSTR, "uint*", HANDLE, IntPtr) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["uint*", PWSTR, "uint*", HANDLE, IntPtr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
