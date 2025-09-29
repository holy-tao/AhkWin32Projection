#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Provides information about a single property of the event or filter.
 * @remarks
 * Filters do not support maps, structures, or arrays.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-event_property_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class EVENT_PROPERTY_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Flags that indicate if the property is contained in a structure or array. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ne-tdh-property_flags">PROPERTY_FLAGS</a> enumeration.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Offset to a null-terminated Unicode string that contains the name of the property. If this an event property, the offset is from the beginning of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-trace_event_info">TRACE_EVENT_INFO</a> structure. If this is a filter property, the offset is from the beginning of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-provider_filter_info">PROVIDER_FILTER_INFO</a> structure.
     * @type {Integer}
     */
    NameOffset {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    class _nonStructType extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        InType {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        OutType {
            get => NumGet(this, 2, "ushort")
            set => NumPut("ushort", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        MapNameOffset {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    class _structType extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        StructStartIndex {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        NumOfStructMembers {
            get => NumGet(this, 2, "ushort")
            set => NumPut("ushort", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        padding {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    class _customSchemaType extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Integer}
         */
        InType {
            get => NumGet(this, 0, "ushort")
            set => NumPut("ushort", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        OutType {
            get => NumGet(this, 2, "ushort")
            set => NumPut("ushort", value, this, 2)
        }
    
        /**
         * @type {Integer}
         */
        CustomSchemaOffset {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
    }

    /**
     * @type {_nonStructType}
     */
    nonStructType{
        get {
            if(!this.HasProp("__nonStructType"))
                this.__nonStructType := %this.__Class%._nonStructType(this.ptr + 8)
            return this.__nonStructType
        }
    }

    /**
     * @type {_structType}
     */
    structType{
        get {
            if(!this.HasProp("__structType"))
                this.__structType := %this.__Class%._structType(this.ptr + 8)
            return this.__structType
        }
    }

    /**
     * @type {_customSchemaType}
     */
    customSchemaType{
        get {
            if(!this.HasProp("__customSchemaType"))
                this.__customSchemaType := %this.__Class%._customSchemaType(this.ptr + 8)
            return this.__customSchemaType
        }
    }

    /**
     * @type {Integer}
     */
    count {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    countPropertyIndex {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    length {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    lengthPropertyIndex {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Anonymous {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
