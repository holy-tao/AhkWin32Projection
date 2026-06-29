#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HTTP_FILTER_RAW_DATA {
    #StructPack 8

    pvInData : IntPtr

    cbInData : UInt32

    cbInBuffer : UInt32

    dwReserved : UInt32

}
