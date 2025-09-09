#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Contains biometric values that the Windows Biometric Framework used to determine that an individual was present.
 * @see https://learn.microsoft.com/windows/win32/SecBioMet/winbio-presence-properties
 * @namespace Windows.Win32.Devices.BiometricFramework
 * @version v4.0.30319
 */
class WINBIO_PRESENCE_PROPERTIES extends Win32Struct
{
    static sizeof => 400

    static packingSize => 8

    /**
     * @type {RECT}
     */
    BoundingBox{
        get {
            if(!this.HasProp("__BoundingBox"))
                this.__BoundingBox := RECT(this.ptr + 0)
            return this.__BoundingBox
        }
    }

    /**
     * @type {Integer}
     */
    Distance {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Pointer<Guid>}
     */
    AdapterId {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Array<UInt32>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 32, 78, Primitive, "uint")
            return this.__DataProxyArray
        }
    }

    /**
     * @type {RECT}
     */
    EyeBoundingBox_1{
        get {
            if(!this.HasProp("__EyeBoundingBox_1"))
                this.__EyeBoundingBox_1 := RECT(this.ptr + 0)
            return this.__EyeBoundingBox_1
        }
    }

    /**
     * @type {RECT}
     */
    EyeBoundingBox_2{
        get {
            if(!this.HasProp("__EyeBoundingBox_2"))
                this.__EyeBoundingBox_2 := RECT(this.ptr + 16)
            return this.__EyeBoundingBox_2
        }
    }

    /**
     * @type {POINT}
     */
    PupilCenter_1{
        get {
            if(!this.HasProp("__PupilCenter_1"))
                this.__PupilCenter_1 := POINT(this.ptr + 32)
            return this.__PupilCenter_1
        }
    }

    /**
     * @type {POINT}
     */
    PupilCenter_2{
        get {
            if(!this.HasProp("__PupilCenter_2"))
                this.__PupilCenter_2 := POINT(this.ptr + 40)
            return this.__PupilCenter_2
        }
    }

    /**
     * @type {Integer}
     */
    Distance1 {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }
}
