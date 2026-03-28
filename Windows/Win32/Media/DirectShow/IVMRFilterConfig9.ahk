#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRFilterConfig9 interface is implemented by the Video Mixing Renderer Filter 9.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/nn-vmr9-ivmrfilterconfig9
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRFilterConfig9 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRFilterConfig9
     * @type {Guid}
     */
    static IID => Guid("{5a804648-4f66-4867-9c43-4f5c822cf1b8}")

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
     * The SetImageCompositor method installs an application-provided image compositor object.
     * @remarks
     * Use this method to replace the VMR's default compositor with a custom compositor provided by the application. The image compositor is a sub-component of the mixer. The mixer must be loaded, through a call to <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrfilterconfig9-setnumberofstreams">IVMRFilterConfig9::SetNumberOfStreams</a>,
     * 
     * before the compositor can be specified. The VMR manages all reference counting on the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/nn-vmr9-ivmrimagecompositor9">IVMRImageCompositor9</a> interface.
     * @param {IVMRImageCompositor9} lpVMRImgCompositor Pointer to the image compositor object provided by the application.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * Cannot change the compositor when the VMR filter's pins are connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
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
     * The VMR is not in mixing mode.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrfilterconfig9-setimagecompositor
     */
    SetImageCompositor(lpVMRImgCompositor) {
        result := ComCall(3, this, "ptr", lpVMRImgCompositor, "HRESULT")
        return result
    }

    /**
     * The SetNumberOfStreams method sets the number of streams to be mixed and instructs the VMR to go into mixer mode.
     * @remarks
     * <i>dwMaxStreams</i> should be equal to the number of input pins required. Pins cannot be added or removed after the VMR has been connected. If you do not know in advance how many input streams will be required, set <i>dxMaxStreams</i> to the maximum number that might be required. A value of 1 is valid for dwMaxStreams. This value does not cause any extra pins to be created, but it does force the VMR to go into "mixer mode."
     * 
     * The VMR creates as many input pins as are specified without attempting to determine whether there is enough video memory to support them all. This is because it has no way of knowing the media type or rectangle dimensions at this time. Later, when an upstream filter attempts to connect to a pin, at that point the media type is known and the VMR will examine the video memory and fail the connection if there is not enough memory to process the stream.
     * 
     * <div class="alert"><b>Note</b>  Although the VMR supports multiple streams, they all share a single clock, and therefore you cannot seek one stream independently of the others. If you need to seek the input streams independently, you must use a different technique.</div>
     * <div> </div>
     * @param {Integer} dwMaxStreams Double word containing the maximum number of input streams that the VMR will be required to mix.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrfilterconfig9-setnumberofstreams
     */
    SetNumberOfStreams(dwMaxStreams) {
        result := ComCall(4, this, "uint", dwMaxStreams, "HRESULT")
        return result
    }

    /**
     * The GetNumberOfStreams method retrieves the number of input streams being mixed.
     * @returns {Integer} Receives the number of streams being mixed, which is equal to the number of input pins on the VMR.
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrfilterconfig9-getnumberofstreams
     */
    GetNumberOfStreams() {
        result := ComCall(5, this, "uint*", &pdwMaxStreams := 0, "HRESULT")
        return pdwMaxStreams
    }

    /**
     * The SetRenderingPrefs method sets various application preferences related to video rendering.
     * @remarks
     * This method calls through to the allocator-presenter's <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrimagepresenterconfig9-setrenderingprefs">IVMRImagePresenterConfig9::SetRenderingPrefs</a> method. (The default allocator-presenter exposes <b>IVMRImagePresenterConfig9</b>. Custom allocator-presenters can also expose this interface if desired.) If the VMR-9 has not yet created the default allocator-presenter, or if the application provided a custom allocator-presenter which does not support <b>IVMRImagePresenterConfig9</b>, this method returns VFW_E_WRONG_STATE. To create the default allocator-presenter, call <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrfilterconfig9-setrenderingmode">IVMRFilterConfig9::SetRenderingMode</a> with the value VMR9Mode_Windowed or VMR9Mode_Windowed.
     * @param {Integer} dwRenderFlags Double word containing a bitwise OR of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9renderprefs">VMR9RenderPrefs</a> values specifying the rendering preferences.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrfilterconfig9-setrenderingprefs
     */
    SetRenderingPrefs(dwRenderFlags) {
        result := ComCall(6, this, "uint", dwRenderFlags, "HRESULT")
        return result
    }

    /**
     * The GetRenderingPrefs method retrieves the current set of rendering preferences being used by the VMR-9.
     * @remarks
     * If  the allocator-presenter implements the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/nn-vmr9-ivmrimagepresenterconfig9">IVMRImagePresenterConfig9</a> interface, this method calls the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrimagepresenterconfig9-getrenderingprefs">IVMRImagePresenterConfig9::GetRenderingPrefs</a> method on the allocator-presenter. 
     * 
     * The default allocator-presenter implements <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/nn-vmr9-ivmrimagepresenterconfig9">IVMRImagePresenterConfig9</a>. Custom allocator-presenters can also implements this interface if desired.
     * 
     * If the VMR-9 has not yet created the allocator-presenter, or if a custom allocator-presenter does not support <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/nn-vmr9-ivmrimagepresenterconfig9">IVMRImagePresenterConfig9</a>, this method returns <b>VFW_E_WRONG_STATE</b>. To create the default allocator-presenter, call <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrfilterconfig9-setrenderingmode">IVMRFilterConfig9::SetRenderingMode</a> with the value <b>VMR9Mode_Windowed</b> or <b>VMR9Mode_Windowless</b>.
     * @returns {Integer} Receives a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9renderprefs">VMR9RenderPrefs</a> value indicating the current rendering preferences.
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrfilterconfig9-getrenderingprefs
     */
    GetRenderingPrefs() {
        result := ComCall(7, this, "uint*", &pdwRenderFlags := 0, "HRESULT")
        return pdwRenderFlags
    }

    /**
     * The SetRenderingMode method sets the rendering mode used by the VMR.
     * @remarks
     * The VMR is in windowed mode (<b>VMR9Mode_Windowed</b>) by default. Use this method to put the VMR into windowless mode (<b>VMR9Mode_Windowless</b>) or renderless mode (<b>VMR9Mode_Renderless</b>).
     * 
     * The mode cannot be changed after any pin has been connected. Also, the mode cannot be changed from windowless or renderless mode back to windowed mode, even before pins are connected. Therefore, specifying <b>VMR9Mode_Windowed</b> for the <i>Mode</i> parameter has no effect under any circumstances.
     * @param {Integer} _Mode 
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
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
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrfilterconfig9-setrenderingmode
     */
    SetRenderingMode(_Mode) {
        result := ComCall(8, this, "uint", _Mode, "HRESULT")
        return result
    }

    /**
     * The GetRenderingMode method retrieves the rendering mode currently being used by the VMR.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9mode">VMR9Mode</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/vmr9/nf-vmr9-ivmrfilterconfig9-getrenderingmode
     */
    GetRenderingMode() {
        result := ComCall(9, this, "uint*", &pMode := 0, "HRESULT")
        return pMode
    }
}
