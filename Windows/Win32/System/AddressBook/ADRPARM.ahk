#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Do not use. Describes the display and behavior of the common address dialog box.
 * @see https://docs.microsoft.com/windows/win32/api//wabdefs/ns-wabdefs-adrparm
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class ADRPARM extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifies the list of entries that can be added to the recipient wells.
     * @type {Integer}
     */
    cbABContEntryID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LPENTRYID</b>
     * 
     * Pointer to a variable of type <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wabdefs/ns-wabdefs-entryid">ENTRYID</a> that specifies the container that will supply the list of <a href="https://docs.microsoft.com/">one-off</a> entries that can be added to the recipient wells of the address book's common dialog box. The address book container that <b>lpABContEntryID</b> points to determines what is listed in the edit box within the dialog box that holds possible recipient names. Usually, <b>lpABContEntryID</b> is <b>NULL</b>, indicating the use of a custom recipient provider.
     * @type {Pointer<ENTRYID>}
     */
    lpABContEntryID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Value of type <b>ULONG</b> that specifies the bitmask of flags associated with various address dialog box options. The following flags can be set in the WAB.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>LPVOID</b>
     * @type {Pointer<Void>}
     */
    lpReserved {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Not supported. Must be set to 0.
     * @type {Integer}
     */
    ulHelpContext {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * Not supported. Must be set to <b>NULL</b>.
     * @type {Pointer<Integer>}
     */
    lpszHelpFileName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>LPFNABSDI</b>
     * 
     * Pointer to a WAB function based on the <a href="https://docs.microsoft.com/previous-versions/office/developer/office-2007/cc839835(v=office.12)">ACCELERATEABSDI</a> prototype (see MAPI documentation), or <b>NULL</b>. This member applies only to the modeless version of the dialog box, as indicated by the <b>DIALOG_SDI</b> flag being set.
     * 
     * Clients building an <b>ADRPARM</b> structure to pass to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-ifaxstatus-get-address-vb">Address</a> must always set the <b>lpfnABSDI</b> member to <b>NULL</b>. If the <b>DIALOG_SDI</b> flag is set, WAB then sets it to a valid function before returning. Clients call this function from within their message loop to ensure that accelerators in the address book dialog box work. When the dialog box is dismissed and WAB calls the function to which the <b>lpfnDismiss</b> member points, clients should unhook the <a href="https://docs.microsoft.com/previous-versions/office/developer/office-2007/cc839835(v=office.12)">ACCELERATEABSDI</a> function from their message loop.
     * @type {Pointer<LPFNABSDI>}
     */
    lpfnABSDI {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b>LPFNDISMISS</b>
     * 
     * Pointer to a function based on the <a href="https://docs.microsoft.com/previous-versions/office/developer/office-2007/cc815796(v=office.12)">DISMISSMODELESS</a> (see MAPI documentation) prototype, or <b>NULL</b>. This member applies only to the modeless version of the dialog box, as indicated by the <b>DIALOG_SDI</b> flag being set. WAB calls the DISMISSMODELESS function when the user dismisses the modeless address dialog box, informing a client calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-ifaxstatus-get-address-vb">Address</a> that the dialog box is no longer active.
     * @type {Pointer<LPFNDISMISS>}
     */
    lpfnDismiss {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: <b>LPVOID</b>
     * 
     * Pointer to the context information to be passed to the <a href="https://docs.microsoft.com/previous-versions/office/developer/office-2007/cc815796(v=office.12)">DISMISSMODELESS</a> function to which the <b>lpfnDismiss</b> member points. This member applies only to the modeless version of the dialog box, as indicated by the <b>DIALOG_SDI</b> flag being set.
     * @type {Pointer<Void>}
     */
    lpvDismissContext {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * Variable of type <b>LPTSTR</b> that specifies the text to be used as a caption for the address book dialog box.
     * @type {Pointer<Integer>}
     */
    lpszCaption {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * Variable of type <b>LPTSTR</b> that specifies the text to be used as a new-entry prompt for an edit box in an address book dialog box.
     * @type {Pointer<Integer>}
     */
    lpszNewEntryTitle {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * Variable of type <b>LPTSTR</b> that specifies the text to be used as a title for the set of recipient-name edit boxes that appears in the dialog box. This member is used only if the address book dialog box is modal.
     * @type {Pointer<Integer>}
     */
    lpszDestWellsTitle {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifies the number of recipient-name edit boxes (that is, destination fields) in the address book dialog box. A number from 0 through 3 is typical. If the <b>cDestFields</b> member is zero and the ADDRESS_ONE flag is not set in <b>ulFlags</b>, the address book will be open for browsing only.
     * @type {Integer}
     */
    cDestFields {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifies the field in the address book dialog box that should have the initial focus when the dialog box appears. This value must be between 0 and the value of <b>cDestFields</b> minus 1.
     * @type {Integer}
     */
    nDestFieldFocus {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * Type: <b>LPTSTR*</b>
     * 
     * Pointer to an array of variables of type <b>LPTSTR</b> that specify the text titles to be displayed in the recipient-name edit boxes of the address book dialog box. The size of the array is the value of <b>cDestFields</b>. If the <b>lppszDestTitles</b> member is <b>NULL</b>, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-ifaxstatus-get-address-vb">Address</a> method chooses default titles.
     * @type {Pointer<Pointer<Integer>>}
     */
    lppszDestTitles {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * Type: <b>ULONG*</b>
     * 
     * Pointer to an array of variables of type <b>ULONG</b> that specify the recipient types—such as MAPI_TO, MAPI_CC, and MAPI_BCC—associated with each recipient-name edit box. The size of the array is the value of <b>cDestFields</b>. If the <b>lpulDestComps</b> member is <b>NULL</b>, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-ifaxstatus-get-address-vb">Address</a> method chooses default recipient types.
     * @type {Pointer<Integer>}
     */
    lpulDestComps {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * Type: <b>LPSRestriction</b>
     * 
     * Not supported. Must be set to <b>NULL</b>.
     * @type {Pointer<SRestriction>}
     */
    lpContRestriction {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * Type: <b>LPSRestriction</b>
     * 
     * Not supported. Must be set to <b>NULL</b>.
     * @type {Pointer<SRestriction>}
     */
    lpHierRestriction {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }
}
