#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 * @version v4.0.30319
 */
class IAudioAmbisonicsControl extends IUnknown{
    /**
     * The interface identifier for IAudioAmbisonicsControl
     * @type {Guid}
     */
    static IID => Guid("{28724c91-df35-4856-9f76-d6a26413f3df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<AMBISONICS_PARAMS>} pAmbisonicsParams 
     * @param {Integer} cbAmbisonicsParams 
     * @returns {HRESULT} 
     */
    SetData(pAmbisonicsParams, cbAmbisonicsParams) {
        result := ComCall(3, this, "ptr", pAmbisonicsParams, "uint", cbAmbisonicsParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bEnableHeadTracking 
     * @returns {HRESULT} 
     */
    SetHeadTracking(bEnableHeadTracking) {
        result := ComCall(4, this, "int", bEnableHeadTracking, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbEnableHeadTracking 
     * @returns {HRESULT} 
     */
    GetHeadTracking(pbEnableHeadTracking) {
        result := ComCall(5, this, "ptr", pbEnableHeadTracking, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} X 
     * @param {Float} Y 
     * @param {Float} Z 
     * @param {Float} W 
     * @returns {HRESULT} 
     */
    SetRotation(X, Y, Z, W) {
        result := ComCall(6, this, "float", X, "float", Y, "float", Z, "float", W, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
