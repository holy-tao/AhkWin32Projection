#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class IDirectDrawVideoPort extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectDrawVideoPort
     * @type {Guid}
     */
    static IID => Guid("{b36d93e0-2b43-11cf-a2de-00aa00b93356}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Flip", "GetBandwidthInfo", "GetColorControls", "GetInputFormats", "GetOutputFormats", "GetFieldPolarity", "GetVideoLine", "GetVideoSignalStatus", "SetColorControls", "SetTargetSurface", "StartVideo", "StopVideo", "UpdateVideo", "WaitForSync"]

    /**
     * 
     * @param {IDirectDrawSurface} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    Flip(param0, param1) {
        result := ComCall(3, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDPIXELFORMAT>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<DDVIDEOPORTBANDWIDTH>} param4 
     * @returns {HRESULT} 
     */
    GetBandwidthInfo(param0, param1, param2, param3, param4) {
        result := ComCall(4, this, "ptr", param0, "uint", param1, "uint", param2, "uint", param3, "ptr", param4, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDCOLORCONTROL>} param0 
     * @returns {HRESULT} 
     */
    GetColorControls(param0) {
        result := ComCall(5, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpNumFormats 
     * @param {Pointer<DDPIXELFORMAT>} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    GetInputFormats(lpNumFormats, param1, param2) {
        result := ComCall(6, this, "uint*", lpNumFormats, "ptr", param1, "uint", param2, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDPIXELFORMAT>} param0 
     * @param {Pointer<Integer>} lpNumFormats 
     * @param {Pointer<DDPIXELFORMAT>} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} 
     */
    GetOutputFormats(param0, lpNumFormats, param2, param3) {
        result := ComCall(7, this, "ptr", param0, "uint*", lpNumFormats, "ptr", param2, "uint", param3, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} param0 
     * @returns {HRESULT} 
     */
    GetFieldPolarity(param0) {
        result := ComCall(8, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     */
    GetVideoLine(param0) {
        result := ComCall(9, this, "uint*", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} param0 
     * @returns {HRESULT} 
     */
    GetVideoSignalStatus(param0) {
        result := ComCall(10, this, "uint*", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDCOLORCONTROL>} param0 
     * @returns {HRESULT} 
     */
    SetColorControls(param0) {
        result := ComCall(11, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectDrawSurface} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    SetTargetSurface(param0, param1) {
        result := ComCall(12, this, "ptr", param0, "uint", param1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDVIDEOPORTINFO>} param0 
     * @returns {HRESULT} 
     */
    StartVideo(param0) {
        result := ComCall(13, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopVideo() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<DDVIDEOPORTINFO>} param0 
     * @returns {HRESULT} 
     */
    UpdateVideo(param0) {
        result := ComCall(15, this, "ptr", param0, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    WaitForSync(param0, param1, param2) {
        result := ComCall(16, this, "uint", param0, "uint", param1, "uint", param2, "HRESULT")
        return result
    }
}
