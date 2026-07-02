#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\System\Power\DEVICE_POWER_STATE.ahk" { DEVICE_POWER_STATE }
#Import ".\PDXGK_SET_SHARED_POWER_COMPONENT_STATE.ahk" { PDXGK_SET_SHARED_POWER_COMPONENT_STATE }
#Import ".\PDXGK_GRAPHICSPOWER_UNREGISTER.ahk" { PDXGK_GRAPHICSPOWER_UNREGISTER }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_GRAPHICSPOWER_REGISTER_OUTPUT {
    #StructPack 8

    DeviceHandle : IntPtr

    InitialGrfxPowerState : DEVICE_POWER_STATE

    SetSharedPowerComponentStateCb : PDXGK_SET_SHARED_POWER_COMPONENT_STATE

    UnregisterCb : PDXGK_GRAPHICSPOWER_UNREGISTER

}
