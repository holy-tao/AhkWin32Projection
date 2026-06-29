#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the type and size of an access control entry (ACE).
 * @remarks
 * The <b>ACE_HEADER</b> structure is the first member of the various types of ACE structures, such as <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-access_allowed_ace">ACCESS_ALLOWED_ACE</a>.
 * 
 * System-alarm ACEs are not currently supported. The <b>AceType</b> member cannot specify the SYSTEM_ALARM_ACE_TYPE or SYSTEM_ALARM_OBJECT_ACE_TYPE values. Do not use the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_alarm_ace">SYSTEM_ALARM_ACE</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-system_alarm_object_ace">SYSTEM_ALARM_OBJECT_ACE</a> structures.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-ace_header
 * @namespace Windows.Win32.Security
 */
export default struct ACE_HEADER {
    #StructPack 2

    AceType : Int8

    AceFlags : Int8

    /**
     * Specifies the size, in bytes, of the ACE.
     */
    AceSize : UInt16

}
