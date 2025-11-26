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
     * Gets the size and contents of the metadata stored in the specified section.
     * @param {Pointer<Pointer<Void>>} ppvMd A pointer to a metadata section.
     * @param {Pointer<Integer>} pcbMd The size of the metadata stream.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables2-getmetadatastorage
     */
    GetMetaDataStorage(ppvMd, pcbMd) {
        ppvMdMarshal := ppvMd is VarRef ? "ptr*" : "ptr"
        pcbMdMarshal := pcbMd is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, ppvMdMarshal, ppvMd, pcbMdMarshal, pcbMd, "HRESULT")
        return result
    }

    /**
     * Gets the name, size, and contents of the metadata stream at the specified index.
     * @param {Integer} ix The index of the requested metadata stream.
     * @param {Pointer<Pointer<Integer>>} ppchName A pointer to the name of the stream.
     * @param {Pointer<Pointer<Void>>} ppv A pointer to the metadata stream.
     * @param {Pointer<Integer>} pcb The size, in bytes, of <i>ppv</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//rometadataapi/nf-rometadataapi-imetadatatables2-getmetadatastreaminfo
     */
    GetMetaDataStreamInfo(ix, ppchName, ppv, pcb) {
        ppchNameMarshal := ppchName is VarRef ? "ptr*" : "ptr"
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"
        pcbMarshal := pcb is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, "uint", ix, ppchNameMarshal, ppchName, ppvMarshal, ppv, pcbMarshal, pcb, "HRESULT")
        return result
    }
}
