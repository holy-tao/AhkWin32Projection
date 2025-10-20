#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class IPMTilePropertyEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPMTilePropertyEnumerator
     * @type {Guid}
     */
    static IID => Guid("{cc4cd629-9047-4250-aac8-930e47812421}")

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
     * @param {Pointer<IPMTilePropertyInfo>} ppPropInfo 
     * @returns {HRESULT} 
     */
    get_Next(ppPropInfo) {
        result := ComCall(3, this, "ptr*", ppPropInfo, "HRESULT")
        return result
    }
}
