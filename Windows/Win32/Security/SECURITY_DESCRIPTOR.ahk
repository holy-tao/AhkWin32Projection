#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ACL.ahk" { ACL }
#Import ".\SECURITY_DESCRIPTOR_CONTROL.ahk" { SECURITY_DESCRIPTOR_CONTROL }
#Import ".\PSID.ahk" { PSID }

/**
 * Contains the security information associated with an object.
 * @remarks
 * A security descriptor includes information that specifies the following components of an object's security:
 * 
 * <ul>
 * <li>An owner <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security identifier</a> (SID)</li>
 * <li>A primary group SID</li>
 * <li>A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">discretionary access control list</a> (DACL)</li>
 * <li>A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">system access control list</a> (SACL)</li>
 * <li>Qualifiers for the preceding items</li>
 * </ul>
 * Several functions that use the <b>SECURITY_DESCRIPTOR</b> structure require that this structure be aligned on a valid pointer boundary in memory. These boundaries vary depending on the type of processor used. Memory allocation functions such as <b>malloc</b> and <b>LocalAlloc</b> return properly aligned pointers.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-security_descriptor
 * @namespace Windows.Win32.Security
 */
export default struct SECURITY_DESCRIPTOR {
    #StructPack 8

    Revision : Int8

    Sbz1 : Int8

    Control : SECURITY_DESCRIPTOR_CONTROL

    Owner : PSID

    Group : PSID

    Sacl : ACL.Ptr

    Dacl : ACL.Ptr

}
