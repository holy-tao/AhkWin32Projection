#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapSource.ahk

/**
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICBitmapToneMapper extends IWICBitmapSource{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICBitmapToneMapper
     * @type {Guid}
     */
    static IID => Guid("{44728ded-1edf-4fe9-b50b-c89a264c9439}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeForHdrTarget", "InitializeForSdrTarget"]

    /**
     * 
     * @param {IWICBitmapSource} pISource 
     * @param {Pointer<Guid>} guidDstFormat 
     * @param {Float} fLuminanceInNits 
     * @param {Float} fWhiteLevelInNits 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     */
    InitializeForHdrTarget(pISource, guidDstFormat, fLuminanceInNits, fWhiteLevelInNits, mode) {
        result := ComCall(8, this, "ptr", pISource, "ptr", guidDstFormat, "float", fLuminanceInNits, "float", fWhiteLevelInNits, "int", mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICBitmapSource} pISource 
     * @param {Pointer<Guid>} guidDstFormat 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     */
    InitializeForSdrTarget(pISource, guidDstFormat, mode) {
        result := ComCall(9, this, "ptr", pISource, "ptr", guidDstFormat, "int", mode, "HRESULT")
        return result
    }
}
