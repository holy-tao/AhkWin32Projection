#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the pen-tip shape.
 * @see https://learn.microsoft.com/windows/win32/api/msinkaut/ne-msinkaut-inkpentip
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkPenTip{

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
