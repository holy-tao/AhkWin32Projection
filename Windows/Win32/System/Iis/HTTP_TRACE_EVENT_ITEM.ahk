#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_TRACE_TYPE.ahk" { HTTP_TRACE_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HTTP_TRACE_EVENT_ITEM {
    #StructPack 8

    pszName : PWSTR

    dwDataType : HTTP_TRACE_TYPE

    pbData : IntPtr

    cbData : UInt32

    pszDataDescription : PWSTR

}
