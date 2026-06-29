#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct tagIMMPID_GUIDLIST_ITEM {
    #StructPack 8

    pguid : Guid.Ptr

    dwStart : UInt32

    dwLast : UInt32

}
