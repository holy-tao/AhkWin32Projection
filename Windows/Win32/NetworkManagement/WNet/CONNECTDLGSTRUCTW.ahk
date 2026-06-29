#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CONNECTDLGSTRUCT_FLAGS.ahk" { CONNECTDLGSTRUCT_FLAGS }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\NETRESOURCEW.ahk" { NETRESOURCEW }

/**
 * Used by the WNetConnectionDialog1 function to establish browsing dialog box parameters. (Unicode)
 * @remarks
 * If neither the CONNDLG_RO_PATH nor the CONNDLG_USE_MRU flag is set, and the <b>lpRemoteName</b> member of the 
 * <b>NETRESOURCE</b> structure does not specify a remote path, the request defaults to the CONNDLG_RO_PATH dialog display type.
 * 
 * The CONNDLG_PERSIST and CONNDLG_NOT_PERSIST values cannot both be set. If neither is set, the dialog box defaults to the last option that was selected in this dialog box for the particular type of device connection.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winnetwk.h header defines CONNECTDLGSTRUCT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winnetwk/ns-winnetwk-connectdlgstructw
 * @namespace Windows.Win32.NetworkManagement.WNet
 * @charset Unicode
 */
export default struct CONNECTDLGSTRUCTW {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The size, in bytes, of the 
     * <b>CONNECTDLGSTRUCT</b> structure. The caller must supply this value.
     */
    cbStructure : UInt32

    /**
     * Type: <b>HWND</b>
     * 
     * The handle to the owner window for the dialog box.
     */
    hwndOwner : HWND

    /**
     * Type: <b>LPNETRESOURCE</b>
     * 
     * A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rrascfg/nn-rrascfg-ieapproviderconfig">NETRESOURCE</a> structure. 
     * 
     * 
     * 
     * 
     * If the <b>lpRemoteName</b> member of 
     * <b>NETRESOURCE</b> is specified, it will be entered into the path field of the dialog box. With the exception of the <b>dwType</b> member, all other members of the 
     * <b>NETRESOURCE</b> structure must be set to <b>NULL</b>. The <b>dwType</b> member must be equal to RESOURCETYPE_DISK.
     * 							
     * 
     *  The system does not support the <b>RESOURCETYPE_PRINT</b> flag for browsing and connecting to print resources.
     */
    lpConnRes : NETRESOURCEW.Ptr

    /**
     * Type: <b>DWORD</b>
     */
    dwFlags : CONNECTDLGSTRUCT_FLAGS

    /**
     * Type: <b>DWORD</b>
     * 
     * If the call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnetwk/nf-winnetwk-wnetconnectiondialog1a">WNetConnectionDialog1</a> function is successful, this member returns the number of the connected device. The value is 1 for A:, 2 for B:, 3 for C:, and so on. If the user made a deviceless connection, the value is –1.
     */
    dwDevNum : UInt32

}
