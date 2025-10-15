#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains parameters used to invoke a property sheet dialog box through the OleCreatePropertyFrameIndirect function.
 * @see https://docs.microsoft.com/windows/win32/api//olectl/ns-olectl-ocpfiparams
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class OCPFIPARAMS extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cbStructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Handle to the parent window of the resulting property sheet dialog box.
     * @type {HWND}
     */
    hWndOwner{
        get {
            if(!this.HasProp("__hWndOwner"))
                this.__hWndOwner := HWND(this.ptr + 8)
            return this.__hWndOwner
        }
    }

    /**
     * Horizontal position for the dialog box relative to <b>hWndOwner</b>, in pixels.
     * @type {Integer}
     */
    x {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Vertical position for the dialog box relative to <b>hWndOwner</b>, in pixels.
     * @type {Integer}
     */
    y {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/nf-wtypesbase-olestr">OLESTR</a> that contains the caption of the dialog.
     * @type {PWSTR}
     */
    lpszCaption{
        get {
            if(!this.HasProp("__lpszCaption"))
                this.__lpszCaption := PWSTR(this.ptr + 24)
            return this.__lpszCaption
        }
    }

    /**
     * Number of object pointers passed in <b>lplpUnk</b>.
     * @type {Integer}
     */
    cObjects {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointers on the objects for which this property sheet is being invoked. The number of elements in the array is specified by <b>cObjects</b>. These pointers are passed to each property page through <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-setobjects">IPropertyPage::SetObjects</a>.
     * @type {Pointer<IUnknown>}
     */
    lplpUnk {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Number of property pages specified in <b>lpPages</b>.
     * @type {Integer}
     */
    cPages {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Pointer to an array of size <b>cPages</b> containing the CLSIDs of each property page to display in the property sheet.
     * @type {Pointer<Guid>}
     */
    lpPages {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Locale identifier for the property sheet. This value will be returned through <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypagesite-getlocaleid">IPropertyPageSite::GetLocaleID</a>.
     * @type {Integer}
     */
    lcid {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Property that is highlighted when the dialog box is made visible.
     * @type {Integer}
     */
    dispidInitialProperty {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }
}
