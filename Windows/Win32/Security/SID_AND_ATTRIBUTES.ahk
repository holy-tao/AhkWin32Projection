#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Represents a security identifier (SID) and its attributes.
 * @remarks
 * A group is represented by a SID. SIDs have attributes that indicate whether they are currently enabled, disabled, or mandatory. SIDs also indicate how these attributes are used. A <b>SID_AND_ATTRIBUTES</b> structure can represent a SID whose attributes change frequently. For example, <b>SID_AND_ATTRIBUTES</b> is used to represent groups in the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-sid_and_attributes
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class SID_AND_ATTRIBUTES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure.
     * @type {Pointer<Ptr>}
     */
    Sid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies attributes of the SID. This value contains up to 32 one-bit flags. Its meaning depends on the definition and use of the SID.
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
