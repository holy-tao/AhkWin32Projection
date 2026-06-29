#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The MMCBUTTON structure contains values used in creating buttons on a toolbar. This structure is similar to the TBBUTTON structure discussed in the Platform Software Development Kit (SDK) topics related to common controls.
 * @see https://learn.microsoft.com/windows/win32/api/mmc/ns-mmc-mmcbutton
 * @namespace Windows.Win32.System.Mmc
 */
export default struct MMCBUTTON {
    #StructPack 8

    /**
     * A value that specifies the zero-based index of a button image.
     */
    nBitmap : Int32

    /**
     * A value that specifies the command identifier returned when a button is clicked. This can be any integer value the user wants. Only the low word of the <b>int</b> is used.
     */
    idCommand : Int32

    fsState : Int8

    fsType : Int8

    /**
     * A pointer to the text associated with a particular instance of the 
     * <b>MMCBUTTON</b> structure.
     */
    lpButtonText : PWSTR

    /**
     * A pointer to the text for a particular tooltip.
     */
    lpTooltipText : PWSTR

}
