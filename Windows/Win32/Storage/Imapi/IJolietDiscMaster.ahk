#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\IStorage.ahk" { IStorage }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\StructuredStorage\IPropertyStorage.ahk" { IPropertyStorage }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IJolietDiscMaster interface enables the staging of a CD data disc.
 * @see https://learn.microsoft.com/windows/win32/api/imapi/nn-imapi-ijolietdiscmaster
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IJolietDiscMaster extends IUnknown {
    /**
     * The interface identifier for IJolietDiscMaster
     * @type {Guid}
     */
    static IID := Guid("{e3bc42ce-4e5c-11d3-9144-00104ba11c5e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IJolietDiscMaster interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTotalDataBlocks  : IntPtr
        GetUsedDataBlocks   : IntPtr
        GetDataBlockSize    : IntPtr
        AddData             : IntPtr
        GetJolietProperties : IntPtr
        SetJolietProperties : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IJolietDiscMaster.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the total number of blocks available for staging a Joliet data disc.
     * @returns {Integer} Total number of data blocks available on a disc.
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-ijolietdiscmaster-gettotaldatablocks
     */
    GetTotalDataBlocks() {
        result := ComCall(3, this, "int*", &pnBlocks := 0, "HRESULT")
        return pnBlocks
    }

    /**
     * Retrieves the total number of data blocks that are in use.
     * @returns {Integer} Total number of data blocks in use in the staged image.
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-ijolietdiscmaster-getuseddatablocks
     */
    GetUsedDataBlocks() {
        result := ComCall(4, this, "int*", &pnBlocks := 0, "HRESULT")
        return pnBlocks
    }

    /**
     * Retrieves the size of a data block.
     * @remarks
     * This method returns 2048.
     * @returns {Integer} Total size of a single data block, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-ijolietdiscmaster-getdatablocksize
     */
    GetDataBlockSize() {
        result := ComCall(5, this, "int*", &pnBlockBytes := 0, "HRESULT")
        return pnBlockBytes
    }

    /**
     * Adds the contents of a root storage to the staged image file. This storage will be enumerated to place all substorages and streams in the root file system of the stage image file. Substorages become folders and streams become files.
     * @remarks
     * When you repeat an 
     * <b>AddData</b> operation, folders with duplicate files cause a test of  <i>lFileOverwrite</i>. If the flag is nonzero, the file is overwritten. Earlier files with conflicting names are still written to disc from the image file. If <i>lFileOverwrite</i> is zero and a file with the same name exists, 
     * <b>AddData</b> fails with IMAPI_E_FILEEXISTS.
     * 
     * While 
     * <b>AddData</b> can be called multiple times after calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-idiscmaster-setactivediscrecorder">IDiscMaster::SetActiveDiscRecorder</a>, 
     * <b>SetActiveDiscRecorder</b> must be called any time a new image is started, and immediately before the first 
     * <b>AddData</b> call, regardless of whether the burner is the same one used in the previous image creation.
     * 
     * If a call to this method would overrun the number of available data blocks, the method returns IMAPI_E_DISCFULL and ignores all data that was to be added. This ensures that the final Joliet file system is not corrupted.
     * @param {IStorage} pStorage Path to the storage whose subitems are to be added to the root of the staged image file.
     * @param {Integer} lFileOverwrite If this parameter is nonzero, overwrite existing files with the same name. Otherwise, the last file added appears in the directory.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-ijolietdiscmaster-adddata
     */
    AddData(pStorage, lFileOverwrite) {
        result := ComCall(6, this, "ptr", pStorage, "int", lFileOverwrite, "HRESULT")
        return result
    }

    /**
     * Retrieves a pointer to an IPropertyStorage interface that contains the Joliet properties.
     * @remarks
     * Properties are not retained after IMAPI is closed. A property set is convenient for IMAPI because it stores an ID/TYPE/VALUE combination, as well as ID/NAME associations. Each combination is a single property, and IMAPI uses these properties as values that are unique to the Joliet interface. For example, the Joliet interface supports a VolumeName property.
     * 
     * The caller can modify these properties by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-ijolietdiscmaster-setjolietproperties">SetJolietProperties</a>. Current properties include the following.
     * @returns {IPropertyStorage} Address of a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a> interface for the Joliet property set with all current properties defined.
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-ijolietdiscmaster-getjolietproperties
     */
    GetJolietProperties() {
        result := ComCall(7, this, "ptr*", &ppPropStg := 0, "HRESULT")
        return IPropertyStorage(ppPropStg)
    }

    /**
     * Sets the Joliet properties.
     * @remarks
     * Applications should query for a property set using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-ijolietdiscmaster-getjolietproperties">GetJolietProperties</a>, modify only those settings of interest, and then call 
     * <b>SetJolietProperties</b> to change all values simultaneously.
     * 
     * Some properties are read-only. Both read-only properties and unsupported properties are ignored without generating an error (see IMAPI_S_PROPERTIESIGNORED). For example, someone could submit a property set to this interface and attempt to change the ClearlyNeverHeardOfBefore property. Because ClearlyNeverHeardOfBefore is an unknown value, the property is ignored and the method succeeds.
     * 
     * After calling 
     * <b>SetJolietProperties</b>, an application should verify property settings by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/imapi/nf-imapi-ijolietdiscmaster-getjolietproperties">GetJolietProperties</a>.
     * @param {IPropertyStorage} pPropStg Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a> interface that the Joliet interface can use to retrieve new settings on various properties.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-ijolietdiscmaster-setjolietproperties
     */
    SetJolietProperties(pPropStg) {
        result := ComCall(8, this, "ptr", pPropStg, "HRESULT")
        return result
    }

    Query(iid) {
        if (IJolietDiscMaster.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTotalDataBlocks := CallbackCreate(GetMethod(implObj, "GetTotalDataBlocks"), flags, 2)
        this.vtbl.GetUsedDataBlocks := CallbackCreate(GetMethod(implObj, "GetUsedDataBlocks"), flags, 2)
        this.vtbl.GetDataBlockSize := CallbackCreate(GetMethod(implObj, "GetDataBlockSize"), flags, 2)
        this.vtbl.AddData := CallbackCreate(GetMethod(implObj, "AddData"), flags, 3)
        this.vtbl.GetJolietProperties := CallbackCreate(GetMethod(implObj, "GetJolietProperties"), flags, 2)
        this.vtbl.SetJolietProperties := CallbackCreate(GetMethod(implObj, "SetJolietProperties"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTotalDataBlocks)
        CallbackFree(this.vtbl.GetUsedDataBlocks)
        CallbackFree(this.vtbl.GetDataBlockSize)
        CallbackFree(this.vtbl.AddData)
        CallbackFree(this.vtbl.GetJolietProperties)
        CallbackFree(this.vtbl.SetJolietProperties)
    }
}
