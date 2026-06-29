#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\TIMECODE_SAMPLE.ahk" { TIMECODE_SAMPLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMTimecodeGenerator interface controls how an external SMPTE/MIDI timecode generator supplies data to the filter graph.DirectShow currently does not provide any filters that implement this interface.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamtimecodegenerator
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMTimecodeGenerator extends IUnknown {
    /**
     * The interface identifier for IAMTimecodeGenerator
     * @type {Guid}
     */
    static IID := Guid("{9b496ce0-811b-11cf-8c77-00aa006b6814}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMTimecodeGenerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTCGMode   : IntPtr
        SetTCGMode   : IntPtr
        put_VITCLine : IntPtr
        get_VITCLine : IntPtr
        SetTimecode  : IntPtr
        GetTimecode  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMTimecodeGenerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    VITCLine {
        get => this.get_VITCLine()
        set => this.put_VITCLine(value)
    }

    /**
     * The GetTCGMode method retrieves the SMPTE timecode generator properties.
     * @remarks
     * This method returns various settings of the timecode generator. For more information on ED_TCG_TIMECODE_TYPE, see <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamtimecodereader-settcrmode">IAMTimecodeReader::SetTCRMode</a>.
     * @param {Integer} Param Timecode generator mode. Specify one of the following modes you want to get settings for.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_TCG_FRAMERATE</td>
     * <td>Frame rate</td>
     * </tr>
     * <tr>
     * <td>ED_TCG_REFERENCE_SOURCE</td>
     * <td>Source of the count value</td>
     * </tr>
     * <tr>
     * <td>ED_TCG_SYNC_SOURCE</td>
     * <td>Source of the hardware clock reference</td>
     * </tr>
     * <tr>
     * <td>ED_TCG_TIMECODE_TYPE</td>
     * <td>SMPTE timecode format of the generator</td>
     * </tr>
     * </table>
     * @returns {Integer} Pointer to the current setting of the mode specified in <i>Param</i>.
     * 
     * If you specify ED_TCG_FRAMERATE in <i>Param</i>, this parameter retrieves one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_FORMAT_SMPTE_24</td>
     * <td>24 frames per second.</td>
     * </tr>
     * <tr>
     * <td>ED_FORMAT_SMPTE_25</td>
     * <td>25 frames per second.</td>
     * </tr>
     * <tr>
     * <td>ED_FORMAT_SMPTE_30</td>
     * <td>30 frames per second. Nondrop frame.</td>
     * </tr>
     * <tr>
     * <td>ED_FORMAT_SMPTE_30DROP</td>
     * <td>30 frames per second. Drop frame (actually 29.97 fps).</td>
     * </tr>
     * </table>
     *  
     * 
     * If you specify ED_TCG_REFERENCE_SOURCE in <i>Param</i>, this parameter retrieves one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_TCG_FREE</td>
     * <td>No count reference source.</td>
     * </tr>
     * <tr>
     * <td>ED_TCG_READER</td>
     * <td>Synchronize to reader value (jamsync).</td>
     * </tr>
     * </table>
     *  
     * 
     * If you specify ED_TCG_SYNC_SOURCE in <i>Param</i>, this parameter retrieves one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_TCG_FREE</td>
     * <td>Lock to nothing (freerun).</td>
     * </tr>
     * <tr>
     * <td>ED_TCG_READER</td>
     * <td>Lock to timecode reader.</td>
     * </tr>
     * <tr>
     * <td>ED_TCG_VIDEO</td>
     * <td>Lock to incoming video.</td>
     * </tr>
     * </table>
     *  
     * 
     * If you specify ED_TCG_TIMECODE_TYPE in <i>Param</i>, this parameter retrieves one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_TCG_MIDI_FULL</td>
     * <td>MIDI full frame timecode</td>
     * </tr>
     * <tr>
     * <td>ED_TCG_MIDI_QF</td>
     * <td>MIDI quarter frame timecode</td>
     * </tr>
     * <tr>
     * <td>ED_TCG_SMPTE_LTC</td>
     * <td>Linear timecode</td>
     * </tr>
     * <tr>
     * <td>ED_TCG_SMPTE_VITC</td>
     * <td>Vertical interval timecode</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtimecodegenerator-gettcgmode
     */
    GetTCGMode(Param) {
        result := ComCall(3, this, "int", Param, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The SetTCGMode method sets the SMPTE timecode generator properties.
     * @remarks
     * For more information on ED_TCG_TIMECODE_TYPE, see the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-iamtimecodereader-settcrmode">IAMTimecodeReader::SetTCRMode</a> method.
     * @param {Integer} Param Timecode generator mode. Specify one of the following modes.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_TCG_FRAMERATE</td>
     * <td>Frame rate</td>
     * </tr>
     * <tr>
     * <td>ED_TCG_REFERENCE_SOURCE</td>
     * <td>Source of the count value</td>
     * </tr>
     * <tr>
     * <td>ED_TCG_SYNC_SOURCE</td>
     * <td>Source of the hardware clock reference</td>
     * </tr>
     * <tr>
     * <td>ED_TCG_TIMECODE_TYPE</td>
     * <td>SMPTE timecode format of the generator</td>
     * </tr>
     * </table>
     * @param {Integer} Value Setting of the mode specified in <i>Param</i>.
     * 
     * If ED_TCG_FRAMERATE is specified in <i>Param</i>, this parameter is set to one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_FORMAT_SMPTE_24</td>
     * <td>24 frames per second.</td>
     * </tr>
     * <tr>
     * <td>ED_FORMAT_SMPTE_25</td>
     * <td>25 frames per second.</td>
     * </tr>
     * <tr>
     * <td>ED_FORMAT_SMPTE_30</td>
     * <td>30 frames per second. Nondrop frame.</td>
     * </tr>
     * <tr>
     * <td>ED_FORMAT_SMPTE_30DROP</td>
     * <td>30 frames per second. Drop frame (actually 29.97 frames per second).</td>
     * </tr>
     * </table>
     *  
     * 
     * If ED_TCG_REFERENCE_SOURCE is specified in <i>Param</i>, set one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_TCG_FREE</td>
     * <td>No count reference source.</td>
     * </tr>
     * <tr>
     * <td>ED_TCG_READER</td>
     * <td>Sync to reader value (jamsync).</td>
     * </tr>
     * </table>
     *  
     * 
     * If ED_TCG_SYNC_SOURCE is specified in <i>Param</i>, set one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_TCG_FREE</td>
     * <td>Lock to nothing (freerun).</td>
     * </tr>
     * <tr>
     * <td>ED_TCG_READER</td>
     * <td>Lock to timecode reader.</td>
     * </tr>
     * <tr>
     * <td>ED_TCG_VIDEO</td>
     * <td>Lock to incoming video.</td>
     * </tr>
     * </table>
     *  
     * 
     * If ED_TCG_TIMECODE_TYPE is specified in <i>Param</i>, set one of the following.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>ED_TCG_MIDI_FULL</td>
     * <td>MIDI Full Frame timecode</td>
     * </tr>
     * <tr>
     * <td>ED_TCG_MIDI_QF</td>
     * <td>MIDI quarter frame timecode</td>
     * </tr>
     * <tr>
     * <td>ED_TCG_SMPTE_LTC</td>
     * <td>Linear timecode</td>
     * </tr>
     * <tr>
     * <td>ED_TCG_SMPTE_VITC</td>
     * <td>Vertical interval timecode</td>
     * </tr>
     * </table>
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtimecodegenerator-settcgmode
     */
    SetTCGMode(Param, Value) {
        result := ComCall(4, this, "int", Param, "int", Value, "HRESULT")
        return result
    }

    /**
     * The put_VITCLine method specifies which line to insert the vertical interval timecode information into.
     * @remarks
     * To generate VITC on specific multiple lines, make successive calls to this method, once for each line desired.
     * 
     * Set the high bit to add to this line to any previously set lines.
     * @param {Integer} Line Vertical line to contain the timecode information (valid lines are 11-20; 0 means autoselect).
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtimecodegenerator-put_vitcline
     */
    put_VITCLine(Line) {
        result := ComCall(5, this, "int", Line, "HRESULT")
        return result
    }

    /**
     * The get_VITCLine method retrieves which line(s) the vertical interval timecode information has been inserted into.
     * @remarks
     * To get VITC information from multiple lines, make successive calls to this method, once for each line desired, with the hi bit set for each line.
     * @returns {Integer} Pointer to the vertical line(s) containing the timecode information (valid lines are 11-20).
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtimecodegenerator-get_vitcline
     */
    get_VITCLine() {
        result := ComCall(6, this, "int*", &pLine := 0, "HRESULT")
        return pLine
    }

    /**
     * The SetTimecode method sets the timecode, userbit value, or both.
     * @remarks
     * To set only timecode, set userbit value to <b>NULL</b>, and vice versa. If generator is running, these values will take effect immediately.
     * @param {Pointer<TIMECODE_SAMPLE>} pTimecodeSample Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/strmif/ns-strmif-timecode_sample">TIMECODE_SAMPLE</a> structure.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value that depends on the implementation of the interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtimecodegenerator-settimecode
     */
    SetTimecode(pTimecodeSample) {
        result := ComCall(7, this, TIMECODE_SAMPLE.Ptr, pTimecodeSample, "HRESULT")
        return result
    }

    /**
     * The GetTimecode method retrieves the most recent timecode and/or userbit value available in the stream.
     * @remarks
     * Use this method to obtain the most recent timecode value available in the stream. The application can use this to monitor the timecode and verify the generator is working properly.
     * @returns {TIMECODE_SAMPLE} Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/strmif/ns-strmif-timecode_sample">TIMECODE_SAMPLE</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamtimecodegenerator-gettimecode
     */
    GetTimecode() {
        pTimecodeSample := TIMECODE_SAMPLE()
        result := ComCall(8, this, TIMECODE_SAMPLE.Ptr, pTimecodeSample, "HRESULT")
        return pTimecodeSample
    }

    Query(iid) {
        if (IAMTimecodeGenerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTCGMode := CallbackCreate(GetMethod(implObj, "GetTCGMode"), flags, 3)
        this.vtbl.SetTCGMode := CallbackCreate(GetMethod(implObj, "SetTCGMode"), flags, 3)
        this.vtbl.put_VITCLine := CallbackCreate(GetMethod(implObj, "put_VITCLine"), flags, 2)
        this.vtbl.get_VITCLine := CallbackCreate(GetMethod(implObj, "get_VITCLine"), flags, 2)
        this.vtbl.SetTimecode := CallbackCreate(GetMethod(implObj, "SetTimecode"), flags, 2)
        this.vtbl.GetTimecode := CallbackCreate(GetMethod(implObj, "GetTimecode"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTCGMode)
        CallbackFree(this.vtbl.SetTCGMode)
        CallbackFree(this.vtbl.put_VITCLine)
        CallbackFree(this.vtbl.get_VITCLine)
        CallbackFree(this.vtbl.SetTimecode)
        CallbackFree(this.vtbl.GetTimecode)
    }
}
