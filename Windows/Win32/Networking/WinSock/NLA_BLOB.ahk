#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NLA_CONNECTIVITY_TYPE.ahk" { NLA_CONNECTIVITY_TYPE }
#Import ".\NLA_INTERNET.ahk" { NLA_INTERNET }
#Import ".\NLA_BLOB_DATA_TYPE.ahk" { NLA_BLOB_DATA_TYPE }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct NLA_BLOB {
    #StructPack 4


    struct _header {
        type : NLA_BLOB_DATA_TYPE

        dwSize : UInt32

        nextOffset : UInt32

    }

    struct _data {

        struct _interfaceData {
            dwType : UInt32

            dwSpeed : UInt32

            adapterName : CHAR[1]

        }

        struct _locationData {
            information : CHAR[1]

        }

        struct _connectivity {
            type : NLA_CONNECTIVITY_TYPE

            internet : NLA_INTERNET

        }

        struct _ICS {

            struct _remote {
                speed : UInt32

                type : UInt32

                state : UInt32

                machineName : WCHAR[256]

                sharedAdapterName : WCHAR[256]

            }

            remote : NLA_BLOB._data._ICS._remote

        }

        rawData : CHAR[1]

        static __New() {
            DefineProp(this.Prototype, 'interfaceData', { type: NLA_BLOB._data._interfaceData, offset: 0 })
            DefineProp(this.Prototype, 'locationData', { type: NLA_BLOB._data._locationData, offset: 0 })
            DefineProp(this.Prototype, 'connectivity', { type: NLA_BLOB._data._connectivity, offset: 0 })
            DefineProp(this.Prototype, 'ICS', { type: NLA_BLOB._data._ICS, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    header : NLA_BLOB._header

    data : NLA_BLOB._data

}
