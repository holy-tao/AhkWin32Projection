#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRFilterConfig interface is used to configure the operating mode and video rendering mechanisms of the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ivmrfilterconfig
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRFilterConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRFilterConfig
     * @type {Guid}
     */
    static IID => Guid("{9e5530c5-7034-48b4-bb46-0b8a6efc8e36}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetImageCompositor", "SetNumberOfStreams", "GetNumberOfStreams", "SetRenderingPrefs", "GetRenderingPrefs", "SetRenderingMode", "GetRenderingMode"]

    /**
     * The SetImageCompositor method installs an application-provided image compositor.
     * @remarks
     * Use this method to replace the VMR's default compositor with a custom compositor provided by the application. The image compositor is a sub-component of the mixer.
     * 
     * The compositor is automatically loaded when the VMR is in windowless or windowed mode. When the VMR is in renderless mode, the compositor must be loaded by calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrfilterconfig-setnumberofstreams">IVMRFilterConfig::SetNumberOfStreams</a>. The VMR manages all reference counting on the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ivmrimagecompositor">IVMRImageCompositor</a> interface.
     * @param {IVMRImageCompositor} lpVMRImgCompositor Pointer to the image compositor's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ivmrimagecompositor">IVMRImageCompositor</a> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The mixer is not currently loaded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrfilterconfig-setimagecompositor
     */
    SetImageCompositor(lpVMRImgCompositor) {
        result := ComCall(3, this, "ptr", lpVMRImgCompositor, "HRESULT")
        return result
    }

    /**
     * The SetNumberOfStreams method sets the number of streams to be mixed and instructs the VMR to go into mixer mode.
     * @remarks
     * <i>dwMaxStreams</i> should be equal to the number of input pins required. Pins cannot be added or removed after the VMR has been connected. If you do not know in advance how many input streams will be required, set <i>dxMaxStreams</i> to the maximum number that might be required. A value of 1 is valid for dwMaxStreams. This value does not cause any extra pins to be created, but it does force the VMR to go into "mixer mode." Therefore, once this method has been called, you cannot call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrfilterconfig-setrenderingmode">SetRenderingMode</a> to set the mode to <b>VMRMode_Renderless</b>
     * 
     * The VMR creates as many input pins as are specified without attempting to determine whether there is enough video memory to support them all. This is because it has no way of knowing the media type or rectangle dimensions at this time. Later, when an upstream filter attempts to connect to a pin, at that point the media type is known and the VMR will examine the video memory and fail the connection if there is not enough to process the stream.
     * 
     * <div class="alert"><b>Note</b>  Although the VMR supports multiple streams, they all share a single clock, and therefore you cannot seek one stream independently of the others. If you need to seek the input streams independently, you must use a different technique. See the VMRMulti sample for more information.</div>
     * <div> </div>
     * @param {Integer} dwMaxStreams Double word containing the maximum number of input streams that the VMR will be required to mix. Must not be greater than MAX_MIXER_STREAMS (16).
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The mixer is already configured.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An attempt was made to configure the mixer for more than 16 input streams.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Memory to manage the streams could not be allocated.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrfilterconfig-setnumberofstreams
     */
    SetNumberOfStreams(dwMaxStreams) {
        result := ComCall(4, this, "uint", dwMaxStreams, "HRESULT")
        return result
    }

    /**
     * The GetNumberOfStreams method retrieves the number of input streams being mixed.
     * @returns {Integer} Pointer to a double word that receives the number of streams being mixed, which is equal to the number of input pins on the VMR.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrfilterconfig-getnumberofstreams
     */
    GetNumberOfStreams() {
        result := ComCall(5, this, "uint*", &pdwMaxStreams := 0, "HRESULT")
        return pdwMaxStreams
    }

    /**
     * The SetRenderingPrefs method sets various application preferences related to video rendering.
     * @remarks
     * This method calls through to the allocator-presenter's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrimagepresenterconfig-setrenderingprefs">IVMRImagePresenterConfig::SetRenderingPrefs</a> method. (The default allocator-presenter exposes <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ivmrimagepresenterconfig">IVMRImagePresenterConfig</a>. Custom allocator-presenters can also expose this interface if desired.) If the VMR-7 has not yet created the default allocator-presenter, or if the application provided a custom allocator-presenter which does not support <b>IVMRImagePresenterConfig</b>, this method returns VFW_E_WRONG_STATE. To create the default allocator-presenter, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrfilterconfig-setrenderingmode">IVMRFilterConfig::SetRenderingMode</a> with the value VMRMode_Windowed or VMRMode_Windowed.
     * @param {Integer} dwRenderFlags Double word containing a bitwise OR of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrrenderprefs">VMRRenderPrefs</a> values specifying the rendering preferences.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No allocator-presenter is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>dwRenderFlags</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrfilterconfig-setrenderingprefs
     */
    SetRenderingPrefs(dwRenderFlags) {
        result := ComCall(6, this, "uint", dwRenderFlags, "HRESULT")
        return result
    }

    /**
     * The GetRenderingPrefs method retrieves the current set of rendering preferences being used by the VMR.
     * @remarks
     * This method calls through to the allocator-presenter's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrimagepresenterconfig-getrenderingprefs">IVMRImagePresenterConfig::GetRenderingPrefs</a> method. (The default allocator-presenter exposes <b>IVMRImagePresenterConfig</b>. Custom allocator-presenters can also expose this interface if desired.) If the VMR-7 has not yet created the default allocator-presenter, or if the application provided a custom allocator-presenter which does not support <b>IVMRImagePresenterConfig</b>, this method returns VFW_E_WRONG_STATE. To create the default allocator-presenter, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrfilterconfig-setrenderingmode">IVMRFilterConfig::SetRenderingMode</a> with the value VMRMode_Windowed or VMRMode_Windowed.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrrenderprefs">VMRRenderPrefs</a> enumeration, indicating the current rendering preferences.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrfilterconfig-getrenderingprefs
     */
    GetRenderingPrefs() {
        result := ComCall(7, this, "uint*", &pdwRenderFlags := 0, "HRESULT")
        return pdwRenderFlags
    }

    /**
     * The SetRenderingMode method sets the rendering mode used by the VMR.
     * @remarks
     * The VMR is in <b>VMRMode_Windowed</b> by default. Use this method only if you are putting the VMR into <b>VMRMode_Windowless</b> or <b>VMRMode_Renderless</b> mode. You cannot change the mode after any pin has been connected and you cannot change the mode from windowless or renderless back to windowed, even before any pins are connected. Therefore, specifying <b>VMRMode_Windowed</b> for <i>Mode</i> has no effect under any circumstances.
     * @param {Integer} _Mode 
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid rendering mode was specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The mode cannot be changed for some reason. See Remarks.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrfilterconfig-setrenderingmode
     */
    SetRenderingMode(_Mode) {
        result := ComCall(8, this, "uint", _Mode, "HRESULT")
        return result
    }

    /**
     * The GetRenderingMode method retrieves the rendering mode currently being used by the VMR.
     * @returns {Integer} Pointer to a <b>DWORD</b> that receives a <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrmode">VMRMode</a> value indicating the current rendering mode.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ivmrfilterconfig-getrenderingmode
     */
    GetRenderingMode() {
        result := ComCall(9, this, "uint*", &pMode := 0, "HRESULT")
        return pMode
    }
}
