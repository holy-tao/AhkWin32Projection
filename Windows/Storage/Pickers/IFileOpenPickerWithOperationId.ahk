#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\StorageFile.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Pickers
 * @version WindowsRuntime 1.4
 */
class IFileOpenPickerWithOperationId extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFileOpenPickerWithOperationId
     * @type {Guid}
     */
    static IID => Guid("{3f57b569-2522-4ca5-aa73-a15509f1fcbf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PickSingleFileAsync"]

    /**
     * 
     * @param {HSTRING} pickerOperationId 
     * @returns {IAsyncOperation<StorageFile>} 
     */
    PickSingleFileAsync(pickerOperationId) {
        if(pickerOperationId is String) {
            pin := HSTRING.Create(pickerOperationId)
            pickerOperationId := pin.Value
        }
        pickerOperationId := pickerOperationId is Win32Handle ? NumGet(pickerOperationId, "ptr") : pickerOperationId

        result := ComCall(6, this, "ptr", pickerOperationId, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFile, operation)
    }
}
