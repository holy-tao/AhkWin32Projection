#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDeviceInformationPairingStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceInformationPairingStatics
     * @type {Guid}
     */
    static IID => Guid("{e915c408-36d4-49a1-bf13-514173799b6b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryRegisterForAllInboundPairingRequests"]

    /**
     * 
     * @param {Integer} pairingKindsSupported 
     * @returns {Boolean} 
     */
    TryRegisterForAllInboundPairingRequests(pairingKindsSupported) {
        result := ComCall(6, this, "uint", pairingKindsSupported, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
