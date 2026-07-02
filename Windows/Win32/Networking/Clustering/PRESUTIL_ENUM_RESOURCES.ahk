#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPRESOURCE_CALLBACK.ahk" { LPRESOURCE_CALLBACK }
#Import ".\HRESOURCE.ahk" { HRESOURCE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_ENUM_RESOURCES {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_ENUM_RESOURCES) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HRESOURCE} hSelf 
     * @param {PWSTR} lpszResTypeName 
     * @param {Pointer<LPRESOURCE_CALLBACK>} pResCallBack 
     * @param {Pointer<Void>} pParameter 
     * @returns {Integer} 
     */
    Call(hSelf, lpszResTypeName, pResCallBack, pParameter) {
        lpszResTypeName := lpszResTypeName is String ? StrPtr(lpszResTypeName) : lpszResTypeName

        pParameterMarshal := pParameter is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HRESOURCE, hSelf, "ptr", lpszResTypeName, LPRESOURCE_CALLBACK, pResCallBack, pParameterMarshal, pParameter, UInt32)
        return result
    }

    /**
     * A PRESUTIL_ENUM_RESOURCES that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_ENUM_RESOURCES {
        /**
         * Creates a PRESUTIL_ENUM_RESOURCES pointer that invokes the given AHK function when called.
         * @param {Func(HRESOURCE, PWSTR, LPRESOURCE_CALLBACK, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HRESOURCE, PWSTR, LPRESOURCE_CALLBACK, "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
