#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information related to an ongoing MDNS query. Your application must not modify its contents.
 * @remarks
 * This structure is for internal use only.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-mdns_query_handle
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class MDNS_QUERY_HANDLE extends Win32Struct
{
    static sizeof => 544

    static packingSize => 8

    /**
     * A value representing the queried name.
     * @type {String}
     */
    nameBuf {
        get => StrGet(this.ptr + 0, 255, "UTF-16")
        set => StrPut(value, this.ptr + 0, 255, "UTF-16")
    }

    /**
     * A value representing the type of the query.
     * @type {Integer}
     */
    wType {
        get => NumGet(this, 512, "ushort")
        set => NumPut("ushort", value, this, 512)
    }

    /**
     * Reserved. Do not use.
     * @type {Pointer<Void>}
     */
    pSubscription {
        get => NumGet(this, 520, "ptr")
        set => NumPut("ptr", value, this, 520)
    }

    /**
     * Reserved. Do not use.
     * @type {Pointer<Void>}
     */
    pWnfCallbackParams {
        get => NumGet(this, 528, "ptr")
        set => NumPut("ptr", value, this, 528)
    }

    /**
     * Reserved. Do not use.
     * @type {Array<UInt32>}
     */
    stateNameData{
        get {
            if(!this.HasProp("__stateNameDataProxyArray"))
                this.__stateNameDataProxyArray := Win32FixedArray(this.ptr + 536, 2, Primitive, "uint")
            return this.__stateNameDataProxyArray
        }
    }
}
