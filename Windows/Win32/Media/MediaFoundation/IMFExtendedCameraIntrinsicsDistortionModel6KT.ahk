#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MFCameraIntrinsic_DistortionModel6KT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFExtendedCameraIntrinsicsDistortionModel6KT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFExtendedCameraIntrinsicsDistortionModel6KT
     * @type {Guid}
     */
    static IID => Guid("{74c2653b-5f55-4eb1-9f0f-18b8f68b7d3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDistortionModel", "SetDistortionModel"]

    /**
     * 
     * @returns {MFCameraIntrinsic_DistortionModel6KT} 
     */
    GetDistortionModel() {
        pDistortionModel := MFCameraIntrinsic_DistortionModel6KT()
        result := ComCall(3, this, "ptr", pDistortionModel, "HRESULT")
        return pDistortionModel
    }

    /**
     * 
     * @param {Pointer<MFCameraIntrinsic_DistortionModel6KT>} pDistortionModel 
     * @returns {HRESULT} 
     */
    SetDistortionModel(pDistortionModel) {
        result := ComCall(4, this, "ptr", pDistortionModel, "HRESULT")
        return result
    }
}
