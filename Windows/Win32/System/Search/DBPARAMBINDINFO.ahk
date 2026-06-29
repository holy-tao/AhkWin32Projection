#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct DBPARAMBINDINFO {
    #StructPack 8

    pwszDataSourceType : PWSTR

    pwszName : PWSTR

    ulParamSize : IntPtr

    dwFlags : UInt32

    bPrecision : Int8

    bScale : Int8

}
