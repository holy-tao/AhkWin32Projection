#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The SdpQueryUuidUnion union contains the UUID on which to perform an SDP query. Used in conjunction with the SdpQueryUuid structure.
 * @see https://learn.microsoft.com/windows/win32/api/bthsdpdef/ns-bthsdpdef-sdpqueryuuidunion
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct SdpQueryUuidUnion {
    #StructPack 4

    /**
     * UUID in 128-bit format.
     */
    uuid128 : Guid

    static __New() {
        DefineProp(this.Prototype, 'uuid32', { type: UInt32, offset: 0 })
        DefineProp(this.Prototype, 'uuid16', { type: UInt16, offset: 0 })
        this.DeleteProp("__New")
    }
}
