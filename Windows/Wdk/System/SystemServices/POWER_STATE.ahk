#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\System\Power\SYSTEM_POWER_STATE.ahk" { SYSTEM_POWER_STATE }
#Import "..\..\..\Win32\System\Power\DEVICE_POWER_STATE.ahk" { DEVICE_POWER_STATE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct POWER_STATE {
    #StructPack 4

    SystemState : SYSTEM_POWER_STATE

    static __New() {
        DefineProp(this.Prototype, 'DeviceState', { type: DEVICE_POWER_STATE, offset: 0 })
        this.DeleteProp("__New")
    }
}
