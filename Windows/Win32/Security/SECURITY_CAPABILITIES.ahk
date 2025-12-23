#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Defines the security capabilities of the app container.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-security_capabilities
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class SECURITY_CAPABILITIES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The SID of the app container.
     * @type {PSID}
     */
    AppContainerSid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The specific capabilities.
     * @type {Pointer<SID_AND_ATTRIBUTES>}
     */
    Capabilities {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    CapabilityCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * This member is reserved. Do not use it.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
