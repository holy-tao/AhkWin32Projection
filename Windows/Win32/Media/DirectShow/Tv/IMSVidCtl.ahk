#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include .\IMSVidInputDevices.ahk
#Include .\IMSVidOutputDevices.ahk
#Include .\IMSVidVideoRendererDevices.ahk
#Include .\IMSVidAudioRendererDevices.ahk
#Include .\IMSVidFeatures.ahk
#Include .\IMSVidInputDevice.ahk
#Include .\IMSVidVideoRenderer.ahk
#Include .\IMSVidAudioRenderer.ahk
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_autosize
     */
    get_AutoSize() {
        result := ComCall(7, this, "short*", &pbool := 0, "HRESULT")
        return pbool
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_backcolor
     */
    get_BackColor() {
        result := ComCall(9, this, "uint*", &backcolor := 0, "HRESULT")
        return backcolor
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_enabled
     */
    get_Enabled() {
        result := ComCall(11, this, "short*", &pbool := 0, "HRESULT")
        return pbool
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_tabstop
     */
    get_TabStop() {
        result := ComCall(13, this, "short*", &pbool := 0, "HRESULT")
        return pbool
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
     * @returns {HWND} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_window
     */
    get_Window() {
        phwnd := HWND()
        result := ComCall(15, this, "ptr", phwnd, "HRESULT")
        return phwnd
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_displaysize
     */
    get_DisplaySize() {
        result := ComCall(17, this, "int*", &CurrentValue := 0, "HRESULT")
        return CurrentValue
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
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_maintainaspectratio
     */
    get_MaintainAspectRatio() {
        result := ComCall(19, this, "short*", &CurrentValue := 0, "HRESULT")
        return CurrentValue
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_colorkey
     */
    get_ColorKey() {
        result := ComCall(21, this, "uint*", &CurrentValue := 0, "HRESULT")
        return CurrentValue
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
     * @returns {IMSVidInputDevices} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_inputsavailable
     */
    get_InputsAvailable(CategoryGuid) {
        CategoryGuid := CategoryGuid is String ? BSTR.Alloc(CategoryGuid).Value : CategoryGuid

        result := ComCall(23, this, "ptr", CategoryGuid, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidInputDevices(pVal)
    }

    /**
     * 
     * @param {BSTR} CategoryGuid 
     * @returns {IMSVidOutputDevices} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_outputsavailable
     */
    get_OutputsAvailable(CategoryGuid) {
        CategoryGuid := CategoryGuid is String ? BSTR.Alloc(CategoryGuid).Value : CategoryGuid

        result := ComCall(24, this, "ptr", CategoryGuid, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidOutputDevices(pVal)
    }

    /**
     * 
     * @param {Pointer<Guid>} CategoryGuid 
     * @returns {IMSVidInputDevices} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get__inputsavailable
     */
    get__InputsAvailable(CategoryGuid) {
        result := ComCall(25, this, "ptr", CategoryGuid, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidInputDevices(pVal)
    }

    /**
     * 
     * @param {Pointer<Guid>} CategoryGuid 
     * @returns {IMSVidOutputDevices} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get__outputsavailable
     */
    get__OutputsAvailable(CategoryGuid) {
        result := ComCall(26, this, "ptr", CategoryGuid, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidOutputDevices(pVal)
    }

    /**
     * 
     * @returns {IMSVidVideoRendererDevices} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_videorenderersavailable
     */
    get_VideoRenderersAvailable() {
        result := ComCall(27, this, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidVideoRendererDevices(pVal)
    }

    /**
     * 
     * @returns {IMSVidAudioRendererDevices} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_audiorenderersavailable
     */
    get_AudioRenderersAvailable() {
        result := ComCall(28, this, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidAudioRendererDevices(pVal)
    }

    /**
     * 
     * @returns {IMSVidFeatures} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_featuresavailable
     */
    get_FeaturesAvailable() {
        result := ComCall(29, this, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidFeatures(pVal)
    }

    /**
     * 
     * @returns {IMSVidInputDevice} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_inputactive
     */
    get_InputActive() {
        result := ComCall(30, this, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidInputDevice(pVal)
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
     * @returns {IMSVidOutputDevices} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_outputsactive
     */
    get_OutputsActive() {
        result := ComCall(32, this, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidOutputDevices(pVal)
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
     * @returns {IMSVidVideoRenderer} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_videorendereractive
     */
    get_VideoRendererActive() {
        result := ComCall(34, this, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidVideoRenderer(pVal)
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
     * @returns {IMSVidAudioRenderer} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_audiorendereractive
     */
    get_AudioRendererActive() {
        result := ComCall(36, this, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidAudioRenderer(pVal)
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
     * @returns {IMSVidFeatures} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_featuresactive
     */
    get_FeaturesActive() {
        result := ComCall(38, this, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidFeatures(pVal)
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_state
     */
    get_State() {
        result := ComCall(40, this, "int*", &lState := 0, "HRESULT")
        return lState
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
