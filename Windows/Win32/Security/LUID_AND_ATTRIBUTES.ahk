#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TOKEN_PRIVILEGES_ATTRIBUTES.ahk" { TOKEN_PRIVILEGES_ATTRIBUTES }
#Import "..\Foundation\LUID.ahk" { LUID }

/**
 * Represents a locally unique identifier (LUID) and its attributes.
 * @remarks
 * An <b>LUID_AND_ATTRIBUTES</b> structure can represent an LUID whose attributes change frequently, such as when the LUID is used to represent privileges in the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-privilege_set">PRIVILEGE_SET</a> structure. Privileges are represented by LUIDs and have attributes indicating whether they are currently enabled or disabled.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-luid_and_attributes
 * @namespace Windows.Win32.Security
 */
export default struct LUID_AND_ATTRIBUTES {
    #StructPack 4

    /**
     * Specifies an <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-luid">LUID</a> value.
     */
    Luid : LUID

    /**
     * Specifies attributes of the LUID. This value contains up to 32 one-bit flags. Its meaning is dependent on the definition and use of the LUID.
     */
    Attributes : TOKEN_PRIVILEGES_ATTRIBUTES

}
