#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MDEVICECAPSEX structure contains device capability information for Plug and Play (PnP) device drivers.
 * @see https://learn.microsoft.com/windows/win32/api/mmddk/ns-mmddk-mdevicecapsex
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct MDEVICECAPSEX {
    #StructPack 8

    /**
     * Specifies the size of the structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Specifies the capabilities of the device. The format of this data is device specific.
     */
    pCaps : IntPtr

}
