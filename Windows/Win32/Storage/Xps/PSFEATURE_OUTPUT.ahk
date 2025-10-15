#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The PSFEATURE_OUTPUT structure contains information about PostScript driver output options. This structure is used with the GET_PS_FEATURESETTING printer escape function.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-psfeature_output
 * @namespace Windows.Win32.Storage.Xps
 * @version v4.0.30319
 */
class PSFEATURE_OUTPUT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * <b>TRUE</b> if PostScript output is page-independent or <b>FALSE</b> if PostScript output is page-dependent.
     * @type {BOOL}
     */
    bPageIndependent{
        get {
            if(!this.HasProp("__bPageIndependent"))
                this.__bPageIndependent := BOOL(this.ptr + 0)
            return this.__bPageIndependent
        }
    }

    /**
     * <b>TRUE</b> if printer feature code (setpagedevice's) is included or <b>FALSE</b> if all printer feature code is suppressed.
     * @type {BOOL}
     */
    bSetPageDevice{
        get {
            if(!this.HasProp("__bSetPageDevice"))
                this.__bSetPageDevice := BOOL(this.ptr + 4)
            return this.__bSetPageDevice
        }
    }
}
