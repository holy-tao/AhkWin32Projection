#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SDP_LARGE_INTEGER_16.ahk" { SDP_LARGE_INTEGER_16 }
#Import ".\SDP_ULARGE_INTEGER_16.ahk" { SDP_ULARGE_INTEGER_16 }
#Import ".\SDP_TYPE.ahk" { SDP_TYPE }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SDP_SPECIFICTYPE.ahk" { SDP_SPECIFICTYPE }

/**
 * The SDP_ELEMENT_DATA structure stores SDP element data.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-sdp_element_data
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct SDP_ELEMENT_DATA {
    #StructPack 8


    struct _data {

        struct _string {
            value : IntPtr

            length : UInt32

        }

        struct _url {
            value : IntPtr

            length : UInt32

        }

        struct _sequence {
            value : IntPtr

            length : UInt32

        }

        struct _alternative {
            value : IntPtr

            length : UInt32

        }

        int128 : SDP_LARGE_INTEGER_16

        static __New() {
            DefineProp(this.Prototype, 'int64', { type: Int64, offset: 0 })
            DefineProp(this.Prototype, 'int32', { type: Int32, offset: 0 })
            DefineProp(this.Prototype, 'int16', { type: Int16, offset: 0 })
            DefineProp(this.Prototype, 'int8', { type: CHAR, offset: 0 })
            DefineProp(this.Prototype, 'uint128', { type: SDP_ULARGE_INTEGER_16, offset: 0 })
            DefineProp(this.Prototype, 'uint64', { type: Int64, offset: 0 })
            DefineProp(this.Prototype, 'uint32', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'uint16', { type: UInt16, offset: 0 })
            DefineProp(this.Prototype, 'uint8', { type: Int8, offset: 0 })
            DefineProp(this.Prototype, 'booleanVal', { type: Int8, offset: 0 })
            DefineProp(this.Prototype, 'uuid128', { type: Guid, offset: 0 })
            DefineProp(this.Prototype, 'uuid32', { type: UInt32, offset: 0 })
            DefineProp(this.Prototype, 'uuid16', { type: UInt16, offset: 0 })
            DefineProp(this.Prototype, 'string', { type: SDP_ELEMENT_DATA._data._string, offset: 0 })
            DefineProp(this.Prototype, 'url', { type: SDP_ELEMENT_DATA._data._url, offset: 0 })
            DefineProp(this.Prototype, 'sequence', { type: SDP_ELEMENT_DATA._data._sequence, offset: 0 })
            DefineProp(this.Prototype, 'alternative', { type: SDP_ELEMENT_DATA._data._alternative, offset: 0 })
            this.DeleteProp("__New")
        }
    }

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
     */
    type : SDP_TYPE

    /**
     * Specific type of SDP element, used to further specify generic element types.
     */
    specificType : SDP_SPECIFICTYPE

    data : SDP_ELEMENT_DATA._data

}
