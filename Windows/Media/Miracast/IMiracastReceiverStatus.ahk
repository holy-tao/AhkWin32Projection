#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\MiracastTransmitter.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Miracast
 * @version WindowsRuntime 1.4
 */
class IMiracastReceiverStatus extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMiracastReceiverStatus
     * @type {Guid}
     */
    static IID => Guid("{c28a5591-23ab-519e-ad09-90bff6dcc87e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ListeningStatus", "get_WiFiStatus", "get_IsConnectionTakeoverSupported", "get_MaxSimultaneousConnections", "get_KnownTransmitters"]

    /**
     * @type {Integer} 
     */
    ListeningStatus {
        get => this.get_ListeningStatus()
    }

    /**
     * @type {Integer} 
     */
    WiFiStatus {
        get => this.get_WiFiStatus()
    }

    /**
     * @type {Boolean} 
     */
    IsConnectionTakeoverSupported {
        get => this.get_IsConnectionTakeoverSupported()
    }

    /**
     * @type {Integer} 
     */
    MaxSimultaneousConnections {
        get => this.get_MaxSimultaneousConnections()
    }

    /**
     * @type {IVectorView<MiracastTransmitter>} 
     */
    KnownTransmitters {
        get => this.get_KnownTransmitters()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ListeningStatus() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_WiFiStatus() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConnectionTakeoverSupported() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxSimultaneousConnections() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<MiracastTransmitter>} 
     */
    get_KnownTransmitters() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MiracastTransmitter, value)
    }
}
