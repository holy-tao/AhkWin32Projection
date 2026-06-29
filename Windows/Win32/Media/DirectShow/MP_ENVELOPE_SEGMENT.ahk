#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MP_CURVE_TYPE.ahk" { MP_CURVE_TYPE }

/**
 * The MP_ENVELOPE_SEGMENT structure defines an envelope segment used by an envelope-following parameter.
 * @see https://learn.microsoft.com/windows/win32/api/medparam/ns-medparam-mp_envelope_segment
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct MP_ENVELOPE_SEGMENT {
    #StructPack 8

    /**
     * Start time of the segment, relative to the time stamp on the first buffer, in 100-nanosecond units.
     */
    rtStart : Int64

    /**
     * Stop time of the segment, relative to the time stamp on the first buffer, in 100-nanosecond units.
     */
    rtEnd : Int64

    /**
     * Initial value of the parameter, at the start of the segment.
     */
    valStart : Float32

    /**
     * Final value of the parameter, at the end of the segment.
     */
    valEnd : Float32

    /**
     * Member of the <b>MP_CURVE_TYPE</b> enumerated type that specifies the curve followed by the parameter.
     */
    iCurve : MP_CURVE_TYPE

    /**
     * Specifies one of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPF_ENVLP_STANDARD"></a><a id="mpf_envlp_standard"></a><dl>
     * <dt><b>MPF_ENVLP_STANDARD</b></dt>
     * <dt>0x0000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use all the information provided with the envelope segment.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPF_ENVLP_BEGIN_CURRENTVAL"></a><a id="mpf_envlp_begin_currentval"></a><dl>
     * <dt><b>MPF_ENVLP_BEGIN_CURRENTVAL</b></dt>
     * <dt>0x0001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore the specified start value. Start from the current value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPF_ENVLP_BEGIN_NEUTRALVAL"></a><a id="mpf_envlp_begin_neutralval"></a><dl>
     * <dt><b>MPF_ENVLP_BEGIN_NEUTRALVAL</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Ignore the specified start value. Start from the neutral value. (See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/medparam/ns-medparam-mp_paraminfo">MP_PARAMINFO</a>.)
     * 
     * </td>
     * </tr>
     * </table>
     */
    flags : UInt32

}
