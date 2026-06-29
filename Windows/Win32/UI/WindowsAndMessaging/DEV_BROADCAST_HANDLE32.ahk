#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct DEV_BROADCAST_HANDLE32 {
    #StructPack 4

    dbch_size : UInt32

    dbch_devicetype : UInt32

    dbch_reserved : UInt32

    dbch_handle : UInt32

    dbch_hdevnotify : UInt32

    dbch_eventguid : Guid

    dbch_nameoffset : Int32

    dbch_data : Int8[1]

}
