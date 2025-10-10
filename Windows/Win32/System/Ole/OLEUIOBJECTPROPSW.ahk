#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information that is used to initialize the standard Object Properties dialog box.
 * @remarks
 * 
  * > [!NOTE]
  * > The oledlg.h header defines OLEUIOBJECTPROPS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
 * @see https://docs.microsoft.com/windows/win32/api//oledlg/ns-oledlg-oleuiobjectpropsw
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 * @charset Unicode
 */
class OLEUIOBJECTPROPSW extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Contains in/out global flags for the property sheet.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPF_OBJECTISLINK"></a><a id="opf_objectislink"></a><dl>
     * <dt><b>OPF_OBJECTISLINK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Object is a link object and therefore has a link property page.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPF_NOFILLDEFAULT"></a><a id="opf_nofilldefault"></a><dl>
     * <dt><b>OPF_NOFILLDEFAULT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not fill in default values for the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPF_SHOWHELP"></a><a id="opf_showhelp"></a><dl>
     * <dt><b>OPF_SHOWHELP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The dialog box will display a <b>Help</b> button.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OPF_DISABLECONVERT"></a><a id="opf_disableconvert"></a><dl>
     * <dt><b>OPF_DISABLECONVERT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>Convert</b> button will be disabled on the general property page.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pointer to the standard property sheet header (<a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetheadera_v2">PROPSHEETHEADER</a>), used for extensibility.
     * @type {Pointer<PROPSHEETHEADERW_V2>}
     */
    lpPS {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Identifier for the object.
     * @type {Integer}
     */
    dwObject {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to the interface to manipulate object.
     * @type {Pointer<IOleUIObjInfoW>}
     */
    lpObjInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Container-defined unique identifier for a single link. Containers can use the pointer to the link's container site for this value.
     * @type {Integer}
     */
    dwLink {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Pointer to the interface to manipulate link.
     * @type {Pointer<IOleUILinkInfoW>}
     */
    lpLinkInfo {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Pointer to the general page data.
     * @type {Pointer<OLEUIGNRLPROPSW>}
     */
    lpGP {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to the view page data.
     * @type {Pointer<OLEUIVIEWPROPSW>}
     */
    lpVP {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Pointer to the link page data.
     * @type {Pointer<OLEUILINKPROPSW>}
     */
    lpLP {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
