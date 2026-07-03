#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\HCLUSTER.ahk" { HCLUSTER }
#Import ".\HRESOURCE.ahk" { HRESOURCE }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_ENUM_RESOURCES_EX2 {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_ENUM_RESOURCES_EX2) {
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
     * @param {Integer} dwDesiredAccess 
     * @returns {Integer} 
     */
    Call(_hCluster, hSelf, lpszResTypeName, pResCallBack, pParameter, dwDesiredAccess) {
        lpszResTypeName := lpszResTypeName is String ? StrPtr(lpszResTypeName) : lpszResTypeName

        pParameterMarshal := pParameter is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HCLUSTER, _hCluster, HRESOURCE, hSelf, "ptr", lpszResTypeName, "ptr", pResCallBack, pParameterMarshal, pParameter, UInt32, dwDesiredAccess, UInt32)
        return result
    }

    /**
     * A PRESUTIL_ENUM_RESOURCES_EX2 that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_ENUM_RESOURCES_EX2 {
        /**
         * Creates a PRESUTIL_ENUM_RESOURCES_EX2 pointer that invokes the given AHK function when called.
         * @param {Func(HCLUSTER, HRESOURCE, PWSTR, "ptr", "ptr", UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HCLUSTER, HRESOURCE, PWSTR, "ptr", "ptr", UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
