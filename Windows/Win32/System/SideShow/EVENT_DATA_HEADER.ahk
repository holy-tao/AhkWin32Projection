#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.SideShow
 */
export default struct EVENT_DATA_HEADER {
    #StructPack 4

    cbEventDataHeader : UInt32

    guidEventType : Guid

    dwVersion : UInt32

    cbEventDataSid : UInt32

}
