#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\QUOTA_LIMITS.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class POLICY_DEFAULT_QUOTA_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {QUOTA_LIMITS}
     */
    QuotaLimits{
        get {
            if(!this.HasProp("__QuotaLimits"))
                this.__QuotaLimits := QUOTA_LIMITS(0, this)
            return this.__QuotaLimits
        }
    }
}
