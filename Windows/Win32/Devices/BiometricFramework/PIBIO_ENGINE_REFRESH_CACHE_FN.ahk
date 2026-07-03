#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Notifies the Engine Adapter that it should discard any cached templates that it may be keeping in memory.
 * @remarks
 * An Engine Adapter that maintains a private in-memory cache of templates (e.g., for performance reasons) should discard the contents of its cache when it receives this method call. The call indicates that the cache contents are no longer valid. Depending on the Engine Adapter’s cache policy, the adapter may also choose to reload its cache at this time from the template database.
 * 
 * The biometric service calls this method in the following situations:<ul>
 * <li>
 * Once, when the <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_storage_attach_fn">StorageAdapterAttach</a> routine has successfully opened its connection to the template database.
 * 
 * </li>
 * <li>
 * Again, after performing any operation that changes the state of the template database. <ul>
 * <li>
 * Adding a new template to the database.
 * 
 * </li>
 * <li>
 * Deleting one or more existing templates from the database.
 * 
 * </li>
 * </ul>
 * 
 * 
 * </li>
 * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_refresh_cache_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_REFRESH_CACHE_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_REFRESH_CACHE_FN) {
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
     * @returns {HRESULT} The function will return one of the following <b>HRESULT</b> values. 
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
     * The <i>Pipeline</i> parameter cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value is returned in all other cases.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Pipeline) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, "HRESULT")
        return result
    }

    /**
     * A PIBIO_ENGINE_REFRESH_CACHE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_REFRESH_CACHE_FN {
        /**
         * Creates a PIBIO_ENGINE_REFRESH_CACHE_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
