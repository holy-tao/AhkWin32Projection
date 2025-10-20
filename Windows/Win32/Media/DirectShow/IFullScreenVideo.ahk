#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IFullScreenVideo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFullScreenVideo
     * @type {Guid}
     */
    static IID => Guid("{dd1d7110-7836-11cf-bf47-00aa0055595a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CountModes", "GetModeInfo", "GetCurrentMode", "IsModeAvailable", "IsModeEnabled", "SetEnabled", "GetClipFactor", "SetClipFactor", "SetMessageDrain", "GetMessageDrain", "SetMonitor", "GetMonitor", "HideOnDeactivate", "IsHideOnDeactivate", "SetCaption", "GetCaption", "SetDefault"]

    /**
     * 
     * @param {Pointer<Integer>} pModes 
     * @returns {HRESULT} 
     */
    CountModes(pModes) {
        result := ComCall(3, this, "int*", pModes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Mode 
     * @param {Pointer<Integer>} pWidth 
     * @param {Pointer<Integer>} pHeight 
     * @param {Pointer<Integer>} pDepth 
     * @returns {HRESULT} 
     */
    GetModeInfo(Mode, pWidth, pHeight, pDepth) {
        result := ComCall(4, this, "int", Mode, "int*", pWidth, "int*", pHeight, "int*", pDepth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMode 
     * @returns {HRESULT} 
     */
    GetCurrentMode(pMode) {
        result := ComCall(5, this, "int*", pMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     */
    IsModeAvailable(Mode) {
        result := ComCall(6, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Mode 
     * @returns {HRESULT} 
     */
    IsModeEnabled(Mode) {
        result := ComCall(7, this, "int", Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Mode 
     * @param {Integer} bEnabled 
     * @returns {HRESULT} 
     */
    SetEnabled(Mode, bEnabled) {
        result := ComCall(8, this, "int", Mode, "int", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pClipFactor 
     * @returns {HRESULT} 
     */
    GetClipFactor(pClipFactor) {
        result := ComCall(9, this, "int*", pClipFactor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ClipFactor 
     * @returns {HRESULT} 
     */
    SetClipFactor(ClipFactor) {
        result := ComCall(10, this, "int", ClipFactor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwnd 
     * @returns {HRESULT} 
     */
    SetMessageDrain(hwnd) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd

        result := ComCall(11, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} hwnd 
     * @returns {HRESULT} 
     */
    GetMessageDrain(hwnd) {
        result := ComCall(12, this, "ptr", hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Monitor 
     * @returns {HRESULT} 
     */
    SetMonitor(Monitor) {
        result := ComCall(13, this, "int", Monitor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Monitor 
     * @returns {HRESULT} 
     */
    GetMonitor(Monitor) {
        result := ComCall(14, this, "int*", Monitor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Hide 
     * @returns {HRESULT} 
     */
    HideOnDeactivate(Hide) {
        result := ComCall(15, this, "int", Hide, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsHideOnDeactivate() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strCaption 
     * @returns {HRESULT} 
     */
    SetCaption(strCaption) {
        strCaption := strCaption is String ? BSTR.Alloc(strCaption).Value : strCaption

        result := ComCall(17, this, "ptr", strCaption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pstrCaption 
     * @returns {HRESULT} 
     */
    GetCaption(pstrCaption) {
        result := ComCall(18, this, "ptr", pstrCaption, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetDefault() {
        result := ComCall(19, this, "HRESULT")
        return result
    }
}
