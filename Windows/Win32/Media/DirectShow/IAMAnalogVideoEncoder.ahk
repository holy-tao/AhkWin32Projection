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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideoencoder-get_availabletvformats
     */
    get_AvailableTVFormats() {
        result := ComCall(3, this, "int*", &lAnalogVideoStandard := 0, "HRESULT")
        return lAnalogVideoStandard
    }

    /**
     * 
     * @param {Integer} lAnalogVideoStandard 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideoencoder-put_tvformat
     */
    put_TVFormat(lAnalogVideoStandard) {
        result := ComCall(4, this, "int", lAnalogVideoStandard, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideoencoder-get_tvformat
     */
    get_TVFormat() {
        result := ComCall(5, this, "int*", &plAnalogVideoStandard := 0, "HRESULT")
        return plAnalogVideoStandard
    }

    /**
     * 
     * @param {Integer} lVideoCopyProtection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideoencoder-put_copyprotection
     */
    put_CopyProtection(lVideoCopyProtection) {
        result := ComCall(6, this, "int", lVideoCopyProtection, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideoencoder-get_copyprotection
     */
    get_CopyProtection() {
        result := ComCall(7, this, "int*", &lVideoCopyProtection := 0, "HRESULT")
        return lVideoCopyProtection
    }

    /**
     * 
     * @param {Integer} lCCEnable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideoencoder-put_ccenable
     */
    put_CCEnable(lCCEnable) {
        result := ComCall(8, this, "int", lCCEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamanalogvideoencoder-get_ccenable
     */
    get_CCEnable() {
        result := ComCall(9, this, "int*", &lCCEnable := 0, "HRESULT")
        return lCCEnable
    }
}
