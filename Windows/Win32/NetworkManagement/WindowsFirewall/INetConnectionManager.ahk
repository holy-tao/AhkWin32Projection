#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetConnectionManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetConnectionManager
     * @type {Guid}
     */
    static IID => Guid("{c08956a2-1cd3-11d1-b1c5-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumConnections"]

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<IEnumNetConnection>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumConnections(Flags, ppEnum) {
        result := ComCall(3, this, "int", Flags, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
