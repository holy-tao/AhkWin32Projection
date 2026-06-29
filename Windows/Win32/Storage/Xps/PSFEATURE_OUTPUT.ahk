#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The PSFEATURE_OUTPUT structure contains information about PostScript driver output options. This structure is used with the GET_PS_FEATURESETTING printer escape function.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-psfeature_output
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct PSFEATURE_OUTPUT {
    #StructPack 4

    /**
     * <b>TRUE</b> if PostScript output is page-independent or <b>FALSE</b> if PostScript output is page-dependent.
     */
    bPageIndependent : BOOL

    /**
     * <b>TRUE</b> if printer feature code (setpagedevice's) is included or <b>FALSE</b> if all printer feature code is suppressed.
     */
    bSetPageDevice : BOOL

}
