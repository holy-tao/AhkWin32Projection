#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IJolietDiscMaster interface enables the staging of a CD data disc.
 * @see https://docs.microsoft.com/windows/win32/api//imapi/nn-imapi-ijolietdiscmaster
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IJolietDiscMaster extends IUnknown{
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
     * 
     * @param {Pointer<Int32>} pnBlocks 
     * @returns {HRESULT} 
     */
    GetTotalDataBlocks(pnBlocks) {
        result := ComCall(3, this, "int*", pnBlocks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnBlocks 
     * @returns {HRESULT} 
     */
    GetUsedDataBlocks(pnBlocks) {
        result := ComCall(4, this, "int*", pnBlocks, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pnBlockBytes 
     * @returns {HRESULT} 
     */
    GetDataBlockSize(pnBlockBytes) {
        result := ComCall(5, this, "int*", pnBlockBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStorage>} pStorage 
     * @param {Integer} lFileOverwrite 
     * @returns {HRESULT} 
     */
    AddData(pStorage, lFileOverwrite) {
        result := ComCall(6, this, "ptr", pStorage, "int", lFileOverwrite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyStorage>} ppPropStg 
     * @returns {HRESULT} 
     */
    GetJolietProperties(ppPropStg) {
        result := ComCall(7, this, "ptr", ppPropStg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyStorage>} pPropStg 
     * @returns {HRESULT} 
     */
    SetJolietProperties(pPropStg) {
        result := ComCall(8, this, "ptr", pPropStg, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
