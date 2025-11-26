#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IConfigInterleaving interface controls how the AVI Mux filter interleaves audio and video samples.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iconfiginterleaving
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IConfigInterleaving extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConfigInterleaving
     * @type {Guid}
     */
    static IID => Guid("{bee3d220-157b-11d0-bd23-00a0c911ce86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Mode", "get_Mode", "put_Interleaving", "get_Interleaving"]

    /**
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * The put_Mode method sets how audio samples and video frames are to be written to disk, by specifying quality of interleaving.
     * @param {Integer} mode Interleaving quality setting specified in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-interleavingmode">InterleavingMode</a> enumeration.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iconfiginterleaving-put_mode
     */
    put_Mode(mode) {
        result := ComCall(3, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * The get_Mode method retrieves the interleaving quality setting.
     * @returns {Integer} Receives the interleaving quality, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-interleavingmode">InterleavingMode</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iconfiginterleaving-get_mode
     */
    get_Mode() {
        result := ComCall(4, this, "int*", &pMode := 0, "HRESULT")
        return pMode
    }

    /**
     * The put_Interleaving method sets the audio preroll time and the frequency of interleaving for an AVI file.
     * @param {Pointer<Integer>} prtInterleave The approximate duration of each interleaved group of audio or video chunks, in 100-nanosecond units.
     *           The exact amount of interleaving is also affected by the interleave mode, which is specified by calling <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iconfiginterleaving-put_mode">IConfigInterleaving::put_Mode</a>.
     * @param {Pointer<Integer>} prtPreroll The amount of audio data, in 100-nanosecond units, that is written to the file before the first video frame.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iconfiginterleaving-put_interleaving
     */
    put_Interleaving(prtInterleave, prtPreroll) {
        prtInterleaveMarshal := prtInterleave is VarRef ? "int64*" : "ptr"
        prtPrerollMarshal := prtPreroll is VarRef ? "int64*" : "ptr"

        result := ComCall(5, this, prtInterleaveMarshal, prtInterleave, prtPrerollMarshal, prtPreroll, "HRESULT")
        return result
    }

    /**
     * The get_Interleaving method gets the audio preroll time and the frequency of interleaving for an AVI file.
     * @param {Pointer<Integer>} prtInterleave Receives the approximate duration of each interleaved group of audio or video chunks.
     * @param {Pointer<Integer>} prtPreroll Receives the amount of audio data, in 100-nanosecond units, that is written to the file before the first video frame.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iconfiginterleaving-get_interleaving
     */
    get_Interleaving(prtInterleave, prtPreroll) {
        prtInterleaveMarshal := prtInterleave is VarRef ? "int64*" : "ptr"
        prtPrerollMarshal := prtPreroll is VarRef ? "int64*" : "ptr"

        result := ComCall(6, this, prtInterleaveMarshal, prtInterleave, prtPrerollMarshal, prtPreroll, "HRESULT")
        return result
    }
}
