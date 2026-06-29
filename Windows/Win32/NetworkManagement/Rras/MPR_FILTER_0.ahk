#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains static filter configuration information.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mpr_filter_0
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MPR_FILTER_0 {
    #StructPack 4

    /**
     * A <b>BOOL</b> that specifies the state of the static filters. Set to <b>TRUE</b> if static filters are  enabled and <b>FALSE</b> otherwise.
     */
    fEnable : BOOL

}
