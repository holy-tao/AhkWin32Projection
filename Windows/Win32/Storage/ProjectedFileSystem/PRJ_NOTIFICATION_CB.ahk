#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Delivers notifications to the provider about file system operations.
 * @remarks
 * This callback is optional. If the provider does not supply an implementation of this callback, it will not receive notifications. 
 * 
 * 
 * The provider registers for the notifications it wishes to receive when it calls <a href="https://docs.microsoft.com/windows/desktop/api/projectedfslib/nf-projectedfslib-prjstartvirtualizing">PrjStartVirtualizing</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/projectedfslib/nc-projectedfslib-prj_notification_cb
 * @namespace Windows.Win32.Storage.ProjectedFileSystem
 * @version v4.0.30319
 */
class PRJ_NOTIFICATION_CB extends IUnknown {

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
     * @param {BOOLEAN} isDirectory 
     * @param {Integer} notification_ 
     * @param {PWSTR} destinationFileName 
     * @param {Pointer<PRJ_NOTIFICATION_PARAMETERS>} operationParameters 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(callbackData, isDirectory, notification_, destinationFileName, operationParameters) {
        destinationFileName := destinationFileName is String ? StrPtr(destinationFileName) : destinationFileName

        result := ComCall(3, this, "ptr", callbackData, "char", isDirectory, "int", notification_, "ptr", destinationFileName, "ptr", operationParameters, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
