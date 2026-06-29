#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SID_AND_ATTRIBUTES.ahk" { SID_AND_ATTRIBUTES }

/**
 * Specifies a hash values for the specified array of security identifiers (SIDs).
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-sid_and_attributes_hash
 * @namespace Windows.Win32.Security
 */
export default struct SID_AND_ATTRIBUTES_HASH {
    #StructPack 8

    /**
     * The number of SIDs pointed to by the <i>SidAttr</i> parameter.
     */
    SidCount : UInt32

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structures that represent SIDs and their attributes.
     */
    SidAttr : SID_AND_ATTRIBUTES.Ptr

    /**
     * An array of pointers to hash values. These values correspond to the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid_and_attributes">SID_AND_ATTRIBUTES</a> structures pointed to by the <i>SidAttr</i> parameter.
     * 
     * The <b>SID_HASH_ENTRY</b> data type is defined in Winnt.h as a <b>ULONG_PTR</b>.
     * 
     * The <b>SID_HASH_SIZE</b> array dimension is defined in Winnt.h as 32.
     */
    Hash : IntPtr[32]

}
