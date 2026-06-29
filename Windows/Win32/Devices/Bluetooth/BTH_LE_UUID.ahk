#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The BTH_LE_UUID structure contains information about a Bluetooth Low Energy (LE) Universally Unique Identifier (UUID).
 * @see https://learn.microsoft.com/windows/win32/api/bthledef/ns-bthledef-bth_le_uuid
 * @namespace Windows.Win32.Devices.Bluetooth
 */
export default struct BTH_LE_UUID {
    #StructPack 4


    struct _Value {
        ShortUuid : UInt16

        static __New() {
            DefineProp(this.Prototype, 'LongUuid', { type: Guid, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Indicates if the Low Energy (LE) UUID a 16-bit shortened value, or if it is the long 128-bit value.
     */
    IsShortUuid : BOOLEAN

    /**
     * The value of the UUID.
     */
    Value : BTH_LE_UUID._Value

}
