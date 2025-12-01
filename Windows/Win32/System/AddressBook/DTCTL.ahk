#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class DTCTL extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    class _ctl_e__Union extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        lpv {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLLABEL>}
         */
        lplabel {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLEDIT>}
         */
        lpedit {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLLBX>}
         */
        lplbx {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLCOMBOBOX>}
         */
        lpcombobox {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLDDLBX>}
         */
        lpddlbx {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLCHECKBOX>}
         */
        lpcheckbox {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLGROUPBOX>}
         */
        lpgroupbox {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLBUTTON>}
         */
        lpbutton {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLRADIOBUTTON>}
         */
        lpradiobutton {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLMVLISTBOX>}
         */
        lpmvlbx {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLMVDDLBX>}
         */
        lpmvddlbx {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<DTBLPAGE>}
         */
        lppage {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
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
     * @type {Integer}
     */
    ulCtlType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

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
     * @type {Integer}
     */
    ulCtlFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * > Pointer to a structure that consists of a [GUID](guid.md) structure, to represent the service provider and an identifier for the control. The **lpbNotif** and **cbNotif** members correspond to the control's **PR_CONTROL_ID** ([PidTagControlId](pidtagcontrolid-canonical-property.md)) property and are used to notify the user interface when the control has to be updated.
     * @type {Pointer<Integer>}
     */
    lpbNotif {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * > Count of bytes in the structure pointed to by the **lpbNotif** member.
     * @type {Integer}
     */
    cbNotif {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

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
     * @type {Pointer<Integer>}
     */
    lpszFilter {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * > Value that identifies the control in the dialog box resource. For tabbed pages controls of type DTCT_PAGE the **ulItemID** member is optionally used to load the component name for the page from a string resource. Position and label information are read from the dialog box resource.
     * @type {Integer}
     */
    ulItemID {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * > A structure that holds the data for the control and corresponds to the control's **PR_CONTROL_STRUCTURE** ([PidTagControlStructure](pidtagcontrolstructure-canonical-property.md)) property. Each type of control has a different structure.
     * @type {_ctl_e__Union}
     */
    ctl{
        get {
            if(!this.HasProp("__ctl"))
                this.__ctl := %this.__Class%._ctl_e__Union(40, this)
            return this.__ctl
        }
    }
}
