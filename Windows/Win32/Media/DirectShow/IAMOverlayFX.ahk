#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMOverlayFX interface controls how the video overlay appears on the user's screen. The Overlay Mixer filter implements this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamoverlayfx
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMOverlayFX extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMOverlayFX
     * @type {Guid}
     */
    static IID => Guid("{62fae250-7e65-4460-bfc9-6398b322073c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryOverlayFXCaps", "SetOverlayFX", "GetOverlayFX"]

    /**
     * The QueryOverlayFXCaps method retrieves information about which overlay effects are available to the Overlay Mixer filter.
     * @returns {Integer} Pointer to a variable that receives a value indicating the overlay effects capabilities of the overlay surface. The value is a logical combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-amoverlayfx">AMOVERLAYFX</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamoverlayfx-queryoverlayfxcaps
     */
    QueryOverlayFXCaps() {
        result := ComCall(3, this, "uint*", &lpdwOverlayFXCaps := 0, "HRESULT")
        return lpdwOverlayFXCaps
    }

    /**
     * The SetOverlayFX method applies the specified effects to the overlay surface.
     * @param {Integer} dwOverlayFX Value specifying which effects to apply. The value must be a logical combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-amoverlayfx">AMOVERLAYFX</a> enumeration, or the method returns E_INVALIDARG.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface. The DirectShow implementation may return one of the following values, or others not listed.
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
     * Failure.
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
     * Invalid argument.
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
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamoverlayfx-setoverlayfx
     */
    SetOverlayFX(dwOverlayFX) {
        result := ComCall(4, this, "uint", dwOverlayFX, "HRESULT")
        return result
    }

    /**
     * The GetOverlayFX method retrieves the effects currently applied to the overlay surface, if any. The application can call this method while the filter graph is running.
     * @returns {Integer} Pointer a variable that receives a value indicating which effects, if any, are currently applied to the overlay surface. The value is a logical combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-amoverlayfx">AMOVERLAYFX</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamoverlayfx-getoverlayfx
     */
    GetOverlayFX() {
        result := ComCall(5, this, "uint*", &lpdwOverlayFX := 0, "HRESULT")
        return lpdwOverlayFX
    }
}
