#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how to handle the existing contents of a resource during a copy or update operation of a region within that resource.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/ne-d3d11_1-d3d11_copy_flags
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_COPY_FLAGS{

    /**
     * The existing contents of the resource cannot be overwritten.
     * @type {Integer (Int32)}
     */
    static D3D11_COPY_NO_OVERWRITE => 1

    /**
     * The existing contents of the resource are undefined and can be discarded.
     * @type {Integer (Int32)}
     */
    static D3D11_COPY_DISCARD => 2
}
