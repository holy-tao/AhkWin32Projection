#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.SideShow
 */
export default struct APPLICATION_EVENT_DATA {
    #StructPack 4

    cbApplicationEventData : UInt32

    ApplicationId : Guid

    EndpointId : Guid

    dwEventId : UInt32

    cbEventData : UInt32

    bEventData : Int8[1]

}
