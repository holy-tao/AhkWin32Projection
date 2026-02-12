#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class INetworkItem extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkItem
     * @type {Guid}
     */
    static IID => Guid("{01bc4d39-f5e0-4567-a28c-42080c831b2b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NetworkId", "GetNetworkTypes"]

    /**
     * @type {Guid} 
     */
    NetworkId {
        get => this.get_NetworkId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_NetworkId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetNetworkTypes() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
