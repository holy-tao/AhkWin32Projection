#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Returns the security attribute information.
 * @see https://docs.microsoft.com/windows/win32/api//sspi/ns-sspi-secpkgcontext_subjectattributes
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_SubjectAttributes extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Pointer to a <b>void</b> that receives the attribute information stored in a <a href="https://docs.microsoft.com/windows/desktop/api/authz/ns-authz-authz_security_attributes_information">AUTHZ_SECURITY_ATTRIBUTES_INFORMATION</a> structure.
     * @type {Pointer<Void>}
     */
    AttributeInfo {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
