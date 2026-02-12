#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Determines whether a given file path exists in the provider's backing store.
 * @remarks
 * This callback is optional.  If the provider does not supply an implementation of this callback, ProjFS will invoke the provider’s directory enumeration callbacks to determine the existence of a file path in the provider's store.
 * 
 * The provider should use <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjfilenamecompare">PrjFileNameCompare</a> as the comparison routine when searching its backing store for the specified file.
 * @see https://learn.microsoft.com/windows/win32/api//content/projectedfslib/nc-projectedfslib-prj_query_file_name_cb
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_QUERY_FILE_NAME_CB extends IUnknown {

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
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(callbackData) {
        result := ComCall(3, this, "ptr", callbackData, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
