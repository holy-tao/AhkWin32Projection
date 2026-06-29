#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHEA_XPF_MC_BANK_DESCRIPTOR.ahk" { WHEA_XPF_MC_BANK_DESCRIPTOR }
#Import ".\AER_ROOTPORT_DESCRIPTOR_FLAGS.ahk" { AER_ROOTPORT_DESCRIPTOR_FLAGS }
#Import ".\WHEA_XPF_CMC_DESCRIPTOR.ahk" { WHEA_XPF_CMC_DESCRIPTOR }
#Import ".\WHEA_PCI_SLOT_NUMBER.ahk" { WHEA_PCI_SLOT_NUMBER }
#Import ".\WHEA_IPF_CMC_DESCRIPTOR.ahk" { WHEA_IPF_CMC_DESCRIPTOR }
#Import ".\XPF_MCE_FLAGS.ahk" { XPF_MCE_FLAGS }
#Import ".\WHEA_DEVICE_DRIVER_DESCRIPTOR.ahk" { WHEA_DEVICE_DRIVER_DESCRIPTOR }
#Import ".\WHEA_ERROR_SOURCE_CONFIGURATION_DD.ahk" { WHEA_ERROR_SOURCE_CONFIGURATION_DD }
#Import ".\WHEA_IPF_MCA_DESCRIPTOR.ahk" { WHEA_IPF_MCA_DESCRIPTOR }
#Import ".\WHEA_XPF_MCE_DESCRIPTOR.ahk" { WHEA_XPF_MCE_DESCRIPTOR }
#Import ".\WHEA_AER_ENDPOINT_DESCRIPTOR.ahk" { WHEA_AER_ENDPOINT_DESCRIPTOR }
#Import ".\WHEA_GENERIC_ERROR_DESCRIPTOR_V2.ahk" { WHEA_GENERIC_ERROR_DESCRIPTOR_V2 }
#Import ".\WHEA_IPF_CPE_DESCRIPTOR.ahk" { WHEA_IPF_CPE_DESCRIPTOR }
#Import ".\WHEA_ERROR_SOURCE_STATE.ahk" { WHEA_ERROR_SOURCE_STATE }
#Import ".\WHEA_AER_ROOTPORT_DESCRIPTOR.ahk" { WHEA_AER_ROOTPORT_DESCRIPTOR }
#Import ".\WHEA_GENERIC_ERROR_DESCRIPTOR.ahk" { WHEA_GENERIC_ERROR_DESCRIPTOR }
#Import ".\WHEA_AER_BRIDGE_DESCRIPTOR.ahk" { WHEA_AER_BRIDGE_DESCRIPTOR }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\WHEA_ERROR_SOURCE_TYPE.ahk" { WHEA_ERROR_SOURCE_TYPE }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\WHEA_XPF_NMI_DESCRIPTOR.ahk" { WHEA_XPF_NMI_DESCRIPTOR }
#Import ".\XPF_MC_BANK_FLAGS.ahk" { XPF_MC_BANK_FLAGS }
#Import ".\WHEA_NOTIFICATION_FLAGS.ahk" { WHEA_NOTIFICATION_FLAGS }
#Import ".\AER_BRIDGE_DESCRIPTOR_FLAGS.ahk" { AER_BRIDGE_DESCRIPTOR_FLAGS }
#Import ".\AER_ENDPOINT_DESCRIPTOR_FLAGS.ahk" { AER_ENDPOINT_DESCRIPTOR_FLAGS }
#Import ".\WHEA_NOTIFICATION_DESCRIPTOR.ahk" { WHEA_NOTIFICATION_DESCRIPTOR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WHEA_ERROR_SOURCE_DESCRIPTOR {
    #StructPack 8


    struct _Info {
        XpfMceDescriptor : WHEA_XPF_MCE_DESCRIPTOR

        static __New() {
            DefineProp(this.Prototype, 'XpfCmcDescriptor', { type: WHEA_XPF_CMC_DESCRIPTOR, offset: 0 })
            DefineProp(this.Prototype, 'XpfNmiDescriptor', { type: WHEA_XPF_NMI_DESCRIPTOR, offset: 0 })
            DefineProp(this.Prototype, 'IpfMcaDescriptor', { type: WHEA_IPF_MCA_DESCRIPTOR, offset: 0 })
            DefineProp(this.Prototype, 'IpfCmcDescriptor', { type: WHEA_IPF_CMC_DESCRIPTOR, offset: 0 })
            DefineProp(this.Prototype, 'IpfCpeDescriptor', { type: WHEA_IPF_CPE_DESCRIPTOR, offset: 0 })
            DefineProp(this.Prototype, 'AerRootportDescriptor', { type: WHEA_AER_ROOTPORT_DESCRIPTOR, offset: 0 })
            DefineProp(this.Prototype, 'AerEndpointDescriptor', { type: WHEA_AER_ENDPOINT_DESCRIPTOR, offset: 0 })
            DefineProp(this.Prototype, 'AerBridgeDescriptor', { type: WHEA_AER_BRIDGE_DESCRIPTOR, offset: 0 })
            DefineProp(this.Prototype, 'GenErrDescriptor', { type: WHEA_GENERIC_ERROR_DESCRIPTOR, offset: 0 })
            DefineProp(this.Prototype, 'GenErrDescriptorV2', { type: WHEA_GENERIC_ERROR_DESCRIPTOR_V2, offset: 0 })
            DefineProp(this.Prototype, 'DeviceDriverDescriptor', { type: WHEA_DEVICE_DRIVER_DESCRIPTOR, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Length : UInt32

    Version : UInt32

    Type : WHEA_ERROR_SOURCE_TYPE

    State : WHEA_ERROR_SOURCE_STATE

    MaxRawDataLength : UInt32

    NumRecordsToPreallocate : UInt32

    MaxSectionsPerRecord : UInt32

    ErrorSourceId : UInt32

    PlatformErrorSourceId : UInt32

    Flags : UInt32

    Info : WHEA_ERROR_SOURCE_DESCRIPTOR._Info

}
