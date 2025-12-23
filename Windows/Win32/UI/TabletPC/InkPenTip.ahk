#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the pen-tip shape.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkpentip
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkPenTip extends Win32Enum{

    /**
     * The pen tip is round. This is the default pen tip.
     * @type {Integer (Int32)}
     */
    static IPT_Ball => 0

    /**
     * The pen tip is rectangular.
     * @type {Integer (Int32)}
     */
    static IPT_Rectangle => 1
}
