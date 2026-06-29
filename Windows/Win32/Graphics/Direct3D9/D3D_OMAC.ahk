#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a Message Authentication Code (MAC).
 * @see https://learn.microsoft.com/windows/win32/medfound/d3d-omac
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3D_OMAC {
    #StructPack 1

    /**
     * A byte array that contains the cryptographic MAC value of the message.
     */
    Omac : Int8[16]

}
