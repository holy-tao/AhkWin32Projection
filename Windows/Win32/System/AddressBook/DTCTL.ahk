#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DTBLDDLBX.ahk" { DTBLDDLBX }
#Import ".\DTBLRADIOBUTTON.ahk" { DTBLRADIOBUTTON }
#Import ".\DTBLGROUPBOX.ahk" { DTBLGROUPBOX }
#Import ".\DTBLLBX.ahk" { DTBLLBX }
#Import ".\DTBLMVDDLBX.ahk" { DTBLMVDDLBX }
#Import ".\DTBLBUTTON.ahk" { DTBLBUTTON }
#Import ".\DTBLMVLISTBOX.ahk" { DTBLMVLISTBOX }
#Import ".\DTBLEDIT.ahk" { DTBLEDIT }
#Import ".\DTBLLABEL.ahk" { DTBLLABEL }
#Import ".\DTBLCOMBOBOX.ahk" { DTBLCOMBOBOX }
#Import ".\DTBLPAGE.ahk" { DTBLPAGE }
#Import ".\DTBLCHECKBOX.ahk" { DTBLCHECKBOX }

/**
 * Describes a control that will be used in a dialog box built from a display table.
 * @remarks
 * The **DTCTL** structure describes one control of any type. Most of its members are used to set properties on the control. 
 *   
 * The **ctl** member is a union of structures that relate to a particular type of control. If the **DTCTL** structure is describing an edit control, for example, the **ctl** member will point to a [DTBLEDIT](dtbledit.md) structure. This structure corresponds to the control's **PR_CONTROL_STRUCTURE** property. The union has as its first member a variable of type LPVOID to allow compile time initialization of the **DTCTL** structure. 
 *   
 * Although the [BuildDisplayTable](builddisplaytable.md) function uses the **DTCTL** structure for building the display table from control resources, the **DTCTL** structure never appears in the display table itself. This structure just supplies information to **BuildDisplayTable**.
 *   
 * In the **ulCtlFlags** member, four flags DT_ACCEPT_DBCS, DT_EDITABLE, DT_MULTILINE_and DT_PASSWORD_EDIT affect edit controls only. Two others DT_REQUIRED and DT_SET_IMMEDIATE affect any editable control. 
 *   
 * The controls available for a dialog box are label, text box, ink-aware text box, list, drop-down list, combo box, check box, group box, button, radio button, and tabbed page.
 *   
 * For an overview of display tables, see [Display Tables](display-tables.md). For information about how to implement a display table, see [Implementing a Display Table](display-table-implementation.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/dtctl
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct DTCTL {
    #StructPack 8


    struct _ctl {
        lpv : IntPtr

        static __New() {
            DefineProp(this.Prototype, 'lplabel', { type: DTBLLABEL.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'lpedit', { type: DTBLEDIT.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'lplbx', { type: DTBLLBX.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'lpcombobox', { type: DTBLCOMBOBOX.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'lpddlbx', { type: DTBLDDLBX.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'lpcheckbox', { type: DTBLCHECKBOX.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'lpgroupbox', { type: DTBLGROUPBOX.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'lpbutton', { type: DTBLBUTTON.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'lpradiobutton', { type: DTBLRADIOBUTTON.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'lpmvlbx', { type: DTBLMVLISTBOX.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'lpmvddlbx', { type: DTBLMVDDLBX.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'lppage', { type: DTBLPAGE.Ptr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * > Type of control that is included in the **ctl** member and corresponds to the control's **PR_CONTROL_TYPE** ([PidTagControlType](pidtagcontroltype-canonical-property.md)) property. Possible values are as follows:
     *     
     * DTCT_LABEL 
     *   
     * > Label control.
     *     
     * DTCT_EDIT 
     *   
     * > Edit control.
     *     
     * DTCT_LBX 
     *   
     * > List box control.
     *     
     * DTCT_COMBOBOX 
     *   
     * > Combo box control.
     *     
     * DTCT_DDLBX 
     *   
     * > Drop-down list control.
     *     
     * DTCT_CHECKBOX 
     *   
     * > Check box control.
     *     
     * DTCT_GROUPBOX 
     *   
     * > Group box control.
     *     
     * DTCT_BUTTON 
     *   
     * > Button control.
     *     
     * DTCT_PAGE 
     *   
     * > Tabbed page control.
     *     
     * DTCT_RADIOBUTTON 
     *   
     * > Radio button control.
     *     
     * DTCT_MVLISTBOX 
     *   
     * > Multi-valued list control.
     *     
     * DTCT_MVDDLBX 
     *   
     * > Multi-valued drop-down list control.
     */
    ulCtlType : UInt32

    /**
     * > Bitmask of flags that describes the control's features and corresponds to the control's **PR_CONTROL_FLAGS** ([PidTagControlFlags](pidtagcontrolflags-canonical-property.md)) property. These flags can be set for check boxes, combo boxes, list boxes, and edit controls only. Possible values are as follows:
     *     
     * DT_ACCEPT_DBCS 
     *   
     * > Either the ANSI or DBCS format is accepted. This flag is valid for edit controls only.
     *     
     * DT_EDITABLE 
     *   
     * > A user can modify the text in the control. 
     *     
     * DT_MULTILINE 
     *   
     * > The control can contain multiple text lines. This flag is valid for edit controls only.
     *     
     * DT_PASSWORD_EDIT 
     *   
     * > The control contains a password; therefore, the contents of the control should not be displayed to the user. This flag is valid for edit controls only.
     *     
     * DT_REQUIRED 
     *   
     * > The dialog box control is required. This flag is valid only for edit and combo box controls.
     *     
     * DT_SET_IMMEDIATE 
     *   
     * > Enables immediate output of a value upon a change in the control. This allows a dependency relationship to be established between two controls.
     */
    ulCtlFlags : UInt32

    /**
     * > Pointer to a structure that consists of a [GUID](guid.md) structure, to represent the service provider and an identifier for the control. The **lpbNotif** and **cbNotif** members correspond to the control's **PR_CONTROL_ID** ([PidTagControlId](pidtagcontrolid-canonical-property.md)) property and are used to notify the user interface when the control has to be updated.
     */
    lpbNotif : IntPtr

    /**
     * > Count of bytes in the structure pointed to by the **lpbNotif** member.
     */
    cbNotif : UInt32

    /**
     * > Pointer to a character string that describes which characters can be entered into an edit or combo box control. For other types of controls, the **lpszFilter** member can be NULL. For edit and combo box controls, it should be a regular expression that applies to a single character at a time. The same filter is applied to all characters in the control. The format of the filter string is as follows: 
     *     
     * |**Character**|**Description**|
     * |:-----|:-----|
     * | `*`  | Any character is allowed (for example, `"*"`). |
     * | `[ ]`|Defines a set of characters (for example, `"[0123456789]"`.) |
     * | `-`  |Indicates a range of characters (for example, `"[a-z]"`). |
     * | `~`  |Indicates that these characters are not allowed (for example, `"[~0-9]")`. |   
     * | `\`  |Used to quote any of the previous symbols (for example, `"[\-\\\[\]]"` means -, \, [, and ] characters are allowed). |
     */
    lpszFilter : IntPtr

    /**
     * > Value that identifies the control in the dialog box resource. For tabbed pages controls of type DTCT_PAGE the **ulItemID** member is optionally used to load the component name for the page from a string resource. Position and label information are read from the dialog box resource.
     */
    ulItemID : UInt32

    /**
     * > A structure that holds the data for the control and corresponds to the control's **PR_CONTROL_STRUCTURE** ([PidTagControlStructure](pidtagcontrolstructure-canonical-property.md)) property. Each type of control has a different structure.
     */
    ctl : DTCTL._ctl

}
