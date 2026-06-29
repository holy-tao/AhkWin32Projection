#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct BDANODE_DESCRIPTOR {
    #StructPack 4

    ulBdaNodeType : UInt32

    guidFunction : Guid

    guidName : Guid

}
