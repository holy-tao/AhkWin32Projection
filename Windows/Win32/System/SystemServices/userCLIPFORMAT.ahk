#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct userCLIPFORMAT {
    #StructPack 8


    struct _u {
        dwValue : UInt32

        static __New() {
            DefineProp(this.Prototype, 'pwszName', { type: PWSTR, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    fContext : Int32

    u : userCLIPFORMAT._u

}
