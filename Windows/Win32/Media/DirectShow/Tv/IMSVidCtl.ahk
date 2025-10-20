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
     * 
     * @param {Pointer<VARIANT_BOOL>} pbool 
     * @returns {HRESULT} 
     */
    get_AutoSize(pbool) {
        result := ComCall(7, this, "ptr", pbool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbool 
     * @returns {HRESULT} 
     */
    put_AutoSize(vbool) {
        result := ComCall(8, this, "short", vbool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} backcolor 
     * @returns {HRESULT} 
     */
    get_BackColor(backcolor) {
        result := ComCall(9, this, "uint*", backcolor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} backcolor 
     * @returns {HRESULT} 
     */
    put_BackColor(backcolor) {
        result := ComCall(10, this, "uint", backcolor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbool 
     * @returns {HRESULT} 
     */
    get_Enabled(pbool) {
        result := ComCall(11, this, "ptr", pbool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbool 
     * @returns {HRESULT} 
     */
    put_Enabled(vbool) {
        result := ComCall(12, this, "short", vbool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbool 
     * @returns {HRESULT} 
     */
    get_TabStop(pbool) {
        result := ComCall(13, this, "ptr", pbool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vbool 
     * @returns {HRESULT} 
     */
    put_TabStop(vbool) {
        result := ComCall(14, this, "short", vbool, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HWND>} phwnd 
     * @returns {HRESULT} 
     */
    get_Window(phwnd) {
        result := ComCall(15, this, "ptr", phwnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Refresh() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} CurrentValue 
     * @returns {HRESULT} 
     */
    get_DisplaySize(CurrentValue) {
        result := ComCall(17, this, "int*", CurrentValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewValue 
     * @returns {HRESULT} 
     */
    put_DisplaySize(NewValue) {
        result := ComCall(18, this, "int", NewValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} CurrentValue 
     * @returns {HRESULT} 
     */
    get_MaintainAspectRatio(CurrentValue) {
        result := ComCall(19, this, "ptr", CurrentValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} NewValue 
     * @returns {HRESULT} 
     */
    put_MaintainAspectRatio(NewValue) {
        result := ComCall(20, this, "short", NewValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} CurrentValue 
     * @returns {HRESULT} 
     */
    get_ColorKey(CurrentValue) {
        result := ComCall(21, this, "uint*", CurrentValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NewValue 
     * @returns {HRESULT} 
     */
    put_ColorKey(NewValue) {
        result := ComCall(22, this, "uint", NewValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} CategoryGuid 
     * @param {Pointer<IMSVidInputDevices>} pVal 
     * @returns {HRESULT} 
     */
    get_InputsAvailable(CategoryGuid, pVal) {
        CategoryGuid := CategoryGuid is String ? BSTR.Alloc(CategoryGuid).Value : CategoryGuid

        result := ComCall(23, this, "ptr", CategoryGuid, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} CategoryGuid 
     * @param {Pointer<IMSVidOutputDevices>} pVal 
     * @returns {HRESULT} 
     */
    get_OutputsAvailable(CategoryGuid, pVal) {
        CategoryGuid := CategoryGuid is String ? BSTR.Alloc(CategoryGuid).Value : CategoryGuid

        result := ComCall(24, this, "ptr", CategoryGuid, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} CategoryGuid 
     * @param {Pointer<IMSVidInputDevices>} pVal 
     * @returns {HRESULT} 
     */
    get__InputsAvailable(CategoryGuid, pVal) {
        result := ComCall(25, this, "ptr", CategoryGuid, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} CategoryGuid 
     * @param {Pointer<IMSVidOutputDevices>} pVal 
     * @returns {HRESULT} 
     */
    get__OutputsAvailable(CategoryGuid, pVal) {
        result := ComCall(26, this, "ptr", CategoryGuid, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidVideoRendererDevices>} pVal 
     * @returns {HRESULT} 
     */
    get_VideoRenderersAvailable(pVal) {
        result := ComCall(27, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidAudioRendererDevices>} pVal 
     * @returns {HRESULT} 
     */
    get_AudioRenderersAvailable(pVal) {
        result := ComCall(28, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidFeatures>} pVal 
     * @returns {HRESULT} 
     */
    get_FeaturesAvailable(pVal) {
        result := ComCall(29, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidInputDevice>} pVal 
     * @returns {HRESULT} 
     */
    get_InputActive(pVal) {
        result := ComCall(30, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidInputDevice>} pVal 
     * @returns {HRESULT} 
     */
    put_InputActive(pVal) {
        result := ComCall(31, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidOutputDevices>} pVal 
     * @returns {HRESULT} 
     */
    get_OutputsActive(pVal) {
        result := ComCall(32, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidOutputDevices>} pVal 
     * @returns {HRESULT} 
     */
    put_OutputsActive(pVal) {
        result := ComCall(33, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidVideoRenderer>} pVal 
     * @returns {HRESULT} 
     */
    get_VideoRendererActive(pVal) {
        result := ComCall(34, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidVideoRenderer>} pVal 
     * @returns {HRESULT} 
     */
    put_VideoRendererActive(pVal) {
        result := ComCall(35, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidAudioRenderer>} pVal 
     * @returns {HRESULT} 
     */
    get_AudioRendererActive(pVal) {
        result := ComCall(36, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidAudioRenderer>} pVal 
     * @returns {HRESULT} 
     */
    put_AudioRendererActive(pVal) {
        result := ComCall(37, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidFeatures>} pVal 
     * @returns {HRESULT} 
     */
    get_FeaturesActive(pVal) {
        result := ComCall(38, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidFeatures>} pVal 
     * @returns {HRESULT} 
     */
    put_FeaturesActive(pVal) {
        result := ComCall(39, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lState 
     * @returns {HRESULT} 
     */
    get_State(lState) {
        result := ComCall(40, this, "int*", lState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} v 
     * @returns {HRESULT} 
     */
    View(v) {
        result := ComCall(41, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Build() {
        result := ComCall(42, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Pause() {
        result := ComCall(43, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Run() {
        result := ComCall(44, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Stop() {
        result := ComCall(45, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Decompose() {
        result := ComCall(46, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableVideo() {
        result := ComCall(47, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DisableAudio() {
        result := ComCall(48, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} v 
     * @returns {HRESULT} 
     */
    ViewNext(v) {
        result := ComCall(49, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
