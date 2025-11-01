#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFExtendedCameraIntrinsicModel extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetModel", "SetModel", "GetDistortionModelType"]

    /**
     * 
     * @param {Pointer<MFExtendedCameraIntrinsic_IntrinsicModel>} pIntrinsicModel 
     * @returns {HRESULT} 
     */
    GetModel(pIntrinsicModel) {
        result := ComCall(3, this, "ptr", pIntrinsicModel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<MFExtendedCameraIntrinsic_IntrinsicModel>} pIntrinsicModel 
     * @returns {HRESULT} 
     */
    SetModel(pIntrinsicModel) {
        result := ComCall(4, this, "ptr", pIntrinsicModel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDistortionModelType 
     * @returns {HRESULT} 
     */
    GetDistortionModelType(pDistortionModelType) {
        pDistortionModelTypeMarshal := pDistortionModelType is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pDistortionModelTypeMarshal, pDistortionModelType, "HRESULT")
        return result
    }
}
