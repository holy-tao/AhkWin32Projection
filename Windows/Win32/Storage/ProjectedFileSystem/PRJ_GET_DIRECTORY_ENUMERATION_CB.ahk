#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Requests directory enumeration information from the provider.
 * @remarks
 * ProjFS invokes this callback one or more times after invoking <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nc-projectedfslib-prj_start_directory_enumeration_cb">PRJ_START_DIRECTORY_ENUMERATION_CB</a>.  See the Remarks section of <i>PRJ_START_DIRECTORY_ENUMERATION_CB</i> for more information.
 * @see https://learn.microsoft.com/windows/win32/api//content/projectedfslib/nc-projectedfslib-prj_get_directory_enumeration_cb
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_GET_DIRECTORY_ENUMERATION_CB extends IUnknown {

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
     * @param {PWSTR} searchExpression 
     * @param {PRJ_DIR_ENTRY_BUFFER_HANDLE} dirEntryBufferHandle 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(callbackData, enumerationId, searchExpression, dirEntryBufferHandle) {
        searchExpression := searchExpression is String ? StrPtr(searchExpression) : searchExpression
        dirEntryBufferHandle := dirEntryBufferHandle is Win32Handle ? NumGet(dirEntryBufferHandle, "ptr") : dirEntryBufferHandle

        result := ComCall(3, this, "ptr", callbackData, "ptr", enumerationId, "ptr", searchExpression, "ptr", dirEntryBufferHandle, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
