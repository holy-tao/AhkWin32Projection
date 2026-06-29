#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DRT_DATA.ahk" { DRT_DATA }
#Import ".\DRT_REGISTRATION.ahk" { DRT_REGISTRATION }
#Import ".\DRT_MATCH_TYPE.ahk" { DRT_MATCH_TYPE }

/**
 * DRT_SEARCH_RESULT.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ns-drt-drt_search_result
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct DRT_SEARCH_RESULT {
    #StructPack 8

    /**
     * The size of the <b>DRT_SEARCH_RESULT</b> structure.
     */
    dwSize : UInt32

    /**
     * Specifies  the exactness of the search. This member corresponds to the <a href="https://docs.microsoft.com/windows/desktop/api/drt/ne-drt-drt_match_type">DRT_MATCH_TYPE</a> enumeration.
     */
    type : DRT_MATCH_TYPE

    /**
     * Pointer to the context data passed to the <a href="https://docs.microsoft.com/windows/desktop/api/drt/nf-drt-drtstartsearch">DrtStartSearch</a> API.
     */
    pvContext : IntPtr

    /**
     * Contains the registration result.
     */
    registration : DRT_REGISTRATION

}
