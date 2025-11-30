#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the graphic control extension metadata properties that define the transitions between each frame animation for Graphics Interchange Format (GIF) images.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ne-wincodec-wicgifgraphiccontrolextensionproperties
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICGifGraphicControlExtensionProperties extends Win32Enum{

    /**
     * [VT_UI1] Indicates  the disposal requirements. 0 - no disposal, 1 - do not dispose, 2 - restore to background color, 3 - restore to previous.
     * @type {Integer (Int32)}
     */
    static WICGifGraphicControlExtensionDisposal => 1

    /**
     * [VT_BOOL] Indicates the user input flag. <b>TRUE</b> if user input should advance to the next frame; otherwise, <b>FALSE</b>.
     * @type {Integer (Int32)}
     */
    static WICGifGraphicControlExtensionUserInputFlag => 2

    /**
     * [VT_BOOL] Indicates the transparency flag. <b>TRUE</b> if a transparent color in is in the color table for this frame; otherwise, <b>FALSE</b>.
     * @type {Integer (Int32)}
     */
    static WICGifGraphicControlExtensionTransparencyFlag => 3

    /**
     * [VT_UI2] Indicates  how long to display the next frame before advancing to the next frame, in units of 1/100th of a second.
     * @type {Integer (Int32)}
     */
    static WICGifGraphicControlExtensionDelay => 4

    /**
     * [VT_UI1] Indicates which color in the palette should be treated as transparent.
     * @type {Integer (Int32)}
     */
    static WICGifGraphicControlExtensionTransparentColorIndex => 5
}
