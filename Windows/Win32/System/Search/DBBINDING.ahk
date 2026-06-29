#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DBOBJECT.ahk" { DBOBJECT }
#Import ".\DBBINDEXT.ahk" { DBBINDEXT }
#Import "..\Com\ITypeInfo.ahk" { ITypeInfo }

/**
 * @namespace Windows.Win32.System.Search
 * @architecture X64, Arm64
 */
export default struct DBBINDING {
    #StructPack 8

    iOrdinal : IntPtr

    obValue : IntPtr

    obLength : IntPtr

    obStatus : IntPtr

    pTypeInfo : ITypeInfo

    pObject : DBOBJECT.Ptr

    pBindExt : DBBINDEXT.Ptr

    dwPart : UInt32

    dwMemOwner : UInt32

    eParamIO : UInt32

    cbMaxLen : IntPtr

    dwFlags : UInt32

    wType : UInt16

    bPrecision : Int8

    bScale : Int8

}
