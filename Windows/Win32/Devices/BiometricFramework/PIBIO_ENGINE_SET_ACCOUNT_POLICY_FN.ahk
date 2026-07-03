#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_ACCOUNT_POLICY.ahk" { WINBIO_ACCOUNT_POLICY }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Sets the extended default and per-user antispoofing policies used by the engine adapter.
 * @remarks
 * This method is called each time the biometric unit is activated.
 * 
 * This method executes in the context of the same thread that activated the biometric unit and that processed all other requests for the unit.
 * 
 * The Identity.Type field of the first element in the <i>PolicyItemArray</i> will always be <b>WINBIO_ID_TYPE_WILDCARD</b>. This indicates that the policy item contains a default AntiSpoofBehavior value which should be applied to any user account that isn’t explicitly listed in the rest of the array.
 * 
 * If the <i>PolicyItemArray</i> contains more than one element, the Identity.Type field of the remaining items will be <b>WINBIO_ID_TYPE_WILDCARD</b>, and the Identity.Value.AccountSid.Data field will contain the SID of a user account that requires the antispoof policy behavior specified in the AntiSpoofBehavior field of the array element.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_set_account_policy_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline">WINBIO_PIPELINE</a> structure associated with the biometric unit performing the operation.
     * @param {Pointer<WINBIO_ACCOUNT_POLICY>} PolicyItemArray Address of an array of <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-account-policy">WINBIO_ACCOUNT_POLICY</a> structures, which the routine should use to update the policies it is applying to any identities it detects.
     * @param {Pointer} PolicyItemCount The number of elements in the array pointed to by the <i>PolicyItemArray</i> parameter.
     * @returns {HRESULT} If the function succeeds, it returns <b>S_OK</b>. If the function fails, it must return one of the following <b>HRESULT</b> values to indicate the error.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_some_error </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Errors return by the method are logged but ignored.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Pipeline, PolicyItemArray, PolicyItemCount) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, WINBIO_ACCOUNT_POLICY.Ptr, PolicyItemArray, IntPtr, PolicyItemCount, "HRESULT")
        return result
    }

    /**
     * A PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN {
        /**
         * Creates a PIBIO_ENGINE_SET_ACCOUNT_POLICY_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, WINBIO_ACCOUNT_POLICY, IntPtr) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, WINBIO_ACCOUNT_POLICY.Ptr, IntPtr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
