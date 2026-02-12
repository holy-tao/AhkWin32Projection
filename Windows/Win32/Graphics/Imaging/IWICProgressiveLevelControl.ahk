#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for obtaining information about and controlling progressive decoding.
 * @remarks
 * Images can only be progressively decoded if they were progressively encoded. Progressive images automatically start at the highest (best quality) progressive level. The caller must manually set the decoder to a lower progressive level.
 * 
 * E_NOTIMPL is returned if the codec does not support progressive level decoding.
 * @see https://learn.microsoft.com/windows/win32/api//content/wincodec/nn-wincodec-iwicprogressivelevelcontrol
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICProgressiveLevelControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICProgressiveLevelControl
     * @type {Guid}
     */
    static IID => Guid("{daac296f-7aa5-4dbf-8d15-225c5976f891}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetLevelCount", "GetCurrentLevel", "SetCurrentLevel"]

    /**
     * Gets the number of levels of progressive decoding supported by the CODEC.
     * @remarks
     * Users should not use this function to iterate through the progressive levels of a progressive JPEG image. JPEG progressive levels are determined by the image and do not have a fixed level count. Using this method will force the application to wait for all progressive levels to be downloaded before it can return. Instead, applications should use the following code to iterate through the progressive levels of a progressive JPEG image.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * Indicates the number of levels supported by the CODEC.
     * @see https://learn.microsoft.com/windows/win32/api//content/wincodec/nf-wincodec-iwicprogressivelevelcontrol-getlevelcount
     */
    GetLevelCount() {
        result := ComCall(3, this, "uint*", &pcLevels := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcLevels
    }

    /**
     * Gets the decoder's current progressive level.
     * @remarks
     * The level always defaults to the highest progressive level. In order to decode a lower progressive level, <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicprogressivelevelcontrol-setcurrentlevel">SetCurrentLevel</a> must first be called.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * Indicates the current level specified.
     * @see https://learn.microsoft.com/windows/win32/api//content/wincodec/nf-wincodec-iwicprogressivelevelcontrol-getcurrentlevel
     */
    GetCurrentLevel() {
        result := ComCall(4, this, "uint*", &pnLevel := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pnLevel
    }

    /**
     * Specifies the level to retrieve on the next call to CopyPixels.
     * @remarks
     * A call does not have to request every level supported.
     *         If a caller requests level 1, without having previously requested level 0, the bits returned by the next call to <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapsource-copypixels">CopyPixels</a> will include both levels.
     *       
     * 
     * If the requested level is invalid, the error returned is <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-error-codes">WINCODEC_ERR_INVALIDPROGRESSIVELEVEL</a>.
     * @param {Integer} nLevel Type: <b>UINT</b>
     * 
     * Specifies which level to return next. If greater than the total number of levels supported, an error will be returned.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wincodec/nf-wincodec-iwicprogressivelevelcontrol-setcurrentlevel
     */
    SetCurrentLevel(nLevel) {
        result := ComCall(5, this, "uint", nLevel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
