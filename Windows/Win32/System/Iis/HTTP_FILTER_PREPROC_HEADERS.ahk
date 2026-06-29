#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HTTP_FILTER_PREPROC_HEADERS {
    #StructPack 8

    GetHeader : IntPtr

    SetHeader : IntPtr

    AddHeader : IntPtr

    HttpStatus : UInt32

    dwReserved : UInt32

}
