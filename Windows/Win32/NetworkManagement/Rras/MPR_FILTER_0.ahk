#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains static filter configuration information.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-mpr_filter_0
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_FILTER_0 extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * A <b>BOOL</b> that specifies the state of the static filters. Set to <b>TRUE</b> if static filters are  enabled and <b>FALSE</b> otherwise.
     * @type {Integer}
     */
    fEnable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
