#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMPEffects.ahk

/**
 * IWMPEffects2 interface
 * @see https://learn.microsoft.com/windows/win32/api/effects/nn-effects-iwmpeffects2
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
     * The SetCore method is called by Windows Media Player to provide visualization access to the core Windows Media Player APIs.
     * @remarks
     * You can use this method to set or release a pointer to the <b>IWMPCore</b> interface. If <i>pPlayer</i> is <b>NULL</b>, the visualization is being shut down and all stored references to the core should be released.
     * 
     * This method is not called when Windows Media Player instantiates the visualization for the purpose of displaying its property page. This method can therefore be used as an entry point that will only be called when the visualization is enabled and Windows Media Player loads it normally.
     * @param {IWMPCore} pPlayer Pointer to an <b>IWMPCore</b> interface.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects2-setcore
     */
    SetCore(pPlayer) {
        result := ComCall(14, this, "ptr", pPlayer, "HRESULT")
        return result
    }

    /**
     * The Create method is called by Windows Media Player to instantiate a visualization window.
     * @remarks
     * A visualization that implements <b>IWMPEffects2</b> is rendered in its own window unless it will be displayed in a clipped device context, in which case it is rendered windowless. For a visualization that is rendered windowless, Windows Media Player calls this method with a <b>NULL</b> value for the <i>hwndParent</i> parameter. If your visualization does not support windowless mode (for example, when using Direct3D), it should return a failure <b>HRESULT</b> value. In this case, your visualization will not be available in skins that clip the display region.
     * 
     * If you create a visualization for Windows Media Player using the Direct3D® component of Microsoft DirectX®, you must set the <b>D3DCREATE_FPU_PRESERVE</b> flag when calling <b>IDirect3D8::CreateDevice</b>. Failure to set this flag for visualizations that use Direct3D may yield unexpected results.
     * @param {HWND} hwndParent <b>HWND</b> handle to the parent window hosting the visualization window.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects2-create
     */
    Create(hwndParent) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(15, this, "ptr", hwndParent, "HRESULT")
        return result
    }

    /**
     * The Destroy method is called by Windows Media Player to destroy a visualization window instantiated in the Create method.
     * @remarks
     * This method is used only by windowed visualizations. Windowless visualizations should simply return S_OK.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects2-destroy
     */
    Destroy() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * The NotifyNewMedia method is called by Windows Media Player to inform the visualization that a new media item has been loaded.
     * @param {IWMPMedia} pMedia Pointer to an <b>IWMPMedia</b> interface that represents the new media item.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects2-notifynewmedia
     */
    NotifyNewMedia(pMedia) {
        result := ComCall(17, this, "ptr", pMedia, "HRESULT")
        return result
    }

    /**
     * The OnWindowMessage method is called by Windows Media Player to pass window messages to a visualization.
     * @remarks
     * Your implementation must only return S_OK if it has handled the window message. If it has not handled the window message, it should return S_FALSE. If this method is not implemented, return E_NOTIMPL.
     * @param {Integer} msg <b>UINT</b> that identifies the window message.
     * @param {WPARAM} WParam <b>WPARAM</b> specifying a window message parameter.
     * @param {LPARAM} LParam <b>LPARAM</b> specifying a window message parameter.
     * @param {Pointer<LRESULT>} plResultParam Pointer to an <b>LRESULT</b> specifying the result code for the window message.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects2-onwindowmessage
     */
    OnWindowMessage(msg, WParam, LParam, plResultParam) {
        plResultParamMarshal := plResultParam is VarRef ? "ptr*" : "ptr"

        result := ComCall(18, this, "uint", msg, "ptr", WParam, "ptr", LParam, plResultParamMarshal, plResultParam, "HRESULT")
        return result
    }

    /**
     * The RenderWindowed method is called by Windows Media Player to render a windowed visualization.
     * @remarks
     * This method is used to render windowed visualizations. Windowless visualizations should return S_OK and use the <b>IWMPEffects::Render</b> method instead.
     * 
     * The <i>fRequiredRender</i> parameter informs you that your visualization must repaint itself, for example, when another window is dragged over it. When this value is false, you can safely skip over the rendering code if the current media item is stopped or paused. This lets you avoid consuming CPU cycles unnecessarily.
     * @param {Pointer<TimedLevel>} pData Pointer to a <b>TimedLevel</b> structure specifying rendering information.
     * @param {BOOL} fRequiredRender <b>BOOL</b> indicating whether the visualization must paint itself.
     * @returns {HRESULT} This method returns an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/effects/nf-effects-iwmpeffects2-renderwindowed
     */
    RenderWindowed(pData, fRequiredRender) {
        result := ComCall(19, this, "ptr", pData, "int", fRequiredRender, "HRESULT")
        return result
    }
}
