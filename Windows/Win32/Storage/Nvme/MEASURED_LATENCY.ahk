#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct MEASURED_LATENCY {
    #StructPack 2

    Trim3 : UInt16

    Write3 : UInt16

    Read3 : UInt16

    Trim2 : UInt16

    Write2 : UInt16

    Read2 : UInt16

    Trim1 : UInt16

    Write1 : UInt16

    Read1 : UInt16

    Trim0 : UInt16

    Write0 : UInt16

    Read0 : UInt16

}
