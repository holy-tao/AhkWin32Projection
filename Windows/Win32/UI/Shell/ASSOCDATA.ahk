#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by IQueryAssociations::GetData to define the type of data that is to be returned.
 * @see https://learn.microsoft.com/windows/win32/api/shlwapi/ne-shlwapi-assocdata
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ASSOCDATA extends Win32Enum{

    /**
     * The component descriptor to pass to the Windows Installer API.
     * @type {Integer (Int32)}
     */
    static ASSOCDATA_MSIDESCRIPTOR => 1

    /**
     * Attempts to activate a window are restricted. There is no data associated with this value.
     * @type {Integer (Int32)}
     */
    static ASSOCDATA_NOACTIVATEHANDLER => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ASSOCDATA_UNUSED1 => 3

    /**
     * Defaults to user specified association.
     * @type {Integer (Int32)}
     */
    static ASSOCDATA_HASPERUSERASSOC => 4

    /**
     * <b>Internet Explorer version 6 or later</b>. Gets the data stored in the EditFlags value of a file association <a href="https://docs.microsoft.com/windows/desktop/shell/fa-progids">PROGID</a> registry key. This value consists of one or more <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/ne-shlwapi-filetypeattributeflags">FILETYPEATTRIBUTEFLAGS</a>. Compare against those values to determine which attributes have been set.
     * @type {Integer (Int32)}
     */
    static ASSOCDATA_EDITFLAGS => 5

    /**
     * <b>Internet Explorer version 6 or later</b>. Uses the <i>pwszExtra</i> parameter from the <a href="https://docs.microsoft.com/windows/desktop/api/shlwapi/nf-shlwapi-iqueryassociations-getdata">IQueryAssociations::GetData</a> method as the value name.
     * @type {Integer (Int32)}
     */
    static ASSOCDATA_VALUE => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ASSOCDATA_MAX => 7
}
