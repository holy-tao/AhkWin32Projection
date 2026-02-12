#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\HostName.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RoundTripTimeStatistics.ahk
#Include .\BandwidthStatistics.ahk
#Include ..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IStreamSocketInformation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamSocketInformation
     * @type {Guid}
     */
    static IID => Guid("{3b80ae30-5e68-4205-88f0-dc85d2e25ded}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_LocalAddress", "get_LocalPort", "get_RemoteHostName", "get_RemoteAddress", "get_RemoteServiceName", "get_RemotePort", "get_RoundTripTimeStatistics", "get_BandwidthStatistics", "get_ProtectionLevel", "get_SessionKey"]

    /**
     * @type {HostName} 
     */
    LocalAddress {
        get => this.get_LocalAddress()
    }

    /**
     * @type {HSTRING} 
     */
    LocalPort {
        get => this.get_LocalPort()
    }

    /**
     * @type {HostName} 
     */
    RemoteHostName {
        get => this.get_RemoteHostName()
    }

    /**
     * @type {HostName} 
     */
    RemoteAddress {
        get => this.get_RemoteAddress()
    }

    /**
     * @type {HSTRING} 
     */
    RemoteServiceName {
        get => this.get_RemoteServiceName()
    }

    /**
     * @type {HSTRING} 
     */
    RemotePort {
        get => this.get_RemotePort()
    }

    /**
     * @type {RoundTripTimeStatistics} 
     */
    RoundTripTimeStatistics {
        get => this.get_RoundTripTimeStatistics()
    }

    /**
     * @type {BandwidthStatistics} 
     */
    BandwidthStatistics {
        get => this.get_BandwidthStatistics()
    }

    /**
     * @type {Integer} 
     */
    ProtectionLevel {
        get => this.get_ProtectionLevel()
    }

    /**
     * @type {IBuffer} 
     */
    SessionKey {
        get => this.get_SessionKey()
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_LocalAddress() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HostName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_LocalPort() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_RemoteHostName() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HostName(value)
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_RemoteAddress() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HostName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemoteServiceName() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RemotePort() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RoundTripTimeStatistics} 
     */
    get_RoundTripTimeStatistics() {
        value := RoundTripTimeStatistics()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {BandwidthStatistics} 
     */
    get_BandwidthStatistics() {
        value := BandwidthStatistics()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProtectionLevel() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_SessionKey() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
