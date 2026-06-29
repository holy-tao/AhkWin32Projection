#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\DVD_KEY_TYPE.ahk" { DVD_KEY_TYPE }

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_COPY_PROTECT_KEY {
    #StructPack 4


    struct _Parameters {
        FileHandle : HANDLE

        static __New() {
            DefineProp(this.Prototype, 'TitleOffset', { type: Int64, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    KeyLength : UInt32

    SessionId : UInt32

    KeyType : DVD_KEY_TYPE

    KeyFlags : UInt32

    Parameters : DVD_COPY_PROTECT_KEY._Parameters

    KeyData : Int8[1]

}
