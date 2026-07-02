#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PSET_RESOURCE_INMEMORY_NODELOCAL_PROPERTIES_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PSET_RESOURCE_INMEMORY_NODELOCAL_PROPERTIES_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ResourceHandle 
     * @param {Pointer<Integer>} propertyListBuffer 
     * @param {Integer} propertyListBufferSize 
     * @returns {Integer} 
     */
    Call(ResourceHandle, propertyListBuffer, propertyListBufferSize) {
        propertyListBufferMarshal := propertyListBuffer is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, IntPtr, ResourceHandle, propertyListBufferMarshal, propertyListBuffer, UInt32, propertyListBufferSize, UInt32)
        return result
    }

    /**
     * A PSET_RESOURCE_INMEMORY_NODELOCAL_PROPERTIES_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSET_RESOURCE_INMEMORY_NODELOCAL_PROPERTIES_ROUTINE {
        /**
         * Creates a PSET_RESOURCE_INMEMORY_NODELOCAL_PROPERTIES_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, "char*", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "char*", UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
