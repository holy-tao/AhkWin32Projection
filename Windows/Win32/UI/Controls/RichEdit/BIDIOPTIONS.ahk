#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains bidirectional information about a rich edit control. This structure is used by the EM_GETBIDIOPTIONS and EM_SETBIDIOPTIONS messages to get and set the bidirectional information for a control.
 * @see https://docs.microsoft.com/windows/win32/api//richedit/ns-richedit-bidioptions
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class BIDIOPTIONS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Specifies the size, in bytes, of the structure. Before passing this structure to a rich edit control, set <b>cbSize</b> to the size of the <b>BIDIOPTIONS</b> structure. The rich edit control checks the size of <b>cbSize</b> before sending an <a href="https://msdn.microsoft.com/055581c0-ae59-4601-a3e9-416705af429a">EM_GETBIDIOPTIONS</a> message.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * A set of mask bits that determine which of the <b>wEffects</b> flags will be set to 1 or 0 by the rich edit control. This approach eliminates the need to read the effects flags before changing them.
     * 
     * 					
     * 
     * Obsolete bits are valid only for the bidirectional version of Rich Edit 1.0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BOM_CONTEXTALIGNMENT"></a><a id="bom_contextalignment"></a><dl>
     * <dt><b>BOM_CONTEXTALIGNMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The BOE_CONTEXTALIGNMENT value is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BOM_CONTEXTREADING"></a><a id="bom_contextreading"></a><dl>
     * <dt><b>BOM_CONTEXTREADING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The BOE_CONTEXTREADING value is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BOM_DEFPARADIR"></a><a id="bom_defparadir"></a><dl>
     * <dt><b>BOM_DEFPARADIR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The BOE_RTLDIR  value is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BOM_LEGACYBIDICLASS"></a><a id="bom_legacybidiclass"></a><dl>
     * <dt><b>BOM_LEGACYBIDICLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The BOE_LEGACYBIDICLASS value is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BOM_NEUTRALOVERRIDE"></a><a id="bom_neutraloverride"></a><dl>
     * <dt><b>BOM_NEUTRALOVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The BOE_NEUTRALOVERRIDE value is valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BOM_PLAINTEXT"></a><a id="bom_plaintext"></a><dl>
     * <dt><b>BOM_PLAINTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The BOE_PLAINTEXT value is valid. (obsolete).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BOM_UNICODEBIDI"></a><a id="bom_unicodebidi"></a><dl>
     * <dt><b>BOM_UNICODEBIDI</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The BOE_UNICODEBIDI value is valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    wMask {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WORD</a></b>
     * 
     * A set of flags that indicate the desired or current state of the effects flags. Obsolete bits are valid only for the bidirectional version of Rich Edit 1.0. 
     *                     
     *                     
     * 
     * Obsolete bits are valid only for the bidirectional version of Rich Edit 1.0.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BOE_CONTEXTALIGNMENT"></a><a id="boe_contextalignment"></a><dl>
     * <dt><b>BOE_CONTEXTALIGNMENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is 1, context paragraph alignment is active. This feature is used only for plain-text controls. When active, the paragraph alignment is set to PFA_LEFT if the first strongly directional character is LTR, or PFA_RIGHT if the first strongly directional character is RTL. If the control has no strongly directional character, the alignment is chosen according to the directionality of the keyboard language when the control regains focus (default: 0). 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BOE_CONTEXTREADING"></a><a id="boe_contextreading"></a><dl>
     * <dt><b>BOE_CONTEXTREADING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is 1, context paragraph directionality is active. This feature is used only for plain-text controls. When active, the paragraph directionality effect PFE_RTLPARA is set to 0 if the first strongly directional character is LTR, or 1 if the  first strongly directional character is RTL. If the control has no strongly directional character, the directionality is chosen according to the directionality of 
     * 
     * the keyboard language when the control regains focus (default: 0). 
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BOE_FORCERECALC"></a><a id="boe_forcerecalc"></a><dl>
     * <dt><b>BOE_FORCERECALC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Windows 8</b>: Force the rich edit control to recalculate the bidirectional information, and then redraw the control.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BOE_LEGACYBIDICLASS"></a><a id="boe_legacybidiclass"></a><dl>
     * <dt><b>BOE_LEGACYBIDICLASS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Causes the plus and minus characters to be treated as neutral characters with no implied direction. Also causes the slash character to be treated as a common separator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BOE_NEUTRALOVERRIDE"></a><a id="boe_neutraloverride"></a><dl>
     * <dt><b>BOE_NEUTRALOVERRIDE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is 1, the characters !"#&amp;'()*+,-./:;&lt;=&gt; are treated as strong LTR characters (default: 0). 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BOE_PLAINTEXT"></a><a id="boe_plaintext"></a><dl>
     * <dt><b>BOE_PLAINTEXT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Uses plain text layout (obsolete).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BOE_RTLDIR"></a><a id="boe_rtldir"></a><dl>
     * <dt><b>BOE_RTLDIR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Default paragraph direction—implies alignment (obsolete).
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="BOE_UNICODEBIDI"></a><a id="boe_unicodebidi"></a><dl>
     * <dt><b>BOE_UNICODEBIDI</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If this flag is 1, the Unicode Bidi Algorithm (UBA) is used for rich-text controls. The UBA is always used for plain-text controls (default: 0). 
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    wEffects {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 8
    }
}
