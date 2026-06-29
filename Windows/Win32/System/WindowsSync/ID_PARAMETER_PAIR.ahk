#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Represents the format of a synchronization entity ID.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/ns-winsync-id_parameter_pair
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ID_PARAMETER_PAIR {
    #StructPack 4

    /**
     * <b>TRUE</b> if the ID is variable length; otherwise, <b>FALSE</b>.
     */
    fIsVariable : BOOL

    /**
     * The length of the ID when <i>fIsVariable</i> is <b>FALSE</b>. The maximum length of the ID when <i>fIsVariable</i> is <b>TRUE</b>. Must be greater than zero.
     */
    cbIdSize : UInt16

}
