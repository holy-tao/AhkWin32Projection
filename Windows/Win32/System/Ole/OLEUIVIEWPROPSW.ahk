#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OLEUIOBJECTPROPSW.ahk" { OLEUIOBJECTPROPSW }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\VIEW_OBJECT_PROPERTIES_FLAGS.ahk" { VIEW_OBJECT_PROPERTIES_FLAGS }

/**
 * Contains information that is used to initialize the View tab of the Object properties dialog box. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The oledlg.h header defines OLEUIVIEWPROPS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/oledlg/ns-oledlg-oleuiviewpropsw
 * @namespace Windows.Win32.System.Ole
 * @charset Unicode
 */
export default struct OLEUIVIEWPROPSW {
    #StructPack 8

    /**
     * The size of the structure, in bytes.
     */
    cbStruct : UInt32

    /**
     * Flags specific to view page.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VPF_SELECTRELATIVE"></a><a id="vpf_selectrelative"></a><dl>
     * <dt><b>VPF_SELECTRELATIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Relative to origin.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VPF_DISABLERELATIVE"></a><a id="vpf_disablerelative"></a><dl>
     * <dt><b>VPF_DISABLERELATIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable relative to origin.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="VPF_DISABLESCALE"></a><a id="vpf_disablescale"></a><dl>
     * <dt><b>VPF_DISABLESCALE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Disable scale option.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : VIEW_OBJECT_PROPERTIES_FLAGS

    /**
     * This member is reserved.
     */
    dwReserved1 : UInt32[2]

    /**
     * Pointer to a hook callback (not used in this dialog box).
     */
    lpfnHook : IntPtr

    /**
     * Custom data to pass to the hook (not used in this dialog box).
     */
    lCustData : LPARAM

    /**
     * This member is reserved.
     */
    dwReserved2 : UInt32[3]

    __lpOP_ptr : IntPtr
    /**
     * Used internally.
     */
    lpOP {
        get => (addr := this.__lpOP_ptr) ? OLEUIOBJECTPROPSW.At(addr) : unset
        set => this.__lpOP_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    /**
     * Minimum value for the scale range.
     */
    nScaleMin : Int32

    /**
     * Maximum value for the scale range.
     */
    nScaleMax : Int32

}
