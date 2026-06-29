#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

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
 * @see https://learn.microsoft.com/windows/win32/api/storageprovider/nn-storageprovider-istorageproviderpropertyhandler
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IStorageProviderPropertyHandler extends IUnknown {
    /**
     * The interface identifier for IStorageProviderPropertyHandler
     * @type {Guid}
     */
    static IID := Guid("{301dfbe5-524c-4b0f-8b2d-21c40b3a2988}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStorageProviderPropertyHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RetrieveProperties : IntPtr
        SaveProperties     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStorageProviderPropertyHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the properties managed by the sync engine.
     * @remarks
     * If the file or folder cannot be found, this method should return <b>S_OK</b>, but <i>retrievedProperties</i> should be empty.
     * 
     * Any properties that are not managed by the sync engine should return <b>VT_EMPTY</b> for those properties.
     * @param {Pointer<PROPERTYKEY>} propertiesToRetrieve The identifier for the properties to retrieve.
     * @param {Integer} propertiesToRetrieveCount The number of properties to retrieve.
     * @returns {IPropertyStore} A collection of properties.
     * @see https://learn.microsoft.com/windows/win32/api/storageprovider/nf-storageprovider-istorageproviderpropertyhandler-retrieveproperties
     */
    RetrieveProperties(propertiesToRetrieve, propertiesToRetrieveCount) {
        result := ComCall(3, this, PROPERTYKEY.Ptr, propertiesToRetrieve, "uint", propertiesToRetrieveCount, "ptr*", &retrievedProperties := 0, "HRESULT")
        return IPropertyStore(retrievedProperties)
    }

    /**
     * Saves properties associated with a file or folder.
     * @remarks
     * Attempting to save properties that are not managed by the sync engine should result in the error code <b>E_INVALIDARG</b>.
     * @param {IPropertyStore} propertiesToSave The properties to save.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/storageprovider/nf-storageprovider-istorageproviderpropertyhandler-saveproperties
     */
    SaveProperties(propertiesToSave) {
        result := ComCall(4, this, "ptr", propertiesToSave, "HRESULT")
        return result
    }

    Query(iid) {
        if (IStorageProviderPropertyHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RetrieveProperties := CallbackCreate(GetMethod(implObj, "RetrieveProperties"), flags, 4)
        this.vtbl.SaveProperties := CallbackCreate(GetMethod(implObj, "SaveProperties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RetrieveProperties)
        CallbackFree(this.vtbl.SaveProperties)
    }
}
