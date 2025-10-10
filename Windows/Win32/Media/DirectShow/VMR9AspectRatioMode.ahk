#Requires AutoHotkey v2.0.0 64-bit

/**
 * The VMR9AspectRatioMode enumeration type is used with the IVMRWindowlessControl9::GetAspectRatioMode and IVMRWindowlessControl9::SetAspectRatioMode methods to set and retrieve the aspect ratio mode (VMR-9 only).
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/ne-vmr9-vmr9aspectratiomode
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR9AspectRatioMode{

    /**
     * Indicates that the VMR is not attempting to maintain the aspect ratio of the source video.
     * @type {Integer (Int32)}
     */
    static VMR9ARMode_None => 0

    /**
     * Indicates that the VMR will maintain the aspect ratio of the source video by letterboxing within the output rectangle.
     * @type {Integer (Int32)}
     */
    static VMR9ARMode_LetterBox => 1
}
