#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CANDIDATELIST structure (immdev.h) contains information about a candidate list.
 * @remarks
 * The candidate strings immediately follow the last offset in the <b>dwOffset</b> array.
 * @see https://learn.microsoft.com/windows/win32/api/immdev/ns-immdev-candidatelist
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct CANDIDATELIST {
    #StructPack 4

    /**
     * Size, in bytes, of the structure, the offset array, and all candidate strings.
     */
    dwSize : UInt32

    dwStyle : UInt32

    /**
     * Number of candidate strings.
     */
    dwCount : UInt32

    /**
     * Index of the selected candidate string.
     */
    dwSelection : UInt32

    /**
     * Index of the first candidate string in the candidate window. This varies as the user presses the PAGE UP and PAGE DOWN keys.
     */
    dwPageStart : UInt32

    /**
     * Number of candidate strings to be shown in one page in the candidate window. The user can move to the next page by pressing IME-defined keys, such as the PAGE UP or PAGE DOWN key. If this number is 0, an application can define a proper value by itself.
     */
    dwPageSize : UInt32

    /**
     * Offset to the start of the first candidate string, relative to the start of this structure. The offsets for subsequent strings immediately follow this member, forming an array of 32-bit offsets.
     */
    dwOffset : UInt32[1]

}
