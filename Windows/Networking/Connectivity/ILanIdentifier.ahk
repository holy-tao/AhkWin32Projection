#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LanIdentifierData.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class ILanIdentifier extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILanIdentifier
     * @type {Guid}
     */
    static IID => Guid("{48aa53aa-1108-4546-a6cb-9a74da4b7ba0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InfrastructureId", "get_PortId", "get_NetworkAdapterId"]

    /**
     * @type {LanIdentifierData} 
     */
    InfrastructureId {
        get => this.get_InfrastructureId()
    }

    /**
     * @type {LanIdentifierData} 
     */
    PortId {
        get => this.get_PortId()
    }

    /**
     * @type {Guid} 
     */
    NetworkAdapterId {
        get => this.get_NetworkAdapterId()
    }

    /**
     * 
     * @returns {LanIdentifierData} 
     */
    get_InfrastructureId() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LanIdentifierData(value)
    }

    /**
     * 
     * @returns {LanIdentifierData} 
     */
    get_PortId() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LanIdentifierData(value)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_NetworkAdapterId() {
        value := Guid()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
