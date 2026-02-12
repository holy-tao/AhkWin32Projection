#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sms
 * @version WindowsRuntime 1.4
 */
class ISmsFilterRule extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISmsFilterRule
     * @type {Guid}
     */
    static IID => Guid("{40e32fae-b049-4fbc-afe9-e2a610eff55c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MessageType", "get_ImsiPrefixes", "get_DeviceIds", "get_SenderNumbers", "get_TextMessagePrefixes", "get_PortNumbers", "get_CellularClass", "put_CellularClass", "get_ProtocolIds", "get_TeleserviceIds", "get_WapApplicationIds", "get_WapContentTypes", "get_BroadcastTypes", "get_BroadcastChannels"]

    /**
     * @type {Integer} 
     */
    MessageType {
        get => this.get_MessageType()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    ImsiPrefixes {
        get => this.get_ImsiPrefixes()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    DeviceIds {
        get => this.get_DeviceIds()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    SenderNumbers {
        get => this.get_SenderNumbers()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    TextMessagePrefixes {
        get => this.get_TextMessagePrefixes()
    }

    /**
     * @type {IVector<Integer>} 
     */
    PortNumbers {
        get => this.get_PortNumbers()
    }

    /**
     * @type {Integer} 
     */
    CellularClass {
        get => this.get_CellularClass()
        set => this.put_CellularClass(value)
    }

    /**
     * @type {IVector<Integer>} 
     */
    ProtocolIds {
        get => this.get_ProtocolIds()
    }

    /**
     * @type {IVector<Integer>} 
     */
    TeleserviceIds {
        get => this.get_TeleserviceIds()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    WapApplicationIds {
        get => this.get_WapApplicationIds()
    }

    /**
     * @type {IVector<HSTRING>} 
     */
    WapContentTypes {
        get => this.get_WapContentTypes()
    }

    /**
     * @type {IVector<Integer>} 
     */
    BroadcastTypes {
        get => this.get_BroadcastTypes()
    }

    /**
     * @type {IVector<Integer>} 
     */
    BroadcastChannels {
        get => this.get_BroadcastChannels()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_ImsiPrefixes() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_DeviceIds() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_SenderNumbers() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_TextMessagePrefixes() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_PortNumbers() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CellularClass() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CellularClass(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_ProtocolIds() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_TeleserviceIds() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_WapApplicationIds() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_WapContentTypes() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_BroadcastTypes() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_BroadcastChannels() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }
}
