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
     * 
     * @param {Pointer<Void>} ppvMd 
     * @param {Pointer<UInt32>} pcbMd 
     * @returns {HRESULT} 
     */
    GetMetaDataStorage(ppvMd, pcbMd) {
        result := ComCall(22, this, "ptr", ppvMd, "uint*", pcbMd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ix 
     * @param {Pointer<SByte>} ppchName 
     * @param {Pointer<Void>} ppv 
     * @param {Pointer<UInt32>} pcb 
     * @returns {HRESULT} 
     */
    GetMetaDataStreamInfo(ix, ppchName, ppv, pcb) {
        result := ComCall(23, this, "uint", ix, "char*", ppchName, "ptr", ppv, "uint*", pcb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
