#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import ".\CMINVOKECOMMANDINFO.ahk" { CMINVOKECOMMANDINFO }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Contains additional arguments used by DFM_INVOKECOMMANDEX.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-dfmics
 * @namespace Windows.Win32.UI.Shell
 */
export default struct DFMICS {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of this structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>DWORD</b>
     * 
     * Zero, or one or more of the following flags that specify how to handle the data in the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfo">CMINVOKECOMMANDINFO</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfoex">CMINVOKECOMMANDINFOEX</a> structure pointed to by <b>pici</b>.
     */
    fMask : UInt32

    /**
     * Type: <b>LPARAM</b>
     * 
     * A pointer to a null-terminated string that contains additional arguments to the selected menu command. This member can be <b>NULL</b>.
     */
    lParam : LPARAM

    /**
     * Type: <b>UINT</b>
     * 
     * The minimum value that the handler can specify for a menu item identifier.
     */
    idCmdFirst : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The maximum value that the handler can specify for a menu item identifier.
     */
    idDefMax : UInt32

    /**
     * Type: <b>LPCMINVOKECOMMANDINFO</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ns-shobjidl_core-cminvokecommandinfo">CMINVOKECOMMANDINFO</a> or <b>CMINVOKECOMMANDINFO</b> structure.
     */
    pici : CMINVOKECOMMANDINFO.Ptr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * A pointer to the site of the context menu handler.
     */
    punkSite : IUnknown

}
