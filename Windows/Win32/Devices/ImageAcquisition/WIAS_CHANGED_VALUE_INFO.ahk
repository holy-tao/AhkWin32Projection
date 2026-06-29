#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
export default struct WIAS_CHANGED_VALUE_INFO {
    #StructPack 8


    struct _Old {
        lVal : Int32

        static __New() {
            DefineProp(this.Prototype, 'fltVal', { type: Float32, offset: 0 })
            DefineProp(this.Prototype, 'bstrVal', { type: BSTR, offset: 0 })
            DefineProp(this.Prototype, 'guidVal', { type: Guid, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    struct _Current {
        lVal : Int32

        static __New() {
            DefineProp(this.Prototype, 'fltVal', { type: Float32, offset: 0 })
            DefineProp(this.Prototype, 'bstrVal', { type: BSTR, offset: 0 })
            DefineProp(this.Prototype, 'guidVal', { type: Guid, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    bChanged : BOOL

    vt : Int32

    Old : WIAS_CHANGED_VALUE_INFO._Old

    Current : WIAS_CHANGED_VALUE_INFO._Current

}
