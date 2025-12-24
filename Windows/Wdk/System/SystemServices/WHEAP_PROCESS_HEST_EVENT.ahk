#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEAP_PROCESS_HEST_EVENT extends Win32Struct
{
    static sizeof => 176

    static packingSize => 8

    /**
     * @type {Pointer<WHEA_EVENT_LOG_ENTRY>}
     */
    WheaEventLogEntry {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {String}
     */
    Error {
        get => StrGet(this.ptr + 8, 31, "UTF-16")
        set => StrPut(value, this.ptr + 8, 31, "UTF-16")
    }

    /**
     * @type {String}
     */
    EntryType {
        get => StrGet(this.ptr + 72, 31, "UTF-16")
        set => StrPut(value, this.ptr + 72, 31, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    EntryIndex {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {BOOLEAN}
     */
    HestValid {
        get => NumGet(this, 140, "char")
        set => NumPut("char", value, this, 140)
    }

    /**
     * @type {Integer}
     */
    CmcCount {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    MceCount {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * @type {Integer}
     */
    NmiCount {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    AerRootCount {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * @type {Integer}
     */
    AerBridgeCount {
        get => NumGet(this, 160, "uint")
        set => NumPut("uint", value, this, 160)
    }

    /**
     * @type {Integer}
     */
    AerEndPointCount {
        get => NumGet(this, 164, "uint")
        set => NumPut("uint", value, this, 164)
    }

    /**
     * @type {Integer}
     */
    GenericV1Count {
        get => NumGet(this, 168, "uint")
        set => NumPut("uint", value, this, 168)
    }

    /**
     * @type {Integer}
     */
    GenericV2Count {
        get => NumGet(this, 172, "uint")
        set => NumPut("uint", value, this, 172)
    }
}
