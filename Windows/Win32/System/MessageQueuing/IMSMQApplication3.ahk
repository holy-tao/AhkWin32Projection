#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\IMSMQApplication2.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQApplication3 extends IMSMQApplication2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQApplication3
     * @type {Guid}
     */
    static IID => Guid("{eba96b1f-2168-11d3-898c-00e02c074f6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ActiveQueues", "get_PrivateQueues", "get_DirectoryServiceServer", "get_IsConnected", "get_BytesInAllQueues", "put_Machine", "get_Machine", "Connect", "Disconnect", "Tidy"]

    /**
     * @type {VARIANT} 
     */
    ActiveQueues {
        get => this.get_ActiveQueues()
    }

    /**
     * @type {VARIANT} 
     */
    PrivateQueues {
        get => this.get_PrivateQueues()
    }

    /**
     * @type {BSTR} 
     */
    DirectoryServiceServer {
        get => this.get_DirectoryServiceServer()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IsConnected {
        get => this.get_IsConnected()
    }

    /**
     * @type {VARIANT} 
     */
    BytesInAllQueues {
        get => this.get_BytesInAllQueues()
    }

    /**
     * @type {BSTR} 
     */
    Machine {
        get => this.get_Machine()
        set => this.put_Machine(value)
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_ActiveQueues() {
        pvActiveQueues := VARIANT()
        result := ComCall(15, this, "ptr", pvActiveQueues, "HRESULT")
        return pvActiveQueues
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_PrivateQueues() {
        pvPrivateQueues := VARIANT()
        result := ComCall(16, this, "ptr", pvPrivateQueues, "HRESULT")
        return pvPrivateQueues
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DirectoryServiceServer() {
        pbstrDirectoryServiceServer := BSTR()
        result := ComCall(17, this, "ptr", pbstrDirectoryServiceServer, "HRESULT")
        return pbstrDirectoryServiceServer
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_IsConnected() {
        result := ComCall(18, this, "short*", &pfIsConnected := 0, "HRESULT")
        return pfIsConnected
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_BytesInAllQueues() {
        pvBytesInAllQueues := VARIANT()
        result := ComCall(19, this, "ptr", pvBytesInAllQueues, "HRESULT")
        return pvBytesInAllQueues
    }

    /**
     * 
     * @param {BSTR} bstrMachine 
     * @returns {HRESULT} 
     */
    put_Machine(bstrMachine) {
        bstrMachine := bstrMachine is String ? BSTR.Alloc(bstrMachine).Value : bstrMachine

        result := ComCall(20, this, "ptr", bstrMachine, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Machine() {
        pbstrMachine := BSTR()
        result := ComCall(21, this, "ptr", pbstrMachine, "HRESULT")
        return pbstrMachine
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Connect() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Disconnect() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Tidy() {
        result := ComCall(24, this, "HRESULT")
        return result
    }
}
