#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct DBCOLUMNACCESS {
    #StructPack 8

    pData : IntPtr

    columnid : DBID

    cbDataLen : IntPtr

    dwStatus : UInt32

    cbMaxLen : IntPtr

    dwReserved : IntPtr

    wType : UInt16

    bPrecision : Int8

    bScale : Int8

}
