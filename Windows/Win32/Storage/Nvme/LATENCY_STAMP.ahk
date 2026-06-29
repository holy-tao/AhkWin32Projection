#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct LATENCY_STAMP {
    #StructPack 8

    Trim3 : Int64

    Write3 : Int64

    Read3 : Int64

    Trim2 : Int64

    Write2 : Int64

    Read2 : Int64

    Trim1 : Int64

    Write1 : Int64

    Read1 : Int64

    Trim0 : Int64

    Write0 : Int64

    Read0 : Int64

}
