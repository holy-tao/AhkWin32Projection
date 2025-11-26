#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Note  This interface has been deprecated. Note  Microsoft does not provide an implementation of this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamanalogvideoencoder
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMAnalogVideoEncoder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMAnalogVideoEncoder
     * @type {Guid}
     */
    static IID => Guid("{c6e133b0-30ac-11d0-a18c-00a0c9118956}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AvailableTVFormats", "put_TVFormat", "get_TVFormat", "put_CopyProtection", "get_CopyProtection", "put_CCEnable", "get_CCEnable"]

    /**
     * @type {Integer} 
     */
    AvailableTVFormats {
        get => this.get_AvailableTVFormats()
    }

    /**
     * @type {Integer} 
     */
    TVFormat {
        get => this.get_TVFormat()
        set => this.put_TVFormat(value)
    }

    /**
     * @type {Integer} 
     */
    CopyProtection {
        get => this.get_CopyProtection()
        set => this.put_CopyProtection(value)
    }

    /**
     * @type {Integer} 
     */
    CCEnable {
        get => this.get_CCEnable()
        set => this.put_CCEnable(value)
    }

    /**
     * Note  The IAMAnalogVideoEncoder interface is deprecated. The get_AvailableTVFormats method retrieves the analog video standards (NTSC/M, PAL/B, SECAM/K1, and so on) supported by the encoder.
     * @returns {Integer} Specifies a pointer to a [AnalogVideoStandard](/windows/desktop/api/strmif/ne-strmif-analogvideostandard) enumeration and the available formats have been combined in this integer with a bitwise OR.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamanalogvideoencoder-get_availabletvformats
     */
    get_AvailableTVFormats() {
        result := ComCall(3, this, "int*", &lAnalogVideoStandard := 0, "HRESULT")
        return lAnalogVideoStandard
    }

    /**
     * Note  The IAMAnalogVideoEncoder interface is deprecated. The put_TVFormat method sets the encoder to a particular analog video standard (NTSC/M, PAL/B, SECAM/K1, and so on).
     * @param {Integer} lAnalogVideoStandard Specifies the video standard to set in the encoder as a [AnalogVideoStandard](/windows/desktop/api/strmif/ne-strmif-analogvideostandard) enumeration.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamanalogvideoencoder-put_tvformat
     */
    put_TVFormat(lAnalogVideoStandard) {
        result := ComCall(4, this, "int", lAnalogVideoStandard, "HRESULT")
        return result
    }

    /**
     * Note  The IAMAnalogVideoEncoder interface is deprecated. The get_TVFormat method retrieves the analog video standard that the encoder is currently set to (NTSC/M, PAL/B, SECAM/K1, and so on).
     * @returns {Integer} Specifies a pointer to a <b>long</b> integer to receive the encoder's current video standard.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamanalogvideoencoder-get_tvformat
     */
    get_TVFormat() {
        result := ComCall(5, this, "int*", &plAnalogVideoStandard := 0, "HRESULT")
        return plAnalogVideoStandard
    }

    /**
     * Note  The IAMAnalogVideoEncoder interface is deprecated. The put_CopyProtection method sets the level of copy protection for the encoder.
     * @param {Integer} lVideoCopyProtection Specifies the level of copy protection as a <b>long</b> integer with a value as defined in the <a href="https://docs.microsoft.com/windows/desktop/api/dvdmedia/ne-dvdmedia-am_copy_macrovision_level">AM_COPY_MACROVISION_LEVEL</a> enumeration.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamanalogvideoencoder-put_copyprotection
     */
    put_CopyProtection(lVideoCopyProtection) {
        result := ComCall(6, this, "int", lVideoCopyProtection, "HRESULT")
        return result
    }

    /**
     * Note  The IAMAnalogVideoEncoder interface is deprecated. The get_CopyProtection method determines whether copy protection is currently enabled on the encoder.
     * @returns {Integer} Specifies a pointer to a <b>long</b> integer to receive the current copy protection level, as defined in the <a href="https://docs.microsoft.com/windows/desktop/api/dvdmedia/ne-dvdmedia-am_copy_macrovision_level">AM_COPY_MACROVISION_LEVEL</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamanalogvideoencoder-get_copyprotection
     */
    get_CopyProtection() {
        result := ComCall(7, this, "int*", &lVideoCopyProtection := 0, "HRESULT")
        return lVideoCopyProtection
    }

    /**
     * Note  The IAMAnalogVideoEncoder interface is deprecated. The put_CCEnable method enables or disables closed captioning.
     * @param {Integer} lCCEnable Specifies whether closed captioning is on or off as a <b>long</b> integer.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Closed captioning is on.</td>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Closed captioning is off.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamanalogvideoencoder-put_ccenable
     */
    put_CCEnable(lCCEnable) {
        result := ComCall(8, this, "int", lCCEnable, "HRESULT")
        return result
    }

    /**
     * Note  The IAMAnalogVideoEncoder interface is deprecated. The get_CCEnable determines whether closed captioning on the encoder is currently enabled.
     * @returns {Integer} Specifies a pointer to a long integer to receive the current status of closed captioning on the encoder.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>Closed captioning enabled.</td>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>Closed captioning disabled.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iamanalogvideoencoder-get_ccenable
     */
    get_CCEnable() {
        result := ComCall(9, this, "int*", &lCCEnable := 0, "HRESULT")
        return lCCEnable
    }
}
