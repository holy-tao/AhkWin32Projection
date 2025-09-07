#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The APO_REG_PROPERTIES structure is used by IAudioProcessingObject::GetRegistrationProperties for returning the registration properties of an audio processing object (APO).
 * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/ns-audioenginebaseapo-apo_reg_properties
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class APO_REG_PROPERTIES extends Win32Struct
{
    static sizeof => 1080

    static packingSize => 8

    /**
     * The class ID for this APO.
     * @type {Pointer<Guid>}
     */
    clsid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The flags for this APO. This parameter is an enumerated constant of type <a href="https://docs.microsoft.com/windows/desktop/api/audioenginebaseapo/ne-audioenginebaseapo-apo_flag">APO_FLAG</a>.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The friendly name of this APO. This is a string of characters with a max length of 256.
     * @type {String}
     */
    szFriendlyName {
        get => StrGet(this.ptr + 12, 255, "UTF-16")
        set => StrPut(value, this.ptr + 12, 255, "UTF-16")
    }

    /**
     * The copyright info for this APO. This is a string of characters with a max length of 256.
     * @type {String}
     */
    szCopyrightInfo {
        get => StrGet(this.ptr + 524, 255, "UTF-16")
        set => StrPut(value, this.ptr + 524, 255, "UTF-16")
    }

    /**
     * The major version number for this APO.
     * @type {Integer}
     */
    u32MajorVersion {
        get => NumGet(this, 1036, "uint")
        set => NumPut("uint", value, this, 1036)
    }

    /**
     * The minor version number for this APO.
     * @type {Integer}
     */
    u32MinorVersion {
        get => NumGet(this, 1040, "uint")
        set => NumPut("uint", value, this, 1040)
    }

    /**
     * The minimum number of input connections for this APO.
     * @type {Integer}
     */
    u32MinInputConnections {
        get => NumGet(this, 1044, "uint")
        set => NumPut("uint", value, this, 1044)
    }

    /**
     * The maximum number of input connections for this APO.
     * @type {Integer}
     */
    u32MaxInputConnections {
        get => NumGet(this, 1048, "uint")
        set => NumPut("uint", value, this, 1048)
    }

    /**
     * The minimum number of output connections for this APO.
     * @type {Integer}
     */
    u32MinOutputConnections {
        get => NumGet(this, 1052, "uint")
        set => NumPut("uint", value, this, 1052)
    }

    /**
     * The maximum number of output connections for this APO.
     * @type {Integer}
     */
    u32MaxOutputConnections {
        get => NumGet(this, 1056, "uint")
        set => NumPut("uint", value, this, 1056)
    }

    /**
     * The maximum number of instances of this APO.
     * @type {Integer}
     */
    u32MaxInstances {
        get => NumGet(this, 1060, "uint")
        set => NumPut("uint", value, this, 1060)
    }

    /**
     * The number of interfaces for this APO.
     * @type {Integer}
     */
    u32NumAPOInterfaces {
        get => NumGet(this, 1064, "uint")
        set => NumPut("uint", value, this, 1064)
    }

    /**
     * 
     * @type {Array<Guid>}
     */
    iidAPOInterfaceList{
        get {
            if(!this.HasProp("__iidAPOInterfaceListProxyArray"))
                this.__iidAPOInterfaceListProxyArray := Win32FixedArray(this.ptr + 1072, 8, Primitive, "ptr")
            return this.__iidAPOInterfaceListProxyArray
        }
    }
}
