#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IEnumAddress.ahk
#Include .\IEnumTerminal.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITPhone interface is the main interface for the new Phone objects in the TAPI 3.1 object model.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itphone
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITPhone extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITPhone
     * @type {Guid}
     */
    static IID => Guid("{09d48db4-10cc-4388-9de7-a8465618975a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close", "get_Addresses", "EnumerateAddresses", "get_PhoneCapsLong", "get_PhoneCapsString", "get_Terminals", "EnumerateTerminals", "get_ButtonMode", "put_ButtonMode", "get_ButtonFunction", "put_ButtonFunction", "get_ButtonText", "put_ButtonText", "get_ButtonState", "get_HookSwitchState", "put_HookSwitchState", "put_RingMode", "get_RingMode", "put_RingVolume", "get_RingVolume", "get_Privilege", "GetPhoneCapsBuffer", "get_PhoneCapsBuffer", "get_LampMode", "put_LampMode", "get_Display", "SetDisplay", "get_PreferredAddresses", "EnumeratePreferredAddresses", "DeviceSpecific", "DeviceSpecificVariant", "NegotiateExtVersion"]

    /**
     * @type {VARIANT} 
     */
    Addresses {
        get => this.get_Addresses()
    }

    /**
     * @type {Integer} 
     */
    RingMode {
        get => this.get_RingMode()
        set => this.put_RingMode(value)
    }

    /**
     * @type {Integer} 
     */
    RingVolume {
        get => this.get_RingVolume()
        set => this.put_RingVolume(value)
    }

    /**
     * @type {Integer} 
     */
    Privilege {
        get => this.get_Privilege()
    }

    /**
     * @type {BSTR} 
     */
    Display {
        get => this.get_Display()
    }

    /**
     * @type {VARIANT} 
     */
    PreferredAddresses {
        get => this.get_PreferredAddresses()
    }

    /**
     * The Open method opens this phone device. The phone device remains open until the application calls ITPhone::Close or until TAPI is shut down.
     * @param {Integer} Privilege The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_privilege">PHONE_PRIVILEGE</a> descriptor for the application's privilege status with respect to the phone device.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-open
     */
    Open(Privilege) {
        result := ComCall(7, this, "int", Privilege, "HRESULT")
        return result
    }

    /**
     * The Close method closes this phone device. The phone device remains closed until the application calls the ITPhone::Open method. For more information, see the following Remarks section.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-close
     */
    Close() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * The get_Addresses method returns a collection of addresses that the phone can be used on. The application does not have to call ITPhone::Open before executing this method.
     * @returns {VARIANT} Pointer to a VARIANT containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-get_addresses
     */
    get_Addresses() {
        pAddresses := VARIANT()
        result := ComCall(9, this, "ptr", pAddresses, "HRESULT")
        return pAddresses
    }

    /**
     * The EnumerateAddresses method enumerates the addresses that the phone can be used on. The application does not have to call ITPhone::Open before executing this method.
     * @returns {IEnumAddress} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumaddress">IEnumAddress</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-enumerateaddresses
     */
    EnumerateAddresses() {
        result := ComCall(10, this, "ptr*", &ppEnumAddress := 0, "HRESULT")
        return IEnumAddress(ppEnumAddress)
    }

    /**
     * The get_PhoneCapsLong method gets a DWORD capability of the phone, based on the PHONECAPS_LONG enum passed in. The application does not have to call ITPhone::Open before executing this method.
     * @param {Integer} pclCap The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phonecaps_long">PHONECAPS_LONG</a> descriptor for the phone capability.
     * @returns {Integer} Capability value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-get_phonecapslong
     */
    get_PhoneCapsLong(pclCap) {
        result := ComCall(11, this, "int", pclCap, "int*", &plCapability := 0, "HRESULT")
        return plCapability
    }

    /**
     * The get_PhoneCapsString method gets a string capability/information about the phone, based on the PHONECAPS_STRING enum passed in. The application does not have to call ITPhone::Open before executing this method.
     * @param {Integer} pcsCap The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phonecaps_string">PHONECAPS_STRING</a> descriptor for the phone capability.
     * @returns {BSTR} Capability value. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The <b>BSTR</b> argument should be deallocated by the client.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-get_phonecapsstring
     */
    get_PhoneCapsString(pcsCap) {
        ppCapability := BSTR()
        result := ComCall(12, this, "int", pcsCap, "ptr", ppCapability, "HRESULT")
        return ppCapability
    }

    /**
     * The get_Terminals method retrieves a collection of terminals that are associated with the phone. The application does not have to call ITPhone::Open before executing this method.
     * @param {ITAddress} pAddress Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-get_terminals
     */
    get_Terminals(pAddress) {
        pTerminals := VARIANT()
        result := ComCall(13, this, "ptr", pAddress, "ptr", pTerminals, "HRESULT")
        return pTerminals
    }

    /**
     * The EnumerateTerminals method retrieves an enumeration of terminals that are associated with the phone. The application does not have to call ITPhone::Open before executing this method.
     * @param {ITAddress} pAddress Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface.
     * @returns {IEnumTerminal} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumterminal">IEnumTerminal</a> interface that enumerates terminals.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-enumerateterminals
     */
    EnumerateTerminals(pAddress) {
        result := ComCall(14, this, "ptr", pAddress, "ptr*", &ppEnumTerminal := 0, "HRESULT")
        return IEnumTerminal(ppEnumTerminal)
    }

    /**
     * The get_ButtonMode method retrieves the button mode associated with a particular button.
     * @param {Integer} lButtonID Button identifier. For more information, see the following Remarks section.
     * @returns {Integer} The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_button_mode">PHONE_BUTTON_MODE</a> descriptor for the button's mode.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-get_buttonmode
     */
    get_ButtonMode(lButtonID) {
        result := ComCall(15, this, "int", lButtonID, "int*", &pButtonMode := 0, "HRESULT")
        return pButtonMode
    }

    /**
     * The put_ButtonMode method sets the button mode.
     * @param {Integer} lButtonID Button identifier.
     * @param {Integer} ButtonMode The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_button_mode">PHONE_BUTTON_MODE</a> descriptor for the button's mode.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-put_buttonmode
     */
    put_ButtonMode(lButtonID, ButtonMode) {
        result := ComCall(16, this, "int", lButtonID, "int", ButtonMode, "HRESULT")
        return result
    }

    /**
     * The get_ButtonFunction method retrieves the button function associated with a particular button.
     * @param {Integer} lButtonID Button identifier.
     * @returns {Integer} The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_button_function">PHONE_BUTTON_FUNCTION</a> descriptor for the button's function.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-get_buttonfunction
     */
    get_ButtonFunction(lButtonID) {
        result := ComCall(17, this, "int", lButtonID, "int*", &pButtonFunction := 0, "HRESULT")
        return pButtonFunction
    }

    /**
     * The put_ButtonFunction method sets the button function.
     * @param {Integer} lButtonID Button identifier.
     * @param {Integer} ButtonFunction The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_button_function">PHONE_BUTTON_FUNCTION</a> descriptor for the button's function.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-put_buttonfunction
     */
    put_ButtonFunction(lButtonID, ButtonFunction) {
        result := ComCall(18, this, "int", lButtonID, "int", ButtonFunction, "HRESULT")
        return result
    }

    /**
     * The get_ButtonText method retrieves the button text associated with a particular button.
     * @param {Integer} lButtonID Button identifier.
     * @returns {BSTR} The <b>BSTR</b> representation of the button text. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The <b>BSTR</b> argument should be deallocated by the client.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-get_buttontext
     */
    get_ButtonText(lButtonID) {
        ppButtonText := BSTR()
        result := ComCall(19, this, "int", lButtonID, "ptr", ppButtonText, "HRESULT")
        return ppButtonText
    }

    /**
     * The put_ButtonText method sets the button text.
     * @param {Integer} lButtonID Button identifier.
     * @param {BSTR} bstrButtonText The BS<b></b>TR representation of the button text.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-put_buttontext
     */
    put_ButtonText(lButtonID, bstrButtonText) {
        bstrButtonText := bstrButtonText is String ? BSTR.Alloc(bstrButtonText).Value : bstrButtonText

        result := ComCall(20, this, "int", lButtonID, "ptr", bstrButtonText, "HRESULT")
        return result
    }

    /**
     * The get_ButtonState method retrieves the button state associated with a particular button.
     * @param {Integer} lButtonID Button identifier.
     * @returns {Integer} The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_button_state">PHONE_BUTTON_STATE</a> descriptor for the button's state.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-get_buttonstate
     */
    get_ButtonState(lButtonID) {
        result := ComCall(21, this, "int", lButtonID, "int*", &pButtonState := 0, "HRESULT")
        return pButtonState
    }

    /**
     * The get_HookSwitchState method retrieves the current hookswitch state for a particular hookswitch device on the phone.
     * @param {Integer} HookSwitchDevice The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_hook_switch_device">PHONE_HOOK_SWITCH_DEVICE</a> descriptor for the hookswitch type.
     * @returns {Integer} The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_hook_switch_state">PHONE_HOOK_SWITCH_STATE</a> descriptor for the hookswitch status.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-get_hookswitchstate
     */
    get_HookSwitchState(HookSwitchDevice) {
        result := ComCall(22, this, "int", HookSwitchDevice, "int*", &pHookSwitchState := 0, "HRESULT")
        return pHookSwitchState
    }

    /**
     * The put_HookSwitchState method sets the current hookswitch state for a particular hookswitch device on the phone.
     * @param {Integer} HookSwitchDevice The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_hook_switch_device">PHONE_HOOK_SWITCH_DEVICE</a> descriptor for the hookswitch type.
     * @param {Integer} HookSwitchState The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_hook_switch_state">PHONE_HOOK_SWITCH_STATE</a> descriptor for the hookswitch status.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-put_hookswitchstate
     */
    put_HookSwitchState(HookSwitchDevice, HookSwitchState) {
        result := ComCall(23, this, "int", HookSwitchDevice, "int", HookSwitchState, "HRESULT")
        return result
    }

    /**
     * The put_RingMode method requests that the phone change its ring mode.
     * @param {Integer} lRingMode Ring mode.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-put_ringmode
     */
    put_RingMode(lRingMode) {
        result := ComCall(24, this, "int", lRingMode, "HRESULT")
        return result
    }

    /**
     * The get_RingMode method retrieves the current ring mode for the phone.
     * @returns {Integer} Phone ring mode.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-get_ringmode
     */
    get_RingMode() {
        result := ComCall(25, this, "int*", &plRingMode := 0, "HRESULT")
        return plRingMode
    }

    /**
     * The put_RingVolume method requests that the phone change its ring volume.
     * @param {Integer} lRingVolume Phone volume. For more information, see the following Remarks section.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-put_ringvolume
     */
    put_RingVolume(lRingVolume) {
        result := ComCall(26, this, "int", lRingVolume, "HRESULT")
        return result
    }

    /**
     * The get_RingVolume method retrieves the current ring volume for the phone.
     * @returns {Integer} Ring volume.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-get_ringvolume
     */
    get_RingVolume() {
        result := ComCall(27, this, "int*", &plRingVolume := 0, "HRESULT")
        return plRingVolume
    }

    /**
     * The get_Privilege method retrieves the privilege of the open phone.
     * @returns {Integer} The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_privilege">PHONE_PRIVILEGE</a> descriptor for the application's privilege status with respect to the phone device.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-get_privilege
     */
    get_Privilege() {
        result := ComCall(28, this, "int*", &pPrivilege := 0, "HRESULT")
        return pPrivilege
    }

    /**
     * The GetPhoneCapsBuffer method gets a buffer capability/information about the phone, based on the PHONECAPS_BUFFER enum passed in.
     * @param {Integer} pcbCaps The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phonecaps_buffer">PHONECAPS_BUFFER</a> descriptor for the phone capability.
     * @param {Pointer<Integer>} pdwSize Size of the buffer, in bytes.
     * @param {Pointer<Pointer<Integer>>} ppPhoneCapsBuffer Pointer to the buffer containing the values.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-getphonecapsbuffer
     */
    GetPhoneCapsBuffer(pcbCaps, pdwSize, ppPhoneCapsBuffer) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        ppPhoneCapsBufferMarshal := ppPhoneCapsBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(29, this, "int", pcbCaps, pdwSizeMarshal, pdwSize, ppPhoneCapsBufferMarshal, ppPhoneCapsBuffer, "HRESULT")
        return result
    }

    /**
     * The get_PhoneCapsBuffer method gets a buffer capability/information about the phone, based on the PHONECAPS_BUFFER enum passed in.
     * @param {Integer} pcbCaps The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phonecaps_buffer">PHONECAPS_BUFFER</a> descriptor for the phone capability.
     * @returns {VARIANT} Pointer to VARIANT containing the capability value.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-get_phonecapsbuffer
     */
    get_PhoneCapsBuffer(pcbCaps) {
        pVarBuffer := VARIANT()
        result := ComCall(30, this, "int", pcbCaps, "ptr", pVarBuffer, "HRESULT")
        return pVarBuffer
    }

    /**
     * The get_LampMode method gets the current lamp mode for the given lamp.
     * @param {Integer} lLampID Lamp identifier.
     * @returns {Integer} The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_lamp_mode">PHONE_LAMP_MODE</a> descriptor for the phone's lamp status.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-get_lampmode
     */
    get_LampMode(lLampID) {
        result := ComCall(31, this, "int", lLampID, "int*", &pLampMode := 0, "HRESULT")
        return pLampMode
    }

    /**
     * The put_LampMode method sets the current lamp mode for the given lamp.
     * @param {Integer} lLampID Lamp identifier.
     * @param {Integer} LampMode The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_lamp_mode">PHONE_LAMP_MODE</a> descriptor for the phone's lamp status.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-put_lampmode
     */
    put_LampMode(lLampID, LampMode) {
        result := ComCall(32, this, "int", lLampID, "int", LampMode, "HRESULT")
        return result
    }

    /**
     * The get_Display method gets the display for the phone. In TAPI, the display is simply an NxM character buffer.
     * @returns {BSTR} The <b>BSTR</b> representation of the phone display. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The <b>BSTR</b> argument should be deallocated by the client.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-get_display
     */
    get_Display() {
        pbstrDisplay := BSTR()
        result := ComCall(33, this, "ptr", pbstrDisplay, "HRESULT")
        return pbstrDisplay
    }

    /**
     * The SetDisplay method sets what will appear in a given row and column of the phone's display.
     * @param {Integer} lRow Display row.
     * @param {Integer} lColumn Display column.
     * @param {BSTR} bstrDisplay The <b>BSTR</b> representation of the value to display.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-setdisplay
     */
    SetDisplay(lRow, lColumn, bstrDisplay) {
        bstrDisplay := bstrDisplay is String ? BSTR.Alloc(bstrDisplay).Value : bstrDisplay

        result := ComCall(34, this, "int", lRow, "int", lColumn, "ptr", bstrDisplay, "HRESULT")
        return result
    }

    /**
     * The get_PreferredAddresses method returns a collection of addresses that the phone is preferred for use on. The application does not have to call ITPhone::Open before executing this method.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface pointers.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-get_preferredaddresses
     */
    get_PreferredAddresses() {
        pAddresses := VARIANT()
        result := ComCall(35, this, "ptr", pAddresses, "HRESULT")
        return pAddresses
    }

    /**
     * The EnumeratePreferredAddresses method enumerates the preferred addresses for the phone object. The application does not have to call ITPhone::Open before executing this method.
     * @returns {IEnumAddress} Pointer to a location where, on success, the method places a pointer to an enumeration object that contains the list of addresses. For more information, see the following Remarks section.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-enumeratepreferredaddresses
     */
    EnumeratePreferredAddresses() {
        result := ComCall(36, this, "ptr*", &ppEnumAddress := 0, "HRESULT")
        return IEnumAddress(ppEnumAddress)
    }

    /**
     * The DeviceSpecific method enables service providers to provide access to device specific features not offered by other TAPI functions.
     * @param {Pointer<Integer>} pParams Pointer to a memory area used to hold a parameter block. The format of this parameter block is device specific; TAPI passes its contents between the application and the service provider.
     * @param {Integer} dwSize The size, in bytes, of the parameter block area.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pParams</i> parameter is not a valid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-devicespecific
     */
    DeviceSpecific(pParams, dwSize) {
        pParamsMarshal := pParams is VarRef ? "char*" : "ptr"

        result := ComCall(37, this, pParamsMarshal, pParams, "uint", dwSize, "HRESULT")
        return result
    }

    /**
     * The DeviceSpecificVariant method enables service providers to provide access to features not offered by other TAPI functions.
     * @param {VARIANT} varDevSpecificByteArray VARIANT containing the parameter block. The format of this parameter block is device specific; TAPI passes its contents between the application and the service provider.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory exists to perform the operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-devicespecificvariant
     */
    DeviceSpecificVariant(varDevSpecificByteArray) {
        result := ComCall(38, this, "ptr", varDevSpecificByteArray, "HRESULT")
        return result
    }

    /**
     * The NegotiateExtVersion method allows an application to negotiate an extension version to use with the specified phone device. This operation need not be called if the application does not support provider specific extensions.
     * @param {Integer} lLowVersion Least recent extension version of the extension identifier returned by 
     * <b>NegotiateExtVersion</b> that the application is compliant with. The high-order word is the major version number; the low-order word is the minor version number.
     * @param {Integer} lHighVersion Most recent extension version of the extension identifier returned by 
     * <b>NegotiateExtVersion</b> that the application is compliant with. The high-order word is the major version number; the low-order word is the minor version number.
     * @returns {Integer} Pointer to a <b>long</b> that contains the extension version number that was negotiated. If negotiation succeeds, this number is in the range between <i>lLowVersion</i> and <i>lHighVersion</i>.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itphone-negotiateextversion
     */
    NegotiateExtVersion(lLowVersion, lHighVersion) {
        result := ComCall(39, this, "int", lLowVersion, "int", lHighVersion, "int*", &plExtVersion := 0, "HRESULT")
        return plExtVersion
    }
}
