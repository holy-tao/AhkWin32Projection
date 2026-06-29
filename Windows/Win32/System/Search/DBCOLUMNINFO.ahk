#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\ITypeInfo.ahk" { ITypeInfo }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct DBCOLUMNINFO {
    #StructPack 8

    pwszName : PWSTR

    pTypeInfo : ITypeInfo

    iOrdinal : IntPtr

    dwFlags : UInt32

    ulColumnSize : IntPtr

    wType : UInt16

    bPrecision : Int8

    bScale : Int8

    columnid : DBID

}
