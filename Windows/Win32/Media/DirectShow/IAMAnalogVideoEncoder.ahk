#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Note  This interface has been deprecated. Note  Microsoft does not provide an implementation of this interface.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamanalogvideoencoder
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMAnalogVideoEncoder extends IUnknown {
    /**
     * The interface identifier for IAMAnalogVideoEncoder
     * @type {Guid}
     */
    static IID := Guid("{c6e133b0-30ac-11d0-a18c-00a0c9118956}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMAnalogVideoEncoder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_AvailableTVFormats : IntPtr
        put_TVFormat           : IntPtr
        get_TVFormat           : IntPtr
        put_CopyProtection     : IntPtr
        get_CopyProtection     : IntPtr
        put_CCEnable           : IntPtr
        get_CCEnable           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMAnalogVideoEncoder.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideoencoder-get_availabletvformats
     */
    get_AvailableTVFormats() {
        result := ComCall(3, this, "int*", &lAnalogVideoStandard := 0, "HRESULT")
        return lAnalogVideoStandard
    }

    /**
     * Note  The IAMAnalogVideoEncoder interface is deprecated. The put_TVFormat method sets the encoder to a particular analog video standard (NTSC/M, PAL/B, SECAM/K1, and so on).
     * @param {Integer} lAnalogVideoStandard Specifies the video standard to set in the encoder as a [AnalogVideoStandard](/windows/desktop/api/strmif/ne-strmif-analogvideostandard) enumeration.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideoencoder-put_tvformat
     */
    put_TVFormat(lAnalogVideoStandard) {
        result := ComCall(4, this, "int", lAnalogVideoStandard, "HRESULT")
        return result
    }

    /**
     * Note  The IAMAnalogVideoEncoder interface is deprecated. The get_TVFormat method retrieves the analog video standard that the encoder is currently set to (NTSC/M, PAL/B, SECAM/K1, and so on).
     * @remarks
     * Possible values and their meaning are defined in the [AnalogVideoStandard](/windows/desktop/api/strmif/ne-strmif-analogvideostandard) enumeration.
     * @returns {Integer} Specifies a pointer to a <b>long</b> integer to receive the encoder's current video standard.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideoencoder-get_tvformat
     */
    get_TVFormat() {
        result := ComCall(5, this, "int*", &plAnalogVideoStandard := 0, "HRESULT")
        return plAnalogVideoStandard
    }

    /**
     * Note  The IAMAnalogVideoEncoder interface is deprecated. The put_CopyProtection method sets the level of copy protection for the encoder.
     * @param {Integer} lVideoCopyProtection Specifies the level of copy protection as a <b>long</b> integer with a value as defined in the <a href="https://docs.microsoft.com/previous-versions/ms778997(v=vs.85)">AM_COPY_MACROVISION_LEVEL</a> enumeration.
     * @returns {HRESULT} When this method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideoencoder-put_copyprotection
     */
    put_CopyProtection(lVideoCopyProtection) {
        result := ComCall(6, this, "int", lVideoCopyProtection, "HRESULT")
        return result
    }

    /**
     * Note  The IAMAnalogVideoEncoder interface is deprecated. The get_CopyProtection method determines whether copy protection is currently enabled on the encoder.
     * @returns {Integer} Specifies a pointer to a <b>long</b> integer to receive the current copy protection level, as defined in the <a href="https://docs.microsoft.com/windows/desktop/api/dvdmedia/ne-dvdmedia-am_copy_macrovision_level">AM_COPY_MACROVISION_LEVEL</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideoencoder-get_copyprotection
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideoencoder-put_ccenable
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideoencoder-get_ccenable
     */
    get_CCEnable() {
        result := ComCall(9, this, "int*", &lCCEnable := 0, "HRESULT")
        return lCCEnable
    }

    Query(iid) {
        if (IAMAnalogVideoEncoder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_AvailableTVFormats := CallbackCreate(GetMethod(implObj, "get_AvailableTVFormats"), flags, 2)
        this.vtbl.put_TVFormat := CallbackCreate(GetMethod(implObj, "put_TVFormat"), flags, 2)
        this.vtbl.get_TVFormat := CallbackCreate(GetMethod(implObj, "get_TVFormat"), flags, 2)
        this.vtbl.put_CopyProtection := CallbackCreate(GetMethod(implObj, "put_CopyProtection"), flags, 2)
        this.vtbl.get_CopyProtection := CallbackCreate(GetMethod(implObj, "get_CopyProtection"), flags, 2)
        this.vtbl.put_CCEnable := CallbackCreate(GetMethod(implObj, "put_CCEnable"), flags, 2)
        this.vtbl.get_CCEnable := CallbackCreate(GetMethod(implObj, "get_CCEnable"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_AvailableTVFormats)
        CallbackFree(this.vtbl.put_TVFormat)
        CallbackFree(this.vtbl.get_TVFormat)
        CallbackFree(this.vtbl.put_CopyProtection)
        CallbackFree(this.vtbl.get_CopyProtection)
        CallbackFree(this.vtbl.put_CCEnable)
        CallbackFree(this.vtbl.get_CCEnable)
    }
}
