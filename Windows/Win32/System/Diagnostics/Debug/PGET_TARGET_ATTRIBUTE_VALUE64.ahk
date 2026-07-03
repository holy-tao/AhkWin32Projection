#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct PGET_TARGET_ATTRIBUTE_VALUE64 {
    value : IntPtr

    __value {
        set {
            if (value is PGET_TARGET_ATTRIBUTE_VALUE64) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hProcess 
     * @param {Integer} Attribute 
     * @param {Integer} AttributeData 
     * @param {Pointer<Integer>} AttributeValue 
     * @returns {BOOL} 
     */
    Call(hProcess, Attribute, AttributeData, AttributeValue) {
        AttributeValueMarshal := AttributeValue is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, HANDLE, hProcess, UInt32, Attribute, Int64, AttributeData, AttributeValueMarshal, AttributeValue, BOOL)
        return result
    }

    /**
     * A PGET_TARGET_ATTRIBUTE_VALUE64 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_TARGET_ATTRIBUTE_VALUE64 {
        /**
         * Creates a PGET_TARGET_ATTRIBUTE_VALUE64 pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, Int64, "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, Int64, "uint*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
