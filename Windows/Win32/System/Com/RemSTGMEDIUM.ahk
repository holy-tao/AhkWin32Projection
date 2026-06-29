#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct RemSTGMEDIUM {
    #StructPack 4

    tymed : UInt32

    dwHandleType : UInt32

    pData : UInt32

    pUnkForRelease : UInt32

    cbData : UInt32

    data : Int8[1]

}
