#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Queries the range of playback rates that are supported, including reverse playback.
 * @remarks
 * Applications can use this interface to discover the fastest and slowest playback rates that are possible, and to query whether a given playback rate is supported. Applications obtain this interface from the Media Session. Internally, the Media Session queries the objects in the pipeline. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/how-to-determine-supported-rates">How to Determine Supported Rates</a>.
 * 
 * To get the current playback rate and to change the playback rate, use the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfratecontrol">IMFRateControl</a> interface.
 * 
 * Playback rates are expressed as a ratio the normal playback rate. Reverse playback is expressed as a negative rate. Playback is either <i>thinned</i> or <i>non-thinned</i>. In thinned playback, some of the source data is skipped (typically delta frames). In non-thinned playback, all of the source data is rendered.
 * 
 * You might need to implement this interface if you are writing a pipeline object (media source, transform, or media sink). For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/implementing-rate-control">Implementing Rate Control</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nn-mfidl-imfratesupport
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
     * Retrieves the slowest playback rate supported by the object.
     * @remarks
     * The value returned in <i>plfRate</i> represents a lower bound. Playback at this rate is not guaranteed. Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfratesupport-isratesupported">IMFRateSupport::IsRateSupported</a> to check whether the boundary rate is supported. For example, a component that supports arbitrarily slow rates will return zero in <i>pflRate</i>, and applications should call <b>IsRateSupported</b> separately to determine whether the component supports rate 0.
     * 
     * If <i>eDirection</i> is MFRATE_REVERSE, the method retrieves the slowest reverse playback rate. This is a negative value, assuming the object supports reverse playback.
     * @param {Integer} eDirection Specifies whether to query to the slowest forward playback rate or reverse playback rate. The value is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfrate_direction">MFRATE_DIRECTION</a> enumeration.
     * @param {BOOL} fThin If <b>TRUE</b>, the method retrieves the slowest thinned playback rate. Otherwise, the method retrieves the slowest non-thinned playback rate. For information about thinning, see <a href="https://docs.microsoft.com/windows/desktop/medfound/about-rate-control">About Rate Control</a>.
     * @returns {Float} Receives the slowest playback rate that the object supports.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfratesupport-getslowestrate
     */
    GetSlowestRate(eDirection, fThin) {
        result := ComCall(3, this, "int", eDirection, "int", fThin, "float*", &pflRate := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pflRate
    }

    /**
     * Gets the fastest playback rate supported by the object.
     * @remarks
     * For some formats (such as ASF), thinning means dropping all frames that are not I-frames. If a component produces stream data, such as a media source or a demultiplexer, it should pay attention to the <i>fThin</i> parameter and return MF_E_THINNING_UNSUPPORTED if it cannot thin the stream.
     * 
     * If the component processes or receives a stream (most transforms or media sinks), it may ignore this parameter if it does not care whether the stream is thinned. In the Media Session's implementation of rate support, if the transforms do not explicitly support reverse playback, the Media Session will attempt to playback in reverse with thinning but not without thinning. Therefore, most applications will set <i>fThin</i> to <b>TRUE</b> when using the Media Session for reverse playback.
     * 
     * If <i>eDirection</i> is MFRATE_REVERSE, the method retrieves the fastest reverse playback rate. This is a negative value, assuming the object supports reverse playback.
     * @param {Integer} eDirection Specifies whether to query to the fastest forward playback rate or reverse playback rate. The value is a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfrate_direction">MFRATE_DIRECTION</a> enumeration.
     * @param {BOOL} fThin If <b>TRUE</b>, the method retrieves the fastest thinned playback rate. Otherwise, the method retrieves the fastest non-thinned playback rate. For information about thinning, see <a href="https://docs.microsoft.com/windows/desktop/medfound/about-rate-control">About Rate Control</a>.
     * @returns {Float} Receives the fastest playback rate that the object supports.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfratesupport-getfastestrate
     */
    GetFastestRate(eDirection, fThin) {
        result := ComCall(4, this, "int", eDirection, "int", fThin, "float*", &pflRate := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pflRate
    }

    /**
     * Queries whether the object supports a specified playback rate.
     * @param {BOOL} fThin If <b>TRUE</b>, the method queries whether the object supports the playback rate with thinning. Otherwise, the method queries whether the object supports the playback rate without thinning. For information about thinning, see <a href="https://docs.microsoft.com/windows/desktop/medfound/about-rate-control">About Rate Control</a>.
     * @param {Float} flRate The playback rate to query.
     * @param {Pointer<Float>} pflNearestSupportedRate If the object does not support the playback rate given in <i>flRate</i>, this parameter receives the closest supported playback rate. If the method returns S_OK, this parameter receives the value given in <i>flRate</i>. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object supports the specified rate.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_REVERSE_UNSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object does not support reverse playback.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_THINNING_UNSUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object does not support thinning.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_UNSUPPORTED_RATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object does not support the specified rate.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/mfidl/nf-mfidl-imfratesupport-isratesupported
     */
    IsRateSupported(fThin, flRate, pflNearestSupportedRate) {
        pflNearestSupportedRateMarshal := pflNearestSupportedRate is VarRef ? "float*" : "ptr"

        result := ComCall(5, this, "int", fThin, "float", flRate, pflNearestSupportedRateMarshal, pflNearestSupportedRate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
