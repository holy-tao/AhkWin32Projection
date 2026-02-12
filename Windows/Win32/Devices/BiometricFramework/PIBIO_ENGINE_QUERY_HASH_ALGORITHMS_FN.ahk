#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_query_hash_algorithms_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_QUERY_HASH_ALGORITHMS_FN extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline 
     * @param {Pointer<Pointer>} AlgorithmCount 
     * @param {Pointer<Pointer>} AlgorithmBufferSize 
     * @param {Pointer<Pointer<Integer>>} AlgorithmBuffer 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, AlgorithmCount, AlgorithmBufferSize, AlgorithmBuffer) {
        AlgorithmCountMarshal := AlgorithmCount is VarRef ? "ptr*" : "ptr"
        AlgorithmBufferSizeMarshal := AlgorithmBufferSize is VarRef ? "ptr*" : "ptr"
        AlgorithmBufferMarshal := AlgorithmBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", Pipeline, AlgorithmCountMarshal, AlgorithmCount, AlgorithmBufferSizeMarshal, AlgorithmBufferSize, AlgorithmBufferMarshal, AlgorithmBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
