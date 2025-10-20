#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a collection of properties associated with a file or folder.
 * @remarks
 * 
  * <div class="alert"><b>Caution</b>  <p class="note">You should only implement this interface if you have a specific need to do so.  
  * 
  * </div>
  * <div> </div>
  * This interface can be implemented by a cloud storage provider sync engine to share properties about a file or file folder. An instance of <b>IStorageProviderPropertyHandler</b> exists for the lifetime of a storage file created under a sync root. Use <a href="https://docs.microsoft.com/windows/desktop/api/storageprovider/nn-storageprovider-istorageproviderhandler">IStorageProviderHandler</a> to retrieve the set of properties associated with an individual file or folder.
  * 
  * This interface is responsible for keeping track of the following properties:
  * 
  * <ul>
  * <li>StorageProviderFileIdentifier</li>
  * <li>StorageProviderFileRemoteUri</li>
  * <li>StorageProviderFileChecksum</li>
  * <li>StorageProviderFileVersionWaterline</li>
  * </ul>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//storageprovider/nn-storageprovider-istorageproviderpropertyhandler
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IStorageProviderPropertyHandler extends IUnknown{
    /**
     * The interface identifier for IStorageProviderPropertyHandler
     * @type {Guid}
     */
    static IID => Guid("{301dfbe5-524c-4b0f-8b2d-21c40b3a2988}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} propertiesToRetrieve 
     * @param {Integer} propertiesToRetrieveCount 
     * @param {Pointer<IPropertyStore>} retrievedProperties 
     * @returns {HRESULT} 
     */
    RetrieveProperties(propertiesToRetrieve, propertiesToRetrieveCount, retrievedProperties) {
        result := ComCall(3, this, "ptr", propertiesToRetrieve, "uint", propertiesToRetrieveCount, "ptr", retrievedProperties, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyStore>} propertiesToSave 
     * @returns {HRESULT} 
     */
    SaveProperties(propertiesToSave) {
        result := ComCall(4, this, "ptr", propertiesToSave, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
