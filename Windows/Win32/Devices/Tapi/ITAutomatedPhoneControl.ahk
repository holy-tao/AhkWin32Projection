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
     * @type {Integer} 
     */
    Tone {
        get => this.get_Tone()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Ringer {
        get => this.get_Ringer()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    PhoneHandlingEnabled {
        get => this.get_PhoneHandlingEnabled()
        set => this.put_PhoneHandlingEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    AutoEndOfNumberTimeout {
        get => this.get_AutoEndOfNumberTimeout()
        set => this.put_AutoEndOfNumberTimeout(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AutoDialtone {
        get => this.get_AutoDialtone()
        set => this.put_AutoDialtone(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AutoStopTonesOnOnHook {
        get => this.get_AutoStopTonesOnOnHook()
        set => this.put_AutoStopTonesOnOnHook(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AutoStopRingOnOffHook {
        get => this.get_AutoStopRingOnOffHook()
        set => this.put_AutoStopRingOnOffHook(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AutoKeypadTones {
        get => this.get_AutoKeypadTones()
        set => this.put_AutoKeypadTones(value)
    }

    /**
     * @type {Integer} 
     */
    AutoKeypadTonesMinimumDuration {
        get => this.get_AutoKeypadTonesMinimumDuration()
        set => this.put_AutoKeypadTonesMinimumDuration(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AutoVolumeControl {
        get => this.get_AutoVolumeControl()
        set => this.put_AutoVolumeControl(value)
    }

    /**
     * @type {Integer} 
     */
    AutoVolumeControlStep {
        get => this.get_AutoVolumeControlStep()
        set => this.put_AutoVolumeControlStep(value)
    }

    /**
     * @type {Integer} 
     */
    AutoVolumeControlRepeatDelay {
        get => this.get_AutoVolumeControlRepeatDelay()
        set => this.put_AutoVolumeControlRepeatDelay(value)
    }

    /**
     * @type {Integer} 
     */
    AutoVolumeControlRepeatPeriod {
        get => this.get_AutoVolumeControlRepeatPeriod()
        set => this.put_AutoVolumeControlRepeatPeriod(value)
    }

    /**
     * @type {VARIANT} 
     */
    SelectedCalls {
        get => this.get_SelectedCalls()
    }

    /**
     * The StartTone method sends control tones.
     * @param {Integer} Tone <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_tone">PHONE_TONE</a> descriptor of the type of tone to send, such as PT_KEYPADONE.
     * @param {Integer} lDuration Duration, in milliseconds, of the tone being sent.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-starttone
     */
    StartTone(Tone, lDuration) {
        result := ComCall(7, this, "int", Tone, "int", lDuration, "HRESULT")
        return result
    }

    /**
     * The StopTone method ceases any tone that is currently being played. If no tone is being played, the method performs no action and returns success.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-stoptone
     */
    StopTone() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * The get_Tone method returns a PHONE_TONE enum value indicating the type of tone, if any, that the phone is currently playing.
     * @returns {Integer} <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_tone">PHONE_TONE</a> descriptor of tone being played.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-get_tone
     */
    get_Tone() {
        result := ComCall(9, this, "int*", &pTone := 0, "HRESULT")
        return pTone
    }

    /**
     * The StartRinger method starts the phone's ringer, specifying the ring mode and the duration of the ring.
     * @param {Integer} lRingMode Ring mode. The exact meaning of this value is device-dependent. For more information, see the following Remarks section.
     * @param {Integer} lDuration Length of ring.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-startringer
     */
    StartRinger(lRingMode, lDuration) {
        result := ComCall(10, this, "int", lRingMode, "int", lDuration, "HRESULT")
        return result
    }

    /**
     * The StopRinger method ceases any incoming ring that is currently being produced. If no ring is being produced, the method performs no action and returns success.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-stopringer
     */
    StopRinger() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * The get_Ringer method returns a Boolean value indicating whether the phone is currently performing an incoming ring that was initiated by the StartRinger method on this interface.
     * @returns {VARIANT_BOOL} If VARIANT_TRUE, the phone is currently ringing.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-get_ringer
     */
    get_Ringer() {
        result := ComCall(12, this, "short*", &pfRinging := 0, "HRESULT")
        return pfRinging
    }

    /**
     * The put_PhoneHandlingEnabled method sets the PhoneHandlingEnabled property.
     * @param {VARIANT_BOOL} fEnabled If VARIANT_TRUE, phone handling is enabled. If VARIANT_FALSE, phone handling is disabled. The default value is VARIANT_FALSE.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-put_phonehandlingenabled
     */
    put_PhoneHandlingEnabled(fEnabled) {
        result := ComCall(13, this, "short", fEnabled, "HRESULT")
        return result
    }

    /**
     * The get_PhoneHandlingEnabled method retrieves the current value of the PhoneHandlingEnabled property.
     * @returns {VARIANT_BOOL} VARIANT_TRUE if automated phone handling is enabled, VARIANT_FALSE if automated phone handling is not enabled. The default value is VARIANT_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-get_phonehandlingenabled
     */
    get_PhoneHandlingEnabled() {
        result := ComCall(14, this, "short*", &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * The put_AutoEndOfNumberTimeout method sets the value of the AutoEndOfNumberTimeout property. The property specifies how long to wait after a digit has been pressed before it is assumed that the entire number has been gathered.
     * @param {Integer} lTimeout Timeout interval to wait, in milliseconds (ms). The default value is 3000 ms.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autoendofnumbertimeout
     */
    put_AutoEndOfNumberTimeout(lTimeout) {
        result := ComCall(15, this, "int", lTimeout, "HRESULT")
        return result
    }

    /**
     * The get_AutoEndOfNumberTimeout method retrieves the current value of the AutoEndOfNumberTimeout property. The property specifies how long to wait after a digit has been pressed before it is assumed that the entire number has been gathered.
     * @returns {Integer} Time-out interval to wait, in milliseconds (ms). The default value is 3000 ms.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autoendofnumbertimeout
     */
    get_AutoEndOfNumberTimeout() {
        result := ComCall(16, this, "int*", &plTimeout := 0, "HRESULT")
        return plTimeout
    }

    /**
     * The put_AutoDialtone method sets the value of the AutoDialtone property.
     * @param {VARIANT_BOOL} fEnabled If VARIANT_TRUE, enables automatic dial tone. If VARIANT_FALSE, disables automatic dial tone. The default value is VARIANT_TRUE.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autodialtone
     */
    put_AutoDialtone(fEnabled) {
        result := ComCall(17, this, "short", fEnabled, "HRESULT")
        return result
    }

    /**
     * The get_AutoDialtone method retrieves the current value of the AutoDialtone property.
     * @returns {VARIANT_BOOL} If VARIANT_TRUE, auto dial tone is enabled. If VARIANT_FALSE, auto dial tone is disabled.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autodialtone
     */
    get_AutoDialtone() {
        result := ComCall(18, this, "short*", &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * The put_AutoStopTonesOnOnHook method sets the AutoStopTonesOnOnHook property for this phone.
     * @param {VARIANT_BOOL} fEnabled If VARIANT_TRUE, enables automatic stop of tone generation if the phone goes onhook. If VARIANT_FALSE, disables automatic stop if the phone goes onhook. The default value is VARIANT_TRUE.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autostoptonesononhook
     */
    put_AutoStopTonesOnOnHook(fEnabled) {
        result := ComCall(19, this, "short", fEnabled, "HRESULT")
        return result
    }

    /**
     * The get_AutoStopTonesOnOnHook method retrieves the current value of the AutoStopTonesOnOnHook property.
     * @returns {VARIANT_BOOL} If VARIANT_TRUE, automatic stop of tone generation upon onhook is enabled. If VARIANT_FALSE, automatic stop of tone generation upon onhook is disabled.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autostoptonesononhook
     */
    get_AutoStopTonesOnOnHook() {
        result := ComCall(20, this, "short*", &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * The put_AutoStopRingOnOffHook method sets the AutoStopRingOnOffHook property. When this feature is enabled, the phone going offhook results in the termination of any incoming ring produced on the phone (via a call to ITAutomatedPhoneControl::StopRinger).
     * @param {VARIANT_BOOL} fEnabled If VARIANT_TRUE, enables automatic incoming ring termination if the phone goes offhook. If VARIANT_FALSE, disables automatic incoming ring termination if the phone goes offhook. The default value is VARIANT_TRUE.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autostopringonoffhook
     */
    put_AutoStopRingOnOffHook(fEnabled) {
        result := ComCall(21, this, "short", fEnabled, "HRESULT")
        return result
    }

    /**
     * The get_AutoStopRingOnOffHook method retrieves the current value of the AutoStopRingOnOffHook property.
     * @returns {VARIANT_BOOL} If VARIANT_TRUE, automatic incoming ring termination when the phone goes offhook is enabled. If VARIANT_FALSE, automatic incoming ring termination when the phone goes offhook is disabled.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autostopringonoffhook
     */
    get_AutoStopRingOnOffHook() {
        result := ComCall(22, this, "short*", &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * The put_AutoKeypadTones method sets the AutoKeypadTones property for this phone. When this feature is enabled, a digit tone is automatically played whenever a keypad button is pressed.
     * @param {VARIANT_BOOL} fEnabled If VARIANT_TRUE, automatic phone keypad tone generation is enabled. If VARIANT_FALSE, keypad tone generation is disabled. The default value is VARIANT_TRUE.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autokeypadtones
     */
    put_AutoKeypadTones(fEnabled) {
        result := ComCall(23, this, "short", fEnabled, "HRESULT")
        return result
    }

    /**
     * The get_AutoKeypadTones method gets the AutoKeypadTones property for this phone. When this feature is enabled, a digit tone is automatically played whenever a keypad button is pressed.
     * @returns {VARIANT_BOOL} VARIANT_TRUE if automatic phone keypad feedback tone generation is enabled for this phone. VARIANT_FALSE if automatic phone keypad feedback tone generation is disabled for this phone.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autokeypadtones
     */
    get_AutoKeypadTones() {
        result := ComCall(24, this, "short*", &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * The put_AutoKeypadTonesMinimumDuration method sets the value of the AutoKeypadTonesMinimumDuration property. The property specifies how long to play keypad tones on PBS_DOWN.
     * @param {Integer} lDuration Minimum duration of keypad tones, in milliseconds (ms). The default value is 250 ms. If the minimum duration elapses without a PBS_UP event, the keypad tone continues until the PBS_UP event is received.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autokeypadtonesminimumduration
     */
    put_AutoKeypadTonesMinimumDuration(lDuration) {
        result := ComCall(25, this, "int", lDuration, "HRESULT")
        return result
    }

    /**
     * The get_AutoKeypadTonesMinimumDuration method retrieves the current value of the AutoKeypadTonesMinimumDuration property. The property specifies how long to play keypad tones on PBS_DOWN.
     * @returns {Integer} Minimum duration of keypad tones, in milliseconds (ms). The default value is 250 ms. If the minimum duration elapses without a PBS_UP event, the keypad tone continues until the PBS_UP event is received.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autokeypadtonesminimumduration
     */
    get_AutoKeypadTonesMinimumDuration() {
        result := ComCall(26, this, "int*", &plDuration := 0, "HRESULT")
        return plDuration
    }

    /**
     * The put_AutoVolumeControl method sets the AutoVolumeControl property for this phone.
     * @param {VARIANT_BOOL} fEnabled If VARIANT_TRUE, enables automatic volume control. If VARIANT_FALSE, disables automatic volume control. The default value is VARIANT_TRUE.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autovolumecontrol
     */
    put_AutoVolumeControl(fEnabled) {
        result := ComCall(27, this, "short", fEnabled, "HRESULT")
        return result
    }

    /**
     * The get_AutoVolumeControl method retrieves the current value of the AutoVolumeControl property.
     * @returns {VARIANT_BOOL} VARIANT_TRUE indicates that automatic volume control is enabled. VARIANT_FALSE indicates that automatic volume control is disabled.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autovolumecontrol
     */
    get_AutoVolumeControl() {
        result := ComCall(28, this, "short*", &fEnabled := 0, "HRESULT")
        return fEnabled
    }

    /**
     * The put_AutoVolumeControlStep method sets the AutoVolumeControlStep property. The property determines the amount that the phone volume is adjusted when the volume button is pressed.
     * @param {Integer} lStepSize Volume control step, in milliseconds. The default value of the <b>AutoVolumeControlStep</b> property is 4096.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autovolumecontrolstep
     */
    put_AutoVolumeControlStep(lStepSize) {
        result := ComCall(29, this, "int", lStepSize, "HRESULT")
        return result
    }

    /**
     * The get_AutoVolumeControlStep method retrieves the current value of the AutoVolumeControlStep property. The property determines the amount that the phone volume is adjusted when the volume button is pressed.
     * @returns {Integer} Volume control step. The default value of the <b>AutoVolumeControlStep</b> property is 4096.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autovolumecontrolstep
     */
    get_AutoVolumeControlStep() {
        result := ComCall(30, this, "int*", &plStepSize := 0, "HRESULT")
        return plStepSize
    }

    /**
     * The put_AutoVolumeControlRepeatDelay method sets the AutoVolumeControlRepeatDelay property. The property specifies the delay, in milliseconds (ms), before a volume button starts repeating when it is held down.
     * @param {Integer} lDelay Delay, in milliseconds (ms), before the volume button starts repeating. The default value is 500 ms.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autovolumecontrolrepeatdelay
     */
    put_AutoVolumeControlRepeatDelay(lDelay) {
        result := ComCall(31, this, "int", lDelay, "HRESULT")
        return result
    }

    /**
     * The get_AutoVolumeControlRepeatDelay method retrieves the current value of the AutoVolumeControlRepeatDelay property. The property specifies the delay, in milliseconds (ms), before a volume button starts repeating when it is held down.
     * @returns {Integer} Delay, in milliseconds, of the volume repeat delay. The default value is 500 ms.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autovolumecontrolrepeatdelay
     */
    get_AutoVolumeControlRepeatDelay() {
        result := ComCall(32, this, "int*", &plDelay := 0, "HRESULT")
        return plDelay
    }

    /**
     * The put_AutoVolumeControlRepeatPeriod method sets the AutoVolumeControlRepeatPeriod property. The property controls the period, in milliseconds (ms), of button repeats when a volume button is held down.
     * @param {Integer} lPeriod Period, in milliseconds (ms), of button repeats when a volume button is held down. The default value is 100 ms.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-put_autovolumecontrolrepeatperiod
     */
    put_AutoVolumeControlRepeatPeriod(lPeriod) {
        result := ComCall(33, this, "int", lPeriod, "HRESULT")
        return result
    }

    /**
     * The get_AutoVolumeControlRepeatPeriod method retrieves the current value of the AutoVolumeControlRepeatPeriod property. The property controls the period, in milliseconds (ms), of button repeats when a volume button is held down.
     * @returns {Integer} Period, in milliseconds (ms), of button repeats when a volume button is held down.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-get_autovolumecontrolrepeatperiod
     */
    get_AutoVolumeControlRepeatPeriod() {
        result := ComCall(34, this, "int*", &plPeriod := 0, "HRESULT")
        return plPeriod
    }

    /**
     * The SelectCall method selects the current phone object onto the Call object pointed to by the pCall parameter.
     * @param {ITCallInfo} pCall Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface.
     * @param {VARIANT_BOOL} fSelectDefaultTerminals If VARIANT_TRUE, use default terminals. For more information, see the following Remarks section.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-selectcall
     */
    SelectCall(pCall, fSelectDefaultTerminals) {
        result := ComCall(35, this, "ptr", pCall, "short", fSelectDefaultTerminals, "HRESULT")
        return result
    }

    /**
     * The UnselectCall method removes the specified call from this phone object, releasing the phone object's reference to the call object.
     * @param {ITCallInfo} pCall Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcallinfo">ITCallInfo</a> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an error value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-unselectcall
     */
    UnselectCall(pCall) {
        result := ComCall(36, this, "ptr", pCall, "HRESULT")
        return result
    }

    /**
     * The EnumerateSelectedCalls method retrieves an enumerator object indicating which calls are currently selected on this phone. See ITAutomatedPhoneControl::SelectCall for more information.
     * @returns {IEnumCall} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumcall">IEnumCall</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-enumerateselectedcalls
     */
    EnumerateSelectedCalls() {
        result := ComCall(37, this, "ptr*", &ppCallEnum := 0, "HRESULT")
        return IEnumCall(ppCallEnum)
    }

    /**
     * The get_SelectedCalls method retrieves a VARIANT containing a pointer to a collection object indicating which calls are currently selected on this phone. See ITAutomatedPhoneControl::SelectCall for more information.
     * @returns {VARIANT} Pointer to a VARIANT containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumcall">IEnumCall</a> interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itautomatedphonecontrol-get_selectedcalls
     */
    get_SelectedCalls() {
        pVariant := VARIANT()
        result := ComCall(38, this, "ptr", pVariant, "HRESULT")
        return pVariant
    }
}
