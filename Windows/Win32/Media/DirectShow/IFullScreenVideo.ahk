#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
class IFullScreenVideo extends IUnknown {

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
     * @returns {Integer} 
     */
    CountModes() {
        result := ComCall(3, this, "int*", &pModes := 0, "HRESULT")
        return pModes
    }

    /**
     * 
     * @param {Integer} _Mode 
     * @param {Pointer<Integer>} pWidth 
     * @param {Pointer<Integer>} pHeight 
     * @param {Pointer<Integer>} pDepth 
     * @returns {HRESULT} 
     */
    GetModeInfo(_Mode, pWidth, pHeight, pDepth) {
        pWidthMarshal := pWidth is VarRef ? "int*" : "ptr"
        pHeightMarshal := pHeight is VarRef ? "int*" : "ptr"
        pDepthMarshal := pDepth is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "int", _Mode, pWidthMarshal, pWidth, pHeightMarshal, pHeight, pDepthMarshal, pDepth, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCurrentMode() {
        result := ComCall(5, this, "int*", &pMode := 0, "HRESULT")
        return pMode
    }

    /**
     * 
     * @param {Integer} _Mode 
     * @returns {HRESULT} 
     */
    IsModeAvailable(_Mode) {
        result := ComCall(6, this, "int", _Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _Mode 
     * @returns {HRESULT} 
     */
    IsModeEnabled(_Mode) {
        result := ComCall(7, this, "int", _Mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} _Mode 
     * @param {Integer} bEnabled 
     * @returns {HRESULT} 
     */
    SetEnabled(_Mode, bEnabled) {
        result := ComCall(8, this, "int", _Mode, "int", bEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetClipFactor() {
        result := ComCall(9, this, "int*", &pClipFactor := 0, "HRESULT")
        return pClipFactor
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
     * @param {HWND} _hwnd 
     * @returns {HRESULT} 
     */
    SetMessageDrain(_hwnd) {
        _hwnd := _hwnd is Win32Handle ? NumGet(_hwnd, "ptr") : _hwnd

        result := ComCall(11, this, "ptr", _hwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HWND} 
     */
    GetMessageDrain() {
        _hwnd := HWND()
        result := ComCall(12, this, "ptr", _hwnd, "HRESULT")
        return _hwnd
    }

    /**
     * 
     * @param {Integer} _Monitor 
     * @returns {HRESULT} 
     */
    SetMonitor(_Monitor) {
        result := ComCall(13, this, "int", _Monitor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMonitor() {
        result := ComCall(14, this, "int*", &_Monitor := 0, "HRESULT")
        return _Monitor
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
     * @returns {BSTR} 
     */
    GetCaption() {
        pstrCaption := BSTR({Value: 0}, True)
        result := ComCall(18, this, "ptr", pstrCaption, "HRESULT")
        return pstrCaption
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
