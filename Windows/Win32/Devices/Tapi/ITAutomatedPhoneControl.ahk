#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITAutomatedPhoneControl is a fully OLE automatable and scriptable interface exposed by the TAPI phone object.
 * @remarks
 * 
  * An 
  * <b>ITAutomatedPhoneControl</b> pointer becomes invalid when the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itphone-close">ITPhone::Close</a> method is called.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itautomatedphonecontrol
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITAutomatedPhoneControl extends IDispatch{
    /**
     * The interface identifier for ITAutomatedPhoneControl
     * @type {Guid}
     */
    static IID => Guid("{1ee1af0e-6159-4a61-b79b-6a4ba3fc9dfc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} Tone 
     * @param {Integer} lDuration 
     * @returns {HRESULT} 
     */
    StartTone(Tone, lDuration) {
        result := ComCall(7, this, "int", Tone, "int", lDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopTone() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pTone 
     * @returns {HRESULT} 
     */
    get_Tone(pTone) {
        result := ComCall(9, this, "int*", pTone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lRingMode 
     * @param {Integer} lDuration 
     * @returns {HRESULT} 
     */
    StartRinger(lRingMode, lDuration) {
        result := ComCall(10, this, "int", lRingMode, "int", lDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopRinger() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfRinging 
     * @returns {HRESULT} 
     */
    get_Ringer(pfRinging) {
        result := ComCall(12, this, "ptr", pfRinging, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEnabled 
     * @returns {HRESULT} 
     */
    put_PhoneHandlingEnabled(fEnabled) {
        result := ComCall(13, this, "short", fEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfEnabled 
     * @returns {HRESULT} 
     */
    get_PhoneHandlingEnabled(pfEnabled) {
        result := ComCall(14, this, "ptr", pfEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lTimeout 
     * @returns {HRESULT} 
     */
    put_AutoEndOfNumberTimeout(lTimeout) {
        result := ComCall(15, this, "int", lTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plTimeout 
     * @returns {HRESULT} 
     */
    get_AutoEndOfNumberTimeout(plTimeout) {
        result := ComCall(16, this, "int*", plTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEnabled 
     * @returns {HRESULT} 
     */
    put_AutoDialtone(fEnabled) {
        result := ComCall(17, this, "short", fEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfEnabled 
     * @returns {HRESULT} 
     */
    get_AutoDialtone(pfEnabled) {
        result := ComCall(18, this, "ptr", pfEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEnabled 
     * @returns {HRESULT} 
     */
    put_AutoStopTonesOnOnHook(fEnabled) {
        result := ComCall(19, this, "short", fEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfEnabled 
     * @returns {HRESULT} 
     */
    get_AutoStopTonesOnOnHook(pfEnabled) {
        result := ComCall(20, this, "ptr", pfEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEnabled 
     * @returns {HRESULT} 
     */
    put_AutoStopRingOnOffHook(fEnabled) {
        result := ComCall(21, this, "short", fEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfEnabled 
     * @returns {HRESULT} 
     */
    get_AutoStopRingOnOffHook(pfEnabled) {
        result := ComCall(22, this, "ptr", pfEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEnabled 
     * @returns {HRESULT} 
     */
    put_AutoKeypadTones(fEnabled) {
        result := ComCall(23, this, "short", fEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfEnabled 
     * @returns {HRESULT} 
     */
    get_AutoKeypadTones(pfEnabled) {
        result := ComCall(24, this, "ptr", pfEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lDuration 
     * @returns {HRESULT} 
     */
    put_AutoKeypadTonesMinimumDuration(lDuration) {
        result := ComCall(25, this, "int", lDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plDuration 
     * @returns {HRESULT} 
     */
    get_AutoKeypadTonesMinimumDuration(plDuration) {
        result := ComCall(26, this, "int*", plDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEnabled 
     * @returns {HRESULT} 
     */
    put_AutoVolumeControl(fEnabled) {
        result := ComCall(27, this, "short", fEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} fEnabled 
     * @returns {HRESULT} 
     */
    get_AutoVolumeControl(fEnabled) {
        result := ComCall(28, this, "ptr", fEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lStepSize 
     * @returns {HRESULT} 
     */
    put_AutoVolumeControlStep(lStepSize) {
        result := ComCall(29, this, "int", lStepSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plStepSize 
     * @returns {HRESULT} 
     */
    get_AutoVolumeControlStep(plStepSize) {
        result := ComCall(30, this, "int*", plStepSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lDelay 
     * @returns {HRESULT} 
     */
    put_AutoVolumeControlRepeatDelay(lDelay) {
        result := ComCall(31, this, "int", lDelay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plDelay 
     * @returns {HRESULT} 
     */
    get_AutoVolumeControlRepeatDelay(plDelay) {
        result := ComCall(32, this, "int*", plDelay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lPeriod 
     * @returns {HRESULT} 
     */
    put_AutoVolumeControlRepeatPeriod(lPeriod) {
        result := ComCall(33, this, "int", lPeriod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plPeriod 
     * @returns {HRESULT} 
     */
    get_AutoVolumeControlRepeatPeriod(plPeriod) {
        result := ComCall(34, this, "int*", plPeriod, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITCallInfo>} pCall 
     * @param {VARIANT_BOOL} fSelectDefaultTerminals 
     * @returns {HRESULT} 
     */
    SelectCall(pCall, fSelectDefaultTerminals) {
        result := ComCall(35, this, "ptr", pCall, "short", fSelectDefaultTerminals, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITCallInfo>} pCall 
     * @returns {HRESULT} 
     */
    UnselectCall(pCall) {
        result := ComCall(36, this, "ptr", pCall, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumCall>} ppCallEnum 
     * @returns {HRESULT} 
     */
    EnumerateSelectedCalls(ppCallEnum) {
        result := ComCall(37, this, "ptr", ppCallEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    get_SelectedCalls(pVariant) {
        result := ComCall(38, this, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
