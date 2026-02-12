#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_check_for_duplicate_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_CHECK_FOR_DUPLICATE_FN extends IUnknown {

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
     * @param {Pointer<WINBIO_IDENTITY>} Identity 
     * @param {Pointer<Integer>} SubFactor 
     * @param {Pointer<BOOLEAN>} Duplicate 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, Identity, SubFactor, Duplicate) {
        SubFactorMarshal := SubFactor is VarRef ? "char*" : "ptr"
        DuplicateMarshal := Duplicate is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", Pipeline, "ptr", Identity, SubFactorMarshal, SubFactor, DuplicateMarshal, Duplicate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
