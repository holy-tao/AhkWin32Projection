#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MediaLabelInfo.ahk" { MediaLabelInfo }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct CLAIMMEDIALABELEX {
    value : IntPtr

    __value {
        set {
            if (value is CLAIMMEDIALABELEX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Integer>} pBuffer 
     * @param {Integer} nBufferSize 
     * @param {Pointer<MediaLabelInfo>} pLabelInfo 
     * @param {Pointer<Guid>} LabelGuid 
     * @returns {Integer} 
     */
    Call(pBuffer, nBufferSize, pLabelInfo, LabelGuid) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, pBufferMarshal, pBuffer, UInt32, nBufferSize, MediaLabelInfo.Ptr, pLabelInfo, Guid.Ptr, LabelGuid, UInt32)
        return result
    }

    /**
     * A CLAIMMEDIALABELEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends CLAIMMEDIALABELEX {
        /**
         * Creates a CLAIMMEDIALABELEX pointer that invokes the given AHK function when called.
         * @param {Func("char*", UInt32, MediaLabelInfo, Guid) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["char*", UInt32, MediaLabelInfo.Ptr, Guid.Ptr, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
