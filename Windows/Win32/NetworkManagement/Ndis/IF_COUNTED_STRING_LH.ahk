#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The IF_COUNTED_STRING structure specifies a counted string for NDIS interfaces.
 * @remarks
 * The <b>IF_COUNTED_STRING</b> structure is the data type for various NDIS string structures, such as <b>NDIS_IF_COUNTED_STRING</b>.
 * 
 * If the string is NULL-terminated, the <b>Length</b> member must not include the terminating NULL character.
 * @see https://learn.microsoft.com/windows/win32/api/ifdef/ns-ifdef-if_counted_string_lh
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct IF_COUNTED_STRING_LH {
    #StructPack 2

    /**
     * A USHORT value that contains the length, in bytes, of the string.
     */
    Length : UInt16

    /**
     * A WCHAR buffer that contains the string. The string does not need to be null-terminated.
     */
    String : WCHAR[257]

}
