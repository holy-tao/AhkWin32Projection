#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WINBIO_STORAGE_RECORD.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN extends IUnknown {

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
     * @returns {WINBIO_STORAGE_RECORD} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(Pipeline, Identity, SubFactor) {
        RecordContents := WINBIO_STORAGE_RECORD()
        result := ComCall(3, this, "ptr", Pipeline, "ptr", Identity, "char", SubFactor, "ptr", RecordContents, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RecordContents
    }
}
