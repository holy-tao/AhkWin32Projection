#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IMap.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Saves and retrieves the properties of a storage item.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.istorageitemextraproperties
 * @namespace Windows.Storage.FileProperties
 * @version WindowsRuntime 1.4
 */
class IStorageItemExtraProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageItemExtraProperties
     * @type {Guid}
     */
    static IID => Guid("{c54361b2-54cd-432b-bdbc-4b19c4b470d7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RetrievePropertiesAsync", "SavePropertiesAsync", "SavePropertiesAsyncOverloadDefault"]

    /**
     * Retrieves the specified properties associated with the item.
     * @param {IIterable<HSTRING>} propertiesToRetrieve A collection that contains the names of the properties to retrieve. Pass null to retrieve all possible properties.
     * @returns {IAsyncOperation<IMap<HSTRING, IInspectable>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.istorageitemextraproperties.retrievepropertiesasync
     */
    RetrievePropertiesAsync(propertiesToRetrieve) {
        result := ComCall(6, this, "ptr", propertiesToRetrieve, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IMap.Call.Bind(IMap, (ptr) => HSTRING({ Value: ptr }), IInspectable), operation)
    }

    /**
     * Saves all properties associated with the item.
     * @remarks
     * If any one of the property values is invalid, none of the values will be saved.
     * @param {IIterable<IKeyValuePair<HSTRING, IInspectable>>} propertiesToSave 
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.istorageitemextraproperties.savepropertiesasync
     */
    SavePropertiesAsync(propertiesToSave) {
        result := ComCall(7, this, "ptr", propertiesToSave, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }

    /**
     * Saves the specified properties and values associated with the item.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.storage.fileproperties.istorageitemextraproperties.savepropertiesasync
     */
    SavePropertiesAsyncOverloadDefault() {
        result := ComCall(8, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(operation)
    }
}
