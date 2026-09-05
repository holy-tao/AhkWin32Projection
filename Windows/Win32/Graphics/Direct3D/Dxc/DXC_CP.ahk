#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Dxc
 */
class DXC_CP extends Win32Enum {

    /**
     * Native name: DXC_CP_ACP
     * @type {Integer (UInt32)}
     */
    static ACP => 0

    /**
     * Native name: DXC_CP_UTF16
     * @type {Integer (UInt32)}
     */
    static UTF16 => 1200

    /**
     * Native name: DXC_CP_UTF8
     * @type {Integer (UInt32)}
     */
    static UTF8 => 65001

    /**
     * Native name: DXC_CP_UTF32
     * @type {Integer (UInt32)}
     */
    static UTF32 => 12000

    /**
     * Native name: DXC_CP_WIDE
     * @type {Integer (UInt32)}
     */
    static WIDE => 1200
}
