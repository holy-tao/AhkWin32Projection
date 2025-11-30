#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the way in which ink is erased from the InkOverlay object and the InkPicture control.This mode is used when the InkOverlayEditingMode is set to Delete.
 * @see https://docs.microsoft.com/windows/win32/api//msinkaut/ne-msinkaut-inkoverlayerasermode
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkOverlayEraserMode extends Win32Enum{

    /**
     * Ink is erased by stroke.
     * 
     * This is the default value.
     * @type {Integer (Int32)}
     */
    static IOERM_StrokeErase => 0

    /**
     * Ink is erased by point.
     * @type {Integer (Int32)}
     */
    static IOERM_PointErase => 1
}
