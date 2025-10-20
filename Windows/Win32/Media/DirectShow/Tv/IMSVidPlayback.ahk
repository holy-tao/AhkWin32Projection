#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IMSVidInputDevice.ahk

/**
 * The IMSVidPlayback interface controls a Video Control playback device.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidPlayback)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidplayback
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidPlayback extends IMSVidInputDevice{
    /**
     * The interface identifier for IMSVidPlayback
     * @type {Guid}
     */
    static IID => Guid("{37b03538-a4c8-11d2-b634-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_EnableResetOnStop(pVal) {
        result := ComCall(18, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     */
    put_EnableResetOnStop(newVal) {
        result := ComCall(19, this, "short", newVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Run() {
        result := ComCall(20, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(21, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(22, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fBackwards 
     * @param {Pointer<VARIANT_BOOL>} pfCan 
     * @returns {HRESULT} 
     */
    get_CanStep(fBackwards, pfCan) {
        result := ComCall(23, this, "short", fBackwards, "ptr", pfCan, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lStep 
     * @returns {HRESULT} 
     */
    Step(lStep) {
        result := ComCall(24, this, "int", lStep, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} plRate 
     * @returns {HRESULT} 
     */
    put_Rate(plRate) {
        result := ComCall(25, this, "double", plRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} plRate 
     * @returns {HRESULT} 
     */
    get_Rate(plRate) {
        result := ComCall(26, this, "double*", plRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPosition 
     * @returns {HRESULT} 
     */
    put_CurrentPosition(lPosition) {
        result := ComCall(27, this, "int", lPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lPosition 
     * @returns {HRESULT} 
     */
    get_CurrentPosition(lPosition) {
        result := ComCall(28, this, "int*", lPosition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPositionMode 
     * @returns {HRESULT} 
     */
    put_PositionMode(lPositionMode) {
        result := ComCall(29, this, "int", lPositionMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lPositionMode 
     * @returns {HRESULT} 
     */
    get_PositionMode(lPositionMode) {
        result := ComCall(30, this, "int*", lPositionMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lLength 
     * @returns {HRESULT} 
     */
    get_Length(lLength) {
        result := ComCall(31, this, "int*", lLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
