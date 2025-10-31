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
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-get_channels
     */
    get_Channels(pVal) {
        result := ComCall(7, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nNewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-put_channels
     */
    put_Channels(nNewVal) {
        result := ComCall(8, this, "int", nNewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-get_samplespersec
     */
    get_SamplesPerSec(pVal) {
        result := ComCall(9, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nNewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-put_samplespersec
     */
    put_SamplesPerSec(nNewVal) {
        result := ComCall(10, this, "int", nNewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-get_avgbytespersec
     */
    get_AvgBytesPerSec(pVal) {
        result := ComCall(11, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nNewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-put_avgbytespersec
     */
    put_AvgBytesPerSec(nNewVal) {
        result := ComCall(12, this, "int", nNewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-get_blockalign
     */
    get_BlockAlign(pVal) {
        result := ComCall(13, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nNewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-put_blockalign
     */
    put_BlockAlign(nNewVal) {
        result := ComCall(14, this, "int", nNewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-get_bitspersample
     */
    get_BitsPerSample(pVal) {
        result := ComCall(15, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nNewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-put_bitspersample
     */
    put_BitsPerSample(nNewVal) {
        result := ComCall(16, this, "int", nNewVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-get_formattag
     */
    get_FormatTag(pVal) {
        result := ComCall(17, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} nNewVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tapi3if/nf-tapi3if-itscriptableaudioformat-put_formattag
     */
    put_FormatTag(nNewVal) {
        result := ComCall(18, this, "int", nNewVal, "HRESULT")
        return result
    }
}
