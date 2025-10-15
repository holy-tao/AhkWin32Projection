#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_MANUFACTURING_SELF_TEST_QUERY_RESULTS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SelfTestType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    uTestID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {BOOLEAN}
     */
    bResult{
        get {
            if(!this.HasProp("__bResult"))
                this.__bResult := BOOLEAN(this.ptr + 8)
            return this.__bResult
        }
    }

    /**
     * @type {Integer}
     */
    uPinFailedBitMask {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Pointer<Void>}
     */
    pvContext {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    uBytesWrittenOut {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Byte>}
     */
    ucBufferOut{
        get {
            if(!this.HasProp("__ucBufferOutProxyArray"))
                this.__ucBufferOutProxyArray := Win32FixedArray(this.ptr + 28, 1, Primitive, "char")
            return this.__ucBufferOutProxyArray
        }
    }
}
