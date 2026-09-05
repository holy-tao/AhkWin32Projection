#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the scope of a directory search.
 * @remarks
 * If you do not explicitly set the search scope, the default is <b>ADS_SCOPE_SUBTREE</b>.
 * 
 * Because VBScript cannot read data from a type library, VBScript applications do not recognize the symbolic constants as defined above. Use the numerical constants, instead, to set the appropriate flags in your VBScript applications. To use the symbolic constants as a good programming practice, create explicit declarations of such constants, as done here, in your VBScript applications.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ne-iads-ads_scopeenum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
class ADS_SCOPEENUM extends Win32Enum {

    /**
     * Limits the search to the base object. The result contains, at most, one object.
     * Native name: ADS_SCOPE_BASE
     * @type {Integer (Int32)}
     */
    static SCOPE_BASE => 0

    /**
     * Searches one level of the immediate children, excluding the base object.
     * Native name: ADS_SCOPE_ONELEVEL
     * @type {Integer (Int32)}
     */
    static SCOPE_ONELEVEL => 1

    /**
     * Searches the whole subtree, including all the children and the base object itself.
     * Native name: ADS_SCOPE_SUBTREE
     * @type {Integer (Int32)}
     */
    static SCOPE_SUBTREE => 2
}
