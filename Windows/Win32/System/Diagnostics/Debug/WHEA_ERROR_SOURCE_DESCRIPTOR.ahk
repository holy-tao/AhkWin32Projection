#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\XPF_MCE_FLAGS.ahk
#Include ..\..\..\Foundation\BOOLEAN.ahk
#Include .\XPF_MC_BANK_FLAGS.ahk
#Include .\WHEA_XPF_MC_BANK_DESCRIPTOR.ahk
#Include .\WHEA_XPF_MCE_DESCRIPTOR.ahk
#Include .\WHEA_NOTIFICATION_FLAGS.ahk
#Include .\WHEA_NOTIFICATION_DESCRIPTOR.ahk
#Include .\WHEA_XPF_CMC_DESCRIPTOR.ahk
#Include .\WHEA_XPF_NMI_DESCRIPTOR.ahk
#Include .\WHEA_IPF_MCA_DESCRIPTOR.ahk
#Include .\WHEA_IPF_CMC_DESCRIPTOR.ahk
#Include .\WHEA_IPF_CPE_DESCRIPTOR.ahk
#Include .\WHEA_PCI_SLOT_NUMBER.ahk
#Include .\AER_ROOTPORT_DESCRIPTOR_FLAGS.ahk
#Include .\WHEA_AER_ROOTPORT_DESCRIPTOR.ahk
#Include .\AER_ENDPOINT_DESCRIPTOR_FLAGS.ahk
#Include .\WHEA_AER_ENDPOINT_DESCRIPTOR.ahk
#Include .\AER_BRIDGE_DESCRIPTOR_FLAGS.ahk
#Include .\WHEA_AER_BRIDGE_DESCRIPTOR.ahk
#Include .\WHEA_GENERIC_ERROR_DESCRIPTOR.ahk
#Include .\WHEA_GENERIC_ERROR_DESCRIPTOR_V2.ahk
#Include .\WHEA_ERROR_SOURCE_CONFIGURATION_DD.ahk
#Include .\WHEA_DEVICE_DRIVER_DESCRIPTOR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class WHEA_ERROR_SOURCE_DESCRIPTOR extends Win32Struct
{
    static sizeof => 336

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    MaxRawDataLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    NumRecordsToPreallocate {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    MaxSectionsPerRecord {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ErrorSourceId {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    PlatformErrorSourceId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {WHEA_XPF_MCE_DESCRIPTOR}
     */
    XpfMceDescriptor{
        get {
            if(!this.HasProp("__XpfMceDescriptor"))
                this.__XpfMceDescriptor := WHEA_XPF_MCE_DESCRIPTOR(this.ptr + 40)
            return this.__XpfMceDescriptor
        }
    }

    /**
     * @type {WHEA_XPF_CMC_DESCRIPTOR}
     */
    XpfCmcDescriptor{
        get {
            if(!this.HasProp("__XpfCmcDescriptor"))
                this.__XpfCmcDescriptor := WHEA_XPF_CMC_DESCRIPTOR(this.ptr + 40)
            return this.__XpfCmcDescriptor
        }
    }

    /**
     * @type {WHEA_XPF_NMI_DESCRIPTOR}
     */
    XpfNmiDescriptor{
        get {
            if(!this.HasProp("__XpfNmiDescriptor"))
                this.__XpfNmiDescriptor := WHEA_XPF_NMI_DESCRIPTOR(this.ptr + 40)
            return this.__XpfNmiDescriptor
        }
    }

    /**
     * @type {WHEA_IPF_MCA_DESCRIPTOR}
     */
    IpfMcaDescriptor{
        get {
            if(!this.HasProp("__IpfMcaDescriptor"))
                this.__IpfMcaDescriptor := WHEA_IPF_MCA_DESCRIPTOR(this.ptr + 40)
            return this.__IpfMcaDescriptor
        }
    }

    /**
     * @type {WHEA_IPF_CMC_DESCRIPTOR}
     */
    IpfCmcDescriptor{
        get {
            if(!this.HasProp("__IpfCmcDescriptor"))
                this.__IpfCmcDescriptor := WHEA_IPF_CMC_DESCRIPTOR(this.ptr + 40)
            return this.__IpfCmcDescriptor
        }
    }

    /**
     * @type {WHEA_IPF_CPE_DESCRIPTOR}
     */
    IpfCpeDescriptor{
        get {
            if(!this.HasProp("__IpfCpeDescriptor"))
                this.__IpfCpeDescriptor := WHEA_IPF_CPE_DESCRIPTOR(this.ptr + 40)
            return this.__IpfCpeDescriptor
        }
    }

    /**
     * @type {WHEA_AER_ROOTPORT_DESCRIPTOR}
     */
    AerRootportDescriptor{
        get {
            if(!this.HasProp("__AerRootportDescriptor"))
                this.__AerRootportDescriptor := WHEA_AER_ROOTPORT_DESCRIPTOR(this.ptr + 40)
            return this.__AerRootportDescriptor
        }
    }

    /**
     * @type {WHEA_AER_ENDPOINT_DESCRIPTOR}
     */
    AerEndpointDescriptor{
        get {
            if(!this.HasProp("__AerEndpointDescriptor"))
                this.__AerEndpointDescriptor := WHEA_AER_ENDPOINT_DESCRIPTOR(this.ptr + 40)
            return this.__AerEndpointDescriptor
        }
    }

    /**
     * @type {WHEA_AER_BRIDGE_DESCRIPTOR}
     */
    AerBridgeDescriptor{
        get {
            if(!this.HasProp("__AerBridgeDescriptor"))
                this.__AerBridgeDescriptor := WHEA_AER_BRIDGE_DESCRIPTOR(this.ptr + 40)
            return this.__AerBridgeDescriptor
        }
    }

    /**
     * @type {WHEA_GENERIC_ERROR_DESCRIPTOR}
     */
    GenErrDescriptor{
        get {
            if(!this.HasProp("__GenErrDescriptor"))
                this.__GenErrDescriptor := WHEA_GENERIC_ERROR_DESCRIPTOR(this.ptr + 40)
            return this.__GenErrDescriptor
        }
    }

    /**
     * @type {WHEA_GENERIC_ERROR_DESCRIPTOR_V2}
     */
    GenErrDescriptorV2{
        get {
            if(!this.HasProp("__GenErrDescriptorV2"))
                this.__GenErrDescriptorV2 := WHEA_GENERIC_ERROR_DESCRIPTOR_V2(this.ptr + 40)
            return this.__GenErrDescriptorV2
        }
    }

    /**
     * @type {WHEA_DEVICE_DRIVER_DESCRIPTOR}
     */
    DeviceDriverDescriptor{
        get {
            if(!this.HasProp("__DeviceDriverDescriptor"))
                this.__DeviceDriverDescriptor := WHEA_DEVICE_DRIVER_DESCRIPTOR(this.ptr + 40)
            return this.__DeviceDriverDescriptor
        }
    }
}
