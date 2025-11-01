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
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-get_enableresetonstop
     */
    get_EnableResetOnStop(pVal) {
        result := ComCall(18, this, "ptr", pVal, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pfCan 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-get_canstep
     */
    get_CanStep(fBackwards, pfCan) {
        result := ComCall(23, this, "short", fBackwards, "ptr", pfCan, "HRESULT")
        return result
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
     * @param {Pointer<Float>} plRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-get_rate
     */
    get_Rate(plRate) {
        result := ComCall(26, this, "double*", plRate, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} lPosition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-get_currentposition
     */
    get_CurrentPosition(lPosition) {
        result := ComCall(28, this, "int*", lPosition, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} lPositionMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-get_positionmode
     */
    get_PositionMode(lPositionMode) {
        result := ComCall(30, this, "int*", lPositionMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidplayback-get_length
     */
    get_Length(lLength) {
        result := ComCall(31, this, "int*", lLength, "HRESULT")
        return result
    }
}
