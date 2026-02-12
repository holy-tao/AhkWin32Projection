#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WiFiDirectConnectionRequest.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class IWiFiDirectConnectionRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiDirectConnectionRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{f99d20be-d38d-484f-8215-e7b65abf244c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConnectionRequest"]

    /**
     * 
     * @returns {WiFiDirectConnectionRequest} 
     */
    GetConnectionRequest() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WiFiDirectConnectionRequest(result_)
    }
}
