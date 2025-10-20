#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMTileInfoEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMTileInfoEnumerator
     * @type {Guid}
     */
    static IID => Guid("{ded83065-e462-4b2c-acb5-e39cea61c874}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Next"]

    /**
     * 
     * @param {Pointer<IPMTileInfo>} ppTileInfo 
     * @returns {HRESULT} 
     */
    get_Next(ppTileInfo) {
        result := ComCall(3, this, "ptr*", ppTileInfo, "HRESULT")
        return result
    }
}
