#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 */
export default struct alljoyn_certificateid {
    #StructPack 8

    serial : IntPtr

    serialLen : IntPtr

    issuerPublicKey : IntPtr

    issuerAki : IntPtr

    issuerAkiLen : IntPtr

}
