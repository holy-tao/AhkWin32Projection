#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Specifies the target of an authentication request.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecpkg/ns-ntsecpkg-secpkg_targetinfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_TARGETINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that specifies the domain of the target computer.
     * @type {Pointer<Void>}
     */
    DomainSid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The name of the target computer.
     * @type {Pointer<Char>}
     */
    ComputerName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
