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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-ijolietdiscmaster-gettotaldatablocks
     */
    GetTotalDataBlocks() {
        result := ComCall(3, this, "int*", &pnBlocks := 0, "HRESULT")
        return pnBlocks
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-ijolietdiscmaster-getuseddatablocks
     */
    GetUsedDataBlocks() {
        result := ComCall(4, this, "int*", &pnBlocks := 0, "HRESULT")
        return pnBlocks
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-ijolietdiscmaster-getdatablocksize
     */
    GetDataBlockSize() {
        result := ComCall(5, this, "int*", &pnBlockBytes := 0, "HRESULT")
        return pnBlockBytes
    }

    /**
     * 
     * @param {IStorage} pStorage 
     * @param {Integer} lFileOverwrite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-ijolietdiscmaster-adddata
     */
    AddData(pStorage, lFileOverwrite) {
        result := ComCall(6, this, "ptr", pStorage, "int", lFileOverwrite, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IPropertyStorage} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-ijolietdiscmaster-getjolietproperties
     */
    GetJolietProperties() {
        result := ComCall(7, this, "ptr*", &ppPropStg := 0, "HRESULT")
        return IPropertyStorage(ppPropStg)
    }

    /**
     * 
     * @param {IPropertyStorage} pPropStg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi/nf-imapi-ijolietdiscmaster-setjolietproperties
     */
    SetJolietProperties(pPropStg) {
        result := ComCall(8, this, "ptr", pPropStg, "HRESULT")
        return result
    }
}
