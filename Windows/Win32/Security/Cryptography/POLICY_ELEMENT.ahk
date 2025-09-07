#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
    targetEndpointAddress{
        get {
            if(!this.HasProp("__targetEndpointAddress"))
                this.__targetEndpointAddress := PWSTR(this.ptr + 0)
            return this.__targetEndpointAddress
        }
    }

    /**
     * @type {PWSTR}
     */
    issuerEndpointAddress{
        get {
            if(!this.HasProp("__issuerEndpointAddress"))
                this.__issuerEndpointAddress := PWSTR(this.ptr + 8)
            return this.__issuerEndpointAddress
        }
    }

    /**
     * @type {PWSTR}
     */
    issuedTokenParameters{
        get {
            if(!this.HasProp("__issuedTokenParameters"))
                this.__issuedTokenParameters := PWSTR(this.ptr + 16)
            return this.__issuedTokenParameters
        }
    }

    /**
     * @type {PWSTR}
     */
    privacyNoticeLink{
        get {
            if(!this.HasProp("__privacyNoticeLink"))
                this.__privacyNoticeLink := PWSTR(this.ptr + 24)
            return this.__privacyNoticeLink
        }
    }

    /**
     * @type {Integer}
     */
    privacyNoticeVersion {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    useManagedPresentation {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }
}
