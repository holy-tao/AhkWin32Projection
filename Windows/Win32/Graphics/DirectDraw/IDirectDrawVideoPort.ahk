#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class IDirectDrawVideoPort extends IUnknown{
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
     * 
     * @param {Pointer<IDirectDrawSurface>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    Flip(param0, param1) {
        result := ComCall(3, this, "ptr", param0, "uint", param1, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(4, this, "ptr", param0, "uint", param1, "uint", param2, "uint", param3, "ptr", param4, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DDCOLORCONTROL>} param0 
     * @returns {HRESULT} 
     */
    GetColorControls(param0) {
        result := ComCall(5, this, "ptr", param0, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} lpNumFormats 
     * @param {Pointer<DDPIXELFORMAT>} param1 
     * @param {Integer} param2 
     * @returns {HRESULT} 
     */
    GetInputFormats(lpNumFormats, param1, param2) {
        result := ComCall(6, this, "uint*", lpNumFormats, "ptr", param1, "uint", param2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DDPIXELFORMAT>} param0 
     * @param {Pointer<UInt32>} lpNumFormats 
     * @param {Pointer<DDPIXELFORMAT>} param2 
     * @param {Integer} param3 
     * @returns {HRESULT} 
     */
    GetOutputFormats(param0, lpNumFormats, param2, param3) {
        result := ComCall(7, this, "ptr", param0, "uint*", lpNumFormats, "ptr", param2, "uint", param3, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} param0 
     * @returns {HRESULT} 
     */
    GetFieldPolarity(param0) {
        result := ComCall(8, this, "ptr", param0, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @returns {HRESULT} 
     */
    GetVideoLine(param0) {
        result := ComCall(9, this, "uint*", param0, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} param0 
     * @returns {HRESULT} 
     */
    GetVideoSignalStatus(param0) {
        result := ComCall(10, this, "uint*", param0, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DDCOLORCONTROL>} param0 
     * @returns {HRESULT} 
     */
    SetColorControls(param0) {
        result := ComCall(11, this, "ptr", param0, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectDrawSurface>} param0 
     * @param {Integer} param1 
     * @returns {HRESULT} 
     */
    SetTargetSurface(param0, param1) {
        result := ComCall(12, this, "ptr", param0, "uint", param1, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DDVIDEOPORTINFO>} param0 
     * @returns {HRESULT} 
     */
    StartVideo(param0) {
        result := ComCall(13, this, "ptr", param0, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopVideo() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<DDVIDEOPORTINFO>} param0 
     * @returns {HRESULT} 
     */
    UpdateVideo(param0) {
        result := ComCall(15, this, "ptr", param0, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(16, this, "uint", param0, "uint", param1, "uint", param2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
