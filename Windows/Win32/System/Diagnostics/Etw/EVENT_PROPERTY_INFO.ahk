#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROPERTY_FLAGS.ahk" { PROPERTY_FLAGS }

/**
 * Provides information about a single property of the event or filter.
 * @remarks
 * Filters do not support maps, structures, or arrays.
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ns-tdh-event_property_info
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct EVENT_PROPERTY_INFO {
    #StructPack 4


    struct _nonStructType {
        InType : UInt16

        OutType : UInt16

        MapNameOffset : UInt32

    }

    struct _structType {
        StructStartIndex : UInt16

        NumOfStructMembers : UInt16

        padding : UInt32

    }

    struct _customSchemaType {
        InType : UInt16

        OutType : UInt16

        CustomSchemaOffset : UInt32

    }

    /**
     * Flags that indicate if the property is contained in a structure or array. For possible values, see the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ne-tdh-property_flags">PROPERTY_FLAGS</a> enumeration.
     */
    Flags : PROPERTY_FLAGS

    /**
     * Offset to a null-terminated Unicode string that contains the name of the property. If this an event property, the offset is from the beginning of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-trace_event_info">TRACE_EVENT_INFO</a> structure. If this is a filter property, the offset is from the beginning of the <a href="https://docs.microsoft.com/windows/desktop/api/tdh/ns-tdh-provider_filter_info">PROVIDER_FILTER_INFO</a> structure.
     */
    NameOffset : UInt32

    nonStructType : EVENT_PROPERTY_INFO._nonStructType

    count : UInt16

    length : UInt16

    Reserved : UInt32


    /**
     * @type {Integer}
     */
    Tags {
        get => (this._bitfield >> 0) & 0xFFFFFFF
        set => this._bitfield := ((value & 0xFFFFFFF) << 0) | (this._bitfield & ~(0xFFFFFFF << 0))
    }
    static __New() {
        DefineProp(this.Prototype, 'structType', { type: EVENT_PROPERTY_INFO._structType, offset: 8 })
        DefineProp(this.Prototype, 'customSchemaType', { type: EVENT_PROPERTY_INFO._customSchemaType, offset: 8 })
        DefineProp(this.Prototype, 'countPropertyIndex', { type: UInt16, offset: 16 })
        DefineProp(this.Prototype, 'lengthPropertyIndex', { type: UInt16, offset: 18 })
        DefineProp(this.Prototype, '_bitfield', { type: Int32, offset: 20 })
        this.DeleteProp("__New")
    }
}
