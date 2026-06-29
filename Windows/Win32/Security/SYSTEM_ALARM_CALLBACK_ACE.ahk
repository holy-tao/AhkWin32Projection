#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ACE_HEADER.ahk" { ACE_HEADER }

/**
 * The SYSTEM_ALARM_CALLBACK_ACE structure is reserved for future use.
 * @remarks
 * ACE structures must be aligned on <b>DWORD</b> boundaries. All Windows memory-management functions return <b>DWORD</b>-aligned handles to memory.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_alarm_callback_ace
 * @namespace Windows.Win32.Security
 */
export default struct SYSTEM_ALARM_CALLBACK_ACE {
    #StructPack 4

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure that specifies the size and type of ACE. It also contains flags that control inheritance of the ACE by child objects. The <b>AceType</b> member of the <b>ACE_HEADER</b> structure should be set to SYSTEM_ALARM_CALLBACK_ACE_TYPE.
     */
    Header : ACE_HEADER

    /**
     * Specifies an 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-mask">ACCESS_MASK</a> structure that gives the access rights that cause audit messages to be generated. The SUCCESSFUL_ACCESS_ACE_FLAG and FAILED_ACCESS_ACE_FLAG flags in the <b>AceFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-ace_header">ACE_HEADER</a> structure indicate whether messages are generated for successful access attempts, unsuccessful access attempts, or both.
     */
    Mask : UInt32

    /**
     * The first <b>DWORD</b> of a trustee's ACE. This ACE can be appended with application data. When the <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/authzaccesscheckcallback">AuthzAccessCheckCallback</a> function is called, this ACE is passed as the <i>pAce</i> parameter of that function.
     */
    SidStart : UInt32

}
