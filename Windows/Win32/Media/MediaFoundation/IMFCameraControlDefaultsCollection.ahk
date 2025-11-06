#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFCameraControlDefaults.ahk
#Include .\IMFAttributes.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfcameracontroldefaultscollection
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFCameraControlDefaultsCollection extends IMFAttributes{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFCameraControlDefaultsCollection
     * @type {Guid}
     */
    static IID => Guid("{92d43d0f-54a8-4bae-96da-356d259a5c26}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 33

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetControlCount", "GetControl", "GetOrAddExtendedControl", "GetOrAddControl", "RemoveControl", "RemoveAllControls"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaultscollection-getcontrolcount
     */
    GetControlCount() {
        result := ComCall(33, this, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IMFCameraControlDefaults} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaultscollection-getcontrol
     */
    GetControl(index) {
        result := ComCall(34, this, "uint", index, "ptr*", &configuration := 0, "HRESULT")
        return IMFCameraControlDefaults(configuration)
    }

    /**
     * 
     * @param {Integer} configType 
     * @param {Integer} constrolId 
     * @param {Integer} streamId 
     * @param {Integer} dataSize 
     * @returns {IMFCameraControlDefaults} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaultscollection-getoraddextendedcontrol
     */
    GetOrAddExtendedControl(configType, constrolId, streamId, dataSize) {
        result := ComCall(35, this, "int", configType, "uint", constrolId, "uint", streamId, "uint", dataSize, "ptr*", &defaults := 0, "HRESULT")
        return IMFCameraControlDefaults(defaults)
    }

    /**
     * 
     * @param {Integer} configType 
     * @param {Pointer<Guid>} controlSet 
     * @param {Integer} constrolId 
     * @param {Integer} controlSize 
     * @param {Integer} dataSize 
     * @returns {IMFCameraControlDefaults} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaultscollection-getoraddcontrol
     */
    GetOrAddControl(configType, controlSet, constrolId, controlSize, dataSize) {
        result := ComCall(36, this, "int", configType, "ptr", controlSet, "uint", constrolId, "uint", controlSize, "uint", dataSize, "ptr*", &defaults := 0, "HRESULT")
        return IMFCameraControlDefaults(defaults)
    }

    /**
     * 
     * @param {Pointer<Guid>} controlSet 
     * @param {Integer} constrolId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaultscollection-removecontrol
     */
    RemoveControl(controlSet, constrolId) {
        result := ComCall(37, this, "ptr", controlSet, "uint", constrolId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfcameracontroldefaultscollection-removeallcontrols
     */
    RemoveAllControls() {
        result := ComCall(38, this, "HRESULT")
        return result
    }
}
