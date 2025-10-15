#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_AUTO_BREADCRUMB_NODE1 extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Pointer<Byte>}
     */
    pCommandListDebugNameA {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pCommandListDebugNameW{
        get {
            if(!this.HasProp("__pCommandListDebugNameW"))
                this.__pCommandListDebugNameW := PWSTR(this.ptr + 8)
            return this.__pCommandListDebugNameW
        }
    }

    /**
     * @type {Pointer<Byte>}
     */
    pCommandQueueDebugNameA {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    pCommandQueueDebugNameW{
        get {
            if(!this.HasProp("__pCommandQueueDebugNameW"))
                this.__pCommandQueueDebugNameW := PWSTR(this.ptr + 24)
            return this.__pCommandQueueDebugNameW
        }
    }

    /**
     * @type {Pointer<ID3D12GraphicsCommandList>}
     */
    pCommandList {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<ID3D12CommandQueue>}
     */
    pCommandQueue {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    BreadcrumbCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    pLastBreadcrumbValue {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<Int32>}
     */
    pCommandHistory {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer<D3D12_AUTO_BREADCRUMB_NODE1>}
     */
    pNext {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    BreadcrumbContextsCount {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Pointer<D3D12_DRED_BREADCRUMB_CONTEXT>}
     */
    pBreadcrumbContexts {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }
}
