#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MP_TYPE.ahk" { MP_TYPE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The MP_PARAMINFO structure contains information about a parameter.
 * @remarks
 * The <b>szUnitText</b> and <b>szLabel</b> members always contain English-language strings. For international support, use the <a href="https://docs.microsoft.com/windows/desktop/api/medparam/nf-medparam-imediaparaminfo-getparamtext">IMediaParamInfo::GetParamText</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/medparam/ns-medparam-mp_paraminfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct MP_PARAMINFO {
    #StructPack 4

    /**
     * Member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/medparam/ne-medparam-mp_type">MP_TYPE</a> enumeration that specifies the valid data type for this parameter.
     */
    mpType : MP_TYPE

    /**
     * Bitwise combination of one or more <a href="https://docs.microsoft.com/windows/desktop/DirectShow/parameter-capabilities-flags">Parameter Capabilities Flags</a> that specify which envelope curves are supported. For Boolean and enumeration parameters, only MP_CAPS_CURVE_JUMP is valid.
     */
    mopCaps : UInt32

    /**
     * Minimum value of the parameter. Used only for parameters with numeric values.
     */
    mpdMinValue : Float32

    /**
     * Maximum value of the parameter. Used only for parameters with numeric values.
     */
    mpdMaxValue : Float32

    /**
     * Default or "neutral" value of the parameter.
     */
    mpdNeutralValue : Float32

    /**
     * NULL-terminated wide-character string that contains the name of the units for the parameter.
     */
    szUnitText : WCHAR[32]

    /**
     * NULL-terminated wide-character string that contains the name of the parameter.
     */
    szLabel : WCHAR[32]

}
