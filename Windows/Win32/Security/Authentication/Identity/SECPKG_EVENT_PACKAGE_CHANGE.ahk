#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\SECURITY_STRING.ahk

/**
 * The SECPKG_EVENT_PACKAGE_CHANGE structure contains information about changes in security package availability.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecpkg/ns-ntsecpkg-secpkg_event_package_change
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_EVENT_PACKAGE_CHANGE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    ChangeType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The identifier of the security package.
     * @type {Pointer}
     */
    PackageId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The name of the security package.
     * @type {SECURITY_STRING}
     */
    PackageName{
        get {
            if(!this.HasProp("__PackageName"))
                this.__PackageName := SECURITY_STRING(16, this)
            return this.__PackageName
        }
    }
}
