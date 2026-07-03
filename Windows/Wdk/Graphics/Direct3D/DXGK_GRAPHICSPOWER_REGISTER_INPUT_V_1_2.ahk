#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGK_GRAPHICSPOWER_REGISTER_INPUT_V_1_2 {
    #StructPack 8

    Version : UInt32

    PrivateHandle : IntPtr

    PowerNotificationCb : IntPtr

    RemovalNotificationCb : IntPtr

    FStateNotificationCb : IntPtr

    InitialComponentStateCb : IntPtr

}
