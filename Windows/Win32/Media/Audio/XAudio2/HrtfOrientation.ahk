#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Indicates the orientation of an HRTF directivity object.
 * @see https://docs.microsoft.com/windows/win32/api//hrtfapoapi/ns-hrtfapoapi-hrtforientation
 * @namespace Windows.Win32.Media.Audio.XAudio2
 * @version v4.0.30319
 */
class HrtfOrientation extends Win32Struct
{
    static sizeof => 36

    static packingSize => 4

    /**
     * The orientation. This is a row-major 3x3 rotation matrix.
     * @type {Array<Single>}
     */
    element{
        get {
            if(!this.HasProp("__elementProxyArray"))
                this.__elementProxyArray := Win32FixedArray(this.ptr + 0, 9, Primitive, "float")
            return this.__elementProxyArray
        }
    }
}
