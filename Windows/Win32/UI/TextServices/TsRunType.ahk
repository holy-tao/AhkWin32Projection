#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Elements of the TsRunType enumeration specify if a text run is visible, hidden, or is a private data type embedded in the text run.
 * @remarks
 * A text run is a collection of consecutive characters that is visible, hidden, or contains embedded data. For example, the text, Hello World in HTML might be &lt;b&gt;Hello &lt;/b&gt;&lt;i&gt;World&lt;/i&gt;. This text would be defined using the TsRunType as in the following.
 * 
 * <table>
 * <tr>
 * <th>Text Run</th>
 * <th>Value</th>
 * </tr>
 * <tr>
 * <td>&lt;b&gt;</td>
 * <td>TS_RT_HIDDEN</td>
 * </tr>
 * <tr>
 * <td>Hello&lt;space&gt;</td>
 * <td>TS_RT_PLAIN</td>
 * </tr>
 * <tr>
 * <td>&lt;/b&gt;</td>
 * <td>TS_RT_HIDDEN</td>
 * </tr>
 * <tr>
 * <td>&lt;i&gt;</td>
 * <td>TS_RT_HIDDEN</td>
 * </tr>
 * <tr>
 * <td>World</td>
 * <td>TS_RT_PLAIN</td>
 * </tr>
 * <tr>
 * <td>&lt;/i&gt;</td>
 * <td>TS_RT_HIDDEN</td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/textstor/ne-textstor-tsruntype
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TsRunType extends Win32Enum{

    /**
     * The text run is visible.
     * @type {Integer (Int32)}
     */
    static TS_RT_PLAIN => 0

    /**
     * The text run is hidden.
     * @type {Integer (Int32)}
     */
    static TS_RT_HIDDEN => 1

    /**
     * The text run is a private data type embedded in the text run.
     * @type {Integer (Int32)}
     */
    static TS_RT_OPAQUE => 2
}
