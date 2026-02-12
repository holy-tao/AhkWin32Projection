#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * If this flag is specified, the helper token is used
  * 
  * <ul>
  * <li>To open the local file of an upload job</li>
  * <li>To create or rename the temporary file of a download job</li>
  * <li>To create or rename the reply file of an upload-reply job</li>
  * </ul>
 * @see https://learn.microsoft.com/windows/win32/api//content/bits4_0/nf-bits4_0-ibitstokenoptions-gethelpertokenflags
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BG_TOKEN extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static BG_TOKEN_LOCAL_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BG_TOKEN_NETWORK => 2
}
