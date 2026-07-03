#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PDXGK_FSTATE_NOTIFICATION.ahk" { PDXGK_FSTATE_NOTIFICATION }
#Import ".\PDXGK_INITIAL_COMPONENT_STATE.ahk" { PDXGK_INITIAL_COMPONENT_STATE }
#Import ".\PDXGK_POWER_NOTIFICATION.ahk" { PDXGK_POWER_NOTIFICATION }
#Import ".\PDXGK_REMOVAL_NOTIFICATION.ahk" { PDXGK_REMOVAL_NOTIFICATION }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_GRAPHICSPOWER_REGISTER_INPUT_V_1_2 {
    #StructPack 8

    Version : UInt32

    PrivateHandle : IntPtr

    PowerNotificationCb : PDXGK_POWER_NOTIFICATION

    RemovalNotificationCb : PDXGK_REMOVAL_NOTIFICATION

    FStateNotificationCb : PDXGK_FSTATE_NOTIFICATION

    InitialComponentStateCb : PDXGK_INITIAL_COMPONENT_STATE

}
