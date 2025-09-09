#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RPCOLEMESSAGE (objidlbase.h) structure contains marshaling invocation arguments and return values between COM components.
 * @see https://learn.microsoft.com/windows/win32/api/objidlbase/ns-objidlbase-rpcolemessage
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class RPCOLEMESSAGE extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * This member is reserved.
     * @type {Pointer<Void>}
     */
    reserved1 {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The data representation with which the data was marshaled.
     * @type {Integer}
     */
    dataRepresentation {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A buffer for marshaled data.
     * @type {Pointer<Void>}
     */
    Buffer {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The size of the buffer, in bytes.
     * @type {Integer}
     */
    cbBuffer {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of the method to be invoked.
     * @type {Integer}
     */
    iMethod {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * This member is reserved.
     * @type {Array<Void>}
     */
    reserved2{
        get {
            if(!this.HasProp("__reserved2ProxyArray"))
                this.__reserved2ProxyArray := Win32FixedArray(this.ptr + 32, 5, Primitive, "ptr")
            return this.__reserved2ProxyArray
        }
    }

    /**
     * Status flags for the RPC connection.
     * @type {Integer}
     */
    rpcFlags {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }
}
