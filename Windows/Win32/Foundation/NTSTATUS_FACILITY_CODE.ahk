#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Foundation
 */
class NTSTATUS_FACILITY_CODE extends Win32Enum {

    /**
     * Native name: FACILITY_MCA_ERROR_CODE
     * @type {Integer (UInt32)}
     */
    static MCA_ERROR_CODE => 5

    /**
     * Native name: FACILITY_DEBUGGER
     * @type {Integer (UInt32)}
     */
    static DEBUGGER => 1

    /**
     * Native name: FACILITY_RPC_RUNTIME
     * @type {Integer (UInt32)}
     */
    static RPC_RUNTIME => 2

    /**
     * Native name: FACILITY_RPC_STUBS
     * @type {Integer (UInt32)}
     */
    static RPC_STUBS => 3

    /**
     * Native name: FACILITY_IO_ERROR_CODE
     * @type {Integer (UInt32)}
     */
    static IO_ERROR_CODE => 4

    /**
     * Native name: FACILITY_CODCLASS_ERROR_CODE
     * @type {Integer (UInt32)}
     */
    static CODCLASS_ERROR_CODE => 6

    /**
     * Native name: FACILITY_NTWIN32
     * @type {Integer (UInt32)}
     */
    static NTWIN32 => 7

    /**
     * Native name: FACILITY_NTCERT
     * @type {Integer (UInt32)}
     */
    static NTCERT => 8

    /**
     * Native name: FACILITY_NTSSPI
     * @type {Integer (UInt32)}
     */
    static NTSSPI => 9

    /**
     * Native name: FACILITY_TERMINAL_SERVER
     * @type {Integer (UInt32)}
     */
    static TERMINAL_SERVER => 10

    /**
     * Native name: FACILITY_USB_ERROR_CODE
     * @type {Integer (UInt32)}
     */
    static USB_ERROR_CODE => 16

    /**
     * Native name: FACILITY_HID_ERROR_CODE
     * @type {Integer (UInt32)}
     */
    static HID_ERROR_CODE => 17

    /**
     * Native name: FACILITY_FIREWIRE_ERROR_CODE
     * @type {Integer (UInt32)}
     */
    static FIREWIRE_ERROR_CODE => 18

    /**
     * Native name: FACILITY_CLUSTER_ERROR_CODE
     * @type {Integer (UInt32)}
     */
    static CLUSTER_ERROR_CODE => 19

    /**
     * Native name: FACILITY_ACPI_ERROR_CODE
     * @type {Integer (UInt32)}
     */
    static ACPI_ERROR_CODE => 20

    /**
     * Native name: FACILITY_SXS_ERROR_CODE
     * @type {Integer (UInt32)}
     */
    static SXS_ERROR_CODE => 21

    /**
     * Native name: FACILITY_TRANSACTION
     * @type {Integer (UInt32)}
     */
    static TRANSACTION => 25

    /**
     * Native name: FACILITY_COMMONLOG
     * @type {Integer (UInt32)}
     */
    static COMMONLOG => 26

    /**
     * Native name: FACILITY_VIDEO
     * @type {Integer (UInt32)}
     */
    static VIDEO => 27

    /**
     * Native name: FACILITY_FILTER_MANAGER
     * @type {Integer (UInt32)}
     */
    static FILTER_MANAGER => 28

    /**
     * Native name: FACILITY_MONITOR
     * @type {Integer (UInt32)}
     */
    static MONITOR => 29

    /**
     * Native name: FACILITY_GRAPHICS_KERNEL
     * @type {Integer (UInt32)}
     */
    static GRAPHICS_KERNEL => 30

    /**
     * Native name: FACILITY_CAMERA
     * @type {Integer (UInt32)}
     */
    static CAMERA => 31

    /**
     * Native name: FACILITY_DRIVER_FRAMEWORK
     * @type {Integer (UInt32)}
     */
    static DRIVER_FRAMEWORK => 32

    /**
     * Native name: FACILITY_FVE_ERROR_CODE
     * @type {Integer (UInt32)}
     */
    static FVE_ERROR_CODE => 33

    /**
     * Native name: FACILITY_FWP_ERROR_CODE
     * @type {Integer (UInt32)}
     */
    static FWP_ERROR_CODE => 34

    /**
     * Native name: FACILITY_NDIS_ERROR_CODE
     * @type {Integer (UInt32)}
     */
    static NDIS_ERROR_CODE => 35

    /**
     * Native name: FACILITY_QUIC_ERROR_CODE
     * @type {Integer (UInt32)}
     */
    static QUIC_ERROR_CODE => 36

    /**
     * Native name: FACILITY_TPM
     * @type {Integer (UInt32)}
     */
    static TPM => 41

    /**
     * Native name: FACILITY_RTPM
     * @type {Integer (UInt32)}
     */
    static RTPM => 42

    /**
     * Native name: FACILITY_HYPERVISOR
     * @type {Integer (UInt32)}
     */
    static HYPERVISOR => 53

    /**
     * Native name: FACILITY_IPSEC
     * @type {Integer (UInt32)}
     */
    static IPSEC => 54

    /**
     * Native name: FACILITY_VIRTUALIZATION
     * @type {Integer (UInt32)}
     */
    static VIRTUALIZATION => 55

    /**
     * Native name: FACILITY_VOLMGR
     * @type {Integer (UInt32)}
     */
    static VOLMGR => 56

    /**
     * Native name: FACILITY_BCD_ERROR_CODE
     * @type {Integer (UInt32)}
     */
    static BCD_ERROR_CODE => 57

    /**
     * Native name: FACILITY_WIN32K_NTUSER
     * @type {Integer (UInt32)}
     */
    static WIN32K_NTUSER => 62

    /**
     * Native name: FACILITY_WIN32K_NTGDI
     * @type {Integer (UInt32)}
     */
    static WIN32K_NTGDI => 63

    /**
     * Native name: FACILITY_RESUME_KEY_FILTER
     * @type {Integer (UInt32)}
     */
    static RESUME_KEY_FILTER => 64

    /**
     * Native name: FACILITY_RDBSS
     * @type {Integer (UInt32)}
     */
    static RDBSS => 65

    /**
     * Native name: FACILITY_BTH_ATT
     * @type {Integer (UInt32)}
     */
    static BTH_ATT => 66

    /**
     * Native name: FACILITY_SECUREBOOT
     * @type {Integer (UInt32)}
     */
    static SECUREBOOT => 67

    /**
     * Native name: FACILITY_AUDIO_KERNEL
     * @type {Integer (UInt32)}
     */
    static AUDIO_KERNEL => 68

    /**
     * Native name: FACILITY_VSM
     * @type {Integer (UInt32)}
     */
    static VSM => 69

    /**
     * Native name: FACILITY_NT_IORING
     * @type {Integer (UInt32)}
     */
    static NT_IORING => 70

    /**
     * Native name: FACILITY_VOLSNAP
     * @type {Integer (UInt32)}
     */
    static VOLSNAP => 80

    /**
     * Native name: FACILITY_SDBUS
     * @type {Integer (UInt32)}
     */
    static SDBUS => 81

    /**
     * Native name: FACILITY_SHARED_VHDX
     * @type {Integer (UInt32)}
     */
    static SHARED_VHDX => 92

    /**
     * Native name: FACILITY_SMB
     * @type {Integer (UInt32)}
     */
    static SMB => 93

    /**
     * Native name: FACILITY_XVS
     * @type {Integer (UInt32)}
     */
    static XVS => 94

    /**
     * Native name: FACILITY_INTERIX
     * @type {Integer (UInt32)}
     */
    static INTERIX => 153

    /**
     * Native name: FACILITY_SPACES
     * @type {Integer (UInt32)}
     */
    static SPACES => 231

    /**
     * Native name: FACILITY_SECURITY_CORE
     * @type {Integer (UInt32)}
     */
    static SECURITY_CORE => 232

    /**
     * Native name: FACILITY_SYSTEM_INTEGRITY
     * @type {Integer (UInt32)}
     */
    static SYSTEM_INTEGRITY => 233

    /**
     * Native name: FACILITY_LICENSING
     * @type {Integer (UInt32)}
     */
    static LICENSING => 234

    /**
     * Native name: FACILITY_PLATFORM_MANIFEST
     * @type {Integer (UInt32)}
     */
    static PLATFORM_MANIFEST => 235

    /**
     * Native name: FACILITY_APP_EXEC
     * @type {Integer (UInt32)}
     */
    static APP_EXEC => 236

    /**
     * Native name: FACILITY_UNIONFS
     * @type {Integer (UInt32)}
     */
    static UNIONFS => 237

    /**
     * Native name: FACILITY_PLATFORM_RUNTIME_MECHANISM
     * @type {Integer (UInt32)}
     */
    static PLATFORM_RUNTIME_MECHANISM => 238

    /**
     * Native name: FACILITY_WIN_ACCEL
     * @type {Integer (UInt32)}
     */
    static WIN_ACCEL => 239

    /**
     * Native name: FACILITY_MAXIMUM_VALUE
     * @type {Integer (UInt32)}
     */
    static MAXIMUM_VALUE => 240
}
