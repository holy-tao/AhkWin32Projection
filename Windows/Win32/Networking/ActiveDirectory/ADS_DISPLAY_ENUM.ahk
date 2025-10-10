#Requires AutoHotkey v2.0.0 64-bit

/**
 * The ADS_DISPLAY_ENUM enumeration specifies how a path is to be displayed.
 * @remarks
 * 
  * This enumeration is used in  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iadspathname-setdisplaytype">IADsPathname::SetDisplayType</a> method to specify how a path  is to be displayed.
  * 
  * <div class="alert"><b>Note</b>  Because VBScript cannot read data from a type library, VBScript applications do not understand the symbolic constants as defined above. You should use the numeric constants instead to set the appropriate flags in your VBScript applications. If you want to use the symbolic constants as a good programming practice, you should create explicit declarations of such constants, as done here, in your VBScript applications.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ne-iads-ads_display_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_DISPLAY_ENUM{

    /**
     * The path  is displayed with both attributes and values. For example, CN=Jeff Smith.
     * @type {Integer (Int32)}
     */
    static ADS_DISPLAY_FULL => 1

    /**
     * The path is displayed with values only. For example, Jeff Smith.
     * @type {Integer (Int32)}
     */
    static ADS_DISPLAY_VALUE_ONLY => 2
}
