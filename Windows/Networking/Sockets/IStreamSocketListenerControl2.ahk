#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IStreamSocketListenerControl2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamSocketListenerControl2
     * @type {Guid}
     */
    static IID => Guid("{948bb665-2c3e-404b-b8b0-8eb249a2b0a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NoDelay", "put_NoDelay", "get_KeepAlive", "put_KeepAlive", "get_OutboundBufferSizeInBytes", "put_OutboundBufferSizeInBytes", "get_OutboundUnicastHopLimit", "put_OutboundUnicastHopLimit"]

    /**
     * @type {Boolean} 
     */
    NoDelay {
        get => this.get_NoDelay()
        set => this.put_NoDelay(value)
    }

    /**
     * @type {Boolean} 
     */
    KeepAlive {
        get => this.get_KeepAlive()
        set => this.put_KeepAlive(value)
    }

    /**
     * @type {Integer} 
     */
    OutboundBufferSizeInBytes {
        get => this.get_OutboundBufferSizeInBytes()
        set => this.put_OutboundBufferSizeInBytes(value)
    }

    /**
     * @type {Integer} 
     */
    OutboundUnicastHopLimit {
        get => this.get_OutboundUnicastHopLimit()
        set => this.put_OutboundUnicastHopLimit(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_NoDelay() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_NoDelay(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_KeepAlive() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_KeepAlive(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OutboundBufferSizeInBytes() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
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
    put_OutboundBufferSizeInBytes(value) {
        result := ComCall(11, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OutboundUnicastHopLimit() {
        result := ComCall(12, this, "char*", &value := 0, "int")
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
    put_OutboundUnicastHopLimit(value) {
        result := ComCall(13, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
