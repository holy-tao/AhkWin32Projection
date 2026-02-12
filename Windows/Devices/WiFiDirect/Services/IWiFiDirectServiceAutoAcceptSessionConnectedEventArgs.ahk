#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WiFiDirectServiceSession.ahk
#Include ..\..\..\Storage\Streams\IBuffer.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFiDirect.Services
 * @version WindowsRuntime 1.4
 */
class IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiDirectServiceAutoAcceptSessionConnectedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{dcd9e01e-83df-43e5-8f43-cbe8479e84eb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Session", "get_SessionInfo"]

    /**
     * @type {WiFiDirectServiceSession} 
     */
    Session {
        get => this.get_Session()
    }

    /**
     * @type {IBuffer} 
     */
    SessionInfo {
        get => this.get_SessionInfo()
    }

    /**
     * 
     * @returns {WiFiDirectServiceSession} 
     */
    get_Session() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WiFiDirectServiceSession(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_SessionInfo() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBuffer(value)
    }
}
