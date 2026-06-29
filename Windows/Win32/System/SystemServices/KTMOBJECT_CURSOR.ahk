#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct KTMOBJECT_CURSOR {
    #StructPack 8

    LastQuery : Guid

    ObjectIdCount : UInt32

    ObjectIds : IntPtr[1]

}
