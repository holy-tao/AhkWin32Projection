#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Finalizes the enrollment object, converts it to a template, and saves the template in the database.
 * @remarks
 * If this function succeeds, it should flush the enrollment template from the pipeline. The result of this action should be equivalent to calling <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/nc-winbio_adapter-pibio_engine_clear_context_fn">EngineAdapterClearContext</a>.
 * 
 * If this function fails, it should not change the state of the engine context. In particular, if there is a completed template attached to the pipeline, it should be possible to call this function again (after reasons for any failure have been addressed) to commit the template to the database.
 * 
 * Engine adapters that support pre-boot authentication must commit the enrollment not only to the storage adapter attached to the pipeline, but also to the pre-boot storage area. The details of how this is to be accomplished are left to the vendor.
 * 
 * <div class="alert"><b>Important</b>  <p class="note">Do not attempt to validate the value supplied for the <i>SubFactor</i> parameter. The Windows Biometrics Service will validate the supplied value before passing it through to your implementation. If the value is <b>WINBIO_SUBTYPE_NO_INFORMATION</b> or <b>WINBIO_SUBTYPE_ANY</b>, then validate where appropriate.
 * 
 * </div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_engine_commit_enrollment_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_ENGINE_COMMIT_ENROLLMENT_FN extends IUnknown {

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
     * @param {Pointer} PayloadBlob 
     * @param {Pointer} PayloadBlobSize 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, Identity, SubFactor, PayloadBlob, PayloadBlobSize) {
        result := ComCall(3, this, "ptr", Pipeline, "ptr", Identity, "char", SubFactor, "ptr", PayloadBlob, "ptr", PayloadBlobSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
