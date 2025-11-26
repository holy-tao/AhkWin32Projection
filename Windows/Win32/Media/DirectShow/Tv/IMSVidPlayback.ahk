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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_EnableResetOnStop", "put_EnableResetOnStop", "Run", "Pause", "Stop", "get_CanStep", "Step", "put_Rate", "get_Rate", "put_CurrentPosition", "get_CurrentPosition", "put_PositionMode", "get_PositionMode", "get_Length"]

    /**
     * @type {VARIANT_BOOL} 
     */
    EnableResetOnStop {
        get => this.get_EnableResetOnStop()
        set => this.put_EnableResetOnStop(value)
    }

    /**
     * @type {Float} 
     */
    Rate {
        get => this.get_Rate()
        set => this.put_Rate(value)
    }

    /**
     * @type {Integer} 
     */
    CurrentPosition {
        get => this.get_CurrentPosition()
        set => this.put_CurrentPosition(value)
    }

    /**
     * @type {Integer} 
     */
    PositionMode {
        get => this.get_PositionMode()
        set => this.put_PositionMode(value)
    }

    /**
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-get_enableresetonstop
     */
    get_EnableResetOnStop() {
        result := ComCall(18, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {VARIANT_BOOL} newVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-put_enableresetonstop
     */
    put_EnableResetOnStop(newVal) {
        result := ComCall(19, this, "short", newVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-run
     */
    Run() {
        result := ComCall(20, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-pause
     */
    Pause() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-stop
     */
    Stop() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fBackwards 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-get_canstep
     */
    get_CanStep(fBackwards) {
        result := ComCall(23, this, "short", fBackwards, "short*", &pfCan := 0, "HRESULT")
        return pfCan
    }

    /**
     * 
     * @param {Integer} lStep 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-step
     */
    Step(lStep) {
        result := ComCall(24, this, "int", lStep, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} plRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-put_rate
     */
    put_Rate(plRate) {
        result := ComCall(25, this, "double", plRate, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-get_rate
     */
    get_Rate() {
        result := ComCall(26, this, "double*", &plRate := 0, "HRESULT")
        return plRate
    }

    /**
     * 
     * @param {Integer} lPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-put_currentposition
     */
    put_CurrentPosition(lPosition) {
        result := ComCall(27, this, "int", lPosition, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-get_currentposition
     */
    get_CurrentPosition() {
        result := ComCall(28, this, "int*", &lPosition := 0, "HRESULT")
        return lPosition
    }

    /**
     * 
     * @param {Integer} lPositionMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-put_positionmode
     */
    put_PositionMode(lPositionMode) {
        result := ComCall(29, this, "int", lPositionMode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-get_positionmode
     */
    get_PositionMode() {
        result := ComCall(30, this, "int*", &lPositionMode := 0, "HRESULT")
        return lPositionMode
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-get_length
     */
    get_Length() {
        result := ComCall(31, this, "int*", &lLength := 0, "HRESULT")
        return lLength
    }
}
