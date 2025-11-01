#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICDisplayAdaptationControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICDisplayAdaptationControl
     * @type {Guid}
     */
    static IID => Guid("{de9d91d2-70b4-4f41-836c-25fcd39626d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DoesSupportChangingMaxLuminance", "SetDisplayMaxLuminance", "GetDisplayMaxLuminance"]

    /**
     * 
     * @param {Pointer<Guid>} pguidDstFormat 
     * @param {Pointer<BOOL>} pfIsSupported 
     * @returns {HRESULT} 
     */
    DoesSupportChangingMaxLuminance(pguidDstFormat, pfIsSupported) {
        result := ComCall(3, this, "ptr", pguidDstFormat, "ptr", pfIsSupported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} fLuminanceInNits 
     * @returns {HRESULT} 
     */
    SetDisplayMaxLuminance(fLuminanceInNits) {
        result := ComCall(4, this, "float", fLuminanceInNits, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pfLuminanceInNits 
     * @returns {HRESULT} 
     */
    GetDisplayMaxLuminance(pfLuminanceInNits) {
        result := ComCall(5, this, "float*", pfLuminanceInNits, "HRESULT")
        return result
    }
}
