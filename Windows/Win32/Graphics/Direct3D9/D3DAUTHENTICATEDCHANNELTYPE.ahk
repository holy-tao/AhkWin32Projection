#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of Direct3D authenticated channel.
 * @see https://learn.microsoft.com/windows/win32/medfound/d3dauthenticatedchanneltype
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DAUTHENTICATEDCHANNELTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static D3DAUTHENTICATEDCHANNEL_D3D9 => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DAUTHENTICATEDCHANNEL_DRIVER_SOFTWARE => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DAUTHENTICATEDCHANNEL_DRIVER_HARDWARE => 3
}
