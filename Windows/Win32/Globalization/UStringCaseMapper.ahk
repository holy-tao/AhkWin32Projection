#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\UErrorCode.ahk" { UErrorCode }
#Import ".\UCaseMap.ahk" { UCaseMap }

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UStringCaseMapper {
    value : IntPtr

    __value {
        set {
            if (value is UStringCaseMapper) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<UCaseMap>} csm 
     * @param {Pointer<Integer>} dest 
     * @param {Integer} destCapacity 
     * @param {Pointer<Integer>} src 
     * @param {Integer} srcLength 
     * @param {Pointer<UErrorCode>} pErrorCode 
     * @returns {Integer} 
     */
    Call(csm, dest, destCapacity, src, srcLength, pErrorCode) {
        csmMarshal := csm is VarRef ? "ptr*" : "ptr"
        destMarshal := dest is VarRef ? "ushort*" : "ptr"
        srcMarshal := src is VarRef ? "ushort*" : "ptr"
        pErrorCodeMarshal := pErrorCode is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, csmMarshal, csm, destMarshal, dest, Int32, destCapacity, srcMarshal, src, Int32, srcLength, pErrorCodeMarshal, pErrorCode, Int32)
        return result
    }

    /**
     * A UStringCaseMapper that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends UStringCaseMapper {
        /**
         * Creates a UStringCaseMapper pointer that invokes the given AHK function when called.
         * @param {Func(UCaseMap, "ushort*", Int32, "ushort*", Int32, "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [UCaseMap.Ptr, "ushort*", Int32, "ushort*", Int32, "int*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
