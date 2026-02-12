#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class IWiFiConnectionResult extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiConnectionResult
     * @type {Guid}
     */
    static IID => Guid("{143bdfd9-c37d-40be-a5c8-857bce85a931}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ConnectionStatus"]

    /**
     * @type {Integer} 
     */
    ConnectionStatus {
        get => this.get_ConnectionStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConnectionStatus() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
