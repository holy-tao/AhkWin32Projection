#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SOLE_AUTHENTICATION_LIST (objidlbase.h) structure indicates the default authentication information to use with each authentication service.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/ns-objidlbase-sole_authentication_list
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class SOLE_AUTHENTICATION_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The count of pointers in the array pointed to by <b>aAuthInfo</b>.
     * @type {Integer}
     */
    cAuthInfo {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/ns-objidl-sole_authentication_info">SOLE_AUTHENTICATION_INFO</a> structures. Each of these structures contains an identifier for an authentication service, an identifier for the authorization service, and a pointer to authentication information to use with the specified authentication service.
     * @type {Pointer<SOLE_AUTHENTICATION_INFO>}
     */
    aAuthInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
