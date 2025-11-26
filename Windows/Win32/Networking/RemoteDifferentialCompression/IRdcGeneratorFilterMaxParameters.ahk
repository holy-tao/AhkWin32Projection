#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Sets and retrieves parameters used by the FilterMax generator.
 * @see https://docs.microsoft.com/windows/win32/api//msrdc/nn-msrdc-irdcgeneratorfiltermaxparameters
 * @namespace Windows.Win32.Networking.RemoteDifferentialCompression
 * @version v4.0.30319
 */
class IRdcGeneratorFilterMaxParameters extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRdcGeneratorFilterMaxParameters
     * @type {Guid}
     */
    static IID => Guid("{96236a72-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The class identifier for RdcGeneratorFilterMaxParameters
     * @type {Guid}
     */
    static CLSID => Guid("{96236a87-9dbc-11da-9e3f-0011114ae311}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetHorizonSize", "SetHorizonSize", "GetHashWindowSize", "SetHashWindowSize"]

    /**
     * Returns the horizon size�the length over which the FilterMax generator looks for local maxima.
     * @returns {Integer} Address of a <b>ULONG</b> that will receive the length in bytes of the horizon size. 
     *       The valid range is from <b>MSRDC_MINIMUM_HORIZONSIZE</b> to 
     *       <b>MSRDC_MAXIMUM_HORIZONSIZE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdcgeneratorfiltermaxparameters-gethorizonsize
     */
    GetHorizonSize() {
        result := ComCall(3, this, "uint*", &horizonSize := 0, "HRESULT")
        return horizonSize
    }

    /**
     * Sets the horizon size�the length over which the FilterMax generator looks for local maxima.
     * @param {Integer} horizonSize Specifies the length in bytes of the horizon size. 
     *       The valid range is from <b>MSRDC_MINIMUM_HORIZONSIZE</b> to 
     *       <b>MSRDC_MAXIMUM_HORIZONSIZE</b>. If this parameter is not set then a suitable default will 
     *       be used.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdcgeneratorfiltermaxparameters-sethorizonsize
     */
    SetHorizonSize(horizonSize) {
        result := ComCall(4, this, "uint", horizonSize, "HRESULT")
        return result
    }

    /**
     * Returns the hash window size�the size of the sliding window used by the FilterMax generator for computing the hash used in the local maxima calculations.
     * @returns {Integer} Address of a <b>ULONG</b> that will receive the length in bytes of the hash window 
     *       size. The valid range is from <b>MSRDC_MINIMUM_HASHWINDOWSIZE</b> to 
     *       <b>MSRDC_MAXIMUM_HASHWINDOWSIZE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdcgeneratorfiltermaxparameters-gethashwindowsize
     */
    GetHashWindowSize() {
        result := ComCall(5, this, "uint*", &hashWindowSize := 0, "HRESULT")
        return hashWindowSize
    }

    /**
     * Sets the hash window size�the size of the sliding window used by the FilterMax generator for computing the hash used in the local maxima calculations.
     * @param {Integer} hashWindowSize The length in bytes of the hash window size. The valid range is from 
     *       <b>MSRDC_MINIMUM_HASHWINDOWSIZE</b> to 
     *       <b>MSRDC_MAXIMUM_HASHWINDOWSIZE</b>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msrdc/nf-msrdc-irdcgeneratorfiltermaxparameters-sethashwindowsize
     */
    SetHashWindowSize(hashWindowSize) {
        result := ComCall(6, this, "uint", hashWindowSize, "HRESULT")
        return result
    }
}
