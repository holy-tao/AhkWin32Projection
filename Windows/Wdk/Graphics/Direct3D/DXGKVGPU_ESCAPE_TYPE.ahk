#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGKVGPU_ESCAPE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGKVGPU_ESCAPE_TYPE_READ_PCI_CONFIG => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGKVGPU_ESCAPE_TYPE_WRITE_PCI_CONFIG => 1

    /**
     * @type {Integer (Int32)}
     */
    static DXGKVGPU_ESCAPE_TYPE_INITIALIZE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DXGKVGPU_ESCAPE_TYPE_RELEASE => 3

    /**
     * @type {Integer (Int32)}
     */
    static DXGKVGPU_ESCAPE_TYPE_GET_VGPU_TYPE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DXGKVGPU_ESCAPE_TYPE_POWERTRANSITIONCOMPLETE => 5

    /**
     * @type {Integer (Int32)}
     */
    static DXGKVGPU_ESCAPE_TYPE_PAUSE => 6

    /**
     * @type {Integer (Int32)}
     */
    static DXGKVGPU_ESCAPE_TYPE_RESUME => 7
}
