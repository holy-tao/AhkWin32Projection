#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\NORMALIZEDRECT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IVMRMixerControl interface is enables an application to manipulate the incoming video streams on the Video Mixing Renderer Filter 7 (VMR-7).
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ivmrmixercontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVMRMixerControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVMRMixerControl
     * @type {Guid}
     */
    static IID => Guid("{1c1a17b0-bed0-415d-974b-dc6696131599}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAlpha", "GetAlpha", "SetZOrder", "GetZOrder", "SetOutputRect", "GetOutputRect", "SetBackgroundClr", "GetBackgroundClr", "SetMixingPrefs", "GetMixingPrefs"]

    /**
     * The SetAlpha method sets a constant alpha value that is applied to this video stream.
     * @param {Integer} dwStreamID Specifies the input stream.
     * @param {Float} Alpha Specifies the alpha blending value to be applied to all the pixels in this stream.
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
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrmixercontrol-setalpha
     */
    SetAlpha(dwStreamID, Alpha) {
        result := ComCall(3, this, "uint", dwStreamID, "float", Alpha, "HRESULT")
        return result
    }

    /**
     * The GetAlpha method retrieves the constant alpha value that is applied to this video stream.
     * @param {Integer} dwStreamID Specifies the input stream.
     * @returns {Float} Pointer to a variable of type float that receives the current alpha value.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrmixercontrol-getalpha
     */
    GetAlpha(dwStreamID) {
        result := ComCall(4, this, "uint", dwStreamID, "float*", &pAlpha := 0, "HRESULT")
        return pAlpha
    }

    /**
     * The SetZOrder method sets this video stream's position in the Z-order; larger values are further away.
     * @param {Integer} dwStreamID Specifies the input stream.
     * @param {Integer} dwZ Double word containing the stream's position within the Z-order.
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
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrmixercontrol-setzorder
     */
    SetZOrder(dwStreamID, dwZ) {
        result := ComCall(5, this, "uint", dwStreamID, "uint", dwZ, "HRESULT")
        return result
    }

    /**
     * The GetZOrder method retrieves this video stream's position in the Z order.
     * @param {Integer} dwStreamID Specifies the input stream.
     * @returns {Integer} Pointer to a DWORD that receives the current position in the Z-order.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrmixercontrol-getzorder
     */
    GetZOrder(dwStreamID) {
        result := ComCall(6, this, "uint", dwStreamID, "uint*", &pZ := 0, "HRESULT")
        return pZ
    }

    /**
     * The SetOutputRect method sets the position of this stream within the composition rectangle.
     * @param {Integer} dwStreamID Specifies the input stream.
     * @param {Pointer<NORMALIZEDRECT>} pRect Pointer to a [NORMALIZEDRECT](/windows/desktop/api/strmif/ns-strmif-normalizedrect) structure that specifies the position of the rectangle with composition space.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pRect</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pin is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrmixercontrol-setoutputrect
     */
    SetOutputRect(dwStreamID, pRect) {
        result := ComCall(7, this, "uint", dwStreamID, "ptr", pRect, "HRESULT")
        return result
    }

    /**
     * The GetOutputRect method retrieves the position of this stream's video rectangle within the composition rectangle.
     * @param {Integer} dwStreamID Specifies the input stream.
     * @returns {NORMALIZEDRECT} Pointer to a [NORMALIZEDRECT](/windows/desktop/api/strmif/ns-strmif-normalizedrect) structure that receives the destination rectangle in composition space.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrmixercontrol-getoutputrect
     */
    GetOutputRect(dwStreamID) {
        pRect := NORMALIZEDRECT()
        result := ComCall(8, this, "uint", dwStreamID, "ptr", pRect, "HRESULT")
        return pRect
    }

    /**
     * Sets the background color on the output rectangle.
     * @param {COLORREF} ClrBkg Specifies the background color.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrmixercontrol-setbackgroundclr
     */
    SetBackgroundClr(ClrBkg) {
        result := ComCall(9, this, "uint", ClrBkg, "HRESULT")
        return result
    }

    /**
     * Gets the current background color on the output rectangle.
     * @param {Pointer<COLORREF>} lpClrBkg Address of a variable that receives the background color.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrmixercontrol-getbackgroundclr
     */
    GetBackgroundClr(lpClrBkg) {
        lpClrBkgMarshal := lpClrBkg is VarRef ? "uint*" : "ptr"

        result := ComCall(10, this, lpClrBkgMarshal, lpClrBkg, "HRESULT")
        return result
    }

    /**
     * Sets the mixing preferences for the stream.
     * @param {Integer} dwMixerPrefs Bitwise <b>OR</b> combination of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrmixerprefs">VMRMixerPrefs</a> flags.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrmixercontrol-setmixingprefs
     */
    SetMixingPrefs(dwMixerPrefs) {
        result := ComCall(11, this, "uint", dwMixerPrefs, "HRESULT")
        return result
    }

    /**
     * Retrieves the mixing preferences for the stream.
     * @returns {Integer} Address of a variable that receives a bitwise OR combination of <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrmixerprefs">VMRMixerPrefs</a> flags.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ivmrmixercontrol-getmixingprefs
     */
    GetMixingPrefs() {
        result := ComCall(12, this, "uint*", &pdwMixerPrefs := 0, "HRESULT")
        return pdwMixerPrefs
    }
}
