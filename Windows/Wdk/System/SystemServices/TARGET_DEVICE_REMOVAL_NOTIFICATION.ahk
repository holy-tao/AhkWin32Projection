#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILE_OBJECT.ahk" { FILE_OBJECT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct TARGET_DEVICE_REMOVAL_NOTIFICATION {
    #StructPack 8

    Version : UInt16

    Size : UInt16

    Event : Guid

    FileObject : FILE_OBJECT.Ptr

}
