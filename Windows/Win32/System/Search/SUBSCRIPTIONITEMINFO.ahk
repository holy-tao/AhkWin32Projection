#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct SUBSCRIPTIONITEMINFO {
    #StructPack 4

    cbSize : UInt32 := this.Size

    dwFlags : UInt32

    dwPriority : UInt32

    ScheduleGroup : Guid

    clsidAgent : Guid

}
