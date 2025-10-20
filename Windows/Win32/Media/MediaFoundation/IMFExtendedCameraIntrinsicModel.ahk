#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFExtendedCameraIntrinsicModel extends IUnknown{
    /**
     * The interface identifier for IMFExtendedCameraIntrinsicModel
     * @type {Guid}
     */
    static IID => Guid("{5c595e64-4630-4231-855a-12842f733245}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<MFExtendedCameraIntrinsic_IntrinsicModel>} pIntrinsicModel 
     * @returns {HRESULT} 
     */
    GetModel(pIntrinsicModel) {
        result := ComCall(3, this, "ptr", pIntrinsicModel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MFExtendedCameraIntrinsic_IntrinsicModel>} pIntrinsicModel 
     * @returns {HRESULT} 
     */
    SetModel(pIntrinsicModel) {
        result := ComCall(4, this, "ptr", pIntrinsicModel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pDistortionModelType 
     * @returns {HRESULT} 
     */
    GetDistortionModelType(pDistortionModelType) {
        result := ComCall(5, this, "int*", pDistortionModelType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
