#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct BDA_EVENT_DATA {
    #StructPack 4

    lResult : Int32

    ulEventID : UInt32

    uuidEventType : Guid

    ulEventDataLength : UInt32

    argbEventData : Int8[1]

}
