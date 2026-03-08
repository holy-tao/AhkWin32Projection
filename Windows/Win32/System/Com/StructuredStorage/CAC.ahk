#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The <b>CachePath</b> field of the 
  *          <a href="https://docs.microsoft.com/windows/desktop/api/winineti/ns-winineti-internet_cache_config_infoa">INTERNET_CACHE_CONFIG_INFO</a> structure 
  *          specified in the <i>lpCachedConfigInfo</i> parameter is filled with a pointer to a string 
  *          identifying the content path. This cannot be used at the same time as 
  *          <b>CACHE_CONFIG_HISTORY_PATHS_FC</b> or 
  *          <b>CACHE_CONFIG_COOKIES_PATHS_FC</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winineti/nf-winineti-geturlcacheconfiginfoa
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class CAC extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cElems {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {PSTR}
     */
    pElems {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
