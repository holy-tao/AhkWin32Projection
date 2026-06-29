#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.SideShow
 */
export default struct CONTENT_MISSING_EVENT_DATA {
    #StructPack 4

    cbContentMissingEventData : UInt32

    ApplicationId : Guid

    EndpointId : Guid

    ContentId : UInt32

}
