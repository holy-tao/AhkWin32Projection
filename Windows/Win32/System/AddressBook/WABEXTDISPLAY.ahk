#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * Do not use. Used by the Windows Address Book (WAB) to initialize user's IContextMenu Interface and IShellPropSheetExt Interface implementations.
 * @see https://docs.microsoft.com/windows/win32/api//wabapi/ns-wabapi-wabextdisplay
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class WABEXTDISPLAY extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * Not used.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LPWABOBJECT</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wabapi/nn-wabapi-iwabobject">IWABObject</a> interface that specifies the object to use for calling the <b>IWABObject</b> memory allocation methods. These methods allocate any memory that you pass back to the WAB and that you expect the WAB to free or use. You can also use this pointer to call any of the other <b>IWABObject</b> methods.
     * @type {Pointer<IWABObject>}
     */
    lpWABObject {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>LPADRBOOK</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wabiab/nn-wabiab-iaddrbook">IAddrBook</a> interface that specifies the object to use for calling any of the standard WAB <b>IAddrBook</b> methods.
     * @type {Pointer<IAddrBook>}
     */
    lpAdrBook {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>LPMAPIPROP</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/previous-versions/office/developer/office-2007/cc839725(v=office.12)">IMailUser : IMAPIProp</a> object. This interface is relevant for both <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellpropsheetext">IShellPropSheetExt Interface</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu">IContextMenu Interface</a> implementations. For IShellPropSheetExt Interface implementations, <b>lpPropObj</b> contains the actual object being displayed. It can be either an IMailUser : IMAPIProp or <a href="https://docs.microsoft.com/previous-versions/office/developer/office-2007/cc842393(v=office.12)">IDistList : IMAPIContainer</a> object. To determine which object <b>lpPropObj</b> is, query for its PR_OBJECT_TYPE property. You can retrieve properties from this object to populate your extension property sheets.
     * 
     * For <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-icontextmenu">IContextMenu Interface</a> implementations, <b>lpPropObj</b> contains a valid object; however, this object does not have any properties associated with it. 
     * You can call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on this object to ensure that the object and any other data of interest in this <b>WABEXTDISPLAY</b> structure survives as long as you need it. 
     * If you call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a>, you must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on <b>lpPropObj</b> when you no longer need it.
     * 
     * If your application uses named properties, and you want to get the named properties relevant to you from the WAB, you can call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/wab/-wab-iabcontainer-getidsfromnames">GetIDsfromNames</a> method on this <b>lpPropObj</b> object to retrieve any such named properties. If you want to access properties that are associated with messaging users, cast this object to an <a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/nn-wabdefs-imailuser">LPMAILUSER</a> before calling GetIDsfromNames on it.
     * @type {Pointer<IMAPIProp>}
     */
    lpPropObj {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Variable of type <b>BOOL</b> that specifies the read-only property on certain kinds of objects, such as the <a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Reference">VCARD_NAME</a> attribute, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winldap/ns-winldap-ldap">LDAP</a> search results, and <a href="https://docs.microsoft.com/">one-off</a> MailUser. This member is relevant only for <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellpropsheetext">IShellPropSheetExt Interface</a>. If this flag is set to true, one's property sheet must set all its controls to a read-only or disabled mode, typically in response to the <a href="https://docs.microsoft.com/windows/desktop/dlgbox/wm-initdialog">WM_INITDIALOG</a> message. Setting  controls to a read-only state makes the user experience more consistent.
     * @type {BOOL}
     */
    fReadOnly{
        get {
            if(!this.HasProp("__fReadOnly"))
                this.__fReadOnly := BOOL(this.ptr + 32)
            return this.__fReadOnly
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Variable of type <b>BOOL</b> that specifies the flag indicating that a change has been made to your property sheet. This member is relevant for <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellpropsheetext">IShellPropSheetExt Interface</a> only. Any time the user makes a change such as adding, editing or deleting data on your property sheet, you must set this flag to true to signal to the WAB that the data on your property sheet has changed. If this flag is not set, the WAB may not persist the changes the user made to your property sheet.
     * @type {BOOL}
     */
    fDataChanged{
        get {
            if(!this.HasProp("__fDataChanged"))
                this.__fDataChanged := BOOL(this.ptr + 36)
            return this.__fDataChanged
        }
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifies flags that control behavior. The following flags are valid.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b>LPVOID</b>
     * 
     * Pointer that specifies miscellaneous information that is passed to your application. The current flags identify the information being represented. If <b>ulFlags</b> is set to <b>WAB_CONTEXT_ADRLIST</b>, <b>lpv</b> contains a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/ns-wabdefs-adrlist">ADRLIST</a>. Cast <b>lpv</b> to an <b>ADRLIST</b> to access the contents of the <b>ADRLIST</b>. The <b>lpAdrList-&gt;cEntries</b> member contains the number of selected items. The <a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/ns-wabdefs-adrentry">ADRENTRY</a> structures in <b>lpAdrList-&gt;aEntries</b> contain <a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/ns-wabdefs-spropvalue">SPropValue</a> arrays with all of the properties pertaining to each selected item.
     * @type {Pointer<Void>}
     */
    lpv {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b>LPTSTR</b>
     * 
     * Variable of type <b>LPTSTR</b> that specifies a string used for passing in miscellaneous information to your application. The current flags identify the information being represented. If <b>ulFlags</b> is set to <b>WAB_DISPLAY_LDAPURL</b>, the <b>lpsz</b> member contains a pointer to a <b>NULL</b> terminated string containing the LDAP URL whose properties are being displayed.
     * @type {Pointer<SByte>}
     */
    lpsz {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 64
    }
}
