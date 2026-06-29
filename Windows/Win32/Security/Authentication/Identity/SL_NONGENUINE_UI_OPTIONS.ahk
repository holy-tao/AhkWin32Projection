#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * Specifies an application that displays a dialog box when the SLIsGenuineLocal function indicates that an installation is not genuine.
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/ns-slpublic-sl_nongenuine_ui_options
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SL_NONGENUINE_UI_OPTIONS {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A pointer to an <b>SLID</b> structure that specifies an application that displays a dialog box.
     */
    pComponentId : Guid.Ptr

    /**
     * The return value that the <a href="https://docs.microsoft.com/windows/desktop/api/slpublic/nf-slpublic-slisgenuinelocal">SLIsGenuineLocal</a> function returns when an installation is not genuine.
     */
    hResultUI : HRESULT

}
