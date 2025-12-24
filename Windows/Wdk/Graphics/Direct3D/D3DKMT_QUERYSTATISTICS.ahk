#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\LUID.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_QUERYSTATISTICS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {LUID}
     */
    AdapterLuid{
        get {
            if(!this.HasProp("__AdapterLuid"))
                this.__AdapterLuid := LUID(4, this)
            return this.__AdapterLuid
        }
    }

    /**
     * @type {HANDLE}
     */
    hProcess{
        get {
            if(!this.HasProp("__hProcess"))
                this.__hProcess := HANDLE(16, this)
            return this.__hProcess
        }
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_RESULT>}
     */
    QueryResult {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_QUERY_SEGMENT>}
     */
    QuerySegment {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_QUERY_SEGMENT>}
     */
    QueryProcessSegment {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    QueryProcessSegmentGroup {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_QUERY_NODE>}
     */
    QueryNode {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_QUERY_NODE>}
     */
    QueryProcessNode {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_QUERY_VIDPNSOURCE>}
     */
    QueryVidPnSource {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_QUERY_VIDPNSOURCE>}
     */
    QueryProcessVidPnSource {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_QUERY_PHYSICAL_ADAPTER>}
     */
    QueryPhysAdapter {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_QUERY_ADAPTER2>}
     */
    QueryAdapter2 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_QUERY_SEGMENT2>}
     */
    QuerySegment2 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_QUERY_ADAPTER2>}
     */
    QueryProcessAdapter2 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_QUERY_SEGMENT2>}
     */
    QueryProcessSegment2 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_QUERY_PROCESS_SEGMENT_GROUP2>}
     */
    QueryProcessSegmentGroup2 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_QUERY_SEGMENT_USAGE>}
     */
    QuerySegmentUsage {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_QUERY_SEGMENT_GROUP_USAGE>}
     */
    QuerySegmentGroupUsage {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_QUERY_NODE2>}
     */
    QueryNode2 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<D3DKMT_QUERYSTATISTICS_QUERY_NODE2>}
     */
    QueryProcessNode2 {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
