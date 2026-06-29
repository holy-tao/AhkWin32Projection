#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Describes the data used to initialize a browse dialog box in the directory service query.
 * @remarks
 * This structure is specific to the <b>CLSID_DsQuery</b> query handler. This structure is used for the <b>pHandlerParameters</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/ns-cmnquery-openquerywindow">OPENQUERYWINDOW</a> structure when <b>CLSID_DsQuery</b> is set for the <b>clsidHandler</b> member of the 
 * <b>OPENQUERYWINDOW</b> structure. For more information, and a code example for  using this, and other related APIs, see 
 * <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/nf-cmnquery-icommonquery-openquerywindow">ICommonQuery::OpenQueryWindow</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dsquery/ns-dsquery-dsqueryinitparams
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct DSQUERYINITPARAMS {
    #StructPack 8

    /**
     * Contains the size, in bytes,  of this structure.
     */
    cbStruct : UInt32

    dwFlags : UInt32

    /**
     * Pointer to a null-terminated Unicode string that contains the ADsPath of the default scope for the search. Set this member to <b>NULL</b> if no default search scope is specified.
     */
    pDefaultScope : PWSTR

    /**
     * Pointer to a null-terminated Unicode string that contains the default file system path where searches will be saved. This member is ignored if the <b>dwFlags</b> member does not contain <b>DSQPF_SAVELOCATION</b>.
     */
    pDefaultSaveLocation : PWSTR

    /**
     * Pointer to a  null-terminated Unicode string that contains the user name in the valid domain notation, for example, "fabrikam\jeffsmith".
     */
    pUserName : PWSTR

    /**
     * Pointer to a  null-terminated Unicode string that contains the password of the user specified by the <b>pUserName</b> member.
     */
    pPassword : PWSTR

    /**
     * Pointer to  a  null-terminated Unicode string that contains the name of the server from which the list of trusted domains is read. The list is used to populate the <b>In:</b> drop-down list in the dialog box.
     */
    pServer : PWSTR

}
