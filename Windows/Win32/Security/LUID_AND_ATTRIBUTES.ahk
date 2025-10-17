#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\Foundation\LUID.ahk

/**
 * Represents a locally unique identifier (LUID) and its attributes.
 * @remarks
 * 
  * An <b>LUID_AND_ATTRIBUTES</b> structure can represent an LUID whose attributes change frequently, such as when the LUID is used to represent privileges in the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-privilege_set">PRIVILEGE_SET</a> structure. Privileges are represented by LUIDs and have attributes indicating whether they are currently enabled or disabled.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-luid_and_attributes
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class LUID_AND_ATTRIBUTES extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> value.
     * @type {LUID}
     */
    Luid{
        get {
            if(!this.HasProp("__Luid"))
                this.__Luid := LUID(0, this)
            return this.__Luid
        }
    }

    /**
     * Specifies attributes of the LUID. This value contains up to 32 one-bit flags. Its meaning is dependent on the definition and use of the LUID.
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
