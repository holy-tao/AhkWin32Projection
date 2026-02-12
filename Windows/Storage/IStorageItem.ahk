#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncAction.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include FileProperties\BasicProperties.ahk
#Include ..\Foundation\DateTime.ahk
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
 * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitem
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IStorageItem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageItem
     * @type {Guid}
     */
    static IID => Guid("{4207a996-ca2f-42f7-bde8-8b10457a7f30}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RenameAsyncOverloadDefaultOptions", "RenameAsync1", "DeleteAsyncOverloadDefaultOptions", "DeleteAsync1", "GetBasicPropertiesAsync", "get_Name", "get_Path", "get_Attributes", "get_DateCreated", "IsOfType"]

    /**
     * Gets the name of the item including the file name extension if there is one.
     * @remarks
     * If the item is a file, this name includes the file name extension.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitem.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * Gets the full file-system path of the item, if the item has a path.
     * @remarks
     * Do not rely on this property to access an item because some items may not have file-system paths. For example if the item is backed by a URI, or was picked using the file picker, the item is not guaranteed to have a file-system path.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitem.path
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * Gets the attributes of a storage item.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitem.attributes
     * @type {Integer} 
     */
    Attributes {
        get => this.get_Attributes()
    }

    /**
     * Gets the date and time when the current item was created.
     * @remarks
     * - **DateTime**: If the date property isn't set, this value defaults to 0 which can be translated into misleading dates in different programming languages. Microsoft .NET languages do not use this type directly. In .NET it is projected as a `System.DateTimeOffset`. Each language transparently handles the conversion to the granularity and date ranges for the respective language.
     * 
     * - **DateTimeOffset**: Because the .NET `DateTimeOffset` is a structure, a `DateTimeOffset` object that has been declared but not otherwise initialized contains the default values for each of its member fields. This means that its `DateTime` property is set to `DateTimeOffset.MinValue` and its `Offset` property is set to `TimeSpan.Zero`. In string format, the `DateTimeOffset` that a file was created might be "4/18/2020 3:13:50 PM".
     * 
     * You should always check that this property is a real value and is not set to the default value.
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitem.datecreated
     * @type {DateTime} 
     */
    DateCreated {
        get => this.get_DateCreated()
    }

    /**
     * Renames the current item. This method also specifies what to do if an existing item in the current item's location has the same name.
     * @param {HSTRING} desiredName The desired, new name of the current item.
     * 
     * If there is an existing item in the current item's location that already has the specified *desiredName*, the specified [NameCollisionOption](namecollisionoption.md) determines how Windows responds to the conflict.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitem.renameasync
     */
    RenameAsyncOverloadDefaultOptions(desiredName) {
        if(desiredName is String) {
            pin := HSTRING.Create(desiredName)
            desiredName := pin.Value
        }
        desiredName := desiredName is Win32Handle ? NumGet(desiredName, "ptr") : desiredName

        result := ComCall(6, this, "ptr", desiredName, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * Renames the current item.
     * @remarks
     * For this method and its overload, if the name you specify is invalid, this method throws an exception. To handle all the ways the specified name could be invalid, you must catch all four of these exceptions:<table>
     *    <tr><td>E_INVALIDARG</td></tr>
     *    <tr><td>E_FAIL</td></tr>
     *    <tr><td>ERROR_FILENAME_EXCED_RANGE</td></tr>
     *    <tr><td>ERROR_INVALID_NAME</td></tr>
     * </table>
     * 
     * If the file is deleted before the rename finishes, this method throws the ERROR_FILE_NOT_FOUND exception. You must also catch and handle this exception when you use this method.
     * @param {HSTRING} desiredName The desired, new name of the item.
     * @param {Integer} option 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitem.renameasync
     */
    RenameAsync1(desiredName, option) {
        if(desiredName is String) {
            pin := HSTRING.Create(desiredName)
            desiredName := pin.Value
        }
        desiredName := desiredName is Win32Handle ? NumGet(desiredName, "ptr") : desiredName

        result := ComCall(7, this, "ptr", desiredName, "int", option, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * Deletes the current item, optionally deleting it permanently.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitem.deleteasync
     */
    DeleteAsyncOverloadDefaultOptions() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * Deletes the current item.
     * @remarks
     * This method uses [StorageDeleteOption.default](storagedeleteoption.md) to determine whether the item is deleted permanently.
     * @param {Integer} option 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitem.deleteasync
     */
    DeleteAsync1(option) {
        result := ComCall(9, this, "int", option, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * Gets the basic properties of the current item (like a file or folder).
     * @returns {IAsyncOperation<BasicProperties>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitem.getbasicpropertiesasync
     */
    GetBasicPropertiesAsync() {
        result := ComCall(10, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(BasicProperties, operation)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Path() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Attributes() {
        result := ComCall(13, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_DateCreated() {
        value := DateTime()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Determines whether the current [IStorageItem](istorageitem.md) matches the specified [StorageItemTypes](storageitemtypes.md) value.
     * @param {Integer} type The value to match against.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.istorageitem.isoftype
     */
    IsOfType(type) {
        result := ComCall(15, this, "uint", type, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
