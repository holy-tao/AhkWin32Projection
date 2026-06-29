#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct SpanningEventDescriptor {
    #StructPack 2

    wDataLen : UInt16

    wProgNumber : UInt16

    wSID : UInt16

    bDescriptor : Int8[1]

}
