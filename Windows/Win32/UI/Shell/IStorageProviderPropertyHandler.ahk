#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include PropertiesSystem\IPropertyStore.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a collection of properties associated with a file or folder.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api//content/storageprovider/nn-storageprovider-istorageproviderpropertyhandler
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IStorageProviderPropertyHandler extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RetrieveProperties", "SaveProperties"]

    /**
     * Gets the properties managed by the sync engine.
     * @remarks
     * If the file or folder cannot be found, this method should return <b>S_OK</b>, but <i>retrievedProperties</i> should be empty.
     * 
     * Any properties that are not managed by the sync engine should return <b>VT_EMPTY</b> for those properties.
     * @param {Pointer<PROPERTYKEY>} propertiesToRetrieve The identifier for the properties to retrieve.
     * @param {Integer} propertiesToRetrieveCount The number of properties to retrieve.
     * @returns {IPropertyStore} A collection of properties.
     * @see https://learn.microsoft.com/windows/win32/api//content/storageprovider/nf-storageprovider-istorageproviderpropertyhandler-retrieveproperties
     */
    RetrieveProperties(propertiesToRetrieve, propertiesToRetrieveCount) {
        result := ComCall(3, this, "ptr", propertiesToRetrieve, "uint", propertiesToRetrieveCount, "ptr*", &retrievedProperties := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertyStore(retrievedProperties)
    }

    /**
     * Saves properties associated with a file or folder.
     * @remarks
     * Attempting to save properties that are not managed by the sync engine should result in the error code <b>E_INVALIDARG</b>.
     * @param {IPropertyStore} propertiesToSave The properties to save.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/storageprovider/nf-storageprovider-istorageproviderpropertyhandler-saveproperties
     */
    SaveProperties(propertiesToSave) {
        result := ComCall(4, this, "ptr", propertiesToSave, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
