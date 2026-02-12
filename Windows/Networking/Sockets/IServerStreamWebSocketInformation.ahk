#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BandwidthStatistics.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\HostName.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IServerStreamWebSocketInformation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServerStreamWebSocketInformation
     * @type {Guid}
     */
    static IID => Guid("{fc32b45f-4448-5505-6cc9-09aba8915f5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BandwidthStatistics", "get_Protocol", "get_LocalAddress"]

    /**
     * @type {BandwidthStatistics} 
     */
    BandwidthStatistics {
        get => this.get_BandwidthStatistics()
    }

    /**
     * @type {HSTRING} 
     */
    Protocol {
        get => this.get_Protocol()
    }

    /**
     * @type {HostName} 
     */
    LocalAddress {
        get => this.get_LocalAddress()
    }

    /**
     * 
     * @returns {BandwidthStatistics} 
     */
    get_BandwidthStatistics() {
        value := BandwidthStatistics()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Protocol() {
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
    get_LocalAddress() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HostName(value)
    }
}
