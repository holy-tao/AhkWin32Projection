#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Used in cases where a non-authenticated system access is needed.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-lsa_token_information_null
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class LSA_TOKEN_INFORMATION_NULL extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Time at which the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> becomes not valid. Use a value in the distant future if the context never expires.
     * @type {Integer}
     */
    ExpirationTime {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure containing the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifiers</a> (SIDs) of groups the user is to be made a member of. This should not include WORLD or other SIDs defined and assigned by the system. 
     * 
     * 
     * 
     * 
     * Each SID is expected to be in a separately allocated block of memory. The <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure is also expected to be in a separately allocated block of memory.
     * @type {Pointer<TOKEN_GROUPS>}
     */
    Groups {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
