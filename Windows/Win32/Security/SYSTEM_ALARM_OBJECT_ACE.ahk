#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\..\..\Guid.ahk
#Include .\ACE_HEADER.ahk

/**
 * The SYSTEM_ALARM_OBJECT_ACE structure is reserved for future use.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-system_alarm_object_ace
 * @namespace Windows.Win32.Security
 */
class SYSTEM_ALARM_OBJECT_ACE extends Win32Struct {
    static sizeof => 48

    static packingSize => 4

    /**
     * @type {ACE_HEADER}
     */
    Header {
        get {
            if(!this.HasProp("__Header"))
                this.__Header := ACE_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    Mask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Guid}
     */
    ObjectType {
        get {
            if(!this.HasProp("__ObjectType"))
                this.__ObjectType := Guid(12, this)
            return this.__ObjectType
        }
    }

    /**
     * @type {Guid}
     */
    InheritedObjectType {
        get {
            if(!this.HasProp("__InheritedObjectType"))
                this.__InheritedObjectType := Guid(28, this)
            return this.__InheritedObjectType
        }
    }

    /**
     * @type {Integer}
     */
    SidStart {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
