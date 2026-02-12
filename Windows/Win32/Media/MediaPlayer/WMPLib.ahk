#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WMPLibraryType enumeration type defines the possible library types to which Windows Media Player can connect.
 * @remarks
 * Windows Media Player 10 Mobile: This enumeration is not supported.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmp/ne-wmp-wmplibrarytype
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPLib extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
