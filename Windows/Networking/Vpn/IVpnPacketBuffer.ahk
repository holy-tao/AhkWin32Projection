#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Storage\Streams\WinRTBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * This interface is reserved for system use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.vpn.ivpnpacketbufferfactory
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnPacketBuffer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnPacketBuffer
     * @type {Guid}
     */
    static IID => Guid("{c2f891fc-4d5c-4a63-b70d-4e307eacce55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Buffer", "put_Status", "get_Status", "put_TransportAffinity", "get_TransportAffinity"]

    /**
     * @type {WinRTBuffer} 
     */
    Buffer {
        get => this.get_Buffer()
    }

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
        set => this.put_Status(value)
    }

    /**
     * @type {Integer} 
     */
    TransportAffinity {
        get => this.get_TransportAffinity()
        set => this.put_TransportAffinity(value)
    }

    /**
     * 
     * @returns {WinRTBuffer} 
     */
    get_Buffer() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Buffer(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Status(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_TransportAffinity(value) {
        result := ComCall(9, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TransportAffinity() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
