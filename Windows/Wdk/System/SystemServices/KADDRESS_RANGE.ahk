#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KADDRESS_RANGE {
    #StructPack 8

    Address : IntPtr

    Size : IntPtr

}
