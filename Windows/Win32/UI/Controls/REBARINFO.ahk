#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that describes rebar control characteristics.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-rebarinfo
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class REBARINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of this structure, in bytes. Your application must fill this member before sending any messages that use the address of this structure as a parameter.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    fMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>HIMAGELIST</b>
     * 
     * Handle to an image list. The rebar control will use the specified image list to obtain images.
     * @type {Pointer}
     */
    himl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 16
    }
}
