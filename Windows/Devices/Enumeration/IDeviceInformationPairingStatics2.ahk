#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDeviceInformationPairingStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceInformationPairingStatics2
     * @type {Guid}
     */
    static IID => Guid("{04de5372-b7b7-476b-a74f-c5836a704d98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["TryRegisterForAllInboundPairingRequestsWithProtectionLevel"]

    /**
     * 
     * @param {Integer} pairingKindsSupported 
     * @param {Integer} minProtectionLevel 
     * @returns {Boolean} 
     */
    TryRegisterForAllInboundPairingRequestsWithProtectionLevel(pairingKindsSupported, minProtectionLevel) {
        result := ComCall(6, this, "uint", pairingKindsSupported, "int", minProtectionLevel, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
