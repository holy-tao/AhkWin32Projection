#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MP_PARAMINFO structure contains information about a parameter.
 * @remarks
 * 
 * The <b>szUnitText</b> and <b>szLabel</b> members always contain English-language strings. For international support, use the <a href="https://docs.microsoft.com/windows/desktop/api/medparam/nf-medparam-imediaparaminfo-getparamtext">IMediaParamInfo::GetParamText</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//medparam/ns-medparam-mp_paraminfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class MP_PARAMINFO extends Win32Struct
{
    static sizeof => 148

    static packingSize => 4

    /**
     * Member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/medparam/ne-medparam-mp_type">MP_TYPE</a> enumeration that specifies the valid data type for this parameter.
     * @type {Integer}
     */
    mpType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Bitwise combination of one or more <a href="https://docs.microsoft.com/windows/desktop/DirectShow/parameter-capabilities-flags">Parameter Capabilities Flags</a> that specify which envelope curves are supported. For Boolean and enumeration parameters, only MP_CAPS_CURVE_JUMP is valid.
     * @type {Integer}
     */
    mopCaps {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Minimum value of the parameter. Used only for parameters with numeric values.
     * @type {Float}
     */
    mpdMinValue {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Maximum value of the parameter. Used only for parameters with numeric values.
     * @type {Float}
     */
    mpdMaxValue {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * Default or "neutral" value of the parameter.
     * @type {Float}
     */
    mpdNeutralValue {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * NULL-terminated wide-character string that contains the name of the units for the parameter.
     * @type {String}
     */
    szUnitText {
        get => StrGet(this.ptr + 20, 31, "UTF-16")
        set => StrPut(value, this.ptr + 20, 31, "UTF-16")
    }

    /**
     * NULL-terminated wide-character string that contains the name of the parameter.
     * @type {String}
     */
    szLabel {
        get => StrGet(this.ptr + 84, 31, "UTF-16")
        set => StrPut(value, this.ptr + 84, 31, "UTF-16")
    }
}
