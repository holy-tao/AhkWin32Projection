#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about a property value to retrieve from the protocol.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ns-wtsdefs-wts_property_value
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_PROPERTY_VALUE {
    #StructPack 8


    struct _u {

        struct _strVal {
            size : UInt32

            pstrVal : PWSTR

        }

        struct _bVal {
            size : UInt32

            pbVal : PSTR

        }

        ulVal : UInt32

        static __New() {
            DefineProp(this.Prototype, 'strVal', { type: WTS_PROPERTY_VALUE._u._strVal, offset: 0 })
            DefineProp(this.Prototype, 'bVal', { type: WTS_PROPERTY_VALUE._u._bVal, offset: 0 })
            DefineProp(this.Prototype, 'guidVal', { type: Guid, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Type : UInt16

    /**
     * A union that contains the property value.
     */
    u : WTS_PROPERTY_VALUE._u

}
