#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct BUCKET_COUNTER {
    #StructPack 4

    Reserved : UInt32

    Trim : UInt32

    Write : UInt32

    Read : UInt32

}
