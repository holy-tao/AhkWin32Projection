#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Retrieves format and version information used by the current database associated with the pipeline.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_storage_get_data_format_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_STORAGE_GET_DATA_FORMAT_FN extends IUnknown {

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
     * @param {Pointer<Guid>} Format 
     * @param {Pointer<WINBIO_VERSION>} Version_ 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, Format, Version_) {
        result := ComCall(3, this, "ptr", Pipeline, "ptr", Format, "ptr", Version_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
