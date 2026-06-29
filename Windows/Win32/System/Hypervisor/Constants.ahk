#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global HVSOCKET_CONNECT_TIMEOUT := 1

/**
 * @type {Integer (UInt32)}
 */
export global HVSOCKET_CONNECT_TIMEOUT_MAX := 300000

/**
 * @type {Integer (UInt32)}
 */
export global HVSOCKET_CONNECTED_SUSPEND := 4

/**
 * @type {Integer (UInt32)}
 */
export global HVSOCKET_HIGH_VTL := 8

/**
 * @type {Integer (UInt32)}
 */
export global HV_PROTOCOL_RAW := 1

/**
 * @type {Integer (UInt32)}
 */
export global HVSOCKET_ADDRESS_FLAG_PASSTHRU := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHV_PROCESSOR_FEATURES_BANKS_COUNT := 2

/**
 * @type {Integer (UInt32)}
 */
export global WHV_SYNTHETIC_PROCESSOR_FEATURES_BANKS_COUNT := 1

/**
 * @type {Integer (UInt32)}
 */
export global WHV_READ_WRITE_GPA_RANGE_MAX_SIZE := 16

/**
 * @type {Integer (UInt32)}
 */
export global WHV_HYPERCALL_CONTEXT_MAX_XMM_REGISTERS := 6

/**
 * @type {Integer (UInt32)}
 */
export global WHV_MAX_DEVICE_ID_SIZE_IN_CHARS := 200

/**
 * @type {Integer (UInt32)}
 */
export global WHV_VPCI_TYPE0_BAR_COUNT := 6

/**
 * @type {Integer (UInt32)}
 */
export global WHV_ANY_VP := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global WHV_SYNIC_MESSAGE_SIZE := 256

/**
 * @type {String}
 */
export global VM_GENCOUNTER_SYMBOLIC_LINK_NAME := "\VmGenerationCounter"

/**
 * @type {Integer (UInt32)}
 */
export global IOCTL_VMGENCOUNTER_READ := 3325956

/**
 * @type {Integer (UInt32)}
 */
export global HDV_PCI_BAR_COUNT := 6

/**
 * @type {Guid}
 */
export global HV_GUID_ZERO := Guid("{00000000-0000-0000-0000-000000000000}")

/**
 * @type {Guid}
 */
export global HV_GUID_BROADCAST := Guid("{ffffffff-ffff-ffff-ffff-ffffffffffff}")

/**
 * @type {Guid}
 */
export global HV_GUID_CHILDREN := Guid("{90db8b89-0d35-4f79-8ce9-49ea0ac8b7cd}")

/**
 * @type {Guid}
 */
export global HV_GUID_LOOPBACK := Guid("{e0e16197-dd56-4a10-9195-5ee7a155a838}")

/**
 * @type {Guid}
 */
export global HV_GUID_PARENT := Guid("{a42e7cda-d03f-480c-9cc2-a4de20abb878}")

/**
 * @type {Guid}
 */
export global HV_GUID_SILOHOST := Guid("{36bd0c5c-7276-4223-88ba-7d03b654c568}")

/**
 * @type {Guid}
 */
export global HV_GUID_VSOCK_TEMPLATE := Guid("{00000000-facb-11e6-bd58-64006a7986d3}")

/**
 * @type {Guid}
 */
export global GUID_DEVINTERFACE_VM_GENCOUNTER := Guid("{3ff2c92b-6598-4e60-8e1c-0ccf4927e319}")
;@endregion Constants
