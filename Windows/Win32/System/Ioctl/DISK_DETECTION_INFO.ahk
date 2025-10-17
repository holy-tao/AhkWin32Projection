#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DISK_INT13_INFO.ahk
#Include .\DISK_EX_INT13_INFO.ahk

/**
 * Contains detected drive parameters.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-disk_detection_info
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DISK_DETECTION_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    SizeOfDetectInfo {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The detected partition type.
     * @type {Integer}
     */
    DetectionType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {DISK_INT13_INFO}
     */
    Int13{
        get {
            if(!this.HasProp("__Int13"))
                this.__Int13 := DISK_INT13_INFO(8, this)
            return this.__Int13
        }
    }

    /**
     * @type {DISK_EX_INT13_INFO}
     */
    ExInt13{
        get {
            if(!this.HasProp("__ExInt13"))
                this.__ExInt13 := DISK_EX_INT13_INFO(24, this)
            return this.__ExInt13
        }
    }
}
