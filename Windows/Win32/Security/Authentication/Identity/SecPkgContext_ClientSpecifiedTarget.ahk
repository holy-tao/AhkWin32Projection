#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies the service principal name (SPN) of the initial target when calling the QueryContextAttributes (Digest) function.
 * @see https://docs.microsoft.com/windows/win32/api//sspi/ns-sspi-secpkgcontext_clientspecifiedtarget
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_ClientSpecifiedTarget extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The SPN of the initial target.
     * @type {Pointer<UInt16>}
     */
    sTargetName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
