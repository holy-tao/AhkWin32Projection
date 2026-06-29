#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct TCG_AUTH_METHOD_SPECIFIC {
    #StructPack 8

    AuthorityId : Int64

    TriesCount : Int8

}
