#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Deletes one or more templates from the database.
 * @remarks
 * If the <b>Type</b> field of the <a href="https://docs.microsoft.com/windows/desktop/SecBioMet/winbio-identity">WINBIO_IDENTITY</a> structure pointed to by the <i>Identity</i> parameter is set to <b>WINBIO_IDENTITY_TYPE_WILDCARD</b> and the <i>SubFactor</i> parameter equals <b>WINBIO_SUBTYPE_ANY</b>, the storage adapter should delete all records from the database.
 * 
 * <div class="alert"><b>Important</b>  <p class="note">Do not attempt to validate the value supplied for the <i>SubFactor</i> parameter. The Windows Biometrics Service will validate the supplied value before passing it through to your implementation. If the value is <b>WINBIO_SUBTYPE_NO_INFORMATION</b> or <b>WINBIO_SUBTYPE_ANY</b>, then validate where appropriate.
 * 
 * </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_storage_delete_record_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_STORAGE_DELETE_RECORD_FN extends IUnknown {

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
     * @param {Integer} SubFactor 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, Identity, SubFactor) {
        result := ComCall(3, this, "ptr", Pipeline, "ptr", Identity, "char", SubFactor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
