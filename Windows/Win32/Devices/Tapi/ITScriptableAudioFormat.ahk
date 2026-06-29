#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The ITScriptableAudioFormat interface is used by scriptable clients to get the audio format from, or set the audio format for, the track. The interface provides properties for each member from the WAVEFORMATEX structure.
 * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nn-tapi3if-itscriptableaudioformat
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct ITScriptableAudioFormat extends IDispatch {
    /**
     * The interface identifier for ITScriptableAudioFormat
     * @type {Guid}
     */
    static IID := Guid("{b87658bd-3c59-4f64-be74-aede3e86a81e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITScriptableAudioFormat interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Channels       : IntPtr
        put_Channels       : IntPtr
        get_SamplesPerSec  : IntPtr
        put_SamplesPerSec  : IntPtr
        get_AvgBytesPerSec : IntPtr
        put_AvgBytesPerSec : IntPtr
        get_BlockAlign     : IntPtr
        put_BlockAlign     : IntPtr
        get_BitsPerSample  : IntPtr
        put_BitsPerSample  : IntPtr
        get_FormatTag      : IntPtr
        put_FormatTag      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITScriptableAudioFormat.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-get_channels
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-put_channels
     */
    put_Channels(nNewVal) {
        result := ComCall(8, this, "int", nNewVal, "HRESULT")
        return result
    }

    /**
     * The get_SamplesPerSec method returns the value for the nSamplesPerSec member in the WAVEFORMATEX structure.
     * @returns {Integer} Pointer to the value of the <b>nSamplesPerSec</b> member in the 
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-get_samplespersec
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-put_samplespersec
     */
    put_SamplesPerSec(nNewVal) {
        result := ComCall(10, this, "int", nNewVal, "HRESULT")
        return result
    }

    /**
     * The get_AvgBytesPerSec method returns the value for the nAvgBytesPerSec member in the WAVEFORMATEX structure.
     * @returns {Integer} Pointer to the value for the <b>nAvgBytesPerSec</b> member in the 
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-get_avgbytespersec
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-put_avgbytespersec
     */
    put_AvgBytesPerSec(nNewVal) {
        result := ComCall(12, this, "int", nNewVal, "HRESULT")
        return result
    }

    /**
     * The get_BlockAlign method returns the value for the nBlockAlign member in the WAVEFORMATEX structure.
     * @returns {Integer} Pointer to the value of the <b>nBlockAlign</b> member in the 
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-get_blockalign
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-put_blockalign
     */
    put_BlockAlign(nNewVal) {
        result := ComCall(14, this, "int", nNewVal, "HRESULT")
        return result
    }

    /**
     * The get_BitsPerSample method returns the value for the wBitsPerSample member in the WAVEFORMATEX structure.
     * @returns {Integer} Pointer to the value of the <b>wBitsPerSample</b> member in the 
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-get_bitspersample
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-put_bitspersample
     */
    put_BitsPerSample(nNewVal) {
        result := ComCall(16, this, "int", nNewVal, "HRESULT")
        return result
    }

    /**
     * The get_FormatTag method returns the value for the wFormatTag member in the WAVEFORMATEX structure.
     * @returns {Integer} Pointer to the value of the <b>wFormatTag</b> member in the 
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-get_formattag
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
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-put_formattag
     */
    put_FormatTag(nNewVal) {
        result := ComCall(18, this, "int", nNewVal, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITScriptableAudioFormat.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Channels := CallbackCreate(GetMethod(implObj, "get_Channels"), flags, 2)
        this.vtbl.put_Channels := CallbackCreate(GetMethod(implObj, "put_Channels"), flags, 2)
        this.vtbl.get_SamplesPerSec := CallbackCreate(GetMethod(implObj, "get_SamplesPerSec"), flags, 2)
        this.vtbl.put_SamplesPerSec := CallbackCreate(GetMethod(implObj, "put_SamplesPerSec"), flags, 2)
        this.vtbl.get_AvgBytesPerSec := CallbackCreate(GetMethod(implObj, "get_AvgBytesPerSec"), flags, 2)
        this.vtbl.put_AvgBytesPerSec := CallbackCreate(GetMethod(implObj, "put_AvgBytesPerSec"), flags, 2)
        this.vtbl.get_BlockAlign := CallbackCreate(GetMethod(implObj, "get_BlockAlign"), flags, 2)
        this.vtbl.put_BlockAlign := CallbackCreate(GetMethod(implObj, "put_BlockAlign"), flags, 2)
        this.vtbl.get_BitsPerSample := CallbackCreate(GetMethod(implObj, "get_BitsPerSample"), flags, 2)
        this.vtbl.put_BitsPerSample := CallbackCreate(GetMethod(implObj, "put_BitsPerSample"), flags, 2)
        this.vtbl.get_FormatTag := CallbackCreate(GetMethod(implObj, "get_FormatTag"), flags, 2)
        this.vtbl.put_FormatTag := CallbackCreate(GetMethod(implObj, "put_FormatTag"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Channels)
        CallbackFree(this.vtbl.put_Channels)
        CallbackFree(this.vtbl.get_SamplesPerSec)
        CallbackFree(this.vtbl.put_SamplesPerSec)
        CallbackFree(this.vtbl.get_AvgBytesPerSec)
        CallbackFree(this.vtbl.put_AvgBytesPerSec)
        CallbackFree(this.vtbl.get_BlockAlign)
        CallbackFree(this.vtbl.put_BlockAlign)
        CallbackFree(this.vtbl.get_BitsPerSample)
        CallbackFree(this.vtbl.put_BitsPerSample)
        CallbackFree(this.vtbl.get_FormatTag)
        CallbackFree(this.vtbl.put_FormatTag)
    }
}
