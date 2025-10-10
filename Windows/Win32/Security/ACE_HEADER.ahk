#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Defines the type and size of an access control entry (ACE).
 * @remarks
 * 
  * The <b>ACE_HEADER</b> structure is the first member of the various types of ACE structures, such as <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-access_allowed_ace">ACCESS_ALLOWED_ACE</a>.
  * 
  * System-alarm ACEs are not currently supported. The <b>AceType</b> member cannot specify the SYSTEM_ALARM_ACE_TYPE or SYSTEM_ALARM_OBJECT_ACE_TYPE values. Do not use the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_alarm_ace">SYSTEM_ALARM_ACE</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_alarm_object_ace">SYSTEM_ALARM_OBJECT_ACE</a> structures.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ns-winnt-ace_header
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class ACE_HEADER extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * 
     * @type {Integer}
     */
    AceType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    AceFlags {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Specifies the size, in bytes, of the ACE.
     * @type {Integer}
     */
    AceSize {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
