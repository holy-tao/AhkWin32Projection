#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PSID.ahk" { PSID }

/**
 * Represents a security identifier (SID) and its attributes.
 * @remarks
 * A group is represented by a SID. SIDs have attributes that indicate whether they are currently enabled, disabled, or mandatory. SIDs also indicate how these attributes are used. A <b>SID_AND_ATTRIBUTES</b> structure can represent a SID whose attributes change frequently. For example, <b>SID_AND_ATTRIBUTES</b> is used to represent groups in the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-token_groups">TOKEN_GROUPS</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-sid_and_attributes
 * @namespace Windows.Win32.Security
 */
export default struct SID_AND_ATTRIBUTES {
    #StructPack 8

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure.
     */
    Sid : PSID

    /**
     * Specifies attributes of the SID. This value contains up to 32 one-bit flags. Its meaning depends on the definition and use of the SID.
     */
    Attributes : UInt32

}
