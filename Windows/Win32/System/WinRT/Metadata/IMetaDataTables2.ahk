#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMetaDataTables.ahk

/**
 * Extends IMetaDataTables to include methods for working with metadata streams.
 * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nn-rometadataapi-imetadatatables2
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class IMetaDataTables2 extends IMetaDataTables{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMetaDataTables2
     * @type {Guid}
     */
    static IID => Guid("{badb5f70-58da-43a9-a1c6-d74819f19b15}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMetaDataStorage", "GetMetaDataStreamInfo"]

    /**
     * 
     * @param {Pointer<Pointer<Void>>} ppvMd 
     * @param {Pointer<Integer>} pcbMd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables2-getmetadatastorage
     */
    GetMetaDataStorage(ppvMd, pcbMd) {
        pcbMdMarshal := pcbMd is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, "ptr*", ppvMd, pcbMdMarshal, pcbMd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ix 
     * @param {Pointer<Pointer<Integer>>} ppchName 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @param {Pointer<Integer>} pcb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rometadataapi/nf-rometadataapi-imetadatatables2-getmetadatastreaminfo
     */
    GetMetaDataStreamInfo(ix, ppchName, ppv, pcb) {
        pcbMarshal := pcb is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "uint", ix, "ptr*", ppchName, "ptr*", ppv, pcbMarshal, pcb, "HRESULT")
        return result
    }
}
