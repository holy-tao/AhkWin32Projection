#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to perform operations specific to the software provider.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsswprovider
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsSwProvider extends IUnknown{
    /**
     * The interface identifier for IVdsSwProvider
     * @type {Guid}
     */
    static IID => Guid("{9aa58360-ce33-4f92-b658-ed24b14425b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IEnumVdsObject>} ppEnum 
     * @returns {HRESULT} 
     */
    QueryPacks(ppEnum) {
        result := ComCall(3, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IVdsPack>} ppPack 
     * @returns {HRESULT} 
     */
    CreatePack(ppPack) {
        result := ComCall(4, this, "ptr", ppPack, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
