#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Nfp
 */
export default struct SUBSCRIBED_MESSAGE {
    #StructPack 4

    cbPayloadHint : UInt32

    payload : Int8[1]

}
