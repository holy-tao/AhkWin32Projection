#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Contains parameters used to invoke a property sheet dialog box through the OleCreatePropertyFrameIndirect function.
 * @see https://learn.microsoft.com/windows/win32/api/olectl/ns-olectl-ocpfiparams
 * @namespace Windows.Win32.System.Ole
 */
export default struct OCPFIPARAMS {
    #StructPack 8

    /**
     * The size of the structure, in bytes.
     */
    cbStructSize : UInt32

    /**
     * Handle to the parent window of the resulting property sheet dialog box.
     */
    hWndOwner : HWND

    /**
     * Horizontal position for the dialog box relative to <b>hWndOwner</b>, in pixels.
     */
    x : Int32

    /**
     * Vertical position for the dialog box relative to <b>hWndOwner</b>, in pixels.
     */
    y : Int32

    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wtypesbase/nf-wtypesbase-olestr">OLESTR</a> that contains the caption of the dialog.
     */
    lpszCaption : PWSTR

    /**
     * Number of object pointers passed in <b>lplpUnk</b>.
     */
    cObjects : UInt32

    /**
     * Array of <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> pointers on the objects for which this property sheet is being invoked. The number of elements in the array is specified by <b>cObjects</b>. These pointers are passed to each property page through <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypage-setobjects">IPropertyPage::SetObjects</a>.
     */
    lplpUnk : IUnknown.Ptr

    /**
     * Number of property pages specified in <b>lpPages</b>.
     */
    cPages : UInt32

    /**
     * Pointer to an array of size <b>cPages</b> containing the CLSIDs of each property page to display in the property sheet.
     */
    lpPages : Guid.Ptr

    /**
     * Locale identifier for the property sheet. This value will be returned through <a href="https://docs.microsoft.com/windows/desktop/api/ocidl/nf-ocidl-ipropertypagesite-getlocaleid">IPropertyPageSite::GetLocaleID</a>.
     */
    lcid : UInt32

    /**
     * Property that is highlighted when the dialog box is made visible.
     */
    dispidInitialProperty : Int32

}
