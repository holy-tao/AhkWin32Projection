#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The POLICY_ELEMENT (lpmapi.h) structure contains an RSVP policy element.
 * @see https://learn.microsoft.com/windows/win32/api/lpmapi/ns-lpmapi-policy_element
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class POLICY_ELEMENT extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    targetEndpointAddress {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    issuerEndpointAddress {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    issuedTokenParameters {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    privacyNoticeLink {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    privacyNoticeVersion {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {BOOL}
     */
    useManagedPresentation {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }
}
