#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains view or projection transforms for stereo rendering. One transform is for the left display, and the other is for the right display.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicstereotransform
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicStereoTransform extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * View or projection transform for the left display of a stereo device.
     * @type {Pointer<Matrix4x4>}
     */
    Left {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * View or projection transform for the right display of a stereo device.
     * @type {Pointer<Matrix4x4>}
     */
    Right {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
