#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumCall.ahk
#Include ..\..\System\Variant\VARIANT.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartTone", "StopTone", "get_Tone", "StartRinger", "StopRinger", "get_Ringer", "put_PhoneHandlingEnabled", "get_PhoneHandlingEnabled", "put_AutoEndOfNumberTimeout", "get_AutoEndOfNumberTimeout", "put_AutoDialtone", "get_AutoDialtone", "put_AutoStopTonesOnOnHook", "get_AutoStopTonesOnOnHook", "put_AutoStopRingOnOffHook", "get_AutoStopRingOnOffHook", "put_AutoKeypadTones", "get_AutoKeypadTones", "put_AutoKeypadTonesMinimumDuration", "get_AutoKeypadTonesMinimumDuration", "put_AutoVolumeControl", "get_AutoVolumeControl", "put_AutoVolumeControlStep", "get_AutoVolumeControlStep", "put_AutoVolumeControlRepeatDelay", "get_AutoVolumeControlRepeatDelay", "put_AutoVolumeControlRepeatPeriod", "get_AutoVolumeControlRepeatPeriod", "SelectCall", "UnselectCall", "EnumerateSelectedCalls", "get_SelectedCalls"]

    /**
     * 
     * @param {Integer} Tone 
     * @param {Integer} lDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-starttone
     */
    StartTone(Tone, lDuration) {
        result := ComCall(7, this, "int", Tone, "int", lDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-stoptone
     */
    StopTone() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-get_tone
     */
    get_Tone() {
        result := ComCall(9, this, "int*", &pTone := 0, "HRESULT")
        return pTone
    }

    /**
     * 
     * @param {Integer} lRingMode 
     * @param {Integer} lDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-startringer
     */
    StartRinger(lRingMode, lDuration) {
        result := ComCall(10, this, "int", lRingMode, "int", lDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-stopringer
     */
    StopRinger() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-get_ringer
     */
    get_Ringer() {
        result := ComCall(12, this, "short*", &pfRinging := 0, "HRESULT")
        return pfRinging
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-put_phonehandlingenabled
     */
    put_PhoneHandlingEnabled(fEnabled) {
        result := ComCall(13, this, "short", fEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-get_phonehandlingenabled
     */
    get_PhoneHandlingEnabled() {
        result := ComCall(14, this, "short*", &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * 
     * @param {Integer} lTimeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autoendofnumbertimeout
     */
    put_AutoEndOfNumberTimeout(lTimeout) {
        result := ComCall(15, this, "int", lTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autoendofnumbertimeout
     */
    get_AutoEndOfNumberTimeout() {
        result := ComCall(16, this, "int*", &plTimeout := 0, "HRESULT")
        return plTimeout
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autodialtone
     */
    put_AutoDialtone(fEnabled) {
        result := ComCall(17, this, "short", fEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autodialtone
     */
    get_AutoDialtone() {
        result := ComCall(18, this, "short*", &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autostoptonesononhook
     */
    put_AutoStopTonesOnOnHook(fEnabled) {
        result := ComCall(19, this, "short", fEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autostoptonesononhook
     */
    get_AutoStopTonesOnOnHook() {
        result := ComCall(20, this, "short*", &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autostopringonoffhook
     */
    put_AutoStopRingOnOffHook(fEnabled) {
        result := ComCall(21, this, "short", fEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autostopringonoffhook
     */
    get_AutoStopRingOnOffHook() {
        result := ComCall(22, this, "short*", &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autokeypadtones
     */
    put_AutoKeypadTones(fEnabled) {
        result := ComCall(23, this, "short", fEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autokeypadtones
     */
    get_AutoKeypadTones() {
        result := ComCall(24, this, "short*", &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * 
     * @param {Integer} lDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autokeypadtonesminimumduration
     */
    put_AutoKeypadTonesMinimumDuration(lDuration) {
        result := ComCall(25, this, "int", lDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autokeypadtonesminimumduration
     */
    get_AutoKeypadTonesMinimumDuration() {
        result := ComCall(26, this, "int*", &plDuration := 0, "HRESULT")
        return plDuration
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autovolumecontrol
     */
    put_AutoVolumeControl(fEnabled) {
        result := ComCall(27, this, "short", fEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autovolumecontrol
     */
    get_AutoVolumeControl() {
        result := ComCall(28, this, "short*", &fEnabled := 0, "HRESULT")
        return fEnabled
    }

    /**
     * 
     * @param {Integer} lStepSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autovolumecontrolstep
     */
    put_AutoVolumeControlStep(lStepSize) {
        result := ComCall(29, this, "int", lStepSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autovolumecontrolstep
     */
    get_AutoVolumeControlStep() {
        result := ComCall(30, this, "int*", &plStepSize := 0, "HRESULT")
        return plStepSize
    }

    /**
     * 
     * @param {Integer} lDelay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autovolumecontrolrepeatdelay
     */
    put_AutoVolumeControlRepeatDelay(lDelay) {
        result := ComCall(31, this, "int", lDelay, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autovolumecontrolrepeatdelay
     */
    get_AutoVolumeControlRepeatDelay() {
        result := ComCall(32, this, "int*", &plDelay := 0, "HRESULT")
        return plDelay
    }

    /**
     * 
     * @param {Integer} lPeriod 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autovolumecontrolrepeatperiod
     */
    put_AutoVolumeControlRepeatPeriod(lPeriod) {
        result := ComCall(33, this, "int", lPeriod, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autovolumecontrolrepeatperiod
     */
    get_AutoVolumeControlRepeatPeriod() {
        result := ComCall(34, this, "int*", &plPeriod := 0, "HRESULT")
        return plPeriod
    }

    /**
     * 
     * @param {ITCallInfo} pCall 
     * @param {VARIANT_BOOL} fSelectDefaultTerminals 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-selectcall
     */
    SelectCall(pCall, fSelectDefaultTerminals) {
        result := ComCall(35, this, "ptr", pCall, "short", fSelectDefaultTerminals, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITCallInfo} pCall 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-unselectcall
     */
    UnselectCall(pCall) {
        result := ComCall(36, this, "ptr", pCall, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumCall} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-enumerateselectedcalls
     */
    EnumerateSelectedCalls() {
        result := ComCall(37, this, "ptr*", &ppCallEnum := 0, "HRESULT")
        return IEnumCall(ppCallEnum)
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itautomatedphonecontrol-get_selectedcalls
     */
    get_SelectedCalls() {
        pVariant := VARIANT()
        result := ComCall(38, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }
}
