#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ECustomDumpItemKind.ahk" { ECustomDumpItemKind }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct CustomDumpItem {
    #StructPack 8

    itemKind : ECustomDumpItemKind

    pReserved : IntPtr

}
