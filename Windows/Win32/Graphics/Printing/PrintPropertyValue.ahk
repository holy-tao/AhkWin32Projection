#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\EPrintPropertyType.ahk" { EPrintPropertyType }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PrintPropertyValue {
    #StructPack 8


    struct _value {

        struct _propertyBlob {
            cbBuf : UInt32

            pBuf : IntPtr

        }

        propertyByte : Int8

        static __New() {
            DefineProp(this.Prototype, 'propertyString', { type: PWSTR, offset: 0 })
            DefineProp(this.Prototype, 'propertyInt32', { type: Int32, offset: 0 })
            DefineProp(this.Prototype, 'propertyInt64', { type: Int64, offset: 0 })
            DefineProp(this.Prototype, 'propertyBlob', { type: PrintPropertyValue._value._propertyBlob, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    ePropertyType : EPrintPropertyType

    value : PrintPropertyValue._value

}
