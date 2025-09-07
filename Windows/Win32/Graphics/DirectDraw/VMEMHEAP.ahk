#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SURFACEALIGNMENT.ahk
#Include .\HEAPALIGNMENT.ahk
#Include .\DDSCAPSEX.ahk

/**
 * The VMEMHEAP structure contains information about the heap.
 * @see https://learn.microsoft.com/windows/win32/api/dmemmgr/ns-dmemmgr-vmemheap
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class VMEMHEAP extends Win32Struct
{
    static sizeof => 256

    static packingSize => 8

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Integer}
     */
    stride {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Pointer<Void>}
     */
    freeList {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Pointer<Void>}
     */
    allocList {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Points to the linear graphic address remapping table (GART) address of the start of the heap for nonlocal display memory.
     * @type {Pointer}
     */
    fpGARTLin {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Points to the physical GART address of the start of the heap for nonlocal display memory.
     * @type {Pointer}
     */
    fpGARTDev {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Integer}
     */
    dwCommitedSize {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Integer}
     */
    dwCoalesceCount {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {HEAPALIGNMENT}
     */
    Alignment{
        get {
            if(!this.HasProp("__Alignment"))
                this.__Alignment := HEAPALIGNMENT(this.ptr + 56)
            return this.__Alignment
        }
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {DDSCAPSEX}
     */
    ddsCapsEx{
        get {
            if(!this.HasProp("__ddsCapsEx"))
                this.__ddsCapsEx := DDSCAPSEX(this.ptr + 184)
            return this.__ddsCapsEx
        }
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {DDSCAPSEX}
     */
    ddsCapsExAlt{
        get {
            if(!this.HasProp("__ddsCapsExAlt"))
                this.__ddsCapsExAlt := DDSCAPSEX(this.ptr + 200)
            return this.__ddsCapsExAlt
        }
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Integer}
     */
    liPhysAGPBase {
        get => NumGet(this, 216, "int64")
        set => NumPut("int64", value, this, 216)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Pointer<Ptr>}
     */
    hdevAGP {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Pointer<Void>}
     */
    pvPhysRsrv {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Pointer<Byte>}
     */
    pAgpCommitMask {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * Reserved for system use and should be ignored by the driver.
     * @type {Integer}
     */
    dwAgpCommitMaskSize {
        get => NumGet(this, 248, "uint")
        set => NumPut("uint", value, this, 248)
    }
}
