#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Storage\IndexServer\DBID.ahk" { DBID }
#Import ".\DBPROPSET.ahk" { DBPROPSET }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\ITypeInfo.ahk" { ITypeInfo }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct DBCOLUMNDESC {
    #StructPack 8

    pwszTypeName : PWSTR

    pTypeInfo : ITypeInfo

    rgPropertySets : DBPROPSET.Ptr

    pclsid : Guid.Ptr

    cPropertySets : UInt32

    ulColumnSize : IntPtr

    dbcid : DBID

    wType : UInt16

    bPrecision : Int8

    bScale : Int8

}
