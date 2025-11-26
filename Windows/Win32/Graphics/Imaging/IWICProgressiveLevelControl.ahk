#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for obtaining information about and controlling progressive decoding.
 * @remarks
 * 
 * Images can only be progressively decoded if they were progressively encoded. Progressive images automatically start at the highest (best quality) progressive level. The caller must manually set the decoder to a lower progressive level.
 * 
 * E_NOTIMPL is returned if the codec does not support progressive level decoding.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicprogressivelevelcontrol
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
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * Indicates the number of levels supported by the CODEC.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicprogressivelevelcontrol-getlevelcount
     */
    GetLevelCount() {
        result := ComCall(3, this, "uint*", &pcLevels := 0, "HRESULT")
        return pcLevels
    }

    /**
     * Gets the decoder's current progressive level.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * Indicates the current level specified.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicprogressivelevelcontrol-getcurrentlevel
     */
    GetCurrentLevel() {
        result := ComCall(4, this, "uint*", &pnLevel := 0, "HRESULT")
        return pnLevel
    }

    /**
     * Specifies the level to retrieve on the next call to CopyPixels.
     * @param {Integer} nLevel Type: <b>UINT</b>
     * 
     * Specifies which level to return next. If greater than the total number of levels supported, an error will be returned.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicprogressivelevelcontrol-setcurrentlevel
     */
    SetCurrentLevel(nLevel) {
        result := ComCall(5, this, "uint", nLevel, "HRESULT")
        return result
    }
}
