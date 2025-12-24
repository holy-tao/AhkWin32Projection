#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The ITScriptableAudioFormat interface is used by scriptable clients to get the audio format from, or set the audio format for, the track. The interface provides properties for each member from the WAVEFORMATEX structure.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nn-tapi3if-itscriptableaudioformat
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class ITScriptableAudioFormat extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITScriptableAudioFormat
     * @type {Guid}
     */
    static IID => Guid("{b87658bd-3c59-4f64-be74-aede3e86a81e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Channels", "put_Channels", "get_SamplesPerSec", "put_SamplesPerSec", "get_AvgBytesPerSec", "put_AvgBytesPerSec", "get_BlockAlign", "put_BlockAlign", "get_BitsPerSample", "put_BitsPerSample", "get_FormatTag", "put_FormatTag"]

    /**
     * @type {Integer} 
     */
    Channels {
        get => this.get_Channels()
        set => this.put_Channels(value)
    }

    /**
     * @type {Integer} 
     */
    SamplesPerSec {
        get => this.get_SamplesPerSec()
        set => this.put_SamplesPerSec(value)
    }

    /**
     * @type {Integer} 
     */
    AvgBytesPerSec {
        get => this.get_AvgBytesPerSec()
        set => this.put_AvgBytesPerSec(value)
    }

    /**
     * @type {Integer} 
     */
    BlockAlign {
        get => this.get_BlockAlign()
        set => this.put_BlockAlign(value)
    }

    /**
     * @type {Integer} 
     */
    BitsPerSample {
        get => this.get_BitsPerSample()
        set => this.put_BitsPerSample(value)
    }

    /**
     * @type {Integer} 
     */
    FormatTag {
        get => this.get_FormatTag()
        set => this.put_FormatTag(value)
    }

    /**
     * The get_Channels method returns the value for the nChannels member in the WAVEFORMATEX structure.
     * @returns {Integer} Pointer to the value of the <b>nChannels</b> member in the 
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itscriptableaudioformat-get_channels
     */
    get_Channels() {
        result := ComCall(7, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The put_Channels method sets the nChannels member in the WAVEFORMATEX structure.
     * @param {Integer} nNewVal New value for the <b>nChannels</b> member in the 
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itscriptableaudioformat-put_channels
     */
    put_Channels(nNewVal) {
        result := ComCall(8, this, "int", nNewVal, "HRESULT")
        return result
    }

    /**
     * The get_SamplesPerSec method returns the value for the nSamplesPerSec member in the WAVEFORMATEX structure.
     * @returns {Integer} Pointer to the value of the <b>nSamplesPerSec</b> member in the 
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itscriptableaudioformat-get_samplespersec
     */
    get_SamplesPerSec() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The put_SamplesPerSec method sets the nSamplesPerSec member in the WAVEFORMATEX structure.
     * @param {Integer} nNewVal New value for the <b>nSamplesPerSec</b> member in the 
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itscriptableaudioformat-put_samplespersec
     */
    put_SamplesPerSec(nNewVal) {
        result := ComCall(10, this, "int", nNewVal, "HRESULT")
        return result
    }

    /**
     * The get_AvgBytesPerSec method returns the value for the nAvgBytesPerSec member in the WAVEFORMATEX structure.
     * @returns {Integer} Pointer to the value for the <b>nAvgBytesPerSec</b> member in the 
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itscriptableaudioformat-get_avgbytespersec
     */
    get_AvgBytesPerSec() {
        result := ComCall(11, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The put_AvgBytesPerSec method sets the nAvgBytesPerSec member in the WAVEFORMATEX structure.
     * @param {Integer} nNewVal New value for the <b>nAvgBytesPerSec</b> member in the 
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itscriptableaudioformat-put_avgbytespersec
     */
    put_AvgBytesPerSec(nNewVal) {
        result := ComCall(12, this, "int", nNewVal, "HRESULT")
        return result
    }

    /**
     * The get_BlockAlign method returns the value for the nBlockAlign member in the WAVEFORMATEX structure.
     * @returns {Integer} Pointer to the value of the <b>nBlockAlign</b> member in the 
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itscriptableaudioformat-get_blockalign
     */
    get_BlockAlign() {
        result := ComCall(13, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The put_BlockAlign method sets the nBlockAlign member in the WAVEFORMATEX structure.
     * @param {Integer} nNewVal New value for the <b>nBlockAlign</b> member in the 
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itscriptableaudioformat-put_blockalign
     */
    put_BlockAlign(nNewVal) {
        result := ComCall(14, this, "int", nNewVal, "HRESULT")
        return result
    }

    /**
     * The get_BitsPerSample method returns the value for the wBitsPerSample member in the WAVEFORMATEX structure.
     * @returns {Integer} Pointer to the value of the <b>wBitsPerSample</b> member in the 
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itscriptableaudioformat-get_bitspersample
     */
    get_BitsPerSample() {
        result := ComCall(15, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The put_BitsPerSample method sets the wBitsPerSample member in the WAVEFORMATEX structure.
     * @param {Integer} nNewVal New value for the <b>wBitsPerSample</b> member in the 
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itscriptableaudioformat-put_bitspersample
     */
    put_BitsPerSample(nNewVal) {
        result := ComCall(16, this, "int", nNewVal, "HRESULT")
        return result
    }

    /**
     * The get_FormatTag method returns the value for the wFormatTag member in the WAVEFORMATEX structure.
     * @returns {Integer} Pointer to the value of the <b>wFormatTag</b> member in the 
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itscriptableaudioformat-get_formattag
     */
    get_FormatTag() {
        result := ComCall(17, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The put_FormatTag method sets the wFormatTag member in the WAVEFORMATEX structure.
     * @param {Integer} nNewVal New value for the <b>wFormatTag</b> member in the 
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//tapi3if/nf-tapi3if-itscriptableaudioformat-put_formattag
     */
    put_FormatTag(nNewVal) {
        result := ComCall(18, this, "int", nNewVal, "HRESULT")
        return result
    }
}
