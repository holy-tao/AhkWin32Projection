#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Queries the range of playback rates that are supported, including reverse playback.
 * @remarks
 * 
 * Applications can use this interface to discover the fastest and slowest playback rates that are possible, and to query whether a given playback rate is supported. Applications obtain this interface from the Media Session. Internally, the Media Session queries the objects in the pipeline. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/how-to-determine-supported-rates">How to Determine Supported Rates</a>.
 * 
 * To get the current playback rate and to change the playback rate, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfratecontrol">IMFRateControl</a> interface.
 * 
 * Playback rates are expressed as a ratio the normal playback rate. Reverse playback is expressed as a negative rate. Playback is either <i>thinned</i> or <i>non-thinned</i>. In thinned playback, some of the source data is skipped (typically delta frames). In non-thinned playback, all of the source data is rendered.
 * 
 * You might need to implement this interface if you are writing a pipeline object (media source, transform, or media sink). For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/implementing-rate-control">Implementing Rate Control</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfratesupport
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFRateSupport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFRateSupport
     * @type {Guid}
     */
    static IID => Guid("{0a9ccdbc-d797-4563-9667-94ec5d79292d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSlowestRate", "GetFastestRate", "IsRateSupported"]

    /**
     * 
     * @param {Integer} eDirection 
     * @param {BOOL} fThin 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfratesupport-getslowestrate
     */
    GetSlowestRate(eDirection, fThin) {
        result := ComCall(3, this, "int", eDirection, "int", fThin, "float*", &pflRate := 0, "HRESULT")
        return pflRate
    }

    /**
     * 
     * @param {Integer} eDirection 
     * @param {BOOL} fThin 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfratesupport-getfastestrate
     */
    GetFastestRate(eDirection, fThin) {
        result := ComCall(4, this, "int", eDirection, "int", fThin, "float*", &pflRate := 0, "HRESULT")
        return pflRate
    }

    /**
     * 
     * @param {BOOL} fThin 
     * @param {Float} flRate 
     * @param {Pointer<Float>} pflNearestSupportedRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfratesupport-isratesupported
     */
    IsRateSupported(fThin, flRate, pflNearestSupportedRate) {
        pflNearestSupportedRateMarshal := pflNearestSupportedRate is VarRef ? "float*" : "ptr"

        result := ComCall(5, this, "int", fThin, "float", flRate, pflNearestSupportedRateMarshal, pflNearestSupportedRate, "HRESULT")
        return result
    }
}
