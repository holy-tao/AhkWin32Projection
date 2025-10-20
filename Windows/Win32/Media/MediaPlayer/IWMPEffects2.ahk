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
     * 
     * @param {Pointer<IWMPCore>} pPlayer 
     * @returns {HRESULT} 
     */
    SetCore(pPlayer) {
        result := ComCall(14, this, "ptr", pPlayer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @returns {HRESULT} 
     */
    Create(hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(15, this, "ptr", hwndParent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Destroy() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMPMedia>} pMedia 
     * @returns {HRESULT} 
     */
    NotifyNewMedia(pMedia) {
        result := ComCall(17, this, "ptr", pMedia, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} msg 
     * @param {WPARAM} WParam 
     * @param {LPARAM} LParam 
     * @param {Pointer<LRESULT>} plResultParam 
     * @returns {HRESULT} 
     */
    OnWindowMessage(msg, WParam, LParam, plResultParam) {
        result := ComCall(18, this, "uint", msg, "ptr", WParam, "ptr", LParam, "ptr", plResultParam, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TimedLevel>} pData 
     * @param {BOOL} fRequiredRender 
     * @returns {HRESULT} 
     */
    RenderWindowed(pData, fRequiredRender) {
        result := ComCall(19, this, "ptr", pData, "int", fRequiredRender, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
