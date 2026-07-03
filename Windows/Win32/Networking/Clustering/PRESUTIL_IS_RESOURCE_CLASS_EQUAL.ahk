#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CLUS_RESOURCE_CLASS_INFO.ahk" { CLUS_RESOURCE_CLASS_INFO }
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_IS_RESOURCE_CLASS_EQUAL {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_IS_RESOURCE_CLASS_EQUAL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CLUS_RESOURCE_CLASS_INFO>} prci 
     * @param {HRESOURCE} _hResource 
     * @returns {BOOL} 
     */
    Call(prci, _hResource) {
        result := DllCall(this.value, CLUS_RESOURCE_CLASS_INFO.Ptr, prci, HRESOURCE, _hResource, BOOL)
        return result
    }

    /**
     * A PRESUTIL_IS_RESOURCE_CLASS_EQUAL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_IS_RESOURCE_CLASS_EQUAL {
        /**
         * Creates a PRESUTIL_IS_RESOURCE_CLASS_EQUAL pointer that invokes the given AHK function when called.
         * @param {Func(CLUS_RESOURCE_CLASS_INFO, HRESOURCE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CLUS_RESOURCE_CLASS_INFO.Ptr, HRESOURCE, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
