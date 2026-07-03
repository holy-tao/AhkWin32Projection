#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import ".\WINBIO_REGISTERED_FORMAT.ahk" { WINBIO_REGISTERED_FORMAT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Determines the input data format preferred by the engine adapter.
 * @remarks
 * The sensor adapter calls this function to determine the biometric capture format.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_preferred_format_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_QUERY_PREFERRED_FORMAT_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_QUERY_PREFERRED_FORMAT_FN) {
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
     * @param {Pointer<WINBIO_REGISTERED_FORMAT>} StandardFormat Pointer to a <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-registered-format">WINBIO_REGISTERED_FORMAT</a> structure that specifies the format of the data in the <b>StandardDataBlock</b> member of the <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir">WINBIO_BIR</a> object. The format is an IBIA-registered name/value pair.
     * @param {Pointer<Guid>} VendorFormat Pointer to a GUID that receives the vendor-defined format of the data in the <b>VendorDataBlock</b> member of the <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-bir">WINBIO_BIR</a> object.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. If the function fails, it must return one of the following <b>HRESULT</b> values to indicate the error.
     * 
     * <table>
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
     * </table>
     */
    Call(Pipeline, StandardFormat, VendorFormat) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, WINBIO_REGISTERED_FORMAT.Ptr, StandardFormat, Guid.Ptr, VendorFormat, "HRESULT")
        return result
    }

    /**
     * A PIBIO_ENGINE_QUERY_PREFERRED_FORMAT_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_QUERY_PREFERRED_FORMAT_FN {
        /**
         * Creates a PIBIO_ENGINE_QUERY_PREFERRED_FORMAT_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, WINBIO_REGISTERED_FORMAT, Guid) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, WINBIO_REGISTERED_FORMAT.Ptr, Guid.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
