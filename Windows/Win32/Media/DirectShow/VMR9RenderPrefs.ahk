#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VMR9RenderPrefs enumeration type specifies basic rendering preferences for the VMR-9. It is used with the IVMRFilterConfig9::GetRenderingPrefs and IVMRFilterConfig9::SetRenderingPrefs methods.
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/ne-vmr9-vmr9renderprefs
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR9RenderPrefs extends Win32Enum{

    /**
     * Indicates that the application paints the color keyed areas.
     * @type {Integer (Int32)}
     */
    static RenderPrefs9_DoNotRenderBorder => 1

    /**
     * Bitwise <b>OR</b> of all flags; not used by applications.
     * @type {Integer (Int32)}
     */
    static RenderPrefs9_Mask => 1
}
