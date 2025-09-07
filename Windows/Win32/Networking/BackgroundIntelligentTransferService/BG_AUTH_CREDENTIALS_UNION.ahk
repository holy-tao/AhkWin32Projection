#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BG_BASIC_CREDENTIALS.ahk

/**
 * Identifies the credentials to use for the authentication scheme specified in the BG_AUTH_CREDENTIALS structure.
 * @see https://learn.microsoft.com/windows/win32/api/bits1_5/ns-bits1_5-bg_auth_credentials_union
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BG_AUTH_CREDENTIALS_UNION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Identifies the user name and password of the user to authenticate. For details, see the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/bits1_5/ns-bits1_5-bg_basic_credentials">BG_BASIC_CREDENTIALS</a> structure.
     * @type {BG_BASIC_CREDENTIALS}
     */
    Basic{
        get {
            if(!this.HasProp("__Basic"))
                this.__Basic := BG_BASIC_CREDENTIALS(this.ptr + 0)
            return this.__Basic
        }
    }
}
