#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * PEERDIST_CONTENT_TAG structure contains a client supplied content tag as an input to the PeerDistClientOpenContent API.
 * @see https://learn.microsoft.com/windows/win32/api/peerdist/ns-peerdist-peerdist_content_tag
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEERDIST_CONTENT_TAG {
    #StructPack 1

    /**
     * A 16 byte tag associated with the open content.
     */
    Data : Int8[16]

}
