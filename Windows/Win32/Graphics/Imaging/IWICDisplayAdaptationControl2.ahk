#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICDisplayAdaptationControl.ahk

/**
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICDisplayAdaptationControl2 extends IWICDisplayAdaptationControl{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICDisplayAdaptationControl2
     * @type {Guid}
     */
    static IID => Guid("{d7508d29-3ab7-447e-a676-4d80d7de726b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSdrWhiteLevel", "GetSdrWhiteLevel", "SetToneMappingMode", "GetToneMappingMode", "DoesSupportToneMappingMode"]

    /**
     * 
     * @param {Float} fWhiteLevelInNits 
     * @returns {HRESULT} 
     */
    SetSdrWhiteLevel(fWhiteLevelInNits) {
        result := ComCall(6, this, "float", fWhiteLevelInNits, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetSdrWhiteLevel() {
        result := ComCall(7, this, "float*", &pfWhiteLevelInNits := 0, "HRESULT")
        return pfWhiteLevelInNits
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     */
    SetToneMappingMode(mode) {
        result := ComCall(8, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetToneMappingMode() {
        result := ComCall(9, this, "int*", &mode := 0, "HRESULT")
        return mode
    }

    /**
     * 
     * @param {Integer} mode 
     * @returns {BOOL} 
     */
    DoesSupportToneMappingMode(mode) {
        result := ComCall(10, this, "int", mode, "int*", &pfIsSupported := 0, "HRESULT")
        return pfIsSupported
    }
}
