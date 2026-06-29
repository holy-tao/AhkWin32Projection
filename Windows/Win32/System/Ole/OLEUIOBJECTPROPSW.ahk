#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IOleUIObjInfoW.ahk" { IOleUIObjInfoW }
#Import ".\OLEUIVIEWPROPSW.ahk" { OLEUIVIEWPROPSW }
#Import "..\..\UI\Controls\PROPSHEETHEADERW_V2.ahk" { PROPSHEETHEADERW_V2 }
#Import ".\IOleUILinkInfoW.ahk" { IOleUILinkInfoW }
#Import ".\OLEUIGNRLPROPSW.ahk" { OLEUIGNRLPROPSW }
#Import ".\OLEUILINKPROPSW.ahk" { OLEUILINKPROPSW }
#Import ".\OBJECT_PROPERTIES_FLAGS.ahk" { OBJECT_PROPERTIES_FLAGS }

/**
 * Contains information that is used to initialize the standard Object Properties dialog box. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The oledlg.h header defines OLEUIOBJECTPROPS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/oledlg/ns-oledlg-oleuiobjectpropsw
 * @namespace Windows.Win32.System.Ole
 * @charset Unicode
 */
export default struct OLEUIOBJECTPROPSW {
    #StructPack 8

    /**
     * The size of the structure, in bytes.
     */
    cbStruct : UInt32

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
     */
    dwFlags : OBJECT_PROPERTIES_FLAGS

    /**
     * Pointer to the standard property sheet header (<a href="https://docs.microsoft.com/windows/desktop/api/prsht/ns-prsht-propsheetheadera_v2">PROPSHEETHEADER</a>), used for extensibility.
     */
    lpPS : PROPSHEETHEADERW_V2.Ptr

    /**
     * Identifier for the object.
     */
    dwObject : UInt32

    /**
     * Pointer to the interface to manipulate object.
     */
    lpObjInfo : IOleUIObjInfoW

    /**
     * Container-defined unique identifier for a single link. Containers can use the pointer to the link's container site for this value.
     */
    dwLink : UInt32

    /**
     * Pointer to the interface to manipulate link.
     */
    lpLinkInfo : IOleUILinkInfoW

    __lpGP_ptr : IntPtr
    /**
     * Pointer to the general page data.
     */
    lpGP {
        get => (addr := this.__lpGP_ptr) ? OLEUIGNRLPROPSW.At(addr) : unset
        set => this.__lpGP_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    __lpVP_ptr : IntPtr
    /**
     * Pointer to the view page data.
     */
    lpVP {
        get => (addr := this.__lpVP_ptr) ? OLEUIVIEWPROPSW.At(addr) : unset
        set => this.__lpVP_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

    __lpLP_ptr : IntPtr
    /**
     * Pointer to the link page data.
     */
    lpLP {
        get => (addr := this.__lpLP_ptr) ? OLEUILINKPROPSW.At(addr) : unset
        set => this.__lpLP_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

}
