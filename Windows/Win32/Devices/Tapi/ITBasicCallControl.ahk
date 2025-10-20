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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Connect", "Answer", "Disconnect", "Hold", "HandoffDirect", "HandoffIndirect", "Conference", "Transfer", "BlindTransfer", "SwapHold", "ParkDirect", "ParkIndirect", "Unpark", "SetQOS", "Pickup", "Dial", "Finish", "RemoveFromConference"]

    /**
     * 
     * @param {VARIANT_BOOL} fSync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol-connect
     */
    Connect(fSync) {
        result := ComCall(7, this, "short", fSync, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol-answer
     */
    Answer() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} code 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol-disconnect
     */
    Disconnect(code) {
        result := ComCall(9, this, "int", code, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fHold 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol-hold
     */
    Hold(fHold) {
        result := ComCall(10, this, "short", fHold, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pApplicationName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol-handoffdirect
     */
    HandoffDirect(pApplicationName) {
        pApplicationName := pApplicationName is String ? BSTR.Alloc(pApplicationName).Value : pApplicationName

        result := ComCall(11, this, "ptr", pApplicationName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol-handoffindirect
     */
    HandoffIndirect(lMediaType) {
        result := ComCall(12, this, "int", lMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITBasicCallControl} pCall 
     * @param {VARIANT_BOOL} fSync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol-conference
     */
    Conference(pCall, fSync) {
        result := ComCall(13, this, "ptr", pCall, "short", fSync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITBasicCallControl} pCall 
     * @param {VARIANT_BOOL} fSync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol-transfer
     */
    Transfer(pCall, fSync) {
        result := ComCall(14, this, "ptr", pCall, "short", fSync, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pDestAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol-blindtransfer
     */
    BlindTransfer(pDestAddress) {
        pDestAddress := pDestAddress is String ? BSTR.Alloc(pDestAddress).Value : pDestAddress

        result := ComCall(15, this, "ptr", pDestAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITBasicCallControl} pCall 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol-swaphold
     */
    SwapHold(pCall) {
        result := ComCall(16, this, "ptr", pCall, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pParkAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol-parkdirect
     */
    ParkDirect(pParkAddress) {
        pParkAddress := pParkAddress is String ? BSTR.Alloc(pParkAddress).Value : pParkAddress

        result := ComCall(17, this, "ptr", pParkAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppNonDirAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol-parkindirect
     */
    ParkIndirect(ppNonDirAddress) {
        result := ComCall(18, this, "ptr", ppNonDirAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol-unpark
     */
    Unpark() {
        result := ComCall(19, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lMediaType 
     * @param {Integer} ServiceLevel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol-setqos
     */
    SetQOS(lMediaType, ServiceLevel) {
        result := ComCall(20, this, "int", lMediaType, "int", ServiceLevel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pGroupID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol-pickup
     */
    Pickup(pGroupID) {
        pGroupID := pGroupID is String ? BSTR.Alloc(pGroupID).Value : pGroupID

        result := ComCall(21, this, "ptr", pGroupID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} pDestAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol-dial
     */
    Dial(pDestAddress) {
        pDestAddress := pDestAddress is String ? BSTR.Alloc(pDestAddress).Value : pDestAddress

        result := ComCall(22, this, "ptr", pDestAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} finishMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol-finish
     */
    Finish(finishMode) {
        result := ComCall(23, this, "int", finishMode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itbasiccallcontrol-removefromconference
     */
    RemoveFromConference() {
        result := ComCall(24, this, "HRESULT")
        return result
    }
}
