#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ASF_MUX_STATISTICS.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to create Advanced Systems Format (ASF) data packets.
 * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nn-wmcontainer-imfasfmultiplexer
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFASFMultiplexer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFASFMultiplexer
     * @type {Guid}
     */
    static IID => Guid("{57bdd80a-9b38-4838-b737-c58f670d7d4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "SetFlags", "GetFlags", "ProcessSample", "GetNextPacket", "Flush", "End", "GetStatistics", "SetSyncTolerance"]

    /**
     * Initializes the multiplexer with the data from an ASF ContentInfo object.
     * @param {IMFASFContentInfo} pIContentInfo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfcontentinfo">IMFASFContentInfo</a> interface of the <b>MFASFContentInfo</b> object that contains the header information of the new ASF file. The multiplexer will generate data packets for this file.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfmultiplexer-initialize
     */
    Initialize(pIContentInfo) {
        result := ComCall(3, this, "ptr", pIContentInfo, "HRESULT")
        return result
    }

    /**
     * Sets multiplexer options.
     * @param {Integer} dwFlags Bitwise <b>OR</b> of zero or more members of the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/ne-wmcontainer-mfasf_multiplexerflags">MFASF_MULTIPLEXERFLAGS</a> enumeration. These flags specify which multiplexer options to use. For more information, see "Multiplexer Initialization and Leaky Bucket Settings" in <a href="https://docs.microsoft.com/windows/desktop/medfound/creating-the-multiplexer-object">Creating the Multiplexer Object</a>.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfmultiplexer-setflags
     */
    SetFlags(dwFlags) {
        result := ComCall(4, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Retrieves flags indicating the configured multiplexer options.
     * @returns {Integer} Receives a bitwise <b>OR</b> of zero or more values from the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/ne-wmcontainer-mfasf_multiplexerflags">MFASF_MULTIPLEXERFLAGS</a> enumeration. To set these flags, call <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfmultiplexer-setflags">IMFASFMultiplexer::SetFlags</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfmultiplexer-getflags
     */
    GetFlags() {
        result := ComCall(5, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Delivers input samples to the multiplexer.
     * @param {Integer} wStreamNumber The stream number of the stream to which the sample belongs.
     * @param {IMFSample} pISample Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface of the input sample. The input sample contains the media data to be converted to ASF data packets. When possible, the time stamp of this sample should be accurate.
     * @param {Integer} hnsTimestampAdjust The adjustment to apply to the time stamp of the sample. This parameter is used if the caller wants to shift the sample time on <i>pISample</i>. This value should be positive if the time stamp should be pushed ahead and negative if the time stamp should be pushed back. This time stamp is added to sample time on <i>pISample</i>, and the resulting time is used by the multiplexer instead of the original sample time. If no adjustment is needed, set this value to 0.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOTACCEPTING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are too many packets waiting to be retrieved from the multiplexer. Call <a href="/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfmultiplexer-getnextpacket">IMFASFMultiplexer::GetNextPacket</a> to get the packets.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_BANDWIDTH_OVERRUN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sample that was processed violates the bandwidth limitations specified for the stream in the ASF ContentInfo object. When this error is generated, the sample is dropped.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDSTREAMNUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value passed in <i>wStreamNumber</i> is invalid.
     *               
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_LATE_SAMPLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The presentation time of the input media sample is earlier than the send time.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfmultiplexer-processsample
     */
    ProcessSample(wStreamNumber, pISample, hnsTimestampAdjust) {
        result := ComCall(6, this, "ushort", wStreamNumber, "ptr", pISample, "int64", hnsTimestampAdjust, "HRESULT")
        return result
    }

    /**
     * Retrieves the next output ASF packet from the multiplexer.
     * @param {Pointer<Integer>} pdwStatusFlags Receives zero or more status flags. If more than one packet is waiting, the method sets the <b>ASF_STATUSFLAGS_INCOMPLETE</b> flag.
     * @param {Pointer<IMFSample>} ppIPacket Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface of the first output sample of the data packet. The caller must release the interface.
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
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfmultiplexer-getnextpacket
     */
    GetNextPacket(pdwStatusFlags, ppIPacket) {
        pdwStatusFlagsMarshal := pdwStatusFlags is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwStatusFlagsMarshal, pdwStatusFlags, "ptr*", ppIPacket, "HRESULT")
        return result
    }

    /**
     * Signals the multiplexer to process all queued output media samples. Call this method after passing the last sample to the multiplexer.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfmultiplexer-flush
     */
    Flush() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Collects data from the multiplexer and updates the ASF ContentInfo object to include that information in the ASF Header Object.
     * @param {IMFASFContentInfo} pIContentInfo Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfcontentinfo">IMFASFContentInfo</a> interface of the ContentInfo object. This must be the same object that was used to initialize the multiplexer. The ContentInfo object represents the ASF Header Object of the file for which the multiplexer generated data packets.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_FLUSH_NEEDED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There are pending output media samples waiting in the multiplexer. Call <a href="/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfmultiplexer-flush">IMFASFMultiplexer::Flush</a> to force the media samples to be packetized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfmultiplexer-end
     */
    End(pIContentInfo) {
        result := ComCall(9, this, "ptr", pIContentInfo, "HRESULT")
        return result
    }

    /**
     * Retrieves multiplexer statistics.
     * @param {Integer} wStreamNumber The stream number for which to obtain statistics.
     * @returns {ASF_MUX_STATISTICS} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/ns-wmcontainer-asf_mux_statistics">ASF_MUX_STATISTICS</a> structure that receives the statistics.
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfmultiplexer-getstatistics
     */
    GetStatistics(wStreamNumber) {
        pMuxStats := ASF_MUX_STATISTICS()
        result := ComCall(10, this, "ushort", wStreamNumber, "ptr", pMuxStats, "HRESULT")
        return pMuxStats
    }

    /**
     * Sets the maximum time by which samples from various streams can be out of synchronization.
     * @param {Integer} msSyncTolerance Synchronization tolerance in milliseconds.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmcontainer/nf-wmcontainer-imfasfmultiplexer-setsynctolerance
     */
    SetSyncTolerance(msSyncTolerance) {
        result := ComCall(11, this, "uint", msSyncTolerance, "HRESULT")
        return result
    }
}
