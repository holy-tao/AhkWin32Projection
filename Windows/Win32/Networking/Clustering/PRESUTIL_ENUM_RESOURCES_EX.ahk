#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\HRESOURCE.ahk" { HRESOURCE }
#Import ".\LPRESOURCE_CALLBACK_EX.ahk" { LPRESOURCE_CALLBACK_EX }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_ENUM_RESOURCES_EX {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_ENUM_RESOURCES_EX) {
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
     * @param {HRESOURCE} hSelf 
     * @param {PWSTR} lpszResTypeName 
     * @param {Pointer<LPRESOURCE_CALLBACK_EX>} pResCallBack 
     * @param {Pointer<Void>} pParameter 
     * @returns {Integer} 
     */
    Call(_hCluster, hSelf, lpszResTypeName, pResCallBack, pParameter) {
        lpszResTypeName := lpszResTypeName is String ? StrPtr(lpszResTypeName) : lpszResTypeName

        pParameterMarshal := pParameter is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HCLUSTER, _hCluster, HRESOURCE, hSelf, "ptr", lpszResTypeName, LPRESOURCE_CALLBACK_EX, pResCallBack, pParameterMarshal, pParameter, UInt32)
        return result
    }

    /**
     * A PRESUTIL_ENUM_RESOURCES_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_ENUM_RESOURCES_EX {
        /**
         * Creates a PRESUTIL_ENUM_RESOURCES_EX pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, HRESOURCE, PWSTR, LPRESOURCE_CALLBACK_EX, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, HRESOURCE, PWSTR, LPRESOURCE_CALLBACK_EX, "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
