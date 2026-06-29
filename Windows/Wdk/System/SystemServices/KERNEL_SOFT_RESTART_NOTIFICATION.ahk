#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KERNEL_SOFT_RESTART_NOTIFICATION {
    #StructPack 4

    Version : UInt16

    Size : UInt16

    Event : Guid

}
