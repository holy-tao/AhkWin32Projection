#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct RFX_GFX_MSG_HEADER {
    #StructPack 2

    uMSGType : UInt16

    cbSize : UInt16 := this.Size

}
