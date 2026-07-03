#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ITfRange.ahk" { ITfRange }
#Import ".\TfAnchor.ahk" { TfAnchor }

/**
 * The TF_HALTCOND structure is used to contain conditions of a range shift.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ns-msctf-tf_haltcond
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct TF_HALTCOND {
    #StructPack 8

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that halts the shift. If the range shift encounters this range during the shift, the shift halts. This member can be <b>NULL</b>.
     */
    pHaltRange : ITfRange

    /**
     * Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/msctf/ne-msctf-tfanchor">TfAnchor</a> values that specifies which anchor of <b>pHaltRange</b> the anchor will get shifted to if <b>pHaltRange</b> is encountered during the range shift. This member is ignored if <b>pHaltRange</b> is <b>NULL</b>.
     */
    aHaltPos : TfAnchor

    /**
     * Contains a set of flags that modify the behavior of the range shift. This can be zero or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>TF_HF_OBJECT</td>
     * <td>The range shift halts if an embedded object is encountered.</td>
     * </tr>
     * </table>
     */
    dwFlags : UInt32

}
