#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An application-defined callback function used with WriteEncryptedFileRaw. The system calls ImportCallback one or more times, each time to retrieve a portion of a backup file's data.
 * @remarks
 * The system calls the <b>ImportCallback</b> function until the 
 *      callback function indicates there is no more data to restore. To indicate that there is no more data to be 
 *      restored, set <i>*ulLength</i> to 0 and use a return code of 
 *      <b>ERROR_SUCCESS</b>. You can use the application-defined context block for internal tracking 
 *      of information such as the file handle and the current offset in the file.
 * @see https://learn.microsoft.com/windows/win32/api//content/winbase/nc-winbase-pfe_import_func
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class PFE_IMPORT_FUNC extends IUnknown {

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
     * @param {Pointer} pbData 
     * @param {Pointer<Void>} pvCallbackContext 
     * @param {Pointer<Integer>} ulLength 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pbData, pvCallbackContext, ulLength) {
        pvCallbackContextMarshal := pvCallbackContext is VarRef ? "ptr" : "ptr"
        ulLengthMarshal := ulLength is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pbData, pvCallbackContextMarshal, pvCallbackContext, ulLengthMarshal, ulLength, "uint")
        return result
    }
}
