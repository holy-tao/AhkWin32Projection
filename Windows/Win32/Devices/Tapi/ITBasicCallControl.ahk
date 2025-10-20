#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITBasicCallControl interface is used by the application to connect, answer, and perform basic telephony operations on a call object.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itbasiccallcontrol
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITBasicCallControl extends IDispatch{
    /**
     * The interface identifier for ITBasicCallControl
     * @type {Guid}
     */
    static IID => Guid("{b1efc389-9355-11d0-835c-00aa003ccabd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {VARIANT_BOOL} fSync 
     * @returns {HRESULT} 
     */
    Connect(fSync) {
        result := ComCall(7, this, "short", fSync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Answer() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} code 
     * @returns {HRESULT} 
     */
    Disconnect(code) {
        result := ComCall(9, this, "int", code, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fHold 
     * @returns {HRESULT} 
     */
    Hold(fHold) {
        result := ComCall(10, this, "short", fHold, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pApplicationName 
     * @returns {HRESULT} 
     */
    HandoffDirect(pApplicationName) {
        pApplicationName := pApplicationName is String ? BSTR.Alloc(pApplicationName).Value : pApplicationName

        result := ComCall(11, this, "ptr", pApplicationName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lMediaType 
     * @returns {HRESULT} 
     */
    HandoffIndirect(lMediaType) {
        result := ComCall(12, this, "int", lMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITBasicCallControl>} pCall 
     * @param {VARIANT_BOOL} fSync 
     * @returns {HRESULT} 
     */
    Conference(pCall, fSync) {
        result := ComCall(13, this, "ptr", pCall, "short", fSync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITBasicCallControl>} pCall 
     * @param {VARIANT_BOOL} fSync 
     * @returns {HRESULT} 
     */
    Transfer(pCall, fSync) {
        result := ComCall(14, this, "ptr", pCall, "short", fSync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pDestAddress 
     * @returns {HRESULT} 
     */
    BlindTransfer(pDestAddress) {
        pDestAddress := pDestAddress is String ? BSTR.Alloc(pDestAddress).Value : pDestAddress

        result := ComCall(15, this, "ptr", pDestAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITBasicCallControl>} pCall 
     * @returns {HRESULT} 
     */
    SwapHold(pCall) {
        result := ComCall(16, this, "ptr", pCall, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pParkAddress 
     * @returns {HRESULT} 
     */
    ParkDirect(pParkAddress) {
        pParkAddress := pParkAddress is String ? BSTR.Alloc(pParkAddress).Value : pParkAddress

        result := ComCall(17, this, "ptr", pParkAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppNonDirAddress 
     * @returns {HRESULT} 
     */
    ParkIndirect(ppNonDirAddress) {
        result := ComCall(18, this, "ptr", ppNonDirAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unpark() {
        result := ComCall(19, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lMediaType 
     * @param {Integer} ServiceLevel 
     * @returns {HRESULT} 
     */
    SetQOS(lMediaType, ServiceLevel) {
        result := ComCall(20, this, "int", lMediaType, "int", ServiceLevel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pGroupID 
     * @returns {HRESULT} 
     */
    Pickup(pGroupID) {
        pGroupID := pGroupID is String ? BSTR.Alloc(pGroupID).Value : pGroupID

        result := ComCall(21, this, "ptr", pGroupID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} pDestAddress 
     * @returns {HRESULT} 
     */
    Dial(pDestAddress) {
        pDestAddress := pDestAddress is String ? BSTR.Alloc(pDestAddress).Value : pDestAddress

        result := ComCall(22, this, "ptr", pDestAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} finishMode 
     * @returns {HRESULT} 
     */
    Finish(finishMode) {
        result := ComCall(23, this, "int", finishMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RemoveFromConference() {
        result := ComCall(24, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
