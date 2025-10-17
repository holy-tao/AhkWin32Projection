#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SDP_LARGE_INTEGER_16.ahk
#Include .\SDP_ULARGE_INTEGER_16.ahk

/**
 * The SDP_ELEMENT_DATA structure stores SDP element data.
 * @see https://docs.microsoft.com/windows/win32/api//bluetoothapis/ns-bluetoothapis-sdp_element_data
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class SDP_ELEMENT_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Enumeration of SDP element types.  Generic element types have a
     *     <b>specificType</b> value different from SDP_ST_NONE.  The generic SDP element types are the following:
     * 
     * 
     * <ul>
     * <li>SDP_TYPE_UINT</li>
     * <li>SDP_TYPE_INT</li>
     * <li>SDP_TYPE_UUID</li>
     * </ul>
     * 
     * 
     * 
     * The following element types do not have corresponding <b>specificType</b> values:
     * 
     * <ul>
     * <li>SDP_TYPE_STRING</li>
     * <li>SDP_TYPE_URL</li>
     * <li>SDP_TYPE_SEQUENCE</li>
     * <li>SDP_TYPE_ALTERNATIVE</li>
     * <li>SDP_TYPE_BOOLEAN</li>
     * <li>SDP_TYPE_NIL</li>
     * </ul>
     * 
     * 
     * There is no associated data value with the type SDP_TYPE_NIL.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Specific type of SDP element, used to further specify generic element types.
     * @type {Integer}
     */
    specificType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    class _string extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Pointer<Byte>}
         */
        value {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        length {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    class _url extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Pointer<Byte>}
         */
        value {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        length {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    class _sequence extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Pointer<Byte>}
         */
        value {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        length {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    class _alternative extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Pointer<Byte>}
         */
        value {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        length {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    /**
     * @type {SDP_LARGE_INTEGER_16}
     */
    int128{
        get {
            if(!this.HasProp("__int128"))
                this.__int128 := SDP_LARGE_INTEGER_16(8, this)
            return this.__int128
        }
    }

    /**
     * @type {Integer}
     */
    int64 {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    int32 {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    int16 {
        get => NumGet(this, 8, "short")
        set => NumPut("short", value, this, 8)
    }

    /**
     * @type {CHAR}
     */
    int8 {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {SDP_ULARGE_INTEGER_16}
     */
    uint128{
        get {
            if(!this.HasProp("__uint128"))
                this.__uint128 := SDP_ULARGE_INTEGER_16(8, this)
            return this.__uint128
        }
    }

    /**
     * @type {Integer}
     */
    uint64 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    uint32 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    uint16 {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    uint8 {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    booleanVal {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    uuid128 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    uuid32 {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    uuid16 {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {_string}
     */
    string{
        get {
            if(!this.HasProp("__string"))
                this.__string := %this.__Class%._string(8, this)
            return this.__string
        }
    }

    /**
     * @type {_url}
     */
    url{
        get {
            if(!this.HasProp("__url"))
                this.__url := %this.__Class%._url(8, this)
            return this.__url
        }
    }

    /**
     * @type {_sequence}
     */
    sequence{
        get {
            if(!this.HasProp("__sequence"))
                this.__sequence := %this.__Class%._sequence(8, this)
            return this.__sequence
        }
    }

    /**
     * @type {_alternative}
     */
    alternative{
        get {
            if(!this.HasProp("__alternative"))
                this.__alternative := %this.__Class%._alternative(8, this)
            return this.__alternative
        }
    }
}
