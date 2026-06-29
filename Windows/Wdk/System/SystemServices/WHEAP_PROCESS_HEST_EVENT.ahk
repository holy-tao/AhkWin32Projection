#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEAP_PROCESS_HEST_EVENT extends Win32Struct {
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    WheaEventLogEntry {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {String}
     */
    Error {
        get => StrGet(this.ptr + 8, 31, "UTF-8")
        set => StrPut(value, this.ptr + 8, 31, "UTF-8")
    }

    /**
     * @type {String}
     */
    EntryType {
        get => StrGet(this.ptr + 40, 31, "UTF-8")
        set => StrPut(value, this.ptr + 40, 31, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    EntryIndex {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {BOOLEAN}
     */
    HestValid {
        get => NumGet(this, 76, "char")
        set => NumPut("char", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    CmcCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    MceCount {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Integer}
     */
    NmiCount {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    AerRootCount {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    AerBridgeCount {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    AerEndPointCount {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    GenericV1Count {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    GenericV2Count {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }
}
