#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAMTimecodeReader interface reads SMPTE or MIDI timecode from an external device. The MSDV and MSTape drivers support this interface for reading timecode from an external DV or MPEG-2 camcorder.
 * @remarks
 * 
  * For Windows Driver Model (WDM) devices, the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wdm-video-capture-filter">WDM Video Capture Filter</a> automatically exposes this interface if the WDM driver supports the PROPSETID_TIMECODE_READER property set. For more information, see the <a href="https://docs.microsoft.com/windows-hardware/drivers/gettingstarted/">Windows Driver Kit (WDK)</a> documentation.
  * 
  * SMPTE timecode is a frame addressing system that identifies video and audio sources, makes automatic track synchronization possible, and provides a container for additional data related to the source material. SMPTE timecode's main purpose is to provide a machine-readable address for video and audio. It is displayed in hh:mm:ss:ff (hours, minutes, seconds, frames) format and is thoroughly defined in ANSI/SMPTE 12-1986.
  * 
  * Applications generally save timecode in one of two ways. It is either written to the capture file as an additional stream or as a discontinuity table stored in the extended AVI file index. It is commonly used to trigger capture or playback and to create edit decision lists that describes how source material is organized into a finished product.
  * 
  * If you intend to capture timecode, treat it as a separate stream that has its own media type. It can be consumed by an appropriate file-writing multiplexer filter. However, sometimes there are errors in reading the timecode off the tape because of dropouts and other mechanical tape problems. In such cases, the timecode source filter should simply drop samples and mark the next valid one with the discontinuity property.
  * 
  * If you intend to use timecodes to trigger capture or playback from a timecoded (or "striped") videotape, the sequence of events goes as follows:
  * 
  * <ol>
  * <li>Build a capture graph, open a target AVI file, and preallocate disk space if necessary. If the captured material will be appended to an existing AVI file, seek to the end of the file before writing. The capture graph is paused at this point.</li>
  * <li>Search the VCR to the capture start point and note the timecode. You can either enter this value manually into your program, or the application can automatically read it. Automatic reading requires that the graph is running but the stream control interfaces on the file multiplexer's input pins are discarding incoming samples, effectively gating the capture.</li>
  * <li>Cue the VCR to preroll position, usually five seconds before the target point.</li>
  * <li>Start the VCR and the graph. When the trigger point is reached (or the trigger point minus the file writer's preroll), the stream control interfaces release the file multiplexer and it begins streaming media samples to the file writer.</li>
  * <li>You can stop the capture process manually or by setting a duration property on the stream control interface.</li>
  * </ol>
  * You must consider discontinuous timecode, both during preroll and during the capture process; it is reasonable to demand that the timecode be continuous and monotonically increasing throughout the preroll and capture start point. This prevents a potentially ambiguous calculation of relative stream times by the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-converttimeformat">IMediaSeeking::ConvertTimeFormat</a> method. Also, the timecode need not be the only gating signal for triggered capture. Any time-stamped data stored in the vertical blanking interval, such as Intercast or closed-captioned data (XDS), can be used to start the streaming of video and audio data to disk.
  * 
  * <h3><a id="Hardware_Requirements"></a><a id="hardware_requirements"></a><a id="HARDWARE_REQUIREMENTS"></a>Hardware Requirements</h3>
  * See the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iamexttransport">IAMExtTransport</a> interface for hardware requirements.
  * 
  * <h3><a id="Filter_Developers"></a><a id="filter_developers"></a><a id="FILTER_DEVELOPERS"></a>Filter Developers</h3>
  * Implement this interface on an external device filter when you want to specify how an external device should read SMPTE/MIDI timecode information. Expose the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imediaseeking">IMediaSeeking</a> interface on your filter so that applications can convert timecode to reference time, using the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediaseeking-converttimeformat">IMediaSeeking::ConvertTimeFormat</a> method.
  * 
  * The external device must be able to read timecode and send it to the computer over its control interface. If this is not the case, you must either have a timecode reader card in your computer, or you can write a software decoder that converts VITC (Vertical Interval Timecode) in captured video frames or LTC (Linear Timecode) captured as an audio signal into DirectShow timecode samples.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iamtimecodereader
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMTimecodeReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMTimecodeReader
     * @type {Guid}
     */
    static IID => Guid("{9b496ce1-811b-11cf-8c77-00aa006b6814}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTCRMode", "SetTCRMode", "put_VITCLine", "get_VITCLine", "GetTimecode"]

    /**
     * 
     * @param {Integer} Param 
     * @param {Pointer<Integer>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtimecodereader-gettcrmode
     */
    GetTCRMode(Param, pValue) {
        pValueMarshal := pValue is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "int", Param, pValueMarshal, pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Param 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtimecodereader-settcrmode
     */
    SetTCRMode(Param, Value) {
        result := ComCall(4, this, "int", Param, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Line 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtimecodereader-put_vitcline
     */
    put_VITCLine(Line) {
        result := ComCall(5, this, "int", Line, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pLine 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtimecodereader-get_vitcline
     */
    get_VITCLine(pLine) {
        pLineMarshal := pLine is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pLineMarshal, pLine, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<TIMECODE_SAMPLE>} pTimecodeSample 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtimecodereader-gettimecode
     */
    GetTimecode(pTimecodeSample) {
        result := ComCall(7, this, "ptr", pTimecodeSample, "HRESULT")
        return result
    }
}
