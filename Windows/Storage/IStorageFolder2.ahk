#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\IStorageItem.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Manipulates folders and their contents, and provides information about them.
  * 
  * > [!IMPORTANT]
  * > If you simply want to work with folders in your app, see the [StorageFolder](storagefolder.md) class.
 * @remarks
 * > [!IMPORTANT]
 * > If you simply want to work with folders in your app, see the [StorageFolder](storagefolder.md) class.
 * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefolder2
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageFolder2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageFolder2
     * @type {Guid}
     */
    static IID => Guid("{e827e8b9-08d9-4a8e-a0ac-fe5ed3cbbbd3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryGetItemAsync"]

    /**
     * Try to get a single file or sub-folder from the current folder by using the name of the item.
     * @param {HSTRING} name The name (or path relative to the current folder) of the file or sub-folder to try to retrieve.
     * @returns {IAsyncOperation<IStorageItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istoragefolder2.trygetitemasync
     */
    TryGetItemAsync(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(6, this, "ptr", name, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IStorageItem, operation)
    }
}
