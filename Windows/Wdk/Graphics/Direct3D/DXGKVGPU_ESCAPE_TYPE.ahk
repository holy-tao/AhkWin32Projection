#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKVGPU_ESCAPE_TYPE extends Win32Enum {

    /**
     * Native name: DXGKVGPU_ESCAPE_TYPE_READ_PCI_CONFIG
     * @type {Integer (Int32)}
     */
    static READ_PCI_CONFIG => 0

    /**
     * Native name: DXGKVGPU_ESCAPE_TYPE_WRITE_PCI_CONFIG
     * @type {Integer (Int32)}
     */
    static WRITE_PCI_CONFIG => 1

    /**
     * Native name: DXGKVGPU_ESCAPE_TYPE_INITIALIZE
     * @type {Integer (Int32)}
     */
    static INITIALIZE => 2

    /**
     * Native name: DXGKVGPU_ESCAPE_TYPE_RELEASE
     * @type {Integer (Int32)}
     */
    static RELEASE => 3

    /**
     * Native name: DXGKVGPU_ESCAPE_TYPE_GET_VGPU_TYPE
     * @type {Integer (Int32)}
     */
    static GET_VGPU_TYPE => 4

    /**
     * Native name: DXGKVGPU_ESCAPE_TYPE_POWERTRANSITIONCOMPLETE
     * @type {Integer (Int32)}
     */
    static POWERTRANSITIONCOMPLETE => 5

    /**
     * Native name: DXGKVGPU_ESCAPE_TYPE_PAUSE
     * @type {Integer (Int32)}
     */
    static PAUSE => 6

    /**
     * Native name: DXGKVGPU_ESCAPE_TYPE_RESUME
     * @type {Integer (Int32)}
     */
    static RESUME => 7
}
