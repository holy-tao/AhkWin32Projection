#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Nvme
 */
export default struct NVMEOF_PROPERTY_GET_RESPONSE {
    #StructPack 8


    struct _VALUE {

        struct _FourBytes {
            Value : UInt32

            Reserved : UInt32

        }

        FourBytes : NVMEOF_PROPERTY_GET_RESPONSE._VALUE._FourBytes

        static __New() {
            DefineProp(this.Prototype, 'EightBytes', { type: Int64, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    VALUE : NVMEOF_PROPERTY_GET_RESPONSE._VALUE

    SQHD : UInt16

    Reserved0 : UInt16

    CID : UInt16

    STS : UInt16

}
