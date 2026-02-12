#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\NetworkItem.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ConnectionProfile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class INetworkAdapter extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkAdapter
     * @type {Guid}
     */
    static IID => Guid("{3b542e03-5388-496c-a8a3-affd39aec2e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OutboundMaxBitsPerSecond", "get_InboundMaxBitsPerSecond", "get_IanaInterfaceType", "get_NetworkItem", "get_NetworkAdapterId", "GetConnectedProfileAsync"]

    /**
     * @type {Integer} 
     */
    OutboundMaxBitsPerSecond {
        get => this.get_OutboundMaxBitsPerSecond()
    }

    /**
     * @type {Integer} 
     */
    InboundMaxBitsPerSecond {
        get => this.get_InboundMaxBitsPerSecond()
    }

    /**
     * @type {Integer} 
     */
    IanaInterfaceType {
        get => this.get_IanaInterfaceType()
    }

    /**
     * @type {NetworkItem} 
     */
    NetworkItem {
        get => this.get_NetworkItem()
    }

    /**
     * @type {Guid} 
     */
    NetworkAdapterId {
        get => this.get_NetworkAdapterId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OutboundMaxBitsPerSecond() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InboundMaxBitsPerSecond() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IanaInterfaceType() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {NetworkItem} 
     */
    get_NetworkItem() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return NetworkItem(value)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_NetworkAdapterId() {
        value := Guid()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<ConnectionProfile>} 
     */
    GetConnectedProfileAsync() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ConnectionProfile, value)
    }
}
