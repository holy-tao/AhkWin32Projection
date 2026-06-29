#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The PEER_RETRIEVAL_OPTIONS structure contains version of the content information to retrieve.
 * @see https://learn.microsoft.com/windows/win32/api/peerdist/ns-peerdist-peerdist_retrieval_options
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct PEERDIST_RETRIEVAL_OPTIONS {
    #StructPack 4

    /**
     * Specifies the size of the input structure.
     */
    cbSize : UInt32 := this.Size

    dwContentInfoMinVersion : UInt32

    dwContentInfoMaxVersion : UInt32

    /**
     * Reserved. The <b>dwReserved</b> member should be set to 0.
     */
    dwReserved : UInt32

}
