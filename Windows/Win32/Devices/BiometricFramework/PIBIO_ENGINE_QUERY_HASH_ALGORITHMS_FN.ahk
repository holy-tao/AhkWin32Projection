#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Retrieves an array of object identifiers that represent the hash algorithms supported by the engine adapter.
 * @remarks
 * Only the SHA1 hash algorithm is used by the Windows Biometric Framework. Therefore, this OID must be included in the buffer. Other OID strings are optional and can be included for future Windows versions. In Wincrypt.h, included with the Windows SDK, the symbol for the SHA1 algorithm is szOID_OIWSEC_sha1 and the associated string value is "1.3.14.3.2.26". This string value must be in the buffer. See Wincrypt.h for other OID values.
 * 
 * The following example shows how to create an OID buffer. The SHA1 algorithm ("1.3.14.3.2.26") is included first although the order of inclusion is not important. Another algorithm, szOID_OIWSEC_shaRSA with a value of "1.3.14.3.2.15" is also included. Note that a single <b>NULL</b> value identifies the end of each OID string and that an additional <b>NULL</b> value after the end of the last string identifies the end of the buffer. 
 * 
 * 
 * ```cpp
 * char OidBuffer[] = 
 * {
 *     '1','.','3','.','1','4','.','3','.','2','.','2','6','\0',
 *     '1','.','3','.','1','4','.','3','.','2','.','1','5','\0','\0'
 * };
 * 
 * ```
 * 
 * 
 * If this function succeeds, return the address of the start of this buffer in the <i>AlgorithmBuffer</i> argument. The engine adapter owns the buffer. Because the Windows Biometric Framework reads the buffer, the address must remain valid as long as the engine adapter is attached to the biometric unit.
 * 
 * Typically, you compile the table of OID strings into the engine adapter as a static data block.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_query_hash_algorithms_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN) {
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
     * @param {Pointer<Pointer>} AlgorithmCount Pointer to a value that receives the number of algorithm OID strings in the buffer specified by the <i>AlgorithmBuffer</i> parameter.
     * @param {Pointer<Pointer>} AlgorithmBufferSize Pointer to a value that contains the size, in bytes, of the buffer specified by the <i>AlgorithmBuffer</i> parameter. The size includes the two <b>NULL</b> values that terminate the buffer.
     * @param {Pointer<Pointer<Integer>>} AlgorithmBuffer Address of a variable that receives a pointer to a buffer that contains packed, <b>NULL</b>-terminated ANSI strings. Each string represents an OID for a hash algorithm. The final string in the buffer must be terminated by two successive <b>NULL</b> values.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The engine adapter does not support template hash generation.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(Pipeline, AlgorithmCount, AlgorithmBufferSize, AlgorithmBuffer) {
        AlgorithmCountMarshal := AlgorithmCount is VarRef ? "ptr*" : "ptr"
        AlgorithmBufferSizeMarshal := AlgorithmBufferSize is VarRef ? "ptr*" : "ptr"
        AlgorithmBufferMarshal := AlgorithmBuffer is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, AlgorithmCountMarshal, AlgorithmCount, AlgorithmBufferSizeMarshal, AlgorithmBufferSize, AlgorithmBufferMarshal, AlgorithmBuffer, "HRESULT")
        return result
    }

    /**
     * A PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN {
        /**
         * Creates a PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, "ptr*", "ptr*", "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, "ptr*", "ptr*", "ptr*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
