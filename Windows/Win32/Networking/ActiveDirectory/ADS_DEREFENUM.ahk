#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ADS_DEREFENUM enumeration specifies the process through which aliases are dereferenced.
 * @remarks
 * 
 * The  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-idirectorysearch">IDirectorySearch</a> interface uses these constants to set the alias dereferencing behavior. If no option is specified, the server defaults to <b>ADS_DEREF_NEVER</b>.
 * 
 * <div class="alert"><b>Note</b>  Because VBScript cannot read data from a type library, VBScript applications do not recognize the symbolic constants as defined above. Use the numerical constants, instead, to set the appropriate flags in your VBScript applications. To use the symbolic constants, as a good programming practice, explicitly declare constants, as done here.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ne-iads-ads_derefenum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_DEREFENUM{

    /**
     * Does not dereference aliases when searching or locating the base object of the search.
     * @type {Integer (Int32)}
     */
    static ADS_DEREF_NEVER => 0

    /**
     * Dereferences aliases when searching subordinates of the base object, but not when locating the base itself.
     * @type {Integer (Int32)}
     */
    static ADS_DEREF_SEARCHING => 1

    /**
     * Dereferences aliases when locating the base object of the search, but not when searching its subordinates.
     * @type {Integer (Int32)}
     */
    static ADS_DEREF_FINDING => 2

    /**
     * Dereferences aliases when both searching subordinates and locating the base object of the search.
     * @type {Integer (Int32)}
     */
    static ADS_DEREF_ALWAYS => 3
}
