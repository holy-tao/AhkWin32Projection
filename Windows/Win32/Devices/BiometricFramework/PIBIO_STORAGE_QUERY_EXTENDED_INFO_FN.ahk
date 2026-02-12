#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Determines the capabilities and limitations of the biometric storage component.
 * @remarks
 * This method is called once during configuration of the biometric unit. 
 * 
 * It will also be called if a client application uses the <a href="https://docs.microsoft.com/windows/desktop/api/winbio/nf-winbio-winbiogetproperty">WinBioGetProperty</a> function to query the value of the <b>WINBIO_PROPERTY_EXTENDED_STORAGE_INFO</b> property.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbio_adapter/nc-winbio_adapter-pibio_storage_query_extended_info_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_STORAGE_QUERY_EXTENDED_INFO_FN extends IUnknown {

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
     * @param {Pointer} StorageInfo 
     * @param {Pointer} StorageInfoSize 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, StorageInfo, StorageInfoSize) {
        result := ComCall(3, this, "ptr", Pipeline, "ptr", StorageInfo, "ptr", StorageInfoSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
