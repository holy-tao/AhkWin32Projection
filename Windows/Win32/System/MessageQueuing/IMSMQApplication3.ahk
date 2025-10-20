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
     * 
     * @param {Pointer<VARIANT>} pvActiveQueues 
     * @returns {HRESULT} 
     */
    get_ActiveQueues(pvActiveQueues) {
        result := ComCall(15, this, "ptr", pvActiveQueues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvPrivateQueues 
     * @returns {HRESULT} 
     */
    get_PrivateQueues(pvPrivateQueues) {
        result := ComCall(16, this, "ptr", pvPrivateQueues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDirectoryServiceServer 
     * @returns {HRESULT} 
     */
    get_DirectoryServiceServer(pbstrDirectoryServiceServer) {
        result := ComCall(17, this, "ptr", pbstrDirectoryServiceServer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfIsConnected 
     * @returns {HRESULT} 
     */
    get_IsConnected(pfIsConnected) {
        result := ComCall(18, this, "ptr", pfIsConnected, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pvBytesInAllQueues 
     * @returns {HRESULT} 
     */
    get_BytesInAllQueues(pvBytesInAllQueues) {
        result := ComCall(19, this, "ptr", pvBytesInAllQueues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrMachine 
     * @returns {HRESULT} 
     */
    put_Machine(bstrMachine) {
        bstrMachine := bstrMachine is String ? BSTR.Alloc(bstrMachine).Value : bstrMachine

        result := ComCall(20, this, "ptr", bstrMachine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMachine 
     * @returns {HRESULT} 
     */
    get_Machine(pbstrMachine) {
        result := ComCall(21, this, "ptr", pbstrMachine, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Connect() {
        result := ComCall(22, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Disconnect() {
        result := ComCall(23, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Tidy() {
        result := ComCall(24, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
