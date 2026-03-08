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
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidCtl)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nn-msvidctl-imsvidctl
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
     * @type {VARIANT_BOOL} 
     */
    AutoSize {
        get => this.get_AutoSize()
        set => this.put_AutoSize(value)
    }

    /**
     * @type {Integer} 
     */
    BackColor {
        get => this.get_BackColor()
        set => this.put_BackColor(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    TabStop {
        get => this.get_TabStop()
        set => this.put_TabStop(value)
    }

    /**
     * @type {HWND} 
     */
    Window {
        get => this.get_Window()
    }

    /**
     * @type {Integer} 
     */
    DisplaySize {
        get => this.get_DisplaySize()
        set => this.put_DisplaySize(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    MaintainAspectRatio {
        get => this.get_MaintainAspectRatio()
        set => this.put_MaintainAspectRatio(value)
    }

    /**
     * @type {Integer} 
     */
    ColorKey {
        get => this.get_ColorKey()
        set => this.put_ColorKey(value)
    }

    /**
     * @type {IMSVidVideoRendererDevices} 
     */
    VideoRenderersAvailable {
        get => this.get_VideoRenderersAvailable()
    }

    /**
     * @type {IMSVidAudioRendererDevices} 
     */
    AudioRenderersAvailable {
        get => this.get_AudioRenderersAvailable()
    }

    /**
     * @type {IMSVidFeatures} 
     */
    FeaturesAvailable {
        get => this.get_FeaturesAvailable()
    }

    /**
     * @type {IMSVidInputDevice} 
     */
    InputActive {
        get => this.get_InputActive()
        set => this.put_InputActive(value)
    }

    /**
     * @type {IMSVidOutputDevices} 
     */
    OutputsActive {
        get => this.get_OutputsActive()
        set => this.put_OutputsActive(value)
    }

    /**
     * @type {IMSVidVideoRenderer} 
     */
    VideoRendererActive {
        get => this.get_VideoRendererActive()
        set => this.put_VideoRendererActive(value)
    }

    /**
     * @type {IMSVidAudioRenderer} 
     */
    AudioRendererActive {
        get => this.get_AudioRendererActive()
        set => this.put_AudioRendererActive(value)
    }

    /**
     * @type {IMSVidFeatures} 
     */
    FeaturesActive {
        get => this.get_FeaturesActive()
        set => this.put_FeaturesActive(value)
    }

    /**
     * @type {Integer} 
     */
    State {
        get => this.get_State()
    }

    /**
     * The get_AutoSize method retrieves a value that determines whether the Video Control is automatically resized to display its entire contents.
     * @returns {VARIANT_BOOL} Pointer to a variable of type <b>VARIANT_BOOL</b> that receives the current value of the property.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_autosize
     */
    get_AutoSize() {
        result := ComCall(7, this, "short*", &pbool := 0, "HRESULT")
        return pbool
    }

    /**
     * The put_AutoSize method specifies whether the Video Control automatically resizes to display its entire contents.
     * @param {VARIANT_BOOL} vbool 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_autosize
     */
    put_AutoSize(vbool) {
        result := ComCall(8, this, "short", vbool, "HRESULT")
        return result
    }

    /**
     * The get_BackColor method retrieves the background color of the Video Control.
     * @returns {Integer} Receives an <b>OLE_COLOR</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_backcolor
     */
    get_BackColor() {
        result := ComCall(9, this, "uint*", &backcolor := 0, "HRESULT")
        return backcolor
    }

    /**
     * The put_BackColor method specifies the background color of the Video Control.
     * @remarks
     * The Video Control uses the background color when the filter graph is stopped or unbuilt. It also uses this color in letterbox mode to paint unused areas of the video rectangle. The background color is sometimes called the "border" color.
     * @param {Integer} backcolor Specifies the background color as an <b>OLE_COLOR</b> value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_backcolor
     */
    put_BackColor(backcolor) {
        result := ComCall(10, this, "uint", backcolor, "HRESULT")
        return result
    }

    /**
     * The get_Enabled method retrieves a value that determines whether the Video Control can respond to user-generated events.
     * @returns {VARIANT_BOOL} Variable of type <b>VARIANT_BOOL</b> that receives the current value of the property.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_enabled
     */
    get_Enabled() {
        result := ComCall(11, this, "short*", &pbool := 0, "HRESULT")
        return pbool
    }

    /**
     * The put_Enabled method specifies a value that determines whether the Video Control can respond to user-generated events.
     * @param {VARIANT_BOOL} vbool Specifies the new value of the property.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_enabled
     */
    put_Enabled(vbool) {
        result := ComCall(12, this, "short", vbool, "HRESULT")
        return result
    }

    /**
     * The get_TabStop method queries whether a user can use the TAB key to give the focus to the Video Control.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_tabstop
     */
    get_TabStop() {
        result := ComCall(13, this, "short*", &pbool := 0, "HRESULT")
        return pbool
    }

    /**
     * The put_TabStop method specifies whether a user can use the TAB key to give the focus to the Video Control.
     * @param {VARIANT_BOOL} vbool 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_tabstop
     */
    put_TabStop(vbool) {
        result := ComCall(14, this, "short", vbool, "HRESULT")
        return result
    }

    /**
     * The get_Window method retrieves the window associated with the Video Control.
     * @returns {HWND} Receives a handle to the window.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_window
     */
    get_Window() {
        phwnd := HWND()
        result := ComCall(15, this, "ptr", phwnd, "HRESULT")
        return phwnd
    }

    /**
     * The Refresh method immediately updates the Video Control's appearance.
     * @remarks
     * This method is a stock ActiveX control method. It forces the Video Control window to repaint itself. Before repainting, the Video Control ensures that the video rectangle is up to date and that all Video Mixing Renderer settings are correct.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-refresh
     */
    Refresh() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * The get_DisplaySize method retrieves the display size.
     * @remarks
     * The display size has no effect if the <b>AutoSize</b> property is false.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/ne-msvidctl-displaysizelist">DisplaySizeList</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_displaysize
     */
    get_DisplaySize() {
        result := ComCall(17, this, "int*", &CurrentValue := 0, "HRESULT")
        return CurrentValue
    }

    /**
     * The put_DisplaySize method specifies the display size.
     * @remarks
     * Setting this property has no effect if the <b>AutoSize</b> property is false.
     * @param {Integer} NewValue Specifies the display size as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/ne-msvidctl-displaysizelist">DisplaySizeList</a> enumeration.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_displaysize
     */
    put_DisplaySize(NewValue) {
        result := ComCall(18, this, "int", NewValue, "HRESULT")
        return result
    }

    /**
     * The get_MaintainAspectRatio method queries whether the Video Control maintains the aspect ratio of the source video.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_maintainaspectratio
     */
    get_MaintainAspectRatio() {
        result := ComCall(19, this, "short*", &CurrentValue := 0, "HRESULT")
        return CurrentValue
    }

    /**
     * The put_MaintainAspectRatio method specifies whether the Video Control maintains the aspect ratio of the source video.
     * @param {VARIANT_BOOL} NewValue 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_maintainaspectratio
     */
    put_MaintainAspectRatio(NewValue) {
        result := ComCall(20, this, "short", NewValue, "HRESULT")
        return result
    }

    /**
     * The get_ColorKey method retrieves the color key that the video renderer is using.
     * @remarks
     * The color key is used when the video renderer draws to an overlay surface.
     * @returns {Integer} Receives an <b>OLE_COLOR</b> value.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_colorkey
     */
    get_ColorKey() {
        result := ComCall(21, this, "uint*", &CurrentValue := 0, "HRESULT")
        return CurrentValue
    }

    /**
     * The put_ColorKey method specifies the color key.
     * @remarks
     * The color key is used when the video renderer draws to an overlay surface.
     * @param {Integer} NewValue Specifies the color key as an <b>OLE_COLOR</b> value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_colorkey
     */
    put_ColorKey(NewValue) {
        result := ComCall(22, this, "uint", NewValue, "HRESULT")
        return result
    }

    /**
     * The get_InputsAvailable method retrieves the input devices that are available within a specified category.
     * @remarks
     * This method is provided for Automation clients. C++ applications can use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-get__inputsavailable">IMSVidCtl::get__InputsAvailable</a> method, which takes a GUID rather than a <b>BSTR</b> value.
     * 
     * If the method succeeds, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidinputdevices">IMSVidInputDevices</a> interface has an outstanding reference count. The caller must release the interface.
     * @param {BSTR} CategoryGuid <b>BSTR</b> that specifies the GUID of the category to enumerate.
     * @returns {IMSVidInputDevices} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidinputdevices">IMSVidInputDevices</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_inputsavailable
     */
    get_InputsAvailable(CategoryGuid) {
        CategoryGuid := CategoryGuid is String ? BSTR.Alloc(CategoryGuid).Value : CategoryGuid

        result := ComCall(23, this, "ptr", CategoryGuid, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidInputDevices(pVal)
    }

    /**
     * The get_OutputsAvailable method retrieves the output devices that are available in a specified category.
     * @param {BSTR} CategoryGuid <b>BSTR</b> that specifies the GUID of the category to enumerate
     * @returns {IMSVidOutputDevices} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidoutputdevices">IMSVidOutputDevices</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_outputsavailable
     */
    get_OutputsAvailable(CategoryGuid) {
        CategoryGuid := CategoryGuid is String ? BSTR.Alloc(CategoryGuid).Value : CategoryGuid

        result := ComCall(24, this, "ptr", CategoryGuid, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidOutputDevices(pVal)
    }

    /**
     * The get__InputsAvailable method retrieves the input devices that are available in a specified category.
     * @remarks
     * This method returns a read-only collection of input devices. Use the returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidinputdevices">IMSVidInputDevices</a> pointer to enumerate the collection.
     * @param {Pointer<Guid>} CategoryGuid Pointer to a GUID that specifies the category to enumerate. Supported categories include the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>KSCATEGORY_BDA_NETWORK_PROVIDER</td>
     * <td>BDA-compatible tuner devices.</td>
     * </tr>
     * <tr>
     * <td>KSCATEGORY_TVTUNER</td>
     * <td>Non-BDA analog tuner devices.</td>
     * </tr>
     * <tr>
     * <td>GUID_NULL</td>
     * <td>Miscellaneous devices (file source, DVD).</td>
     * </tr>
     * </table>
     * @returns {IMSVidInputDevices} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidinputdevices">IMSVidInputDevices</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get__inputsavailable
     */
    get__InputsAvailable(CategoryGuid) {
        result := ComCall(25, this, "ptr", CategoryGuid, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidInputDevices(pVal)
    }

    /**
     * The get__OutputsAvailable method retrieves the output devices that are available in a specified category.
     * @remarks
     * To obtain the available renderers, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-get_audiorenderersavailable">get_AudioRenderersAvailable</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-get_videorenderersavailable">get_VideoRenderersAvailable</a> methods.
     * @param {Pointer<Guid>} CategoryGuid Pointer to a GUID that specifies the category to enumerate.
     * @returns {IMSVidOutputDevices} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidoutputdevices">IMSVidOutputDevices</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get__outputsavailable
     */
    get__OutputsAvailable(CategoryGuid) {
        result := ComCall(26, this, "ptr", CategoryGuid, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidOutputDevices(pVal)
    }

    /**
     * The get_VideoRenderersAvailable method retrieves a collection of video renderers available on the local system.
     * @remarks
     * This method returns a collection of video renderer devices. Use the returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidvideorendererdevices">IMSVidVideoRendererDevices</a> pointer to enumerate the collection.
     * 
     * <div class="alert"><b>Note</b>  In the current implementation, the collection always contains exactly one item: an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd695138(v=vs.85)">MSVidVideoRenderer</a> object that represents the Video Mixing Renderer filter.</div>
     * <div> </div>
     * @returns {IMSVidVideoRendererDevices} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidvideorendererdevices">IMSVidVideoRendererDevices</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_videorenderersavailable
     */
    get_VideoRenderersAvailable() {
        result := ComCall(27, this, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidVideoRendererDevices(pVal)
    }

    /**
     * The get_AudioRenderersAvailable method retrieves the available audio renderers.
     * @remarks
     * This method returns a read-only collection of input devices. Use the returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidaudiorendererdevices">IMSVidAudioRendererDevices</a> pointer to enumerate the collection.
     * @returns {IMSVidAudioRendererDevices} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidaudiorendererdevices">IMSVidAudioRendererDevices</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_audiorenderersavailable
     */
    get_AudioRenderersAvailable() {
        result := ComCall(28, this, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidAudioRendererDevices(pVal)
    }

    /**
     * The get_FeaturesAvailable method retrieves the features that are available on the local system.
     * @remarks
     * This method returns a collection of feature objects. Use the returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidfeatures">IMSVidFeatures</a> pointer to enumerate the collection. To activate a feature, add it to the active features collection. To search for a specific feature, call the <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsviddevice-get__classid">IMSVidDevice::get__ClassID</a> method on each feature and compare the result against the CLSID of the feature you are looking for.
     * @returns {IMSVidFeatures} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidfeatures">IMSVidFeatures</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_featuresavailable
     */
    get_FeaturesAvailable() {
        result := ComCall(29, this, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidFeatures(pVal)
    }

    /**
     * The get_InputActive method retrieves the input device that is currently active.
     * @returns {IMSVidInputDevice} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidinputdevice">IMSVidInputDevice</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_inputactive
     */
    get_InputActive() {
        result := ComCall(30, this, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidInputDevice(pVal)
    }

    /**
     * The put_InputActive method specifies the input device to use in the filter graph.
     * @remarks
     * If the Video Control's state is not <b>STATE_UNBUILT</b>, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-decompose">IMSVidCtl::Decompose</a> to tear down the filter graph before calling this method.
     * @param {IMSVidInputDevice} pVal Specifies a pointer to the input device's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidinputdevice">IMSVidInputDevice</a> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_inputactive
     */
    put_InputActive(pVal) {
        result := ComCall(31, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * The get_OutputsActive method retrieves the output devices that are currently active.
     * @returns {IMSVidOutputDevices} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidoutputdevices">IMSVidOutputDevices</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_outputsactive
     */
    get_OutputsActive() {
        result := ComCall(32, this, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidOutputDevices(pVal)
    }

    /**
     * The put_OutputsActive method specifies the active output devices.
     * @param {IMSVidOutputDevices} pVal Pointer to the new collection of output devices.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_outputsactive
     */
    put_OutputsActive(pVal) {
        result := ComCall(33, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * The get_VideoRendererActive method retrieves the currently active video renderer.
     * @returns {IMSVidVideoRenderer} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidvideorenderer">IMSVidVideoRenderer</a> interface pointer.  The caller must release the interface. If no video renderer is active, this parameter receives the value <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_videorendereractive
     */
    get_VideoRendererActive() {
        result := ComCall(34, this, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidVideoRenderer(pVal)
    }

    /**
     * The put_VideoRendererActive method specifies the active video renderer.
     * @remarks
     * Currently the only supported video renderer is the Video Mixing Renderer (VMR) filter. The VMR is used by default, so it is not necessary to call this method.
     * @param {IMSVidVideoRenderer} pVal Specifies a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidvideorenderer">IMSVidVideoRenderer</a> interface of the video renderer device.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_videorendereractive
     */
    put_VideoRendererActive(pVal) {
        result := ComCall(35, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * The get_AudioRendererActive method retrieves the audio renderer that is currently active.
     * @returns {IMSVidAudioRenderer} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidaudiorenderer">IMSVidAudioRenderer</a> interface pointer. The caller must release the interface. If no audio renderer is active, this parameter receives the value <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_audiorendereractive
     */
    get_AudioRendererActive() {
        result := ComCall(36, this, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidAudioRenderer(pVal)
    }

    /**
     * The put_AudioRendererActive method specifies the active audio renderer.
     * @param {IMSVidAudioRenderer} pVal Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidaudiorenderer">IMSVidAudioRenderer</a> interface that specifies the audio renderer.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_audiorendereractive
     */
    put_AudioRendererActive(pVal) {
        result := ComCall(37, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * The get_FeaturesActive method retrieves the features that are currently active.
     * @remarks
     * If no features are active, the method might return <b>NULL</b> in the <i>pVal</i> parameter. Otherwise, it returns a collection of feature objects. Use the returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidfeatures">IMSVidFeatures</a> pointer to enumerate the collection.
     * @returns {IMSVidFeatures} Receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidfeatures">IMSVidFeatures</a> interface pointer. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_featuresactive
     */
    get_FeaturesActive() {
        result := ComCall(38, this, "ptr*", &pVal := 0, "HRESULT")
        return IMSVidFeatures(pVal)
    }

    /**
     * The put_FeaturesActive method specifies a collection of features to activate.
     * @remarks
     * Features represent additional capabilities beyond basic tuning and rendering, such as closed captioning or IP data services. When the Video Control builds the filter graph, it uses the active features collection to configure the graph.
     * 
     * For a default graph, it is not necessary to specify the active features. To activate a feature, create a new <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd695126(v=vs.85)">MSVidFeatures</a> collection object. Then use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-get_featuresavailable">IMSVidCtl::get_FeaturesAvailable</a> method to enumerate the available features, and call <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsviddevice-get__classid">IMSVidDevice::get__ClassID</a> on each feature. If the CLSID matches the feature you wish to activate, add that feature to your MSVidFeatures collection. Then call <b>put_FeaturesActive</b> with a pointer to the MSVidFeatures collection.
     * 
     * If the Video Control's state is not <b>STATE_UNBUILT</b>, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-decompose">IMSVidCtl::Decompose</a> to tear down the filter graph before calling this method.
     * @param {IMSVidFeatures} pVal Pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/msvidfeatures">IMSVidFeatures</a> interface on a collection of features.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-put_featuresactive
     */
    put_FeaturesActive(pVal) {
        result := ComCall(39, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * The get_State method retrieves the state of the filter graph.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/ne-msvidctl-msvidctlstatelist">MSVidCtlStateList</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-get_state
     */
    get_State() {
        result := ComCall(40, this, "int*", &lState := 0, "HRESULT")
        return lState
    }

    /**
     * The View method configures the Video Control to view an input source, which can be a tune request, a DVD, or a media file.
     * @remarks
     * If the Video Control already has an active input device, this method configures the device for the specified input. Otherwise, this method locates an input device that can handle the input and activates it.
     * 
     * An input device typically corresponds to a source filter. If the <i>pv</i> parameter is a tune request object, the Video Control determines which filter to use by examining the network type on the tune request. For digital television, the input device will be a BDA Network Provider filter. For analog television, it will be a WDM TV Tuner filter. The specific name and implementation of the filter are device-dependent.
     * 
     * After calling <b>View</b>, use the following methods to build and run the filter graph:
     * 
     * <ul>
     * <li>The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">IMSVidCtl::Build</a> method builds the rest of the filter graph, based on the selected input and the active features collection. The <b>Build</b> method leaves the graph in a stopped state.</li>
     * <li>The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-run">IMSVidCtl::Run</a> method calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">Build</a> if the graph is not built, and puts the graph into a running state. When the filter graph runs, the video control starts playing the specified tune request.</li>
     * </ul>
     * If the filter graph is already built and running, an application can call <b>View</b> to specify a new tune request, either on the same network type or on a different network type.
     * 
     * If the <b>View</b> method succeeds, you can obtain the input device by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-get_inputactive">IMSVidCtl::get_InputActive</a> method.
     * 
     * You can specify a particular input device by calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-put_inputactive">IMSVidCtl::put_InputActive</a> method and then calling <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidinputdevice-view">IMSVidInputDevice::View</a> on the device, instead of calling <b>View</b> on the Video Control. This might be useful if the local system has multiple devices of the same type. The <b>View</b> method is preferred, however, because it automatically locates the correct device type.
     * @param {Pointer<VARIANT>} v Pointer to the input source as a <b>VARIANT</b> type. This parameter must be one of the following:<ul>
     * <li>A pointer to a valid tune request object that supports the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> interface. The tune request must be initialized with all the tuning information required for the particular network type.</li>
     * <li>The string "DVD:" for DVD playback.</li>
     * <li>The name of a media file.</li>
     * </ul>
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-view
     */
    View(v) {
        result := ComCall(41, this, "ptr", v, "HRESULT")
        return result
    }

    /**
     * The Build method builds the filter graph and connects all the filters.
     * @remarks
     * This method builds a filter graph using the current input device. To select an input device, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">IMSVidCtl::View</a> method or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-put_inputactive">IMSVidCtl::put_InputActive</a> method. If no input device has been selected, the method fails.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-build
     */
    Build() {
        result := ComCall(42, this, "HRESULT")
        return result
    }

    /**
     * The Pause method pauses the filter graph.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-pause
     */
    Pause() {
        result := ComCall(43, this, "HRESULT")
        return result
    }

    /**
     * The Run method runs the filter graph.
     * @remarks
     * This method builds the filter graph if the state is unbuilt, and puts the graph into the running state. For more information on the behavior of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">Build</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">View</a> and <b>Run</b>, see <b>IMSVidCtl::View</b>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-run
     */
    Run() {
        result := ComCall(44, this, "HRESULT")
        return result
    }

    /**
     * The Stop method stops the filter graph.
     * @remarks
     * This method leaves the filter graph intact and ready to pause or run. To tear down the filter graph, use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-decompose">IMSVidCtl::Decompose</a> method.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-stop
     */
    Stop() {
        result := ComCall(45, this, "HRESULT")
        return result
    }

    /**
     * The Decompose method tears down the filter graph.
     * @remarks
     * This method is the inverse of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-build">IMSVidCtl::Build</a> method. Call this method before you change the Active Features collection, specify a new renderer, or specify a new input device. The method does not modify the Active Features collection.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-decompose
     */
    Decompose() {
        result := ComCall(46, this, "HRESULT")
        return result
    }

    /**
     * The DisableVideo method disables the video renderer.
     * @remarks
     * This method sets the active video renderer device to <b>NULL</b>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-disablevideo
     */
    DisableVideo() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    /**
     * The DisableAudio method disables the audio output device.
     * @remarks
     * This method sets the active audio output device to <b>NULL</b>.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-disableaudio
     */
    DisableAudio() {
        result := ComCall(48, this, "HRESULT")
        return result
    }

    /**
     * The ViewNext method finds another input device to view the specified tune request.
     * @remarks
     * This method works like the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msvidctl/nf-msvidctl-imsvidctl-view">IMSVidCtl::View</a> method, with the following difference: If the system has more than one tuner that supports the specified network type, the <b>ViewNext</b> method skips the current input device and uses the next one. (The ordering of devices is arbitrary.)
     * @param {Pointer<VARIANT>} v Specifies the tune request as a <b>VARIANT</b> type.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/msvidctl/nf-msvidctl-imsvidctl-viewnext
     */
    ViewNext(v) {
        result := ComCall(49, this, "ptr", v, "HRESULT")
        return result
    }
}
