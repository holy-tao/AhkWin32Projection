#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class ICachedFileManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICachedFileManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{8ffc224a-e782-495d-b614-654c4f0b2370}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DeferUpdates", "CompleteUpdatesAsync"]

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {HRESULT} 
     */
    DeferUpdates(file_) {
        result := ComCall(6, this, "ptr", file_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IStorageFile} file_ 
     * @returns {IAsyncOperation<Integer>} 
     */
    CompleteUpdatesAsync(file_) {
        result := ComCall(7, this, "ptr", file_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation((ptr) => IPropertyValue(ptr).GetInt32(), operation)
    }
}
