#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a buffer for the IDirect3DDXVADevice9::Execute method.
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ns-dxva9typ-dxvabufferinfo
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVABufferInfo {
    #StructPack 8

    /**
     * A pointer to the <b>IDirect3DSurface9</b> interface.
     */
    pCompSurface : IntPtr

    /**
     * The offset of the relevant data from the beginning of the buffer, in bytes.
     */
    DataOffset : UInt32

    /**
     * The size of the relevant data in the buffer, in bytes.
     */
    DataSize : UInt32

}
