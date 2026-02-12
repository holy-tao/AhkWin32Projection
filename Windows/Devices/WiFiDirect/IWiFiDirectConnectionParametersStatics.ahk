#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class IWiFiDirectConnectionParametersStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiDirectConnectionParametersStatics
     * @type {Guid}
     */
    static IID => Guid("{598af493-7642-456f-b9d8-e8a9eb1f401a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevicePairingKinds"]

    /**
     * 
     * @param {Integer} configurationMethod 
     * @returns {Integer} 
     */
    GetDevicePairingKinds(configurationMethod) {
        result := ComCall(6, this, "int", configurationMethod, "uint*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
