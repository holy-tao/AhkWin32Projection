#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_WAITFORSYNCHRONIZATIONOBJECT2 extends Win32Struct
{
    static sizeof => 200

    static packingSize => 8

    /**
     * @type {Integer}
     */
    hContext {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ObjectCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<UInt32>}
     */
    ObjectHandleArray{
        get {
            if(!this.HasProp("__ObjectHandleArrayProxyArray"))
                this.__ObjectHandleArrayProxyArray := Win32FixedArray(this.ptr + 8, 32, Primitive, "uint")
            return this.__ObjectHandleArrayProxyArray
        }
    }

    class _Fence extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        FenceValue {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
    }

    /**
     * @type {_Fence}
     */
    Fence{
        get {
            if(!this.HasProp("__Fence"))
                this.__Fence := %this.__Class%._Fence(136, this)
            return this.__Fence
        }
    }

    /**
     * @type {Array<UInt64>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 136, 8, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
