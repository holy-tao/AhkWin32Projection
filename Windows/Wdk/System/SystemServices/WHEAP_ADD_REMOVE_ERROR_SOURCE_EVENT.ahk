#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\XPF_MCE_FLAGS.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\XPF_MC_BANK_FLAGS.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_XPF_MC_BANK_DESCRIPTOR.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_XPF_MCE_DESCRIPTOR.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_NOTIFICATION_FLAGS.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_NOTIFICATION_DESCRIPTOR.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_XPF_CMC_DESCRIPTOR.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_XPF_NMI_DESCRIPTOR.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_IPF_MCA_DESCRIPTOR.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_IPF_CMC_DESCRIPTOR.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_IPF_CPE_DESCRIPTOR.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_PCI_SLOT_NUMBER.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\AER_ROOTPORT_DESCRIPTOR_FLAGS.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_AER_ROOTPORT_DESCRIPTOR.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\AER_ENDPOINT_DESCRIPTOR_FLAGS.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_AER_ENDPOINT_DESCRIPTOR.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\AER_BRIDGE_DESCRIPTOR_FLAGS.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_AER_BRIDGE_DESCRIPTOR.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_GENERIC_ERROR_DESCRIPTOR.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_GENERIC_ERROR_DESCRIPTOR_V2.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_ERROR_SOURCE_CONFIGURATION_DD.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_DEVICE_DRIVER_DESCRIPTOR.ahk
#Include ..\..\..\Win32\System\Diagnostics\Debug\WHEA_ERROR_SOURCE_DESCRIPTOR.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEAP_ADD_REMOVE_ERROR_SOURCE_EVENT extends Win32Struct
{
    static sizeof => 352

    static packingSize => 8

    /**
     * @type {Pointer<WHEA_EVENT_LOG_ENTRY>}
     */
    WheaEventLogEntry {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {WHEA_ERROR_SOURCE_DESCRIPTOR}
     */
    Descriptor{
        get {
            if(!this.HasProp("__Descriptor"))
                this.__Descriptor := WHEA_ERROR_SOURCE_DESCRIPTOR(8, this)
            return this.__Descriptor
        }
    }

    /**
     * @type {NTSTATUS}
     */
    Status {
        get => NumGet(this, 344, "int")
        set => NumPut("int", value, this, 344)
    }

    /**
     * @type {BOOLEAN}
     */
    IsRemove {
        get => NumGet(this, 348, "char")
        set => NumPut("char", value, this, 348)
    }
}
