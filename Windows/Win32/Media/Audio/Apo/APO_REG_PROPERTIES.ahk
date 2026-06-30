#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\APO_FLAG.ahk

/**
 * The APO_REG_PROPERTIES structure is used by IAudioProcessingObject::GetRegistrationProperties for returning the registration properties of an audio processing object (APO).
 * @see https://learn.microsoft.com/windows/win32/api/audioenginebaseapo/ns-audioenginebaseapo-apo_reg_properties
 * @namespace Windows.Win32.Media.Audio.Apo
 */
class APO_REG_PROPERTIES extends Win32Struct {
    static sizeof => 1088

    static packingSize => 8

    /**
     * The class ID for this APO.
     * @type {Guid}
     */
    clsid {
        get {
            if(!this.HasProp("__clsid"))
                this.__clsid := Guid(0, this)
            return this.__clsid
        }
    }

    /**
     * The flags for this APO. This parameter is an enumerated constant of type <a href="https://docs.microsoft.com/windows/desktop/api/audioenginebaseapo/ne-audioenginebaseapo-apo_flag">APO_FLAG</a>.
     * @type {APO_FLAG}
     */
    Flags {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * The friendly name of this APO. This is a string of characters with a max length of 256.
     * @type {String}
     */
    szFriendlyName {
        get => StrGet(this.ptr + 20, 255, "UTF-16")
        set => StrPut(value, this.ptr + 20, 255, "UTF-16")
    }

    /**
     * The copyright info for this APO. This is a string of characters with a max length of 256.
     * @type {String}
     */
    szCopyrightInfo {
        get => StrGet(this.ptr + 532, 255, "UTF-16")
        set => StrPut(value, this.ptr + 532, 255, "UTF-16")
    }

    /**
     * The major version number for this APO.
     * @type {Integer}
     */
    u32MajorVersion {
        get => NumGet(this, 1044, "uint")
        set => NumPut("uint", value, this, 1044)
    }

    /**
     * The minor version number for this APO.
     * @type {Integer}
     */
    u32MinorVersion {
        get => NumGet(this, 1048, "uint")
        set => NumPut("uint", value, this, 1048)
    }

    /**
     * The minimum number of input connections for this APO.
     * @type {Integer}
     */
    u32MinInputConnections {
        get => NumGet(this, 1052, "uint")
        set => NumPut("uint", value, this, 1052)
    }

    /**
     * The maximum number of input connections for this APO.
     * @type {Integer}
     */
    u32MaxInputConnections {
        get => NumGet(this, 1056, "uint")
        set => NumPut("uint", value, this, 1056)
    }

    /**
     * The minimum number of output connections for this APO.
     * @type {Integer}
     */
    u32MinOutputConnections {
        get => NumGet(this, 1060, "uint")
        set => NumPut("uint", value, this, 1060)
    }

    /**
     * The maximum number of output connections for this APO.
     * @type {Integer}
     */
    u32MaxOutputConnections {
        get => NumGet(this, 1064, "uint")
        set => NumPut("uint", value, this, 1064)
    }

    /**
     * The maximum number of instances of this APO.
     * @type {Integer}
     */
    u32MaxInstances {
        get => NumGet(this, 1068, "uint")
        set => NumPut("uint", value, this, 1068)
    }

    /**
     * The number of interfaces for this APO.
     * @type {Integer}
     */
    u32NumAPOInterfaces {
        get => NumGet(this, 1072, "uint")
        set => NumPut("uint", value, this, 1072)
    }

    /**
     * @type {Array<Pointer>}
     */
    iidAPOInterfaceList {
        get {
            if(!this.HasProp("__iidAPOInterfaceListProxyArray"))
                this.__iidAPOInterfaceListProxyArray := Win32FixedArray(this.ptr + 1080, 1, Primitive, "ptr")
            return this.__iidAPOInterfaceListProxyArray
        }
    }
}
