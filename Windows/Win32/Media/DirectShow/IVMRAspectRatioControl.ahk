#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRAspectRatioControl interface controls whether the Video Mixing Renderer Filter 7 (VMR-7) preserves the aspect ratio of the source video.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmraspectratiocontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRAspectRatioControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRAspectRatioControl
     * @type {Guid}
     */
    static IID => Guid("{ede80b5c-bad6-4623-b537-65586c9f8dfd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAspectRatioMode", "SetAspectRatioMode"]

    /**
     * The GetAspectRatioMode method queries whether the VMR will preserve the aspect ratio of the source video.
     * @returns {Integer} Pointer to a variable that receives a <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmr_aspect_ratio_mode">VMR_ASPECT_RATIO_MODE</a> value indicating the aspect ratio mode.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmraspectratiocontrol-getaspectratiomode
     */
    GetAspectRatioMode() {
        result := ComCall(3, this, "uint*", &lpdwARMode := 0, "HRESULT")
        return lpdwARMode
    }

    /**
     * The SetAspectRatioMode method specifies whether the VMR will preserve the aspect ratio of the source video.
     * @param {Integer} dwARMode Specifies a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmr_aspect_ratio_mode">VMR_ASPECT_RATIO_MODE</a> enumeration type.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
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
     * Invalid argument
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
     * Success
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmraspectratiocontrol-setaspectratiomode
     */
    SetAspectRatioMode(dwARMode) {
        result := ComCall(4, this, "uint", dwARMode, "HRESULT")
        return result
    }
}
