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
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_addresses
     */
    get_Addresses() {
        pAddresses := VARIANT()
        result := ComCall(9, this, "ptr", pAddresses, "HRESULT")
        return pAddresses
    }

    /**
     * 
     * @returns {IEnumAddress} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-enumerateaddresses
     */
    EnumerateAddresses() {
        result := ComCall(10, this, "ptr*", &ppEnumAddress := 0, "HRESULT")
        return IEnumAddress(ppEnumAddress)
    }

    /**
     * 
     * @param {Integer} pclCap 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_phonecapslong
     */
    get_PhoneCapsLong(pclCap) {
        result := ComCall(11, this, "int", pclCap, "int*", &plCapability := 0, "HRESULT")
        return plCapability
    }

    /**
     * 
     * @param {Integer} pcsCap 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_phonecapsstring
     */
    get_PhoneCapsString(pcsCap) {
        ppCapability := BSTR()
        result := ComCall(12, this, "int", pcsCap, "ptr", ppCapability, "HRESULT")
        return ppCapability
    }

    /**
     * 
     * @param {ITAddress} pAddress 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_terminals
     */
    get_Terminals(pAddress) {
        pTerminals := VARIANT()
        result := ComCall(13, this, "ptr", pAddress, "ptr", pTerminals, "HRESULT")
        return pTerminals
    }

    /**
     * 
     * @param {ITAddress} pAddress 
     * @returns {IEnumTerminal} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-enumerateterminals
     */
    EnumerateTerminals(pAddress) {
        result := ComCall(14, this, "ptr", pAddress, "ptr*", &ppEnumTerminal := 0, "HRESULT")
        return IEnumTerminal(ppEnumTerminal)
    }

    /**
     * 
     * @param {Integer} lButtonID 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_buttonmode
     */
    get_ButtonMode(lButtonID) {
        result := ComCall(15, this, "int", lButtonID, "int*", &pButtonMode := 0, "HRESULT")
        return pButtonMode
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_buttonfunction
     */
    get_ButtonFunction(lButtonID) {
        result := ComCall(17, this, "int", lButtonID, "int*", &pButtonFunction := 0, "HRESULT")
        return pButtonFunction
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_buttontext
     */
    get_ButtonText(lButtonID) {
        ppButtonText := BSTR()
        result := ComCall(19, this, "int", lButtonID, "ptr", ppButtonText, "HRESULT")
        return ppButtonText
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_buttonstate
     */
    get_ButtonState(lButtonID) {
        result := ComCall(21, this, "int", lButtonID, "int*", &pButtonState := 0, "HRESULT")
        return pButtonState
    }

    /**
     * 
     * @param {Integer} HookSwitchDevice 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_hookswitchstate
     */
    get_HookSwitchState(HookSwitchDevice) {
        result := ComCall(22, this, "int", HookSwitchDevice, "int*", &pHookSwitchState := 0, "HRESULT")
        return pHookSwitchState
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_ringmode
     */
    get_RingMode() {
        result := ComCall(25, this, "int*", &plRingMode := 0, "HRESULT")
        return plRingMode
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_ringvolume
     */
    get_RingVolume() {
        result := ComCall(27, this, "int*", &plRingVolume := 0, "HRESULT")
        return plRingVolume
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_privilege
     */
    get_Privilege() {
        result := ComCall(28, this, "int*", &pPrivilege := 0, "HRESULT")
        return pPrivilege
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
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"
        ppPhoneCapsBufferMarshal := ppPhoneCapsBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(29, this, "int", pcbCaps, pdwSizeMarshal, pdwSize, ppPhoneCapsBufferMarshal, ppPhoneCapsBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pcbCaps 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_phonecapsbuffer
     */
    get_PhoneCapsBuffer(pcbCaps) {
        pVarBuffer := VARIANT()
        result := ComCall(30, this, "int", pcbCaps, "ptr", pVarBuffer, "HRESULT")
        return pVarBuffer
    }

    /**
     * 
     * @param {Integer} lLampID 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_lampmode
     */
    get_LampMode(lLampID) {
        result := ComCall(31, this, "int", lLampID, "int*", &pLampMode := 0, "HRESULT")
        return pLampMode
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_display
     */
    get_Display() {
        pbstrDisplay := BSTR()
        result := ComCall(33, this, "ptr", pbstrDisplay, "HRESULT")
        return pbstrDisplay
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
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-get_preferredaddresses
     */
    get_PreferredAddresses() {
        pAddresses := VARIANT()
        result := ComCall(35, this, "ptr", pAddresses, "HRESULT")
        return pAddresses
    }

    /**
     * 
     * @returns {IEnumAddress} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-enumeratepreferredaddresses
     */
    EnumeratePreferredAddresses() {
        result := ComCall(36, this, "ptr*", &ppEnumAddress := 0, "HRESULT")
        return IEnumAddress(ppEnumAddress)
    }

    /**
     * 
     * @param {Pointer<Integer>} pParams 
     * @param {Integer} dwSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-devicespecific
     */
    DeviceSpecific(pParams, dwSize) {
        pParamsMarshal := pParams is VarRef ? "char*" : "ptr"

        result := ComCall(37, this, pParamsMarshal, pParams, "uint", dwSize, "HRESULT")
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itphone-negotiateextversion
     */
    NegotiateExtVersion(lLowVersion, lHighVersion) {
        result := ComCall(39, this, "int", lLowVersion, "int", lHighVersion, "int*", &plExtVersion := 0, "HRESULT")
        return plExtVersion
    }
}
