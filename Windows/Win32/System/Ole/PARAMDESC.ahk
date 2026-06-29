#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PARAMFLAGS.ahk" { PARAMFLAGS }
#Import ".\PARAMDESCEX.ahk" { PARAMDESCEX }

/**
 * Contains information needed for transferring a structure element, parameter, or function return value between processes.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-paramdesc
 * @namespace Windows.Win32.System.Ole
 */
export default struct PARAMDESC {
    #StructPack 8

    /**
     * The default value for the parameter, if PARAMFLAG_FHASDEFAULT is specified in <b>wParamFlags</b>.
     */
    pparamdescex : PARAMDESCEX.Ptr

    /**
     * The parameter flags. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/paramflags">PARAMFLAG Constants</a>.
     */
    wParamFlags : PARAMFLAGS

}
