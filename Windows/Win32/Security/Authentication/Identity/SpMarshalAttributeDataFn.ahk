#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpMarshalAttributeDataFn {
    value : IntPtr

    __value {
        set {
            if (value is SpMarshalAttributeDataFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} _AttributeInfo 
     * @param {Integer} Attribute 
     * @param {Integer} AttributeDataSize 
     * @param {Integer} AttributeData 
     * @param {Pointer<Integer>} MarshaledAttributeDataSize 
     * @param {Pointer<Pointer<Integer>>} MarshaledAttributeData 
     * @returns {NTSTATUS} 
     */
    Call(_AttributeInfo, Attribute, AttributeDataSize, AttributeData, MarshaledAttributeDataSize, MarshaledAttributeData) {
        MarshaledAttributeDataSizeMarshal := MarshaledAttributeDataSize is VarRef ? "uint*" : "ptr"
        MarshaledAttributeDataMarshal := MarshaledAttributeData is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, UInt32, _AttributeInfo, UInt32, Attribute, UInt32, AttributeDataSize, IntPtr, AttributeData, MarshaledAttributeDataSizeMarshal, MarshaledAttributeDataSize, MarshaledAttributeDataMarshal, MarshaledAttributeData, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpMarshalAttributeDataFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpMarshalAttributeDataFn {
        /**
         * Creates a SpMarshalAttributeDataFn pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, UInt32, IntPtr, "uint*", "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, UInt32, IntPtr, "uint*", "ptr*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
