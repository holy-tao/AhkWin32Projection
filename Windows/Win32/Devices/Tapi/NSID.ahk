#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ADDRALIAS.ahk" { ADDRALIAS }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct NSID {
    #StructPack 4


    struct _address {
        alias : ADDRALIAS

        static __New() {
            DefineProp(this.Prototype, 'rgchInterNet', { type: CHAR[1], offset: 0 })
            this.DeleteProp("__New")
        }
    }

    dwSize : UInt32

    uchType : Int8[16]

    xtype : UInt32

    lTime : Int32

    address : NSID._address

}
