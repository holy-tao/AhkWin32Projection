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
     * 
     * @param {Integer} Privilege 
     * @returns {HRESULT} 
     */
    Open(Privilege) {
        result := ComCall(7, this, "int", Privilege, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pAddresses 
     * @returns {HRESULT} 
     */
    get_Addresses(pAddresses) {
        result := ComCall(9, this, "ptr", pAddresses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumAddress>} ppEnumAddress 
     * @returns {HRESULT} 
     */
    EnumerateAddresses(ppEnumAddress) {
        result := ComCall(10, this, "ptr", ppEnumAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pclCap 
     * @param {Pointer<Int32>} plCapability 
     * @returns {HRESULT} 
     */
    get_PhoneCapsLong(pclCap, plCapability) {
        result := ComCall(11, this, "int", pclCap, "int*", plCapability, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pcsCap 
     * @param {Pointer<BSTR>} ppCapability 
     * @returns {HRESULT} 
     */
    get_PhoneCapsString(pcsCap, ppCapability) {
        result := ComCall(12, this, "int", pcsCap, "ptr", ppCapability, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITAddress>} pAddress 
     * @param {Pointer<VARIANT>} pTerminals 
     * @returns {HRESULT} 
     */
    get_Terminals(pAddress, pTerminals) {
        result := ComCall(13, this, "ptr", pAddress, "ptr", pTerminals, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITAddress>} pAddress 
     * @param {Pointer<IEnumTerminal>} ppEnumTerminal 
     * @returns {HRESULT} 
     */
    EnumerateTerminals(pAddress, ppEnumTerminal) {
        result := ComCall(14, this, "ptr", pAddress, "ptr", ppEnumTerminal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lButtonID 
     * @param {Pointer<Int32>} pButtonMode 
     * @returns {HRESULT} 
     */
    get_ButtonMode(lButtonID, pButtonMode) {
        result := ComCall(15, this, "int", lButtonID, "int*", pButtonMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lButtonID 
     * @param {Integer} ButtonMode 
     * @returns {HRESULT} 
     */
    put_ButtonMode(lButtonID, ButtonMode) {
        result := ComCall(16, this, "int", lButtonID, "int", ButtonMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lButtonID 
     * @param {Pointer<Int32>} pButtonFunction 
     * @returns {HRESULT} 
     */
    get_ButtonFunction(lButtonID, pButtonFunction) {
        result := ComCall(17, this, "int", lButtonID, "int*", pButtonFunction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lButtonID 
     * @param {Integer} ButtonFunction 
     * @returns {HRESULT} 
     */
    put_ButtonFunction(lButtonID, ButtonFunction) {
        result := ComCall(18, this, "int", lButtonID, "int", ButtonFunction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lButtonID 
     * @param {Pointer<BSTR>} ppButtonText 
     * @returns {HRESULT} 
     */
    get_ButtonText(lButtonID, ppButtonText) {
        result := ComCall(19, this, "int", lButtonID, "ptr", ppButtonText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lButtonID 
     * @param {BSTR} bstrButtonText 
     * @returns {HRESULT} 
     */
    put_ButtonText(lButtonID, bstrButtonText) {
        bstrButtonText := bstrButtonText is String ? BSTR.Alloc(bstrButtonText).Value : bstrButtonText

        result := ComCall(20, this, "int", lButtonID, "ptr", bstrButtonText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lButtonID 
     * @param {Pointer<Int32>} pButtonState 
     * @returns {HRESULT} 
     */
    get_ButtonState(lButtonID, pButtonState) {
        result := ComCall(21, this, "int", lButtonID, "int*", pButtonState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} HookSwitchDevice 
     * @param {Pointer<Int32>} pHookSwitchState 
     * @returns {HRESULT} 
     */
    get_HookSwitchState(HookSwitchDevice, pHookSwitchState) {
        result := ComCall(22, this, "int", HookSwitchDevice, "int*", pHookSwitchState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} HookSwitchDevice 
     * @param {Integer} HookSwitchState 
     * @returns {HRESULT} 
     */
    put_HookSwitchState(HookSwitchDevice, HookSwitchState) {
        result := ComCall(23, this, "int", HookSwitchDevice, "int", HookSwitchState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lRingMode 
     * @returns {HRESULT} 
     */
    put_RingMode(lRingMode) {
        result := ComCall(24, this, "int", lRingMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plRingMode 
     * @returns {HRESULT} 
     */
    get_RingMode(plRingMode) {
        result := ComCall(25, this, "int*", plRingMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lRingVolume 
     * @returns {HRESULT} 
     */
    put_RingVolume(lRingVolume) {
        result := ComCall(26, this, "int", lRingVolume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plRingVolume 
     * @returns {HRESULT} 
     */
    get_RingVolume(plRingVolume) {
        result := ComCall(27, this, "int*", plRingVolume, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pPrivilege 
     * @returns {HRESULT} 
     */
    get_Privilege(pPrivilege) {
        result := ComCall(28, this, "int*", pPrivilege, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pcbCaps 
     * @param {Pointer<UInt32>} pdwSize 
     * @param {Pointer<Byte>} ppPhoneCapsBuffer 
     * @returns {HRESULT} 
     */
    GetPhoneCapsBuffer(pcbCaps, pdwSize, ppPhoneCapsBuffer) {
        result := ComCall(29, this, "int", pcbCaps, "uint*", pdwSize, "char*", ppPhoneCapsBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pcbCaps 
     * @param {Pointer<VARIANT>} pVarBuffer 
     * @returns {HRESULT} 
     */
    get_PhoneCapsBuffer(pcbCaps, pVarBuffer) {
        result := ComCall(30, this, "int", pcbCaps, "ptr", pVarBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lLampID 
     * @param {Pointer<Int32>} pLampMode 
     * @returns {HRESULT} 
     */
    get_LampMode(lLampID, pLampMode) {
        result := ComCall(31, this, "int", lLampID, "int*", pLampMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lLampID 
     * @param {Integer} LampMode 
     * @returns {HRESULT} 
     */
    put_LampMode(lLampID, LampMode) {
        result := ComCall(32, this, "int", lLampID, "int", LampMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDisplay 
     * @returns {HRESULT} 
     */
    get_Display(pbstrDisplay) {
        result := ComCall(33, this, "ptr", pbstrDisplay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lRow 
     * @param {Integer} lColumn 
     * @param {BSTR} bstrDisplay 
     * @returns {HRESULT} 
     */
    SetDisplay(lRow, lColumn, bstrDisplay) {
        bstrDisplay := bstrDisplay is String ? BSTR.Alloc(bstrDisplay).Value : bstrDisplay

        result := ComCall(34, this, "int", lRow, "int", lColumn, "ptr", bstrDisplay, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pAddresses 
     * @returns {HRESULT} 
     */
    get_PreferredAddresses(pAddresses) {
        result := ComCall(35, this, "ptr", pAddresses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumAddress>} ppEnumAddress 
     * @returns {HRESULT} 
     */
    EnumeratePreferredAddresses(ppEnumAddress) {
        result := ComCall(36, this, "ptr", ppEnumAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pParams 
     * @param {Integer} dwSize 
     * @returns {HRESULT} 
     */
    DeviceSpecific(pParams, dwSize) {
        result := ComCall(37, this, "char*", pParams, "uint", dwSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} varDevSpecificByteArray 
     * @returns {HRESULT} 
     */
    DeviceSpecificVariant(varDevSpecificByteArray) {
        result := ComCall(38, this, "ptr", varDevSpecificByteArray, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lLowVersion 
     * @param {Integer} lHighVersion 
     * @param {Pointer<Int32>} plExtVersion 
     * @returns {HRESULT} 
     */
    NegotiateExtVersion(lLowVersion, lHighVersion, plExtVersion) {
        result := ComCall(39, this, "int", lLowVersion, "int", lHighVersion, "int*", plExtVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
