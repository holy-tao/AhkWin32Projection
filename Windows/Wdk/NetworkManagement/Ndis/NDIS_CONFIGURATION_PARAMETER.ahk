#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_PARAMETER_TYPE.ahk" { NDIS_PARAMETER_TYPE }

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_CONFIGURATION_PARAMETER {
    #StructPack 8


    struct _ParameterData {
        IntegerData : UInt32

        static __New() {
            DefineProp(this.Prototype, 'StringData', { type: IntPtr, offset: 0 })
            DefineProp(this.Prototype, 'BinaryData', { type: IntPtr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    ParameterType : NDIS_PARAMETER_TYPE

    ParameterData : NDIS_CONFIGURATION_PARAMETER._ParameterData

}
