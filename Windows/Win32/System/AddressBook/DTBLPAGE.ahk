#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * DTBLPAGE describes a tabbed page that will be used in a dialog box that is built from a display table.
 * @remarks
 * A **DTBLPAGE** structure describes a tabbed page a control that is used to separate several related dialog boxes. Typically, these dialog boxes are property sheets for displaying configuration, message, or recipient options. By clicking the tab, the user can switch from one sheet to another. 
 *   
 * The component string and context identifier provide information about whether extended Help is available for the tabbed page. If extended Help is available, the component string and context identifier will provide information about how to access it. The component string maps to the Help file; the context identifier maps to the initial Help topic. If the context identifier is zero and the component string is NULL, extended Help is not available.
 *   
 * For an overview of display tables, see [Display Tables](display-tables.md). For information about how to implement a display table, see [Implementing a Display Table](display-table-implementation.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/dtblpage
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct DTBLPAGE {
    #StructPack 4

    /**
     * > Position in memory of the character string label for the page tab.
     */
    ulbLpszLabel : UInt32

    /**
     * > Bitmask of flags used to designate the format of the label pointed to by the **ulbLpszLabelName** member. The following flag can be set: 
     *     
     * MAPI_UNICODE 
     *   
     * > The label is in Unicode format. If the MAPI_UNICODE flag is not set, the label is in ANSI format.
     */
    ulFlags : UInt32

    /**
     * > Position in memory of a character string identifying the **[Help File Mappings]** section in the MAPISVC.INF configuration file or 0. The file name appearing in the MAPISVC.INF section can be used by a user to access extended Help for the tabbed page by clicking the **Help** button in the dialog box. For more information about the entries in MAPISVC.INF, see [File Format of MAPISVC.INF](file-format-of-mapisvc-inf.md).
     */
    ulbLpszComponent : UInt32

    /**
     * > A unique identifier for the tabbed page in the string defined by the **ulbLpszComponent** member. The **ulbLpszComponent** member and the **ulContext** member must both be nonzero for the **Help** button to work. If this identifier is zero and the component string is NULL, there is no Help associated with the page.
     */
    ulContext : UInt32

}
