#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Queries the database that is currently open for templates associated with a specified index vector.
 * @remarks
 * If this method returns successfully, the result set in the pipeline is replaced by the results of the query even if the query returns an empty set.
 * 
 * If the database was created with a zero length index vector, the result set will contain every record for which the template sub factor matches the <i>SubFactor</i> parameter. In that case, if the caller passes WINBIO_SUBTYPE_ANY for the <i>SubFactor</i> parameter, this function returns all records in the database.
 * 
 * After a successful call to this function, the result set cursor should be  positioned on the first record in the set.
 * 
 * <div class="alert"><b>Important</b>  <p class="note">Do not attempt to validate the value supplied for the <i>SubFactor</i> parameter. The Windows Biometrics Service will validate the supplied value before passing it through to your implementation. If the value is <b>WINBIO_SUBTYPE_NO_INFORMATION</b> or <b>WINBIO_SUBTYPE_ANY</b>, then validate where appropriate.
 * 
 * </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_storage_query_by_content_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_STORAGE_QUERY_BY_CONTENT_FN extends IUnknown {

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
     * @param {Integer} SubFactor 
     * @param {Pointer<Integer>} IndexVector 
     * @param {Pointer} IndexElementCount 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, SubFactor, IndexVector, IndexElementCount) {
        IndexVectorMarshal := IndexVector is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", Pipeline, "char", SubFactor, IndexVectorMarshal, IndexVector, "ptr", IndexElementCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
