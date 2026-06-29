#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\VIDEO_WIN32K_CALLBACKS_PARAMS_TYPE.ahk" { VIDEO_WIN32K_CALLBACKS_PARAMS_TYPE }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_WIN32K_CALLBACKS_PARAMS {
    #StructPack 8

    CalloutType : VIDEO_WIN32K_CALLBACKS_PARAMS_TYPE

    PhysDisp : IntPtr

    Param : IntPtr

    Status : Int32

    LockUserSession : BOOLEAN

    IsPostDevice : BOOLEAN

    SurpriseRemoval : BOOLEAN

    WaitForQueueReady : BOOLEAN

}
