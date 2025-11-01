#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<VARIANT>} pvActiveQueues 
     * @returns {HRESULT} 
     */
    get_ActiveQueues(pvActiveQueues) {
        result := ComCall(15, this, "ptr", pvActiveQueues, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvPrivateQueues 
     * @returns {HRESULT} 
     */
    get_PrivateQueues(pvPrivateQueues) {
        result := ComCall(16, this, "ptr", pvPrivateQueues, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDirectoryServiceServer 
     * @returns {HRESULT} 
     */
    get_DirectoryServiceServer(pbstrDirectoryServiceServer) {
        result := ComCall(17, this, "ptr", pbstrDirectoryServiceServer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfIsConnected 
     * @returns {HRESULT} 
     */
    get_IsConnected(pfIsConnected) {
        result := ComCall(18, this, "ptr", pfIsConnected, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvBytesInAllQueues 
     * @returns {HRESULT} 
     */
    get_BytesInAllQueues(pvBytesInAllQueues) {
        result := ComCall(19, this, "ptr", pvBytesInAllQueues, "HRESULT")
        return result
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
     * @param {Pointer<BSTR>} pbstrMachine 
     * @returns {HRESULT} 
     */
    get_Machine(pbstrMachine) {
        result := ComCall(21, this, "ptr", pbstrMachine, "HRESULT")
        return result
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
