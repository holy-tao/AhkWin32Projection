#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFExtendedCameraIntrinsicsDistortionModelArcTan extends IUnknown{
    /**
     * The interface identifier for IMFExtendedCameraIntrinsicsDistortionModelArcTan
     * @type {Guid}
     */
    static IID => Guid("{812d5f95-b572-45dc-bafc-ae24199ddda8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<MFCameraIntrinsic_DistortionModelArcTan>} pDistortionModel 
     * @returns {HRESULT} 
     */
    GetDistortionModel(pDistortionModel) {
        result := ComCall(3, this, "ptr", pDistortionModel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MFCameraIntrinsic_DistortionModelArcTan>} pDistortionModel 
     * @returns {HRESULT} 
     */
    SetDistortionModel(pDistortionModel) {
        result := ComCall(4, this, "ptr", pDistortionModel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
