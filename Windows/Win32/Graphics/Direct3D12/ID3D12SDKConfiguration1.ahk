#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12SDKConfiguration.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12SDKConfiguration1 extends ID3D12SDKConfiguration{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12SDKConfiguration1
     * @type {Guid}
     */
    static IID => Guid("{8aaf9303-ad25-48b9-9a57-d9c37e009d9f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDeviceFactory", "FreeUnusedSDKs"]

    /**
     * 
     * @param {Integer} SDKVersion 
     * @param {PSTR} SDKPath 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvFactory 
     * @returns {HRESULT} 
     */
    CreateDeviceFactory(SDKVersion, SDKPath, riid, ppvFactory) {
        result := ComCall(4, this, "uint", SDKVersion, "ptr", SDKPath, "ptr", riid, "ptr*", ppvFactory, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    FreeUnusedSDKs() {
        ComCall(5, this)
    }
}
