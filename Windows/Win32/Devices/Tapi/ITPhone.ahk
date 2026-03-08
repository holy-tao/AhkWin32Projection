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
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itphone
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
     * @remarks
     * While a phone is open, the application receives events pertaining to the phone.
     * 
     * Also, a phone must be open with owner privilege for the application to set the state of the phone. Querying the state of the phone can typically be done even if the phone is not open; for more details, see the individual methods of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itphone">ITPhone</a> interface.
     * @param {Integer} Privilege The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_privilege">PHONE_PRIVILEGE</a> descriptor for the application's privilege status with respect to the phone device.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-open
     */
    Open(Privilege) {
        result := ComCall(7, this, "int", Privilege, "HRESULT")
        return result
    }

    /**
     * The Close method closes this phone device. The phone device remains closed until the application calls the ITPhone::Open method. For more information, see the following Remarks section.
     * @remarks
     * While a phone is closed, the application does not receive events pertaining to the phone.
     * 
     * A phone must be open with owner privilege for the application to set the state of the phone. Querying the state of the phone can typically be done even if the phone is not open; for more details, see the individual methods of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itphone">ITPhone</a> interface.
     * 
     * After the phone device has been successfully closed, any 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itautomatedphonecontrol">ITAutomatedPhoneControl</a> interface pointer obtained for this phone object is no longer valid.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-close
     */
    Close() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * The get_Addresses method returns a collection of addresses that the phone can be used on. The application does not have to call ITPhone::Open before executing this method.
     * @remarks
     * A phone device declares itself as being available on all addresses that support audio terminals by the TSP setting the PHONEFEATURE_GENERICPHONE bit in the <b>dwPhoneFeatures</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonecaps">PHONECAPS</a> structure. A phone device can also declare itself as being preferred to an address or set of addresses by returning address/line IDs using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonegetid">phoneGetID</a> with device class tapi/line. The 
     * <b>get_Addresses</b> method returns addresses that have been identified both ways.
     * 
     * To get only addresses that the phone is preferred on, you can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itphone-get_preferredaddresses">get_PreferredAddresses</a> method.
     * 
     * The application does not have to call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itphone-open">ITPhone::Open</a> method before calling 
     * <b>get_Addresses</b>. This is because the implementation of the phone object can open the phone and call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonegetid">phoneGetID</a> during TAPI initialization or when a new phone object appears.
     * 
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface returned by <b>ITPhone::get_Addresses</b>. The application must call <b>Release</b> on the 
     * <b>ITAddress</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to a VARIANT containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface pointers.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_addresses
     */
    get_Addresses() {
        pAddresses := VARIANT()
        result := ComCall(9, this, "ptr", pAddresses, "HRESULT")
        return pAddresses
    }

    /**
     * The EnumerateAddresses method enumerates the addresses that the phone can be used on. The application does not have to call ITPhone::Open before executing this method.
     * @remarks
     * If no phones are available for use with the address, this method produces an empty enumeration and returns S_OK.
     * 
     * A phone device declares itself as being available on all addresses that support audio terminals by the TSP setting the PHONEFEATURE_GENERICPHONE bit in the <b>dwPhoneFeatures</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-phonecaps">PHONECAPS</a> structure. A phone device can also declare itself as being preferred to an address or set of addresses by returning address/line IDs using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonegetid">phoneGetID</a> with device class tapi/line. The 
     * <b>EnumerateAddresses</b> method returns addresses that have been identified both ways.
     * 
     * To get only addresses that the phone is preferred on, you can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itphone-enumeratepreferredaddresses">EnumeratePreferredAddresses</a> method.
     * 
     * A phone device declares itself as being specific to an address or set of addresses by returning address/line IDs using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonegetid">phoneGetID</a> with device class tapi/line. Although the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonegetid">phoneGetID</a> function requires the handle to an open phone device, the application does not have to call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itphone-open">ITPhone::Open</a> method before calling 
     * <b>EnumerateAddresses</b>. This is because the implementation of the phone object can open the phone and call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonegetid">phoneGetID</a> during TAPI initialization or when a new phone object appears.
     * 
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumaddress">IEnumAddress</a> interface returned by <b>ITPhone::EnumerateAddresses</b>. The application must call <b>Release</b> on the 
     * <b>IEnumAddress</b> interface to free resources associated with it.
     * @returns {IEnumAddress} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumaddress">IEnumAddress</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-enumerateaddresses
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_phonecapslong
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_phonecapsstring
     */
    get_PhoneCapsString(pcsCap) {
        ppCapability := BSTR()
        result := ComCall(12, this, "int", pcsCap, "ptr", ppCapability, "HRESULT")
        return ppCapability
    }

    /**
     * The get_Terminals method retrieves a collection of terminals that are associated with the phone. The application does not have to call ITPhone::Open before executing this method.
     * @remarks
     * If no terminals are associated with the phone, this method produces an empty collection and returns S_OK.
     * 
     * The application does not have to call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itphone-open">ITPhone::Open</a> method before calling 
     * <b>get_Terminals</b>. This is because the implementation of the phone object can open the phone and call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonegetid">phoneGetID</a> during TAPI initialization or when a new phone object appears.
     * 
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface returned by <b>ITPhone::get_Terminals</b>. The application must call <b>Release</b> on the 
     * <b>ITAddress</b> interface to free resources associated with it.
     * @param {ITAddress} pAddress Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itterminal">ITTerminal</a> interface pointers.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_terminals
     */
    get_Terminals(pAddress) {
        pTerminals := VARIANT()
        result := ComCall(13, this, "ptr", pAddress, "ptr", pTerminals, "HRESULT")
        return pTerminals
    }

    /**
     * The EnumerateTerminals method retrieves an enumeration of terminals that are associated with the phone. The application does not have to call ITPhone::Open before executing this method.
     * @remarks
     * If no terminals are associated with the phone, this method produces an empty enumeration and returns S_OK.
     * 
     * Although the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonegetid">phoneGetID</a> function requires the handle to an open phone device, the application does not have to call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itphone-open">ITPhone::Open</a> method before calling 
     * <b>EnumerateTerminals</b>. This is because the implementation of the phone object can open the phone and call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonegetid">phoneGetID</a> during TAPI initialization or when a new phone object appears.
     * 
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumterminal">IEnumTerminal</a> interface returned by <b>ITPhone::EnumerateTerminals</b>. The application must call <b>Release</b> on the 
     * <b>IEnumTerminal</b> interface to free resources associated with it.
     * @param {ITAddress} pAddress Pointer to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface.
     * @returns {IEnumTerminal} Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumterminal">IEnumTerminal</a> interface that enumerates terminals.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-enumerateterminals
     */
    EnumerateTerminals(pAddress) {
        result := ComCall(14, this, "ptr", pAddress, "ptr*", &ppEnumTerminal := 0, "HRESULT")
        return IEnumTerminal(ppEnumTerminal)
    }

    /**
     * The get_ButtonMode method retrieves the button mode associated with a particular button.
     * @remarks
     * See the description of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_button_mode">PHONE_BUTTON_MODE</a> enum and the TAPI 2.<i>x</i> documentation for more information about button modes.
     * 
     * The two following 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_button_mode">PHONE_BUTTON_MODE</a> values are of particular interest:
     * 
     * <ol>
     * <li>If the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_button_mode">PHONE_BUTTON_MODE</a> value is PBM_FEATURE, the application should call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itphone-get_buttonfunction">get_ButtonFunction</a> to retrieve the specific meaning of the button.</li>
     * <li>If the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_button_mode">PHONE_BUTTON_MODE</a> value is PBM_KEYPAD, the button is a keypad button whose value is indicated by the value of the <i>lButtonID</i> parameter. For example, if <i>lButtonID</i> == 10 then the button is the * (star) key on the keypad.</li>
     * </ol>
     * @param {Integer} lButtonID Button identifier. For more information, see the following Remarks section.
     * @returns {Integer} The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_button_mode">PHONE_BUTTON_MODE</a> descriptor for the button's mode.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_buttonmode
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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-put_buttonmode
     */
    put_ButtonMode(lButtonID, ButtonMode) {
        result := ComCall(16, this, "int", lButtonID, "int", ButtonMode, "HRESULT")
        return result
    }

    /**
     * The get_ButtonFunction method retrieves the button function associated with a particular button.
     * @remarks
     * See the description of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_button_function">PHONE_BUTTON_FUNCTION</a> enum for a list of possible button functions.
     * @param {Integer} lButtonID Button identifier.
     * @returns {Integer} The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_button_function">PHONE_BUTTON_FUNCTION</a> descriptor for the button's function.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_buttonfunction
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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-put_buttonfunction
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_buttontext
     */
    get_ButtonText(lButtonID) {
        ppButtonText := BSTR()
        result := ComCall(19, this, "int", lButtonID, "ptr", ppButtonText, "HRESULT")
        return ppButtonText
    }

    /**
     * The put_ButtonText method sets the button text.
     * @param {Integer} lButtonID Button identifier.
     * @param {BSTR} bstrButtonText The <b>BSTR</b> representation of the button text.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-put_buttontext
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_buttonstate
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_hookswitchstate
     */
    get_HookSwitchState(HookSwitchDevice) {
        result := ComCall(22, this, "int", HookSwitchDevice, "int*", &pHookSwitchState := 0, "HRESULT")
        return pHookSwitchState
    }

    /**
     * The put_HookSwitchState method sets the current hookswitch state for a particular hookswitch device on the phone.
     * @remarks
     * Typically, speakerphones and headsets have application-settable hookswitch states, and handsets do not, but this feature is TSP-dependent.
     * @param {Integer} HookSwitchDevice The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_hook_switch_device">PHONE_HOOK_SWITCH_DEVICE</a> descriptor for the hookswitch type.
     * @param {Integer} HookSwitchState The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_hook_switch_state">PHONE_HOOK_SWITCH_STATE</a> descriptor for the hookswitch status.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-put_hookswitchstate
     */
    put_HookSwitchState(HookSwitchDevice, HookSwitchState) {
        result := ComCall(23, this, "int", HookSwitchDevice, "int", HookSwitchState, "HRESULT")
        return result
    }

    /**
     * The put_RingMode method requests that the phone change its ring mode.
     * @param {Integer} lRingMode Ring mode.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-put_ringmode
     */
    put_RingMode(lRingMode) {
        result := ComCall(24, this, "int", lRingMode, "HRESULT")
        return result
    }

    /**
     * The get_RingMode method retrieves the current ring mode for the phone.
     * @returns {Integer} Phone ring mode.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_ringmode
     */
    get_RingMode() {
        result := ComCall(25, this, "int*", &plRingMode := 0, "HRESULT")
        return plRingMode
    }

    /**
     * The put_RingVolume method requests that the phone change its ring volume.
     * @remarks
     * If the phone is currently ringing (RingMode != 0), the new volume takes effect immediately. If the phone is not currently ringing (RingMode == 0), the new volume takes effect the next time the phone rings.
     * @param {Integer} lRingVolume Phone volume. For more information, see the following Remarks section.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-put_ringvolume
     */
    put_RingVolume(lRingVolume) {
        result := ComCall(26, this, "int", lRingVolume, "HRESULT")
        return result
    }

    /**
     * The get_RingVolume method retrieves the current ring volume for the phone.
     * @returns {Integer} Ring volume.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_ringvolume
     */
    get_RingVolume() {
        result := ComCall(27, this, "int*", &plRingVolume := 0, "HRESULT")
        return plRingVolume
    }

    /**
     * The get_Privilege method retrieves the privilege of the open phone.
     * @returns {Integer} The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/ne-tapi3if-phone_privilege">PHONE_PRIVILEGE</a> descriptor for the application's privilege status with respect to the phone device.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_privilege
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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-getphonecapsbuffer
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_phonecapsbuffer
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_lampmode
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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-put_lampmode
     */
    put_LampMode(lLampID, LampMode) {
        result := ComCall(32, this, "int", lLampID, "int", LampMode, "HRESULT")
        return result
    }

    /**
     * The get_Display method gets the display for the phone. In TAPI, the display is simply an NxM character buffer.
     * @returns {BSTR} The <b>BSTR</b> representation of the phone display. The <b>BSTR</b> is allocated using 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a>. The <b>BSTR</b> argument should be deallocated by the client.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_display
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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-setdisplay
     */
    SetDisplay(lRow, lColumn, bstrDisplay) {
        bstrDisplay := bstrDisplay is String ? BSTR.Alloc(bstrDisplay).Value : bstrDisplay

        result := ComCall(34, this, "int", lRow, "int", lColumn, "ptr", bstrDisplay, "HRESULT")
        return result
    }

    /**
     * The get_PreferredAddresses method returns a collection of addresses that the phone is preferred for use on. The application does not have to call ITPhone::Open before executing this method.
     * @remarks
     * If no usable addresses are present on the system, this method returns an empty collection.
     * 
     * A phone device declares itself as being preferred to an address or set of addresses by returning address/line IDs using the TAPI 2.x 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonegetid">phoneGetID</a> function with device class tapi/line.
     * 
     * Although the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonegetid">phoneGetID</a> function requires the handle to an open phone device, the application does not have to call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itphone-open">ITPhone::Open</a> method before calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itphone-enumeratepreferredaddresses">EnumeratePreferredAddresses</a>. This is because the implementation of the phone object can open the phone and call 
     * <b>phoneGetID</b> during TAPI initialization or when a new phone object appears.
     * 
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface returned by <b>ITPhone::get_PreferredAddresses</b>. The application must call <b>Release</b> on the 
     * <b>ITAddress</b> interface to free resources associated with it.
     * @returns {VARIANT} Pointer to a <b>VARIANT</b> containing an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itcollection">ITCollection</a> of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-itaddress">ITAddress</a> interface pointers.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_preferredaddresses
     */
    get_PreferredAddresses() {
        pAddresses := VARIANT()
        result := ComCall(35, this, "ptr", pAddresses, "HRESULT")
        return pAddresses
    }

    /**
     * The EnumeratePreferredAddresses method enumerates the preferred addresses for the phone object. The application does not have to call ITPhone::Open before executing this method.
     * @remarks
     * If there are no usable addresses present on the system, this method produces an empty enumeration and returns S_OK.
     * 
     * A phone device declares itself as being preferred to an address or set of addresses by returning address/line IDs using the TAPI 2.x 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonegetid">phoneGetID</a> function with device class tapi/line.
     * 
     * Although the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-phonegetid">phoneGetID</a> function requires the handle to an open phone device, the application does not have to call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nf-tapi3if-itphone-open">ITPhone::Open</a> method before calling 
     * <b>EnumeratePreferredAddresses</b>. This is because the implementation of the phone object can open the phone and call 
     * <b>phoneGetID</b> during TAPI initialization or when a new phone object appears.
     * 
     * TAPI calls the <b>AddRef</b> method on the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/tapi3if/nn-tapi3if-ienumaddress">IEnumAddress</a> interface returned by <b>ITPhone::EnumeratePreferredAddresses</b>. The application must call <b>Release</b> on the 
     * <b>IEnumAddress</b> interface to free resources associated with it.
     * @returns {IEnumAddress} Pointer to a location where, on success, the method places a pointer to an enumeration object that contains the list of addresses. For more information, see the following Remarks section.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-enumeratepreferredaddresses
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-devicespecific
     */
    DeviceSpecific(pParams, dwSize) {
        pParamsMarshal := pParams is VarRef ? "char*" : "ptr"

        result := ComCall(37, this, pParamsMarshal, pParams, "uint", dwSize, "HRESULT")
        return result
    }

    /**
     * The DeviceSpecificVariant method enables service providers to provide access to features not offered by other TAPI functions. (ITPhone.DeviceSpecificVariant)
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-devicespecificvariant
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-negotiateextversion
     */
    NegotiateExtVersion(lLowVersion, lHighVersion) {
        result := ComCall(39, this, "int", lLowVersion, "int", lHighVersion, "int*", &plExtVersion := 0, "HRESULT")
        return plExtVersion
    }
}
