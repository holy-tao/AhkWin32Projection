#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include .\StorageFolder.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Manipulates storage items (files and folders) and their contents, and provides information about them.
  * 
  * 
  * 
  * > > [!IMPORTANT]
  * > If you simply want to work with files and folders in your app, see the [StorageFile](storagefile.md) and [StorageFolder](storagefolder.md) classes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitem2
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageItem2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageItem2
     * @type {Guid}
     */
    static IID => Guid("{53f926d2-083c-4283-b45b-81c007237e44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetParentAsync", "IsEqual"]

    /**
     * Gets the parent folder of the current storage item.
     * @remarks
     * You must have access to the parent for the GetParentAsync method to succeed, either by declaring library capabilities or by persisting a higher-level folder in the Access List. Also, this method returns **null** if you can’t get to the parent, instead of raising an exception.
     * 
     * This example shows how to get the parent folder of a [StorageFile](storagefile.md).
     * 
     * 
     * 
     * ```javascript
     * function openParentFolder(file) {
     *     file.GetParentAsync().done(function (folder) {
     *         if (folder != null) {
     *             folder.getItemsAsync(function (items) {
     *                 var list = document.getElementById("parentFolderItemsList");
     *                 items.forEach(function (item) {
     *                     var listItemElement = document.createElement("li");
     *                     if (item.isOfType(Windows.Storage.StorageItemTypes.folder)) {
     *                         listItemElement.textContent = item.name + "\\";
     *                     } else {
     *                         listItemElement.textContent = item.name;
     *                     }
     *                     list.appendChild(listItemElement);
     *                 });
     *             });
     *         } else {
     *             // Unable to get parent folder
     *         }
     *     });
     * }
     * 
     * ```
     * @returns {IAsyncOperation<StorageFolder>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitem2.getparentasync
     */
    GetParentAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFolder, operation)
    }

    /**
     * Indicates whether the current item is the same as the specified item.
     * @remarks
     * Use the IsEqual method to determine whether two storage items represent the same file or folder.
     * 
     * This method compares the [Path](istorageitem_path.md) property of both items to determine if they are the same. If there is no [Path](istorageitem_path.md) (if the item is a library for example), or if the paths do not match the items are compared using [IShellItem.Compare](/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellitem-compare).
     * 
     * This example shows how to compare two storage files for equality.
     * 
     * 
     * 
     * ```javascript
     * function openNewFile() {
     *     var picker = new Windows.Storage.Pickers.FileOpenPicker;
     *     picker.fileTypeFilter.replaceAll(["*"]);
     *     picker.pickSingleFileAsync().then(function (file) {
     *         var alreadyOpenedFile = null;
     *         _openFiles.some(function (openFile) {
     *             if (file.IsEqual(openFile.file)) {
     *                 alreadyOpenedFile = openFile;
     *                 return true;
     *             }
     *             return false;
     *         });
     * 
     *         if (alreadyOpenedFile != null) {
     *             alreadyOpenedFile.window.activate();
     *         } else {
     *             createNewFileViewerWindow(file);
     *         }
     *     });
     * }
     * ```
     * @param {IStorageItem} item The [IStorageItem](istorageitem.md) object that represents a storage item to compare against.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitem2.isequal
     */
    IsEqual(item) {
        result := ComCall(7, this, "ptr", item, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
