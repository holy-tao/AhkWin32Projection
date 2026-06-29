#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct AACS_READ_BINDING_NONCE {
    #StructPack 8

    SessionId : UInt32

    NumberOfSectors : UInt32

    StartLba : Int64

    Handle : HANDLE

    static __New() {
        DefineProp(this.Prototype, 'ForceStructureLengthToMatch64bit', { type: Int64, offset: 16 })
        this.DeleteProp("__New")
    }
}
