#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRFilterConfig interface is used to configure the operating mode and video rendering mechanisms of the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmrfilterconfig
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrfilterconfig-setimagecompositor
     */
    SetImageCompositor(lpVMRImgCompositor) {
        result := ComCall(3, this, "ptr", lpVMRImgCompositor, "HRESULT")
        return result
    }

    /**
     * The SetNumberOfStreams method sets the number of streams to be mixed and instructs the VMR to go into mixer mode.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrfilterconfig-setnumberofstreams
     */
    SetNumberOfStreams(dwMaxStreams) {
        result := ComCall(4, this, "uint", dwMaxStreams, "HRESULT")
        return result
    }

    /**
     * The GetNumberOfStreams method retrieves the number of input streams being mixed.
     * @returns {Integer} Pointer to a double word that receives the number of streams being mixed, which is equal to the number of input pins on the VMR.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrfilterconfig-getnumberofstreams
     */
    GetNumberOfStreams() {
        result := ComCall(5, this, "uint*", &pdwMaxStreams := 0, "HRESULT")
        return pdwMaxStreams
    }

    /**
     * The SetRenderingPrefs method sets various application preferences related to video rendering.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrfilterconfig-setrenderingprefs
     */
    SetRenderingPrefs(dwRenderFlags) {
        result := ComCall(6, this, "uint", dwRenderFlags, "HRESULT")
        return result
    }

    /**
     * The GetRenderingPrefs method retrieves the current set of rendering preferences being used by the VMR.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrrenderprefs">VMRRenderPrefs</a> enumeration, indicating the current rendering preferences.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrfilterconfig-getrenderingprefs
     */
    GetRenderingPrefs() {
        result := ComCall(7, this, "uint*", &pdwRenderFlags := 0, "HRESULT")
        return pdwRenderFlags
    }

    /**
     * The SetRenderingMode method sets the rendering mode used by the VMR.
     * @param {Integer} Mode Specifies the rendering mode as a <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrmode">VMRMode</a> value.
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
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrfilterconfig-setrenderingmode
     */
    SetRenderingMode(Mode) {
        result := ComCall(8, this, "uint", Mode, "HRESULT")
        return result
    }

    /**
     * The GetRenderingMode method retrieves the rendering mode currently being used by the VMR.
     * @returns {Integer} Pointer to a <b>DWORD</b> that receives a <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrmode">VMRMode</a> value indicating the current rendering mode.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrfilterconfig-getrenderingmode
     */
    GetRenderingMode() {
        result := ComCall(9, this, "uint*", &pMode := 0, "HRESULT")
        return pMode
    }
}
