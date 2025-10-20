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
     * 
     * @param {Pointer<Int32>} lAnalogVideoStandard 
     * @returns {HRESULT} 
     */
    get_AvailableTVFormats(lAnalogVideoStandard) {
        result := ComCall(3, this, "int*", lAnalogVideoStandard, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lAnalogVideoStandard 
     * @returns {HRESULT} 
     */
    put_TVFormat(lAnalogVideoStandard) {
        result := ComCall(4, this, "int", lAnalogVideoStandard, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plAnalogVideoStandard 
     * @returns {HRESULT} 
     */
    get_TVFormat(plAnalogVideoStandard) {
        result := ComCall(5, this, "int*", plAnalogVideoStandard, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lVideoCopyProtection 
     * @returns {HRESULT} 
     */
    put_CopyProtection(lVideoCopyProtection) {
        result := ComCall(6, this, "int", lVideoCopyProtection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lVideoCopyProtection 
     * @returns {HRESULT} 
     */
    get_CopyProtection(lVideoCopyProtection) {
        result := ComCall(7, this, "int*", lVideoCopyProtection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lCCEnable 
     * @returns {HRESULT} 
     */
    put_CCEnable(lCCEnable) {
        result := ComCall(8, this, "int", lCCEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} lCCEnable 
     * @returns {HRESULT} 
     */
    get_CCEnable(lCCEnable) {
        result := ComCall(9, this, "int*", lCCEnable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
