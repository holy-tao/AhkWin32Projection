#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_OUTDUPL_FLAG extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGI_OUTDUPL_COMPOSITED_UI_CAPTURE_ONLY => 1
}
