#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Informs the provider that a directory enumeration is over.
 * @remarks
 * For a user-initiated enumeration ProjFS invokes this callback when the file handle used to enumerate the directory is closed. For a ProjFS-initiated enumeration, this callback is invoked when ProjFS completes the enumeration.
 * @see https://learn.microsoft.com/windows/win32/api//content/projectedfslib/nc-projectedfslib-prj_end_directory_enumeration_cb
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_END_DIRECTORY_ENUMERATION_CB extends IUnknown {

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
     * @param {Pointer<PRJ_CALLBACK_DATA>} callbackData 
     * @param {Pointer<Guid>} enumerationId 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(callbackData, enumerationId) {
        result := ComCall(3, this, "ptr", callbackData, "ptr", enumerationId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
