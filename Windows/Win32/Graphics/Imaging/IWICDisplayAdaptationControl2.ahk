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
        result := ComCall(6, this, "float", fWhiteLevelInNits, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetSdrWhiteLevel() {
        result := ComCall(7, this, "float*", &pfWhiteLevelInNits := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfWhiteLevelInNits
    }

    /**
     * 
     * @param {Integer} mode_ 
     * @returns {HRESULT} 
     */
    SetToneMappingMode(mode_) {
        result := ComCall(8, this, "int", mode_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetToneMappingMode() {
        result := ComCall(9, this, "int*", &mode_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return mode_
    }

    /**
     * 
     * @param {Integer} mode_ 
     * @returns {BOOL} 
     */
    DoesSupportToneMappingMode(mode_) {
        result := ComCall(10, this, "int", mode_, "int*", &pfIsSupported := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfIsSupported
    }
}
