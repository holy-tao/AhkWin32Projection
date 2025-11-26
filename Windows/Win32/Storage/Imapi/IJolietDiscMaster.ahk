#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\IPropertyStorage.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IJolietDiscMaster interface enables the staging of a CD data disc.
 * @see https://docs.microsoft.com/windows/win32/api//imapi/nn-imapi-ijolietdiscmaster
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IJolietDiscMaster extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IJolietDiscMaster
     * @type {Guid}
     */
    static IID => Guid("{e3bc42ce-4e5c-11d3-9144-00104ba11c5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTotalDataBlocks", "GetUsedDataBlocks", "GetDataBlockSize", "AddData", "GetJolietProperties", "SetJolietProperties"]

    /**
     * Retrieves the total number of blocks available for staging a Joliet data disc.
     * @returns {Integer} Total number of data blocks available on a disc.
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-ijolietdiscmaster-gettotaldatablocks
     */
    GetTotalDataBlocks() {
        result := ComCall(3, this, "int*", &pnBlocks := 0, "HRESULT")
        return pnBlocks
    }

    /**
     * Retrieves the total number of data blocks that are in use.
     * @returns {Integer} Total number of data blocks in use in the staged image.
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-ijolietdiscmaster-getuseddatablocks
     */
    GetUsedDataBlocks() {
        result := ComCall(4, this, "int*", &pnBlocks := 0, "HRESULT")
        return pnBlocks
    }

    /**
     * Retrieves the size of a data block.
     * @returns {Integer} Total size of a single data block, in bytes.
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-ijolietdiscmaster-getdatablocksize
     */
    GetDataBlockSize() {
        result := ComCall(5, this, "int*", &pnBlockBytes := 0, "HRESULT")
        return pnBlockBytes
    }

    /**
     * Adds the contents of a root storage to the staged image file. This storage will be enumerated to place all substorages and streams in the root file system of the stage image file. Substorages become folders and streams become files.
     * @param {IStorage} pStorage Path to the storage whose subitems are to be added to the root of the staged image file.
     * @param {Integer} lFileOverwrite If this parameter is nonzero, overwrite existing files with the same name. Otherwise, the last file added appears in the directory.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-ijolietdiscmaster-adddata
     */
    AddData(pStorage, lFileOverwrite) {
        result := ComCall(6, this, "ptr", pStorage, "int", lFileOverwrite, "HRESULT")
        return result
    }

    /**
     * Retrieves a pointer to an IPropertyStorage interface that contains the Joliet properties.
     * @returns {IPropertyStorage} Address of a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a> interface for the Joliet property set with all current properties defined.
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-ijolietdiscmaster-getjolietproperties
     */
    GetJolietProperties() {
        result := ComCall(7, this, "ptr*", &ppPropStg := 0, "HRESULT")
        return IPropertyStorage(ppPropStg)
    }

    /**
     * Sets the Joliet properties.
     * @param {IPropertyStorage} pPropStg Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nn-propidl-ipropertystorage">IPropertyStorage</a> interface that the Joliet interface can use to retrieve new settings on various properties.
     * @returns {HRESULT} S_OK is returned on success, but other success codes may be returned as a result of implementation. The following error codes are commonly returned on operation failure, but do not represent the only possible error values:
     * @see https://docs.microsoft.com/windows/win32/api//imapi/nf-imapi-ijolietdiscmaster-setjolietproperties
     */
    SetJolietProperties(pPropStg) {
        result := ComCall(8, this, "ptr", pPropStg, "HRESULT")
        return result
    }
}
