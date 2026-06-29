#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\ITypeInfo.ahk" { ITypeInfo }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct DBPARAMINFO {
    #StructPack 8

    dwFlags : UInt32

    iOrdinal : IntPtr

    pwszName : PWSTR

    pTypeInfo : ITypeInfo

    ulParamSize : IntPtr

    wType : UInt16

    bPrecision : Int8

    bScale : Int8

}
