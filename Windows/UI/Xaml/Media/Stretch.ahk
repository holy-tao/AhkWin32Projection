#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes how content is resized to fill its allocated space.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.stretch
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class Stretch extends Win32Enum{

    /**
     * The content preserves its original size.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * The content is resized to fill the destination dimensions. The aspect ratio is not preserved.
     * @type {Integer (Int32)}
     */
    static Fill => 1

    /**
     * The content is resized to fit in the destination dimensions while it preserves its native aspect ratio.
     * @type {Integer (Int32)}
     */
    static Uniform => 2

    /**
     * The content is resized to fill the destination dimensions while it preserves its native aspect ratio. If the aspect ratio of the destination rectangle differs from the source, the source content is clipped to fit in the destination dimensions.
     * @type {Integer (Int32)}
     */
    static UniformToFill => 3
}
