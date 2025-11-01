#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Integer} Privilege 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-open
     */
    Open(Privilege) {
        result := ComCall(7, this, "int", Privilege, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-close
     */
    Close() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pAddresses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_addresses
     */
    get_Addresses(pAddresses) {
        result := ComCall(9, this, "ptr", pAddresses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumAddress>} ppEnumAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-enumerateaddresses
     */
    EnumerateAddresses(ppEnumAddress) {
        result := ComCall(10, this, "ptr*", ppEnumAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pclCap 
     * @param {Pointer<Integer>} plCapability 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_phonecapslong
     */
    get_PhoneCapsLong(pclCap, plCapability) {
        result := ComCall(11, this, "int", pclCap, "int*", plCapability, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pcsCap 
     * @param {Pointer<BSTR>} ppCapability 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_phonecapsstring
     */
    get_PhoneCapsString(pcsCap, ppCapability) {
        result := ComCall(12, this, "int", pcsCap, "ptr", ppCapability, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITAddress} pAddress 
     * @param {Pointer<VARIANT>} pTerminals 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_terminals
     */
    get_Terminals(pAddress, pTerminals) {
        result := ComCall(13, this, "ptr", pAddress, "ptr", pTerminals, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITAddress} pAddress 
     * @param {Pointer<IEnumTerminal>} ppEnumTerminal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-enumerateterminals
     */
    EnumerateTerminals(pAddress, ppEnumTerminal) {
        result := ComCall(14, this, "ptr", pAddress, "ptr*", ppEnumTerminal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lButtonID 
     * @param {Pointer<Integer>} pButtonMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_buttonmode
     */
    get_ButtonMode(lButtonID, pButtonMode) {
        result := ComCall(15, this, "int", lButtonID, "int*", pButtonMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lButtonID 
     * @param {Integer} ButtonMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-put_buttonmode
     */
    put_ButtonMode(lButtonID, ButtonMode) {
        result := ComCall(16, this, "int", lButtonID, "int", ButtonMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lButtonID 
     * @param {Pointer<Integer>} pButtonFunction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_buttonfunction
     */
    get_ButtonFunction(lButtonID, pButtonFunction) {
        result := ComCall(17, this, "int", lButtonID, "int*", pButtonFunction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lButtonID 
     * @param {Integer} ButtonFunction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-put_buttonfunction
     */
    put_ButtonFunction(lButtonID, ButtonFunction) {
        result := ComCall(18, this, "int", lButtonID, "int", ButtonFunction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lButtonID 
     * @param {Pointer<BSTR>} ppButtonText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_buttontext
     */
    get_ButtonText(lButtonID, ppButtonText) {
        result := ComCall(19, this, "int", lButtonID, "ptr", ppButtonText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lButtonID 
     * @param {BSTR} bstrButtonText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-put_buttontext
     */
    put_ButtonText(lButtonID, bstrButtonText) {
        bstrButtonText := bstrButtonText is String ? BSTR.Alloc(bstrButtonText).Value : bstrButtonText

        result := ComCall(20, this, "int", lButtonID, "ptr", bstrButtonText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lButtonID 
     * @param {Pointer<Integer>} pButtonState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_buttonstate
     */
    get_ButtonState(lButtonID, pButtonState) {
        result := ComCall(21, this, "int", lButtonID, "int*", pButtonState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} HookSwitchDevice 
     * @param {Pointer<Integer>} pHookSwitchState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_hookswitchstate
     */
    get_HookSwitchState(HookSwitchDevice, pHookSwitchState) {
        result := ComCall(22, this, "int", HookSwitchDevice, "int*", pHookSwitchState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} HookSwitchDevice 
     * @param {Integer} HookSwitchState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-put_hookswitchstate
     */
    put_HookSwitchState(HookSwitchDevice, HookSwitchState) {
        result := ComCall(23, this, "int", HookSwitchDevice, "int", HookSwitchState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lRingMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-put_ringmode
     */
    put_RingMode(lRingMode) {
        result := ComCall(24, this, "int", lRingMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plRingMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_ringmode
     */
    get_RingMode(plRingMode) {
        result := ComCall(25, this, "int*", plRingMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lRingVolume 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-put_ringvolume
     */
    put_RingVolume(lRingVolume) {
        result := ComCall(26, this, "int", lRingVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plRingVolume 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_ringvolume
     */
    get_RingVolume(plRingVolume) {
        result := ComCall(27, this, "int*", plRingVolume, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pPrivilege 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_privilege
     */
    get_Privilege(pPrivilege) {
        result := ComCall(28, this, "int*", pPrivilege, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pcbCaps 
     * @param {Pointer<Integer>} pdwSize 
     * @param {Pointer<Pointer<Integer>>} ppPhoneCapsBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-getphonecapsbuffer
     */
    GetPhoneCapsBuffer(pcbCaps, pdwSize, ppPhoneCapsBuffer) {
        result := ComCall(29, this, "int", pcbCaps, "uint*", pdwSize, "ptr*", ppPhoneCapsBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pcbCaps 
     * @param {Pointer<VARIANT>} pVarBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_phonecapsbuffer
     */
    get_PhoneCapsBuffer(pcbCaps, pVarBuffer) {
        result := ComCall(30, this, "int", pcbCaps, "ptr", pVarBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lLampID 
     * @param {Pointer<Integer>} pLampMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_lampmode
     */
    get_LampMode(lLampID, pLampMode) {
        result := ComCall(31, this, "int", lLampID, "int*", pLampMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lLampID 
     * @param {Integer} LampMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-put_lampmode
     */
    put_LampMode(lLampID, LampMode) {
        result := ComCall(32, this, "int", lLampID, "int", LampMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDisplay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_display
     */
    get_Display(pbstrDisplay) {
        result := ComCall(33, this, "ptr", pbstrDisplay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lRow 
     * @param {Integer} lColumn 
     * @param {BSTR} bstrDisplay 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-setdisplay
     */
    SetDisplay(lRow, lColumn, bstrDisplay) {
        bstrDisplay := bstrDisplay is String ? BSTR.Alloc(bstrDisplay).Value : bstrDisplay

        result := ComCall(34, this, "int", lRow, "int", lColumn, "ptr", bstrDisplay, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pAddresses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_preferredaddresses
     */
    get_PreferredAddresses(pAddresses) {
        result := ComCall(35, this, "ptr", pAddresses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumAddress>} ppEnumAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-enumeratepreferredaddresses
     */
    EnumeratePreferredAddresses(ppEnumAddress) {
        result := ComCall(36, this, "ptr*", ppEnumAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pParams 
     * @param {Integer} dwSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-devicespecific
     */
    DeviceSpecific(pParams, dwSize) {
        result := ComCall(37, this, "char*", pParams, "uint", dwSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} varDevSpecificByteArray 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-devicespecificvariant
     */
    DeviceSpecificVariant(varDevSpecificByteArray) {
        result := ComCall(38, this, "ptr", varDevSpecificByteArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lLowVersion 
     * @param {Integer} lHighVersion 
     * @param {Pointer<Integer>} plExtVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-negotiateextversion
     */
    NegotiateExtVersion(lLowVersion, lHighVersion, plExtVersion) {
        result := ComCall(39, this, "int", lLowVersion, "int", lHighVersion, "int*", plExtVersion, "HRESULT")
        return result
    }
}
