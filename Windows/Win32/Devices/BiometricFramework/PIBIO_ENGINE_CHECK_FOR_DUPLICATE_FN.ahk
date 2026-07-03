#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_IDENTITY.ahk" { WINBIO_IDENTITY }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Determines whether a new template in the pipeline duplicates any template already saved in the database regardless of the identity associated with the templates.
 * @remarks
 * The Windows Biometric Framework calls this function before committing a new enrollment template to the  database of a biometric unit. The purpose of this function is to prevent collisions in the engine adapter matching space. Collisions can result in false-positive matches.
 * 
 * This function should perform a content-based query by using the storage adapter to determine whether the template matches any template already in the database.
 * 
 * 
 * If this method finds a duplicate template in the database, it should return the <i>Identity</i> and <i>SubFactor</i> values for the matching template, set the <i>Duplicate</i> parameter to <b>TRUE</b>, and return an <b>HRESULT</b> value of S_OK.
 * 
 * If this method does not find a matching template in the database, it should set the  <i>Duplicate</i> parameter to <b>FALSE</b> but return an <b>HRESULT</b> value of S_OK.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_check_for_duplicate_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline">WINBIO_PIPELINE</a> structure associated with the biometric unit performing the operation.
     * @param {Pointer<WINBIO_IDENTITY>} Identity Pointer to a  <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure that receives the GUID or SID of the duplicate template stored in the database.
     * @param {Pointer<Integer>} SubFactor Pointer to a  <b>WINBIO_BIOMETRIC_SUBTYPE</b> variable that receives the sub-factor associated with the duplicate template in the database.
     * @param {Pointer<BOOLEAN>} Duplicate A pointer to a Boolean value that specifies whether a matching template was found in the database.
     * @returns {HRESULT} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A mandatory pointer parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WINBIO_E_INVALID_DEVICE_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is no enrollment template in the pipeline engine context.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Pipeline, Identity, SubFactor, Duplicate) {
        SubFactorMarshal := SubFactor is VarRef ? "char*" : "ptr"
        DuplicateMarshal := Duplicate is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, WINBIO_IDENTITY.Ptr, Identity, SubFactorMarshal, SubFactor, DuplicateMarshal, Duplicate, "HRESULT")
        return result
    }

    /**
     * A PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN {
        /**
         * Creates a PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, WINBIO_IDENTITY, "char*", BOOLEAN) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, WINBIO_IDENTITY.Ptr, "char*", BOOLEAN.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
