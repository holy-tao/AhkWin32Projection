#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PSFEATURE_OUTPUT structure contains information about PostScript driver output options. This structure is used with the GET_PS_FEATURESETTING printer escape function.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-psfeature_output
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
    bPageIndependent {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * <b>TRUE</b> if printer feature code (setpagedevice's) is included or <b>FALSE</b> if all printer feature code is suppressed.
     * @type {BOOL}
     */
    bSetPageDevice {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
