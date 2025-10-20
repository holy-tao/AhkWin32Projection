#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IMSVidCtl interface is the main interface for the Video Control.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidCtl)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msvidctl/nn-msvidctl-imsvidctl
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidCtl extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidCtl
     * @type {Guid}
     */
    static IID => Guid("{b0edf162-910a-11d2-b632-00c04f79498e}")

    /**
     * The class identifier for MSVidCtl
     * @type {Guid}
     */
    static CLSID => Guid("{b0edf163-910a-11d2-b632-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AutoSize", "put_AutoSize", "get_BackColor", "put_BackColor", "get_Enabled", "put_Enabled", "get_TabStop", "put_TabStop", "get_Window", "Refresh", "get_DisplaySize", "put_DisplaySize", "get_MaintainAspectRatio", "put_MaintainAspectRatio", "get_ColorKey", "put_ColorKey", "get_InputsAvailable", "get_OutputsAvailable", "get__InputsAvailable", "get__OutputsAvailable", "get_VideoRenderersAvailable", "get_AudioRenderersAvailable", "get_FeaturesAvailable", "get_InputActive", "put_InputActive", "get_OutputsActive", "put_OutputsActive", "get_VideoRendererActive", "put_VideoRendererActive", "get_AudioRendererActive", "put_AudioRendererActive", "get_FeaturesActive", "put_FeaturesActive", "get_State", "View", "Build", "Pause", "Run", "Stop", "Decompose", "DisableVideo", "DisableAudio", "ViewNext"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_autosize
     */
    get_AutoSize(pbool) {
        result := ComCall(7, this, "ptr", pbool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_autosize
     */
    put_AutoSize(vbool) {
        result := ComCall(8, this, "short", vbool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} backcolor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_backcolor
     */
    get_BackColor(backcolor) {
        result := ComCall(9, this, "uint*", backcolor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} backcolor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_backcolor
     */
    put_BackColor(backcolor) {
        result := ComCall(10, this, "uint", backcolor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_enabled
     */
    get_Enabled(pbool) {
        result := ComCall(11, this, "ptr", pbool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_enabled
     */
    put_Enabled(vbool) {
        result := ComCall(12, this, "short", vbool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_tabstop
     */
    get_TabStop(pbool) {
        result := ComCall(13, this, "ptr", pbool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_tabstop
     */
    put_TabStop(vbool) {
        result := ComCall(14, this, "short", vbool, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} phwnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_window
     */
    get_Window(phwnd) {
        result := ComCall(15, this, "ptr", phwnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-refresh
     */
    Refresh() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} CurrentValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_displaysize
     */
    get_DisplaySize(CurrentValue) {
        result := ComCall(17, this, "int*", CurrentValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NewValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_displaysize
     */
    put_DisplaySize(NewValue) {
        result := ComCall(18, this, "int", NewValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} CurrentValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_maintainaspectratio
     */
    get_MaintainAspectRatio(CurrentValue) {
        result := ComCall(19, this, "ptr", CurrentValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} NewValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_maintainaspectratio
     */
    put_MaintainAspectRatio(NewValue) {
        result := ComCall(20, this, "short", NewValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} CurrentValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_colorkey
     */
    get_ColorKey(CurrentValue) {
        result := ComCall(21, this, "uint*", CurrentValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} NewValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_colorkey
     */
    put_ColorKey(NewValue) {
        result := ComCall(22, this, "uint", NewValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} CategoryGuid 
     * @param {Pointer<IMSVidInputDevices>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_inputsavailable
     */
    get_InputsAvailable(CategoryGuid, pVal) {
        CategoryGuid := CategoryGuid is String ? BSTR.Alloc(CategoryGuid).Value : CategoryGuid

        result := ComCall(23, this, "ptr", CategoryGuid, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} CategoryGuid 
     * @param {Pointer<IMSVidOutputDevices>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_outputsavailable
     */
    get_OutputsAvailable(CategoryGuid, pVal) {
        CategoryGuid := CategoryGuid is String ? BSTR.Alloc(CategoryGuid).Value : CategoryGuid

        result := ComCall(24, this, "ptr", CategoryGuid, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} CategoryGuid 
     * @param {Pointer<IMSVidInputDevices>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get__inputsavailable
     */
    get__InputsAvailable(CategoryGuid, pVal) {
        result := ComCall(25, this, "ptr", CategoryGuid, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} CategoryGuid 
     * @param {Pointer<IMSVidOutputDevices>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get__outputsavailable
     */
    get__OutputsAvailable(CategoryGuid, pVal) {
        result := ComCall(26, this, "ptr", CategoryGuid, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidVideoRendererDevices>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_videorenderersavailable
     */
    get_VideoRenderersAvailable(pVal) {
        result := ComCall(27, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidAudioRendererDevices>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_audiorenderersavailable
     */
    get_AudioRenderersAvailable(pVal) {
        result := ComCall(28, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidFeatures>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_featuresavailable
     */
    get_FeaturesAvailable(pVal) {
        result := ComCall(29, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidInputDevice>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_inputactive
     */
    get_InputActive(pVal) {
        result := ComCall(30, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMSVidInputDevice} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_inputactive
     */
    put_InputActive(pVal) {
        result := ComCall(31, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidOutputDevices>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_outputsactive
     */
    get_OutputsActive(pVal) {
        result := ComCall(32, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMSVidOutputDevices} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_outputsactive
     */
    put_OutputsActive(pVal) {
        result := ComCall(33, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidVideoRenderer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_videorendereractive
     */
    get_VideoRendererActive(pVal) {
        result := ComCall(34, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMSVidVideoRenderer} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_videorendereractive
     */
    put_VideoRendererActive(pVal) {
        result := ComCall(35, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidAudioRenderer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_audiorendereractive
     */
    get_AudioRendererActive(pVal) {
        result := ComCall(36, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMSVidAudioRenderer} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_audiorendereractive
     */
    put_AudioRendererActive(pVal) {
        result := ComCall(37, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidFeatures>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_featuresactive
     */
    get_FeaturesActive(pVal) {
        result := ComCall(38, this, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMSVidFeatures} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_featuresactive
     */
    put_FeaturesActive(pVal) {
        result := ComCall(39, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_state
     */
    get_State(lState) {
        result := ComCall(40, this, "int*", lState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} v 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-view
     */
    View(v) {
        result := ComCall(41, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-build
     */
    Build() {
        result := ComCall(42, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-pause
     */
    Pause() {
        result := ComCall(43, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-run
     */
    Run() {
        result := ComCall(44, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-stop
     */
    Stop() {
        result := ComCall(45, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-decompose
     */
    Decompose() {
        result := ComCall(46, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-disablevideo
     */
    DisableVideo() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-disableaudio
     */
    DisableAudio() {
        result := ComCall(48, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} v 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-viewnext
     */
    ViewNext(v) {
        result := ComCall(49, this, "ptr", v, "HRESULT")
        return result
    }
}
