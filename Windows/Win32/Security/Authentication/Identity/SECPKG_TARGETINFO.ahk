#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\PSID.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * Specifies the target of an authentication request.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ns-ntsecpkg-secpkg_targetinfo
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_TARGETINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that specifies the domain of the target computer.
     * @type {PSID}
     */
    DomainSid{
        get {
            if(!this.HasProp("__DomainSid"))
                this.__DomainSid := PSID(this.ptr + 0)
            return this.__DomainSid
        }
    }

    /**
     * The name of the target computer.
     * @type {PWSTR}
     */
    ComputerName{
        get {
            if(!this.HasProp("__ComputerName"))
                this.__ComputerName := PWSTR(this.ptr + 8)
            return this.__ComputerName
        }
    }
}
