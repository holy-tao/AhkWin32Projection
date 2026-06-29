#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct BDA_DEBUG_DATA {
    #StructPack 4

    lResult : Int32

    uuidDebugDataType : Guid

    ulDataSize : UInt32

    argbDebugData : Int8[1]

}
