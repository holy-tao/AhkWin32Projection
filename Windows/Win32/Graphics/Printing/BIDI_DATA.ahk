#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\BINARY_CONTAINER.ahk" { BINARY_CONTAINER }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct BIDI_DATA {
    #StructPack 8


    struct _u {
        bData : BOOL

        static __New() {
            DefineProp(this.Prototype, 'iData', { type: Int32, offset: 0 })
            DefineProp(this.Prototype, 'sData', { type: PWSTR, offset: 0 })
            DefineProp(this.Prototype, 'fData', { type: Float32, offset: 0 })
            DefineProp(this.Prototype, 'biData', { type: BINARY_CONTAINER, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    dwBidiType : UInt32

    u : BIDI_DATA._u

}
