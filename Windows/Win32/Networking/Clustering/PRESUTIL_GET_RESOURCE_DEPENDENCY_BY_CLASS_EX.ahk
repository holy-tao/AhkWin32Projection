#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\HRESOURCE.ahk" { HRESOURCE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CLUS_RESOURCE_CLASS_INFO.ahk" { CLUS_RESOURCE_CLASS_INFO }
#Import ".\HCLUSTER.ahk" { HCLUSTER }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_CLASS_EX {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_CLASS_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HCLUSTER} _hCluster 
     * @param {HANDLE} hSelf 
     * @param {Pointer<CLUS_RESOURCE_CLASS_INFO>} prci 
     * @param {BOOL} bRecurse 
     * @param {Integer} dwDesiredAccess 
     * @returns {HRESOURCE} 
     */
    Call(_hCluster, hSelf, prci, bRecurse, dwDesiredAccess) {
        result := DllCall(this.value, HCLUSTER, _hCluster, HANDLE, hSelf, CLUS_RESOURCE_CLASS_INFO.Ptr, prci, BOOL, bRecurse, UInt32, dwDesiredAccess, HRESOURCE)
        return result
    }

    /**
     * A PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_CLASS_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_CLASS_EX {
        /**
         * Creates a PRESUTIL_GET_RESOURCE_DEPENDENCY_BY_CLASS_EX pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, HANDLE, CLUS_RESOURCE_CLASS_INFO, BOOL, UInt32) => HRESOURCE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, HANDLE, CLUS_RESOURCE_CLASS_INFO.Ptr, BOOL, UInt32, HRESOURCE])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
