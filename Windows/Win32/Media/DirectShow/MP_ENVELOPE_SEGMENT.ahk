#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MP_ENVELOPE_SEGMENT structure defines an envelope segment used by an envelope-following parameter.
 * @see https://docs.microsoft.com/windows/win32/api//medparam/ns-medparam-mp_envelope_segment
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class MP_ENVELOPE_SEGMENT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Start time of the segment, relative to the time stamp on the first buffer, in 100-nanosecond units.
     * @type {Integer}
     */
    rtStart {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * Stop time of the segment, relative to the time stamp on the first buffer, in 100-nanosecond units.
     * @type {Integer}
     */
    rtEnd {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Initial value of the parameter, at the start of the segment.
     * @type {Float}
     */
    valStart {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Final value of the parameter, at the end of the segment.
     * @type {Float}
     */
    valEnd {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * Member of the <b>MP_CURVE_TYPE</b> enumerated type that specifies the curve followed by the parameter.
     * @type {Integer}
     */
    iCurve {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

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
     * @type {Integer}
     */
    flags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
