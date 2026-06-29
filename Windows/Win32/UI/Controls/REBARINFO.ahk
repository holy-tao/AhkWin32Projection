#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HIMAGELIST.ahk" { HIMAGELIST }

/**
 * Contains information that describes rebar control characteristics.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-rebarinfo
 * @namespace Windows.Win32.UI.Controls
 */
export default struct REBARINFO {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of this structure, in bytes. Your application must fill this member before sending any messages that use the address of this structure as a parameter.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Flag values that describe characteristics of the rebar control. Currently, rebar controls support only one value: 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="RBIM_IMAGELIST"></a><a id="rbim_imagelist"></a><dl>
     * <dt><b>RBIM_IMAGELIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The 
     * 						<b>himl</b> member is valid or must be filled. 
     * 
     * </td>
     * </tr>
     * </table>
     */
    fMask : UInt32

    /**
     * Type: <b>HIMAGELIST</b>
     * 
     * Handle to an image list. The rebar control will use the specified image list to obtain images.
     */
    himl : HIMAGELIST

}
