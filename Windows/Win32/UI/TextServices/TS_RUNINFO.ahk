#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The TS_RUNINFO structure specifies the properties of text run data.
 * @remarks
 * 
  * A text run is a collection of consecutive visible, hidden, or embedded characters. For example, the text, Hello World in HTML might be &lt;b&gt;Hello &lt;/b&gt;&lt;i&gt;World&lt;/i&gt;. This text is represented in the TS_RUNINFO structure as follows.
  * 
  * <table>
  * <tr>
  * <th>Text Run</th>
  * <th>uCount</th>
  * <th>TsRunType</th>
  * </tr>
  * <tr>
  * <td>&lt;b&gt;</td>
  * <td>3</td>
  * <td>TS_RT_HIDDEN</td>
  * </tr>
  * <tr>
  * <td>Hello&lt;space&gt;</td>
  * <td>5</td>
  * <td>TS_RT_PLAIN</td>
  * </tr>
  * <tr>
  * <td>&lt;/b&gt;&lt;i&gt;</td>
  * <td>7</td>
  * <td>TS_RT_HIDDEN</td>
  * </tr>
  * <tr>
  * <td>World</td>
  * <td>5</td>
  * <td>TS_RT_PLAIN</td>
  * </tr>
  * <tr>
  * <td>&lt;/i&gt;</td>
  * <td>4</td>
  * <td>TS_RT_HIDDEN</td>
  * </tr>
  * </table>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//textstor/ns-textstor-ts_runinfo
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TS_RUNINFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the number of characters in the text run.
     * @type {Integer}
     */
    uCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the text run type. If this parameter is TS_RT_PLAIN, the text run is visible. If this parameter is TS_RT_HIDDEN, the text run is hidden. If this parameter is TS_RT_OPAQUE, the text run is a private data type embedded in the text by application or text service that implements the ITextStore interface.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
