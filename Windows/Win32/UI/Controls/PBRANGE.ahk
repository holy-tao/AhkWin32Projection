#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about the high and low limits of a progress bar control. This structure is used with the PBM_GETRANGE message.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-pbrange
 * @namespace Windows.Win32.UI.Controls
 */
export default struct PBRANGE {
    #StructPack 4

    /**
     * Type: <b>int</b>
     * 
     * Low limit for the progress bar control. This is a signed integer.
     */
    iLow : Int32

    /**
     * Type: <b>int</b>
     * 
     * High limit for the progress bar control. This is a signed integer.
     */
    iHigh : Int32

}
