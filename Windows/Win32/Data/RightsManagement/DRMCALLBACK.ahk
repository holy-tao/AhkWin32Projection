#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRM_STATUS_MSG.ahk" { DRM_STATUS_MSG }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Some of the functions included in the AD RMS SDK provide status information and licenses to your application by using a callback function that you must implement. The callback syntax is shown below.
 * @remarks
 * The following asynchronous AD RMS functions use a callback function:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmcreateclientsession">DRMCreateClientSession</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmgetsignedissuancelicense">DRMGetSignedIssuanceLicense</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmacquireadvisories">DRMAcquireAdvisories</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmacquirelicense">DRMAcquireLicense</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msdrm/nf-msdrm-drmactivate">DRMActivate</a>
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/nc-msdrmdefs-drmcallback
 * @namespace Windows.Win32.Data.RightsManagement
 */
export default struct DRMCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is DRMCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {DRM_STATUS_MSG} param0 Specifies the action being performed. This can be one of the <a href="https://docs.microsoft.com/windows/desktop/api/msdrmdefs/ne-msdrmdefs-drm_status_msg">DRM_STATUS_MSG</a> enumeration values.
     * @param {HRESULT} param1 The status of the current action.
     * @param {Pointer<Void>} param2 
     * @param {Pointer<Void>} param3 
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     */
    Call(param0, param1, param2, param3) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"
        param3Marshal := param3 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DRM_STATUS_MSG, param0, "int", param1, param2Marshal, param2, param3Marshal, param3, "HRESULT")
        return result
    }

    /**
     * A DRMCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends DRMCALLBACK {
        /**
         * Creates a DRMCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(DRM_STATUS_MSG, "int", "ptr", "ptr") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DRM_STATUS_MSG, "int", "ptr", "ptr", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
