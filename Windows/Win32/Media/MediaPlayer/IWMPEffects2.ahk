#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPEffects.ahk

/**
 * IWMPEffects2 interface
 * @see https://docs.microsoft.com/windows/win32/api//effects/nn-effects-iwmpeffects2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPEffects2 extends IWMPEffects{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPEffects2
     * @type {Guid}
     */
    static IID => Guid("{695386ec-aa3c-4618-a5e1-dd9a8b987632}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 14

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCore", "Create", "Destroy", "NotifyNewMedia", "OnWindowMessage", "RenderWindowed"]

    /**
     * 
     * @param {IWMPCore} pPlayer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects2-setcore
     */
    SetCore(pPlayer) {
        result := ComCall(14, this, "ptr", pPlayer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects2-create
     */
    Create(hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(15, this, "ptr", hwndParent, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects2-destroy
     */
    Destroy() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWMPMedia} pMedia 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects2-notifynewmedia
     */
    NotifyNewMedia(pMedia) {
        result := ComCall(17, this, "ptr", pMedia, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} msg 
     * @param {WPARAM} WParam 
     * @param {LPARAM} LParam 
     * @param {Pointer<LRESULT>} plResultParam 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects2-onwindowmessage
     */
    OnWindowMessage(msg, WParam, LParam, plResultParam) {
        result := ComCall(18, this, "uint", msg, "ptr", WParam, "ptr", LParam, "ptr", plResultParam, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TimedLevel>} pData 
     * @param {BOOL} fRequiredRender 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects2-renderwindowed
     */
    RenderWindowed(pData, fRequiredRender) {
        result := ComCall(19, this, "ptr", pData, "int", fRequiredRender, "HRESULT")
        return result
    }
}
