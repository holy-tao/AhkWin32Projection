#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Requests the contents of a file's primary data stream.
 * @remarks
 * When ProjFS receives the data it will write it to the file to convert it into a hydrated placeholder. 
 * 
 * 
 * To handle this callback, the provider issues one or more calls to <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjwritefiledata">PrjWriteFileData</a> to give ProjFS the requested contents of the file's primary data stream. Then the provider completes the callback.
 * @see https://learn.microsoft.com/windows/win32/api//content/projectedfslib/nc-projectedfslib-prj_get_file_data_cb
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_GET_FILE_DATA_CB extends IUnknown {

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
     * @param {Integer} byteOffset 
     * @param {Integer} length 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(callbackData, byteOffset, length) {
        result := ComCall(3, this, "ptr", callbackData, "uint", byteOffset, "uint", length, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
