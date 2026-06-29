#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\UNICODE_STRING.ahk" { UNICODE_STRING }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SILO_MONITOR_REGISTRATION {
    #StructPack 8

    Version : Int8

    MonitorHost : BOOLEAN

    MonitorExistingSilos : BOOLEAN

    Reserved : Int8[5]

    DriverObjectName : UNICODE_STRING.Ptr

    CreateCallback : IntPtr

    TerminateCallback : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'ComponentName', { type: UNICODE_STRING.Ptr, offset: 8 })
        this.DeleteProp("__New")
    }
}
