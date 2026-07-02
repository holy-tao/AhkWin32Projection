#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CARD_DATA.ahk" { CARD_DATA }
#Import ".\CONTAINER_INFO.ahk" { CONTAINER_INFO }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct PFN_CARD_GET_CONTAINER_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PFN_CARD_GET_CONTAINER_INFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CARD_DATA>} pCardData 
     * @param {Integer} bContainerIndex 
     * @param {Integer} dwFlags 
     * @param {Pointer<CONTAINER_INFO>} pContainerInfo 
     * @returns {Integer} 
     */
    Call(pCardData, bContainerIndex, dwFlags, pContainerInfo) {
        result := DllCall(this.value, CARD_DATA.Ptr, pCardData, Int8, bContainerIndex, UInt32, dwFlags, CONTAINER_INFO.Ptr, pContainerInfo, UInt32)
        return result
    }

    /**
     * A PFN_CARD_GET_CONTAINER_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_CARD_GET_CONTAINER_INFO {
        /**
         * Creates a PFN_CARD_GET_CONTAINER_INFO pointer that invokes the given AHK function when called.
         * @param {Func(CARD_DATA, Int8, UInt32, CONTAINER_INFO) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CARD_DATA.Ptr, Int8, UInt32, CONTAINER_INFO.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
