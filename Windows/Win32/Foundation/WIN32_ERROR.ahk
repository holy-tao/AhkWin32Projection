#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Foundation
 */
class WIN32_ERROR extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static NO_ERROR => 0

    /**
     * Native name: ERROR_EXPECTED_SECTION_NAME
     * @type {Integer (UInt32)}
     */
    static EXPECTED_SECTION_NAME => 3758096384

    /**
     * Native name: ERROR_BAD_SECTION_NAME_LINE
     * @type {Integer (UInt32)}
     */
    static BAD_SECTION_NAME_LINE => 3758096385

    /**
     * Native name: ERROR_SECTION_NAME_TOO_LONG
     * @type {Integer (UInt32)}
     */
    static SECTION_NAME_TOO_LONG => 3758096386

    /**
     * Native name: ERROR_GENERAL_SYNTAX
     * @type {Integer (UInt32)}
     */
    static GENERAL_SYNTAX => 3758096387

    /**
     * Native name: ERROR_WRONG_INF_STYLE
     * @type {Integer (UInt32)}
     */
    static WRONG_INF_STYLE => 3758096640

    /**
     * Native name: ERROR_SECTION_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static SECTION_NOT_FOUND => 3758096641

    /**
     * Native name: ERROR_LINE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static LINE_NOT_FOUND => 3758096642

    /**
     * Native name: ERROR_NO_BACKUP
     * @type {Integer (UInt32)}
     */
    static NO_BACKUP => 3758096643

    /**
     * Native name: ERROR_NO_ASSOCIATED_CLASS
     * @type {Integer (UInt32)}
     */
    static NO_ASSOCIATED_CLASS => 3758096896

    /**
     * Native name: ERROR_CLASS_MISMATCH
     * @type {Integer (UInt32)}
     */
    static CLASS_MISMATCH => 3758096897

    /**
     * Native name: ERROR_DUPLICATE_FOUND
     * @type {Integer (UInt32)}
     */
    static DUPLICATE_FOUND => 3758096898

    /**
     * Native name: ERROR_NO_DRIVER_SELECTED
     * @type {Integer (UInt32)}
     */
    static NO_DRIVER_SELECTED => 3758096899

    /**
     * Native name: ERROR_KEY_DOES_NOT_EXIST
     * @type {Integer (UInt32)}
     */
    static KEY_DOES_NOT_EXIST => 3758096900

    /**
     * Native name: ERROR_INVALID_DEVINST_NAME
     * @type {Integer (UInt32)}
     */
    static INVALID_DEVINST_NAME => 3758096901

    /**
     * Native name: ERROR_INVALID_CLASS
     * @type {Integer (UInt32)}
     */
    static INVALID_CLASS => 3758096902

    /**
     * Native name: ERROR_DEVINST_ALREADY_EXISTS
     * @type {Integer (UInt32)}
     */
    static DEVINST_ALREADY_EXISTS => 3758096903

    /**
     * Native name: ERROR_DEVINFO_NOT_REGISTERED
     * @type {Integer (UInt32)}
     */
    static DEVINFO_NOT_REGISTERED => 3758096904

    /**
     * Native name: ERROR_INVALID_REG_PROPERTY
     * @type {Integer (UInt32)}
     */
    static INVALID_REG_PROPERTY => 3758096905

    /**
     * Native name: ERROR_NO_INF
     * @type {Integer (UInt32)}
     */
    static NO_INF => 3758096906

    /**
     * Native name: ERROR_NO_SUCH_DEVINST
     * @type {Integer (UInt32)}
     */
    static NO_SUCH_DEVINST => 3758096907

    /**
     * Native name: ERROR_CANT_LOAD_CLASS_ICON
     * @type {Integer (UInt32)}
     */
    static CANT_LOAD_CLASS_ICON => 3758096908

    /**
     * Native name: ERROR_INVALID_CLASS_INSTALLER
     * @type {Integer (UInt32)}
     */
    static INVALID_CLASS_INSTALLER => 3758096909

    /**
     * Native name: ERROR_DI_DO_DEFAULT
     * @type {Integer (UInt32)}
     */
    static DI_DO_DEFAULT => 3758096910

    /**
     * Native name: ERROR_DI_NOFILECOPY
     * @type {Integer (UInt32)}
     */
    static DI_NOFILECOPY => 3758096911

    /**
     * Native name: ERROR_INVALID_HWPROFILE
     * @type {Integer (UInt32)}
     */
    static INVALID_HWPROFILE => 3758096912

    /**
     * Native name: ERROR_NO_DEVICE_SELECTED
     * @type {Integer (UInt32)}
     */
    static NO_DEVICE_SELECTED => 3758096913

    /**
     * Native name: ERROR_DEVINFO_LIST_LOCKED
     * @type {Integer (UInt32)}
     */
    static DEVINFO_LIST_LOCKED => 3758096914

    /**
     * Native name: ERROR_DEVINFO_DATA_LOCKED
     * @type {Integer (UInt32)}
     */
    static DEVINFO_DATA_LOCKED => 3758096915

    /**
     * Native name: ERROR_DI_BAD_PATH
     * @type {Integer (UInt32)}
     */
    static DI_BAD_PATH => 3758096916

    /**
     * Native name: ERROR_NO_CLASSINSTALL_PARAMS
     * @type {Integer (UInt32)}
     */
    static NO_CLASSINSTALL_PARAMS => 3758096917

    /**
     * Native name: ERROR_FILEQUEUE_LOCKED
     * @type {Integer (UInt32)}
     */
    static FILEQUEUE_LOCKED => 3758096918

    /**
     * Native name: ERROR_BAD_SERVICE_INSTALLSECT
     * @type {Integer (UInt32)}
     */
    static BAD_SERVICE_INSTALLSECT => 3758096919

    /**
     * Native name: ERROR_NO_CLASS_DRIVER_LIST
     * @type {Integer (UInt32)}
     */
    static NO_CLASS_DRIVER_LIST => 3758096920

    /**
     * Native name: ERROR_NO_ASSOCIATED_SERVICE
     * @type {Integer (UInt32)}
     */
    static NO_ASSOCIATED_SERVICE => 3758096921

    /**
     * Native name: ERROR_NO_DEFAULT_DEVICE_INTERFACE
     * @type {Integer (UInt32)}
     */
    static NO_DEFAULT_DEVICE_INTERFACE => 3758096922

    /**
     * Native name: ERROR_DEVICE_INTERFACE_ACTIVE
     * @type {Integer (UInt32)}
     */
    static DEVICE_INTERFACE_ACTIVE => 3758096923

    /**
     * Native name: ERROR_DEVICE_INTERFACE_REMOVED
     * @type {Integer (UInt32)}
     */
    static DEVICE_INTERFACE_REMOVED => 3758096924

    /**
     * Native name: ERROR_BAD_INTERFACE_INSTALLSECT
     * @type {Integer (UInt32)}
     */
    static BAD_INTERFACE_INSTALLSECT => 3758096925

    /**
     * Native name: ERROR_NO_SUCH_INTERFACE_CLASS
     * @type {Integer (UInt32)}
     */
    static NO_SUCH_INTERFACE_CLASS => 3758096926

    /**
     * Native name: ERROR_INVALID_REFERENCE_STRING
     * @type {Integer (UInt32)}
     */
    static INVALID_REFERENCE_STRING => 3758096927

    /**
     * Native name: ERROR_INVALID_MACHINENAME
     * @type {Integer (UInt32)}
     */
    static INVALID_MACHINENAME => 3758096928

    /**
     * Native name: ERROR_REMOTE_COMM_FAILURE
     * @type {Integer (UInt32)}
     */
    static REMOTE_COMM_FAILURE => 3758096929

    /**
     * Native name: ERROR_MACHINE_UNAVAILABLE
     * @type {Integer (UInt32)}
     */
    static MACHINE_UNAVAILABLE => 3758096930

    /**
     * Native name: ERROR_NO_CONFIGMGR_SERVICES
     * @type {Integer (UInt32)}
     */
    static NO_CONFIGMGR_SERVICES => 3758096931

    /**
     * Native name: ERROR_INVALID_PROPPAGE_PROVIDER
     * @type {Integer (UInt32)}
     */
    static INVALID_PROPPAGE_PROVIDER => 3758096932

    /**
     * Native name: ERROR_NO_SUCH_DEVICE_INTERFACE
     * @type {Integer (UInt32)}
     */
    static NO_SUCH_DEVICE_INTERFACE => 3758096933

    /**
     * Native name: ERROR_DI_POSTPROCESSING_REQUIRED
     * @type {Integer (UInt32)}
     */
    static DI_POSTPROCESSING_REQUIRED => 3758096934

    /**
     * Native name: ERROR_INVALID_COINSTALLER
     * @type {Integer (UInt32)}
     */
    static INVALID_COINSTALLER => 3758096935

    /**
     * Native name: ERROR_NO_COMPAT_DRIVERS
     * @type {Integer (UInt32)}
     */
    static NO_COMPAT_DRIVERS => 3758096936

    /**
     * Native name: ERROR_NO_DEVICE_ICON
     * @type {Integer (UInt32)}
     */
    static NO_DEVICE_ICON => 3758096937

    /**
     * Native name: ERROR_INVALID_INF_LOGCONFIG
     * @type {Integer (UInt32)}
     */
    static INVALID_INF_LOGCONFIG => 3758096938

    /**
     * Native name: ERROR_DI_DONT_INSTALL
     * @type {Integer (UInt32)}
     */
    static DI_DONT_INSTALL => 3758096939

    /**
     * Native name: ERROR_INVALID_FILTER_DRIVER
     * @type {Integer (UInt32)}
     */
    static INVALID_FILTER_DRIVER => 3758096940

    /**
     * Native name: ERROR_NON_WINDOWS_NT_DRIVER
     * @type {Integer (UInt32)}
     */
    static NON_WINDOWS_NT_DRIVER => 3758096941

    /**
     * Native name: ERROR_NON_WINDOWS_DRIVER
     * @type {Integer (UInt32)}
     */
    static NON_WINDOWS_DRIVER => 3758096942

    /**
     * Native name: ERROR_NO_CATALOG_FOR_OEM_INF
     * @type {Integer (UInt32)}
     */
    static NO_CATALOG_FOR_OEM_INF => 3758096943

    /**
     * Native name: ERROR_DEVINSTALL_QUEUE_NONNATIVE
     * @type {Integer (UInt32)}
     */
    static DEVINSTALL_QUEUE_NONNATIVE => 3758096944

    /**
     * Native name: ERROR_NOT_DISABLEABLE
     * @type {Integer (UInt32)}
     */
    static NOT_DISABLEABLE => 3758096945

    /**
     * Native name: ERROR_CANT_REMOVE_DEVINST
     * @type {Integer (UInt32)}
     */
    static CANT_REMOVE_DEVINST => 3758096946

    /**
     * Native name: ERROR_INVALID_TARGET
     * @type {Integer (UInt32)}
     */
    static INVALID_TARGET => 3758096947

    /**
     * Native name: ERROR_DRIVER_NONNATIVE
     * @type {Integer (UInt32)}
     */
    static DRIVER_NONNATIVE => 3758096948

    /**
     * Native name: ERROR_IN_WOW64
     * @type {Integer (UInt32)}
     */
    static IN_WOW64 => 3758096949

    /**
     * Native name: ERROR_SET_SYSTEM_RESTORE_POINT
     * @type {Integer (UInt32)}
     */
    static SET_SYSTEM_RESTORE_POINT => 3758096950

    /**
     * Native name: ERROR_SCE_DISABLED
     * @type {Integer (UInt32)}
     */
    static SCE_DISABLED => 3758096952

    /**
     * Native name: ERROR_UNKNOWN_EXCEPTION
     * @type {Integer (UInt32)}
     */
    static UNKNOWN_EXCEPTION => 3758096953

    /**
     * Native name: ERROR_PNP_REGISTRY_ERROR
     * @type {Integer (UInt32)}
     */
    static PNP_REGISTRY_ERROR => 3758096954

    /**
     * Native name: ERROR_REMOTE_REQUEST_UNSUPPORTED
     * @type {Integer (UInt32)}
     */
    static REMOTE_REQUEST_UNSUPPORTED => 3758096955

    /**
     * Native name: ERROR_NOT_AN_INSTALLED_OEM_INF
     * @type {Integer (UInt32)}
     */
    static NOT_AN_INSTALLED_OEM_INF => 3758096956

    /**
     * Native name: ERROR_INF_IN_USE_BY_DEVICES
     * @type {Integer (UInt32)}
     */
    static INF_IN_USE_BY_DEVICES => 3758096957

    /**
     * Native name: ERROR_DI_FUNCTION_OBSOLETE
     * @type {Integer (UInt32)}
     */
    static DI_FUNCTION_OBSOLETE => 3758096958

    /**
     * Native name: ERROR_NO_AUTHENTICODE_CATALOG
     * @type {Integer (UInt32)}
     */
    static NO_AUTHENTICODE_CATALOG => 3758096959

    /**
     * Native name: ERROR_AUTHENTICODE_DISALLOWED
     * @type {Integer (UInt32)}
     */
    static AUTHENTICODE_DISALLOWED => 3758096960

    /**
     * Native name: ERROR_AUTHENTICODE_TRUSTED_PUBLISHER
     * @type {Integer (UInt32)}
     */
    static AUTHENTICODE_TRUSTED_PUBLISHER => 3758096961

    /**
     * Native name: ERROR_AUTHENTICODE_TRUST_NOT_ESTABLISHED
     * @type {Integer (UInt32)}
     */
    static AUTHENTICODE_TRUST_NOT_ESTABLISHED => 3758096962

    /**
     * Native name: ERROR_AUTHENTICODE_PUBLISHER_NOT_TRUSTED
     * @type {Integer (UInt32)}
     */
    static AUTHENTICODE_PUBLISHER_NOT_TRUSTED => 3758096963

    /**
     * Native name: ERROR_SIGNATURE_OSATTRIBUTE_MISMATCH
     * @type {Integer (UInt32)}
     */
    static SIGNATURE_OSATTRIBUTE_MISMATCH => 3758096964

    /**
     * Native name: ERROR_ONLY_VALIDATE_VIA_AUTHENTICODE
     * @type {Integer (UInt32)}
     */
    static ONLY_VALIDATE_VIA_AUTHENTICODE => 3758096965

    /**
     * Native name: ERROR_DEVICE_INSTALLER_NOT_READY
     * @type {Integer (UInt32)}
     */
    static DEVICE_INSTALLER_NOT_READY => 3758096966

    /**
     * Native name: ERROR_DRIVER_STORE_ADD_FAILED
     * @type {Integer (UInt32)}
     */
    static DRIVER_STORE_ADD_FAILED => 3758096967

    /**
     * Native name: ERROR_DEVICE_INSTALL_BLOCKED
     * @type {Integer (UInt32)}
     */
    static DEVICE_INSTALL_BLOCKED => 3758096968

    /**
     * Native name: ERROR_DRIVER_INSTALL_BLOCKED
     * @type {Integer (UInt32)}
     */
    static DRIVER_INSTALL_BLOCKED => 3758096969

    /**
     * Native name: ERROR_WRONG_INF_TYPE
     * @type {Integer (UInt32)}
     */
    static WRONG_INF_TYPE => 3758096970

    /**
     * Native name: ERROR_FILE_HASH_NOT_IN_CATALOG
     * @type {Integer (UInt32)}
     */
    static FILE_HASH_NOT_IN_CATALOG => 3758096971

    /**
     * Native name: ERROR_DRIVER_STORE_DELETE_FAILED
     * @type {Integer (UInt32)}
     */
    static DRIVER_STORE_DELETE_FAILED => 3758096972

    /**
     * Native name: ERROR_UNRECOVERABLE_STACK_OVERFLOW
     * @type {Integer (UInt32)}
     */
    static UNRECOVERABLE_STACK_OVERFLOW => 3758097152

    /**
     * Native name: ERROR_NO_DEFAULT_INTERFACE_DEVICE
     * @type {Integer (UInt32)}
     */
    static NO_DEFAULT_INTERFACE_DEVICE => 3758096922

    /**
     * Native name: ERROR_INTERFACE_DEVICE_ACTIVE
     * @type {Integer (UInt32)}
     */
    static INTERFACE_DEVICE_ACTIVE => 3758096923

    /**
     * Native name: ERROR_INTERFACE_DEVICE_REMOVED
     * @type {Integer (UInt32)}
     */
    static INTERFACE_DEVICE_REMOVED => 3758096924

    /**
     * Native name: ERROR_NO_SUCH_INTERFACE_DEVICE
     * @type {Integer (UInt32)}
     */
    static NO_SUCH_INTERFACE_DEVICE => 3758096933

    /**
     * Native name: ERROR_NOT_INSTALLED
     * @type {Integer (UInt32)}
     */
    static NOT_INSTALLED => 3758100480

    /**
     * Native name: ERROR_SUCCESS
     * @type {Integer (UInt32)}
     */
    static SUCCESS => 0

    /**
     * Native name: ERROR_INVALID_FUNCTION
     * @type {Integer (UInt32)}
     */
    static INVALID_FUNCTION => 1

    /**
     * Native name: ERROR_FILE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static FILE_NOT_FOUND => 2

    /**
     * Native name: ERROR_PATH_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static PATH_NOT_FOUND => 3

    /**
     * Native name: ERROR_TOO_MANY_OPEN_FILES
     * @type {Integer (UInt32)}
     */
    static TOO_MANY_OPEN_FILES => 4

    /**
     * Native name: ERROR_ACCESS_DENIED
     * @type {Integer (UInt32)}
     */
    static ACCESS_DENIED => 5

    /**
     * Native name: ERROR_INVALID_HANDLE
     * @type {Integer (UInt32)}
     */
    static INVALID_HANDLE => 6

    /**
     * Native name: ERROR_ARENA_TRASHED
     * @type {Integer (UInt32)}
     */
    static ARENA_TRASHED => 7

    /**
     * Native name: ERROR_NOT_ENOUGH_MEMORY
     * @type {Integer (UInt32)}
     */
    static NOT_ENOUGH_MEMORY => 8

    /**
     * Native name: ERROR_INVALID_BLOCK
     * @type {Integer (UInt32)}
     */
    static INVALID_BLOCK => 9

    /**
     * Native name: ERROR_BAD_ENVIRONMENT
     * @type {Integer (UInt32)}
     */
    static BAD_ENVIRONMENT => 10

    /**
     * Native name: ERROR_BAD_FORMAT
     * @type {Integer (UInt32)}
     */
    static BAD_FORMAT => 11

    /**
     * Native name: ERROR_INVALID_ACCESS
     * @type {Integer (UInt32)}
     */
    static INVALID_ACCESS => 12

    /**
     * Native name: ERROR_INVALID_DATA
     * @type {Integer (UInt32)}
     */
    static INVALID_DATA => 13

    /**
     * Native name: ERROR_OUTOFMEMORY
     * @type {Integer (UInt32)}
     */
    static OUTOFMEMORY => 14

    /**
     * Native name: ERROR_INVALID_DRIVE
     * @type {Integer (UInt32)}
     */
    static INVALID_DRIVE => 15

    /**
     * Native name: ERROR_CURRENT_DIRECTORY
     * @type {Integer (UInt32)}
     */
    static CURRENT_DIRECTORY => 16

    /**
     * Native name: ERROR_NOT_SAME_DEVICE
     * @type {Integer (UInt32)}
     */
    static NOT_SAME_DEVICE => 17

    /**
     * Native name: ERROR_NO_MORE_FILES
     * @type {Integer (UInt32)}
     */
    static NO_MORE_FILES => 18

    /**
     * Native name: ERROR_WRITE_PROTECT
     * @type {Integer (UInt32)}
     */
    static WRITE_PROTECT => 19

    /**
     * Native name: ERROR_BAD_UNIT
     * @type {Integer (UInt32)}
     */
    static BAD_UNIT => 20

    /**
     * Native name: ERROR_NOT_READY
     * @type {Integer (UInt32)}
     */
    static NOT_READY => 21

    /**
     * Native name: ERROR_BAD_COMMAND
     * @type {Integer (UInt32)}
     */
    static BAD_COMMAND => 22

    /**
     * Native name: ERROR_CRC
     * @type {Integer (UInt32)}
     */
    static CRC => 23

    /**
     * Native name: ERROR_BAD_LENGTH
     * @type {Integer (UInt32)}
     */
    static BAD_LENGTH => 24

    /**
     * Native name: ERROR_SEEK
     * @type {Integer (UInt32)}
     */
    static SEEK => 25

    /**
     * Native name: ERROR_NOT_DOS_DISK
     * @type {Integer (UInt32)}
     */
    static NOT_DOS_DISK => 26

    /**
     * Native name: ERROR_SECTOR_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static SECTOR_NOT_FOUND => 27

    /**
     * Native name: ERROR_OUT_OF_PAPER
     * @type {Integer (UInt32)}
     */
    static OUT_OF_PAPER => 28

    /**
     * Native name: ERROR_WRITE_FAULT
     * @type {Integer (UInt32)}
     */
    static WRITE_FAULT => 29

    /**
     * Native name: ERROR_READ_FAULT
     * @type {Integer (UInt32)}
     */
    static READ_FAULT => 30

    /**
     * Native name: ERROR_GEN_FAILURE
     * @type {Integer (UInt32)}
     */
    static GEN_FAILURE => 31

    /**
     * Native name: ERROR_SHARING_VIOLATION
     * @type {Integer (UInt32)}
     */
    static SHARING_VIOLATION => 32

    /**
     * Native name: ERROR_LOCK_VIOLATION
     * @type {Integer (UInt32)}
     */
    static LOCK_VIOLATION => 33

    /**
     * Native name: ERROR_WRONG_DISK
     * @type {Integer (UInt32)}
     */
    static WRONG_DISK => 34

    /**
     * Native name: ERROR_SHARING_BUFFER_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static SHARING_BUFFER_EXCEEDED => 36

    /**
     * Native name: ERROR_HANDLE_EOF
     * @type {Integer (UInt32)}
     */
    static HANDLE_EOF => 38

    /**
     * Native name: ERROR_HANDLE_DISK_FULL
     * @type {Integer (UInt32)}
     */
    static HANDLE_DISK_FULL => 39

    /**
     * Native name: ERROR_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static NOT_SUPPORTED => 50

    /**
     * Native name: ERROR_REM_NOT_LIST
     * @type {Integer (UInt32)}
     */
    static REM_NOT_LIST => 51

    /**
     * Native name: ERROR_DUP_NAME
     * @type {Integer (UInt32)}
     */
    static DUP_NAME => 52

    /**
     * Native name: ERROR_BAD_NETPATH
     * @type {Integer (UInt32)}
     */
    static BAD_NETPATH => 53

    /**
     * Native name: ERROR_NETWORK_BUSY
     * @type {Integer (UInt32)}
     */
    static NETWORK_BUSY => 54

    /**
     * Native name: ERROR_DEV_NOT_EXIST
     * @type {Integer (UInt32)}
     */
    static DEV_NOT_EXIST => 55

    /**
     * Native name: ERROR_TOO_MANY_CMDS
     * @type {Integer (UInt32)}
     */
    static TOO_MANY_CMDS => 56

    /**
     * Native name: ERROR_ADAP_HDW_ERR
     * @type {Integer (UInt32)}
     */
    static ADAP_HDW_ERR => 57

    /**
     * Native name: ERROR_BAD_NET_RESP
     * @type {Integer (UInt32)}
     */
    static BAD_NET_RESP => 58

    /**
     * Native name: ERROR_UNEXP_NET_ERR
     * @type {Integer (UInt32)}
     */
    static UNEXP_NET_ERR => 59

    /**
     * Native name: ERROR_BAD_REM_ADAP
     * @type {Integer (UInt32)}
     */
    static BAD_REM_ADAP => 60

    /**
     * Native name: ERROR_PRINTQ_FULL
     * @type {Integer (UInt32)}
     */
    static PRINTQ_FULL => 61

    /**
     * Native name: ERROR_NO_SPOOL_SPACE
     * @type {Integer (UInt32)}
     */
    static NO_SPOOL_SPACE => 62

    /**
     * Native name: ERROR_PRINT_CANCELLED
     * @type {Integer (UInt32)}
     */
    static PRINT_CANCELLED => 63

    /**
     * Native name: ERROR_NETNAME_DELETED
     * @type {Integer (UInt32)}
     */
    static NETNAME_DELETED => 64

    /**
     * Native name: ERROR_NETWORK_ACCESS_DENIED
     * @type {Integer (UInt32)}
     */
    static NETWORK_ACCESS_DENIED => 65

    /**
     * Native name: ERROR_BAD_DEV_TYPE
     * @type {Integer (UInt32)}
     */
    static BAD_DEV_TYPE => 66

    /**
     * Native name: ERROR_BAD_NET_NAME
     * @type {Integer (UInt32)}
     */
    static BAD_NET_NAME => 67

    /**
     * Native name: ERROR_TOO_MANY_NAMES
     * @type {Integer (UInt32)}
     */
    static TOO_MANY_NAMES => 68

    /**
     * Native name: ERROR_TOO_MANY_SESS
     * @type {Integer (UInt32)}
     */
    static TOO_MANY_SESS => 69

    /**
     * Native name: ERROR_SHARING_PAUSED
     * @type {Integer (UInt32)}
     */
    static SHARING_PAUSED => 70

    /**
     * Native name: ERROR_REQ_NOT_ACCEP
     * @type {Integer (UInt32)}
     */
    static REQ_NOT_ACCEP => 71

    /**
     * Native name: ERROR_REDIR_PAUSED
     * @type {Integer (UInt32)}
     */
    static REDIR_PAUSED => 72

    /**
     * Native name: ERROR_FILE_EXISTS
     * @type {Integer (UInt32)}
     */
    static FILE_EXISTS => 80

    /**
     * Native name: ERROR_CANNOT_MAKE
     * @type {Integer (UInt32)}
     */
    static CANNOT_MAKE => 82

    /**
     * Native name: ERROR_FAIL_I24
     * @type {Integer (UInt32)}
     */
    static FAIL_I24 => 83

    /**
     * Native name: ERROR_OUT_OF_STRUCTURES
     * @type {Integer (UInt32)}
     */
    static OUT_OF_STRUCTURES => 84

    /**
     * Native name: ERROR_ALREADY_ASSIGNED
     * @type {Integer (UInt32)}
     */
    static ALREADY_ASSIGNED => 85

    /**
     * Native name: ERROR_INVALID_PASSWORD
     * @type {Integer (UInt32)}
     */
    static INVALID_PASSWORD => 86

    /**
     * Native name: ERROR_INVALID_PARAMETER
     * @type {Integer (UInt32)}
     */
    static INVALID_PARAMETER => 87

    /**
     * Native name: ERROR_NET_WRITE_FAULT
     * @type {Integer (UInt32)}
     */
    static NET_WRITE_FAULT => 88

    /**
     * Native name: ERROR_NO_PROC_SLOTS
     * @type {Integer (UInt32)}
     */
    static NO_PROC_SLOTS => 89

    /**
     * Native name: ERROR_TOO_MANY_SEMAPHORES
     * @type {Integer (UInt32)}
     */
    static TOO_MANY_SEMAPHORES => 100

    /**
     * Native name: ERROR_EXCL_SEM_ALREADY_OWNED
     * @type {Integer (UInt32)}
     */
    static EXCL_SEM_ALREADY_OWNED => 101

    /**
     * Native name: ERROR_SEM_IS_SET
     * @type {Integer (UInt32)}
     */
    static SEM_IS_SET => 102

    /**
     * Native name: ERROR_TOO_MANY_SEM_REQUESTS
     * @type {Integer (UInt32)}
     */
    static TOO_MANY_SEM_REQUESTS => 103

    /**
     * Native name: ERROR_INVALID_AT_INTERRUPT_TIME
     * @type {Integer (UInt32)}
     */
    static INVALID_AT_INTERRUPT_TIME => 104

    /**
     * Native name: ERROR_SEM_OWNER_DIED
     * @type {Integer (UInt32)}
     */
    static SEM_OWNER_DIED => 105

    /**
     * Native name: ERROR_SEM_USER_LIMIT
     * @type {Integer (UInt32)}
     */
    static SEM_USER_LIMIT => 106

    /**
     * Native name: ERROR_DISK_CHANGE
     * @type {Integer (UInt32)}
     */
    static DISK_CHANGE => 107

    /**
     * Native name: ERROR_DRIVE_LOCKED
     * @type {Integer (UInt32)}
     */
    static DRIVE_LOCKED => 108

    /**
     * Native name: ERROR_BROKEN_PIPE
     * @type {Integer (UInt32)}
     */
    static BROKEN_PIPE => 109

    /**
     * Native name: ERROR_OPEN_FAILED
     * @type {Integer (UInt32)}
     */
    static OPEN_FAILED => 110

    /**
     * Native name: ERROR_BUFFER_OVERFLOW
     * @type {Integer (UInt32)}
     */
    static BUFFER_OVERFLOW => 111

    /**
     * Native name: ERROR_DISK_FULL
     * @type {Integer (UInt32)}
     */
    static DISK_FULL => 112

    /**
     * Native name: ERROR_NO_MORE_SEARCH_HANDLES
     * @type {Integer (UInt32)}
     */
    static NO_MORE_SEARCH_HANDLES => 113

    /**
     * Native name: ERROR_INVALID_TARGET_HANDLE
     * @type {Integer (UInt32)}
     */
    static INVALID_TARGET_HANDLE => 114

    /**
     * Native name: ERROR_INVALID_CATEGORY
     * @type {Integer (UInt32)}
     */
    static INVALID_CATEGORY => 117

    /**
     * Native name: ERROR_INVALID_VERIFY_SWITCH
     * @type {Integer (UInt32)}
     */
    static INVALID_VERIFY_SWITCH => 118

    /**
     * Native name: ERROR_BAD_DRIVER_LEVEL
     * @type {Integer (UInt32)}
     */
    static BAD_DRIVER_LEVEL => 119

    /**
     * Native name: ERROR_CALL_NOT_IMPLEMENTED
     * @type {Integer (UInt32)}
     */
    static CALL_NOT_IMPLEMENTED => 120

    /**
     * Native name: ERROR_SEM_TIMEOUT
     * @type {Integer (UInt32)}
     */
    static SEM_TIMEOUT => 121

    /**
     * Native name: ERROR_INSUFFICIENT_BUFFER
     * @type {Integer (UInt32)}
     */
    static INSUFFICIENT_BUFFER => 122

    /**
     * Native name: ERROR_INVALID_NAME
     * @type {Integer (UInt32)}
     */
    static INVALID_NAME => 123

    /**
     * Native name: ERROR_INVALID_LEVEL
     * @type {Integer (UInt32)}
     */
    static INVALID_LEVEL => 124

    /**
     * Native name: ERROR_NO_VOLUME_LABEL
     * @type {Integer (UInt32)}
     */
    static NO_VOLUME_LABEL => 125

    /**
     * Native name: ERROR_MOD_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static MOD_NOT_FOUND => 126

    /**
     * Native name: ERROR_PROC_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static PROC_NOT_FOUND => 127

    /**
     * Native name: ERROR_WAIT_NO_CHILDREN
     * @type {Integer (UInt32)}
     */
    static WAIT_NO_CHILDREN => 128

    /**
     * Native name: ERROR_CHILD_NOT_COMPLETE
     * @type {Integer (UInt32)}
     */
    static CHILD_NOT_COMPLETE => 129

    /**
     * Native name: ERROR_DIRECT_ACCESS_HANDLE
     * @type {Integer (UInt32)}
     */
    static DIRECT_ACCESS_HANDLE => 130

    /**
     * Native name: ERROR_NEGATIVE_SEEK
     * @type {Integer (UInt32)}
     */
    static NEGATIVE_SEEK => 131

    /**
     * Native name: ERROR_SEEK_ON_DEVICE
     * @type {Integer (UInt32)}
     */
    static SEEK_ON_DEVICE => 132

    /**
     * Native name: ERROR_IS_JOIN_TARGET
     * @type {Integer (UInt32)}
     */
    static IS_JOIN_TARGET => 133

    /**
     * Native name: ERROR_IS_JOINED
     * @type {Integer (UInt32)}
     */
    static IS_JOINED => 134

    /**
     * Native name: ERROR_IS_SUBSTED
     * @type {Integer (UInt32)}
     */
    static IS_SUBSTED => 135

    /**
     * Native name: ERROR_NOT_JOINED
     * @type {Integer (UInt32)}
     */
    static NOT_JOINED => 136

    /**
     * Native name: ERROR_NOT_SUBSTED
     * @type {Integer (UInt32)}
     */
    static NOT_SUBSTED => 137

    /**
     * Native name: ERROR_JOIN_TO_JOIN
     * @type {Integer (UInt32)}
     */
    static JOIN_TO_JOIN => 138

    /**
     * Native name: ERROR_SUBST_TO_SUBST
     * @type {Integer (UInt32)}
     */
    static SUBST_TO_SUBST => 139

    /**
     * Native name: ERROR_JOIN_TO_SUBST
     * @type {Integer (UInt32)}
     */
    static JOIN_TO_SUBST => 140

    /**
     * Native name: ERROR_SUBST_TO_JOIN
     * @type {Integer (UInt32)}
     */
    static SUBST_TO_JOIN => 141

    /**
     * Native name: ERROR_BUSY_DRIVE
     * @type {Integer (UInt32)}
     */
    static BUSY_DRIVE => 142

    /**
     * Native name: ERROR_SAME_DRIVE
     * @type {Integer (UInt32)}
     */
    static SAME_DRIVE => 143

    /**
     * Native name: ERROR_DIR_NOT_ROOT
     * @type {Integer (UInt32)}
     */
    static DIR_NOT_ROOT => 144

    /**
     * Native name: ERROR_DIR_NOT_EMPTY
     * @type {Integer (UInt32)}
     */
    static DIR_NOT_EMPTY => 145

    /**
     * Native name: ERROR_IS_SUBST_PATH
     * @type {Integer (UInt32)}
     */
    static IS_SUBST_PATH => 146

    /**
     * Native name: ERROR_IS_JOIN_PATH
     * @type {Integer (UInt32)}
     */
    static IS_JOIN_PATH => 147

    /**
     * Native name: ERROR_PATH_BUSY
     * @type {Integer (UInt32)}
     */
    static PATH_BUSY => 148

    /**
     * Native name: ERROR_IS_SUBST_TARGET
     * @type {Integer (UInt32)}
     */
    static IS_SUBST_TARGET => 149

    /**
     * Native name: ERROR_SYSTEM_TRACE
     * @type {Integer (UInt32)}
     */
    static SYSTEM_TRACE => 150

    /**
     * Native name: ERROR_INVALID_EVENT_COUNT
     * @type {Integer (UInt32)}
     */
    static INVALID_EVENT_COUNT => 151

    /**
     * Native name: ERROR_TOO_MANY_MUXWAITERS
     * @type {Integer (UInt32)}
     */
    static TOO_MANY_MUXWAITERS => 152

    /**
     * Native name: ERROR_INVALID_LIST_FORMAT
     * @type {Integer (UInt32)}
     */
    static INVALID_LIST_FORMAT => 153

    /**
     * Native name: ERROR_LABEL_TOO_LONG
     * @type {Integer (UInt32)}
     */
    static LABEL_TOO_LONG => 154

    /**
     * Native name: ERROR_TOO_MANY_TCBS
     * @type {Integer (UInt32)}
     */
    static TOO_MANY_TCBS => 155

    /**
     * Native name: ERROR_SIGNAL_REFUSED
     * @type {Integer (UInt32)}
     */
    static SIGNAL_REFUSED => 156

    /**
     * Native name: ERROR_DISCARDED
     * @type {Integer (UInt32)}
     */
    static DISCARDED => 157

    /**
     * Native name: ERROR_NOT_LOCKED
     * @type {Integer (UInt32)}
     */
    static NOT_LOCKED => 158

    /**
     * Native name: ERROR_BAD_THREADID_ADDR
     * @type {Integer (UInt32)}
     */
    static BAD_THREADID_ADDR => 159

    /**
     * Native name: ERROR_BAD_ARGUMENTS
     * @type {Integer (UInt32)}
     */
    static BAD_ARGUMENTS => 160

    /**
     * Native name: ERROR_BAD_PATHNAME
     * @type {Integer (UInt32)}
     */
    static BAD_PATHNAME => 161

    /**
     * Native name: ERROR_SIGNAL_PENDING
     * @type {Integer (UInt32)}
     */
    static SIGNAL_PENDING => 162

    /**
     * Native name: ERROR_MAX_THRDS_REACHED
     * @type {Integer (UInt32)}
     */
    static MAX_THRDS_REACHED => 164

    /**
     * Native name: ERROR_LOCK_FAILED
     * @type {Integer (UInt32)}
     */
    static LOCK_FAILED => 167

    /**
     * Native name: ERROR_BUSY
     * @type {Integer (UInt32)}
     */
    static BUSY => 170

    /**
     * Native name: ERROR_DEVICE_SUPPORT_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static DEVICE_SUPPORT_IN_PROGRESS => 171

    /**
     * Native name: ERROR_CANCEL_VIOLATION
     * @type {Integer (UInt32)}
     */
    static CANCEL_VIOLATION => 173

    /**
     * Native name: ERROR_ATOMIC_LOCKS_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static ATOMIC_LOCKS_NOT_SUPPORTED => 174

    /**
     * Native name: ERROR_INVALID_SEGMENT_NUMBER
     * @type {Integer (UInt32)}
     */
    static INVALID_SEGMENT_NUMBER => 180

    /**
     * Native name: ERROR_INVALID_ORDINAL
     * @type {Integer (UInt32)}
     */
    static INVALID_ORDINAL => 182

    /**
     * Native name: ERROR_ALREADY_EXISTS
     * @type {Integer (UInt32)}
     */
    static ALREADY_EXISTS => 183

    /**
     * Native name: ERROR_INVALID_FLAG_NUMBER
     * @type {Integer (UInt32)}
     */
    static INVALID_FLAG_NUMBER => 186

    /**
     * Native name: ERROR_SEM_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static SEM_NOT_FOUND => 187

    /**
     * Native name: ERROR_INVALID_STARTING_CODESEG
     * @type {Integer (UInt32)}
     */
    static INVALID_STARTING_CODESEG => 188

    /**
     * Native name: ERROR_INVALID_STACKSEG
     * @type {Integer (UInt32)}
     */
    static INVALID_STACKSEG => 189

    /**
     * Native name: ERROR_INVALID_MODULETYPE
     * @type {Integer (UInt32)}
     */
    static INVALID_MODULETYPE => 190

    /**
     * Native name: ERROR_INVALID_EXE_SIGNATURE
     * @type {Integer (UInt32)}
     */
    static INVALID_EXE_SIGNATURE => 191

    /**
     * Native name: ERROR_EXE_MARKED_INVALID
     * @type {Integer (UInt32)}
     */
    static EXE_MARKED_INVALID => 192

    /**
     * Native name: ERROR_BAD_EXE_FORMAT
     * @type {Integer (UInt32)}
     */
    static BAD_EXE_FORMAT => 193

    /**
     * Native name: ERROR_ITERATED_DATA_EXCEEDS_64k
     * @type {Integer (UInt32)}
     */
    static ITERATED_DATA_EXCEEDS_64k => 194

    /**
     * Native name: ERROR_INVALID_MINALLOCSIZE
     * @type {Integer (UInt32)}
     */
    static INVALID_MINALLOCSIZE => 195

    /**
     * Native name: ERROR_DYNLINK_FROM_INVALID_RING
     * @type {Integer (UInt32)}
     */
    static DYNLINK_FROM_INVALID_RING => 196

    /**
     * Native name: ERROR_IOPL_NOT_ENABLED
     * @type {Integer (UInt32)}
     */
    static IOPL_NOT_ENABLED => 197

    /**
     * Native name: ERROR_INVALID_SEGDPL
     * @type {Integer (UInt32)}
     */
    static INVALID_SEGDPL => 198

    /**
     * Native name: ERROR_AUTODATASEG_EXCEEDS_64k
     * @type {Integer (UInt32)}
     */
    static AUTODATASEG_EXCEEDS_64k => 199

    /**
     * Native name: ERROR_RING2SEG_MUST_BE_MOVABLE
     * @type {Integer (UInt32)}
     */
    static RING2SEG_MUST_BE_MOVABLE => 200

    /**
     * Native name: ERROR_RELOC_CHAIN_XEEDS_SEGLIM
     * @type {Integer (UInt32)}
     */
    static RELOC_CHAIN_XEEDS_SEGLIM => 201

    /**
     * Native name: ERROR_INFLOOP_IN_RELOC_CHAIN
     * @type {Integer (UInt32)}
     */
    static INFLOOP_IN_RELOC_CHAIN => 202

    /**
     * Native name: ERROR_ENVVAR_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static ENVVAR_NOT_FOUND => 203

    /**
     * Native name: ERROR_NO_SIGNAL_SENT
     * @type {Integer (UInt32)}
     */
    static NO_SIGNAL_SENT => 205

    /**
     * Native name: ERROR_FILENAME_EXCED_RANGE
     * @type {Integer (UInt32)}
     */
    static FILENAME_EXCED_RANGE => 206

    /**
     * Native name: ERROR_RING2_STACK_IN_USE
     * @type {Integer (UInt32)}
     */
    static RING2_STACK_IN_USE => 207

    /**
     * Native name: ERROR_META_EXPANSION_TOO_LONG
     * @type {Integer (UInt32)}
     */
    static META_EXPANSION_TOO_LONG => 208

    /**
     * Native name: ERROR_INVALID_SIGNAL_NUMBER
     * @type {Integer (UInt32)}
     */
    static INVALID_SIGNAL_NUMBER => 209

    /**
     * Native name: ERROR_THREAD_1_INACTIVE
     * @type {Integer (UInt32)}
     */
    static THREAD_1_INACTIVE => 210

    /**
     * Native name: ERROR_LOCKED
     * @type {Integer (UInt32)}
     */
    static LOCKED => 212

    /**
     * Native name: ERROR_TOO_MANY_MODULES
     * @type {Integer (UInt32)}
     */
    static TOO_MANY_MODULES => 214

    /**
     * Native name: ERROR_NESTING_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static NESTING_NOT_ALLOWED => 215

    /**
     * Native name: ERROR_EXE_MACHINE_TYPE_MISMATCH
     * @type {Integer (UInt32)}
     */
    static EXE_MACHINE_TYPE_MISMATCH => 216

    /**
     * Native name: ERROR_EXE_CANNOT_MODIFY_SIGNED_BINARY
     * @type {Integer (UInt32)}
     */
    static EXE_CANNOT_MODIFY_SIGNED_BINARY => 217

    /**
     * Native name: ERROR_EXE_CANNOT_MODIFY_STRONG_SIGNED_BINARY
     * @type {Integer (UInt32)}
     */
    static EXE_CANNOT_MODIFY_STRONG_SIGNED_BINARY => 218

    /**
     * Native name: ERROR_FILE_CHECKED_OUT
     * @type {Integer (UInt32)}
     */
    static FILE_CHECKED_OUT => 220

    /**
     * Native name: ERROR_CHECKOUT_REQUIRED
     * @type {Integer (UInt32)}
     */
    static CHECKOUT_REQUIRED => 221

    /**
     * Native name: ERROR_BAD_FILE_TYPE
     * @type {Integer (UInt32)}
     */
    static BAD_FILE_TYPE => 222

    /**
     * Native name: ERROR_FILE_TOO_LARGE
     * @type {Integer (UInt32)}
     */
    static FILE_TOO_LARGE => 223

    /**
     * Native name: ERROR_FORMS_AUTH_REQUIRED
     * @type {Integer (UInt32)}
     */
    static FORMS_AUTH_REQUIRED => 224

    /**
     * Native name: ERROR_VIRUS_INFECTED
     * @type {Integer (UInt32)}
     */
    static VIRUS_INFECTED => 225

    /**
     * Native name: ERROR_VIRUS_DELETED
     * @type {Integer (UInt32)}
     */
    static VIRUS_DELETED => 226

    /**
     * Native name: ERROR_PIPE_LOCAL
     * @type {Integer (UInt32)}
     */
    static PIPE_LOCAL => 229

    /**
     * Native name: ERROR_BAD_PIPE
     * @type {Integer (UInt32)}
     */
    static BAD_PIPE => 230

    /**
     * Native name: ERROR_PIPE_BUSY
     * @type {Integer (UInt32)}
     */
    static PIPE_BUSY => 231

    /**
     * Native name: ERROR_NO_DATA
     * @type {Integer (UInt32)}
     */
    static NO_DATA => 232

    /**
     * Native name: ERROR_PIPE_NOT_CONNECTED
     * @type {Integer (UInt32)}
     */
    static PIPE_NOT_CONNECTED => 233

    /**
     * Native name: ERROR_MORE_DATA
     * @type {Integer (UInt32)}
     */
    static MORE_DATA => 234

    /**
     * Native name: ERROR_NO_WORK_DONE
     * @type {Integer (UInt32)}
     */
    static NO_WORK_DONE => 235

    /**
     * Native name: ERROR_VC_DISCONNECTED
     * @type {Integer (UInt32)}
     */
    static VC_DISCONNECTED => 240

    /**
     * Native name: ERROR_INVALID_EA_NAME
     * @type {Integer (UInt32)}
     */
    static INVALID_EA_NAME => 254

    /**
     * Native name: ERROR_EA_LIST_INCONSISTENT
     * @type {Integer (UInt32)}
     */
    static EA_LIST_INCONSISTENT => 255

    /**
     * Native name: ERROR_NO_MORE_ITEMS
     * @type {Integer (UInt32)}
     */
    static NO_MORE_ITEMS => 259

    /**
     * Native name: ERROR_CANNOT_COPY
     * @type {Integer (UInt32)}
     */
    static CANNOT_COPY => 266

    /**
     * Native name: ERROR_DIRECTORY
     * @type {Integer (UInt32)}
     */
    static DIRECTORY => 267

    /**
     * Native name: ERROR_EAS_DIDNT_FIT
     * @type {Integer (UInt32)}
     */
    static EAS_DIDNT_FIT => 275

    /**
     * Native name: ERROR_EA_FILE_CORRUPT
     * @type {Integer (UInt32)}
     */
    static EA_FILE_CORRUPT => 276

    /**
     * Native name: ERROR_EA_TABLE_FULL
     * @type {Integer (UInt32)}
     */
    static EA_TABLE_FULL => 277

    /**
     * Native name: ERROR_INVALID_EA_HANDLE
     * @type {Integer (UInt32)}
     */
    static INVALID_EA_HANDLE => 278

    /**
     * Native name: ERROR_EAS_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static EAS_NOT_SUPPORTED => 282

    /**
     * Native name: ERROR_NOT_OWNER
     * @type {Integer (UInt32)}
     */
    static NOT_OWNER => 288

    /**
     * Native name: ERROR_TOO_MANY_POSTS
     * @type {Integer (UInt32)}
     */
    static TOO_MANY_POSTS => 298

    /**
     * Native name: ERROR_PARTIAL_COPY
     * @type {Integer (UInt32)}
     */
    static PARTIAL_COPY => 299

    /**
     * Native name: ERROR_OPLOCK_NOT_GRANTED
     * @type {Integer (UInt32)}
     */
    static OPLOCK_NOT_GRANTED => 300

    /**
     * Native name: ERROR_INVALID_OPLOCK_PROTOCOL
     * @type {Integer (UInt32)}
     */
    static INVALID_OPLOCK_PROTOCOL => 301

    /**
     * Native name: ERROR_DISK_TOO_FRAGMENTED
     * @type {Integer (UInt32)}
     */
    static DISK_TOO_FRAGMENTED => 302

    /**
     * Native name: ERROR_DELETE_PENDING
     * @type {Integer (UInt32)}
     */
    static DELETE_PENDING => 303

    /**
     * Native name: ERROR_INCOMPATIBLE_WITH_GLOBAL_SHORT_NAME_REGISTRY_SETTING
     * @type {Integer (UInt32)}
     */
    static INCOMPATIBLE_WITH_GLOBAL_SHORT_NAME_REGISTRY_SETTING => 304

    /**
     * Native name: ERROR_SHORT_NAMES_NOT_ENABLED_ON_VOLUME
     * @type {Integer (UInt32)}
     */
    static SHORT_NAMES_NOT_ENABLED_ON_VOLUME => 305

    /**
     * Native name: ERROR_SECURITY_STREAM_IS_INCONSISTENT
     * @type {Integer (UInt32)}
     */
    static SECURITY_STREAM_IS_INCONSISTENT => 306

    /**
     * Native name: ERROR_INVALID_LOCK_RANGE
     * @type {Integer (UInt32)}
     */
    static INVALID_LOCK_RANGE => 307

    /**
     * Native name: ERROR_IMAGE_SUBSYSTEM_NOT_PRESENT
     * @type {Integer (UInt32)}
     */
    static IMAGE_SUBSYSTEM_NOT_PRESENT => 308

    /**
     * Native name: ERROR_NOTIFICATION_GUID_ALREADY_DEFINED
     * @type {Integer (UInt32)}
     */
    static NOTIFICATION_GUID_ALREADY_DEFINED => 309

    /**
     * Native name: ERROR_INVALID_EXCEPTION_HANDLER
     * @type {Integer (UInt32)}
     */
    static INVALID_EXCEPTION_HANDLER => 310

    /**
     * Native name: ERROR_DUPLICATE_PRIVILEGES
     * @type {Integer (UInt32)}
     */
    static DUPLICATE_PRIVILEGES => 311

    /**
     * Native name: ERROR_NO_RANGES_PROCESSED
     * @type {Integer (UInt32)}
     */
    static NO_RANGES_PROCESSED => 312

    /**
     * Native name: ERROR_NOT_ALLOWED_ON_SYSTEM_FILE
     * @type {Integer (UInt32)}
     */
    static NOT_ALLOWED_ON_SYSTEM_FILE => 313

    /**
     * Native name: ERROR_DISK_RESOURCES_EXHAUSTED
     * @type {Integer (UInt32)}
     */
    static DISK_RESOURCES_EXHAUSTED => 314

    /**
     * Native name: ERROR_INVALID_TOKEN
     * @type {Integer (UInt32)}
     */
    static INVALID_TOKEN => 315

    /**
     * Native name: ERROR_DEVICE_FEATURE_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static DEVICE_FEATURE_NOT_SUPPORTED => 316

    /**
     * Native name: ERROR_MR_MID_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static MR_MID_NOT_FOUND => 317

    /**
     * Native name: ERROR_SCOPE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static SCOPE_NOT_FOUND => 318

    /**
     * Native name: ERROR_UNDEFINED_SCOPE
     * @type {Integer (UInt32)}
     */
    static UNDEFINED_SCOPE => 319

    /**
     * Native name: ERROR_INVALID_CAP
     * @type {Integer (UInt32)}
     */
    static INVALID_CAP => 320

    /**
     * Native name: ERROR_DEVICE_UNREACHABLE
     * @type {Integer (UInt32)}
     */
    static DEVICE_UNREACHABLE => 321

    /**
     * Native name: ERROR_DEVICE_NO_RESOURCES
     * @type {Integer (UInt32)}
     */
    static DEVICE_NO_RESOURCES => 322

    /**
     * Native name: ERROR_DATA_CHECKSUM_ERROR
     * @type {Integer (UInt32)}
     */
    static DATA_CHECKSUM_ERROR => 323

    /**
     * Native name: ERROR_INTERMIXED_KERNEL_EA_OPERATION
     * @type {Integer (UInt32)}
     */
    static INTERMIXED_KERNEL_EA_OPERATION => 324

    /**
     * Native name: ERROR_FILE_LEVEL_TRIM_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static FILE_LEVEL_TRIM_NOT_SUPPORTED => 326

    /**
     * Native name: ERROR_OFFSET_ALIGNMENT_VIOLATION
     * @type {Integer (UInt32)}
     */
    static OFFSET_ALIGNMENT_VIOLATION => 327

    /**
     * Native name: ERROR_INVALID_FIELD_IN_PARAMETER_LIST
     * @type {Integer (UInt32)}
     */
    static INVALID_FIELD_IN_PARAMETER_LIST => 328

    /**
     * Native name: ERROR_OPERATION_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static OPERATION_IN_PROGRESS => 329

    /**
     * Native name: ERROR_BAD_DEVICE_PATH
     * @type {Integer (UInt32)}
     */
    static BAD_DEVICE_PATH => 330

    /**
     * Native name: ERROR_TOO_MANY_DESCRIPTORS
     * @type {Integer (UInt32)}
     */
    static TOO_MANY_DESCRIPTORS => 331

    /**
     * Native name: ERROR_SCRUB_DATA_DISABLED
     * @type {Integer (UInt32)}
     */
    static SCRUB_DATA_DISABLED => 332

    /**
     * Native name: ERROR_NOT_REDUNDANT_STORAGE
     * @type {Integer (UInt32)}
     */
    static NOT_REDUNDANT_STORAGE => 333

    /**
     * Native name: ERROR_RESIDENT_FILE_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static RESIDENT_FILE_NOT_SUPPORTED => 334

    /**
     * Native name: ERROR_COMPRESSED_FILE_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static COMPRESSED_FILE_NOT_SUPPORTED => 335

    /**
     * Native name: ERROR_DIRECTORY_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static DIRECTORY_NOT_SUPPORTED => 336

    /**
     * Native name: ERROR_NOT_READ_FROM_COPY
     * @type {Integer (UInt32)}
     */
    static NOT_READ_FROM_COPY => 337

    /**
     * Native name: ERROR_FT_WRITE_FAILURE
     * @type {Integer (UInt32)}
     */
    static FT_WRITE_FAILURE => 338

    /**
     * Native name: ERROR_FT_DI_SCAN_REQUIRED
     * @type {Integer (UInt32)}
     */
    static FT_DI_SCAN_REQUIRED => 339

    /**
     * Native name: ERROR_INVALID_KERNEL_INFO_VERSION
     * @type {Integer (UInt32)}
     */
    static INVALID_KERNEL_INFO_VERSION => 340

    /**
     * Native name: ERROR_INVALID_PEP_INFO_VERSION
     * @type {Integer (UInt32)}
     */
    static INVALID_PEP_INFO_VERSION => 341

    /**
     * Native name: ERROR_OBJECT_NOT_EXTERNALLY_BACKED
     * @type {Integer (UInt32)}
     */
    static OBJECT_NOT_EXTERNALLY_BACKED => 342

    /**
     * Native name: ERROR_EXTERNAL_BACKING_PROVIDER_UNKNOWN
     * @type {Integer (UInt32)}
     */
    static EXTERNAL_BACKING_PROVIDER_UNKNOWN => 343

    /**
     * Native name: ERROR_COMPRESSION_NOT_BENEFICIAL
     * @type {Integer (UInt32)}
     */
    static COMPRESSION_NOT_BENEFICIAL => 344

    /**
     * Native name: ERROR_STORAGE_TOPOLOGY_ID_MISMATCH
     * @type {Integer (UInt32)}
     */
    static STORAGE_TOPOLOGY_ID_MISMATCH => 345

    /**
     * Native name: ERROR_BLOCKED_BY_PARENTAL_CONTROLS
     * @type {Integer (UInt32)}
     */
    static BLOCKED_BY_PARENTAL_CONTROLS => 346

    /**
     * Native name: ERROR_BLOCK_TOO_MANY_REFERENCES
     * @type {Integer (UInt32)}
     */
    static BLOCK_TOO_MANY_REFERENCES => 347

    /**
     * Native name: ERROR_MARKED_TO_DISALLOW_WRITES
     * @type {Integer (UInt32)}
     */
    static MARKED_TO_DISALLOW_WRITES => 348

    /**
     * Native name: ERROR_ENCLAVE_FAILURE
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_FAILURE => 349

    /**
     * Native name: ERROR_FAIL_NOACTION_REBOOT
     * @type {Integer (UInt32)}
     */
    static FAIL_NOACTION_REBOOT => 350

    /**
     * Native name: ERROR_FAIL_SHUTDOWN
     * @type {Integer (UInt32)}
     */
    static FAIL_SHUTDOWN => 351

    /**
     * Native name: ERROR_FAIL_RESTART
     * @type {Integer (UInt32)}
     */
    static FAIL_RESTART => 352

    /**
     * Native name: ERROR_MAX_SESSIONS_REACHED
     * @type {Integer (UInt32)}
     */
    static MAX_SESSIONS_REACHED => 353

    /**
     * Native name: ERROR_NETWORK_ACCESS_DENIED_EDP
     * @type {Integer (UInt32)}
     */
    static NETWORK_ACCESS_DENIED_EDP => 354

    /**
     * Native name: ERROR_DEVICE_HINT_NAME_BUFFER_TOO_SMALL
     * @type {Integer (UInt32)}
     */
    static DEVICE_HINT_NAME_BUFFER_TOO_SMALL => 355

    /**
     * Native name: ERROR_EDP_POLICY_DENIES_OPERATION
     * @type {Integer (UInt32)}
     */
    static EDP_POLICY_DENIES_OPERATION => 356

    /**
     * Native name: ERROR_EDP_DPL_POLICY_CANT_BE_SATISFIED
     * @type {Integer (UInt32)}
     */
    static EDP_DPL_POLICY_CANT_BE_SATISFIED => 357

    /**
     * Native name: ERROR_CLOUD_FILE_SYNC_ROOT_METADATA_CORRUPT
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_SYNC_ROOT_METADATA_CORRUPT => 358

    /**
     * Native name: ERROR_DEVICE_IN_MAINTENANCE
     * @type {Integer (UInt32)}
     */
    static DEVICE_IN_MAINTENANCE => 359

    /**
     * Native name: ERROR_NOT_SUPPORTED_ON_DAX
     * @type {Integer (UInt32)}
     */
    static NOT_SUPPORTED_ON_DAX => 360

    /**
     * Native name: ERROR_DAX_MAPPING_EXISTS
     * @type {Integer (UInt32)}
     */
    static DAX_MAPPING_EXISTS => 361

    /**
     * Native name: ERROR_CLOUD_FILE_PROVIDER_NOT_RUNNING
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_PROVIDER_NOT_RUNNING => 362

    /**
     * Native name: ERROR_CLOUD_FILE_METADATA_CORRUPT
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_METADATA_CORRUPT => 363

    /**
     * Native name: ERROR_CLOUD_FILE_METADATA_TOO_LARGE
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_METADATA_TOO_LARGE => 364

    /**
     * Native name: ERROR_CLOUD_FILE_PROPERTY_BLOB_TOO_LARGE
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_PROPERTY_BLOB_TOO_LARGE => 365

    /**
     * Native name: ERROR_CLOUD_FILE_PROPERTY_BLOB_CHECKSUM_MISMATCH
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_PROPERTY_BLOB_CHECKSUM_MISMATCH => 366

    /**
     * Native name: ERROR_CHILD_PROCESS_BLOCKED
     * @type {Integer (UInt32)}
     */
    static CHILD_PROCESS_BLOCKED => 367

    /**
     * Native name: ERROR_STORAGE_LOST_DATA_PERSISTENCE
     * @type {Integer (UInt32)}
     */
    static STORAGE_LOST_DATA_PERSISTENCE => 368

    /**
     * Native name: ERROR_FILE_SYSTEM_VIRTUALIZATION_UNAVAILABLE
     * @type {Integer (UInt32)}
     */
    static FILE_SYSTEM_VIRTUALIZATION_UNAVAILABLE => 369

    /**
     * Native name: ERROR_FILE_SYSTEM_VIRTUALIZATION_METADATA_CORRUPT
     * @type {Integer (UInt32)}
     */
    static FILE_SYSTEM_VIRTUALIZATION_METADATA_CORRUPT => 370

    /**
     * Native name: ERROR_FILE_SYSTEM_VIRTUALIZATION_BUSY
     * @type {Integer (UInt32)}
     */
    static FILE_SYSTEM_VIRTUALIZATION_BUSY => 371

    /**
     * Native name: ERROR_FILE_SYSTEM_VIRTUALIZATION_PROVIDER_UNKNOWN
     * @type {Integer (UInt32)}
     */
    static FILE_SYSTEM_VIRTUALIZATION_PROVIDER_UNKNOWN => 372

    /**
     * Native name: ERROR_GDI_HANDLE_LEAK
     * @type {Integer (UInt32)}
     */
    static GDI_HANDLE_LEAK => 373

    /**
     * Native name: ERROR_CLOUD_FILE_TOO_MANY_PROPERTY_BLOBS
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_TOO_MANY_PROPERTY_BLOBS => 374

    /**
     * Native name: ERROR_CLOUD_FILE_PROPERTY_VERSION_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_PROPERTY_VERSION_NOT_SUPPORTED => 375

    /**
     * Native name: ERROR_NOT_A_CLOUD_FILE
     * @type {Integer (UInt32)}
     */
    static NOT_A_CLOUD_FILE => 376

    /**
     * Native name: ERROR_CLOUD_FILE_NOT_IN_SYNC
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_NOT_IN_SYNC => 377

    /**
     * Native name: ERROR_CLOUD_FILE_ALREADY_CONNECTED
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_ALREADY_CONNECTED => 378

    /**
     * Native name: ERROR_CLOUD_FILE_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_NOT_SUPPORTED => 379

    /**
     * Native name: ERROR_CLOUD_FILE_INVALID_REQUEST
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_INVALID_REQUEST => 380

    /**
     * Native name: ERROR_CLOUD_FILE_READ_ONLY_VOLUME
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_READ_ONLY_VOLUME => 381

    /**
     * Native name: ERROR_CLOUD_FILE_CONNECTED_PROVIDER_ONLY
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_CONNECTED_PROVIDER_ONLY => 382

    /**
     * Native name: ERROR_CLOUD_FILE_VALIDATION_FAILED
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_VALIDATION_FAILED => 383

    /**
     * Native name: ERROR_SMB1_NOT_AVAILABLE
     * @type {Integer (UInt32)}
     */
    static SMB1_NOT_AVAILABLE => 384

    /**
     * Native name: ERROR_FILE_SYSTEM_VIRTUALIZATION_INVALID_OPERATION
     * @type {Integer (UInt32)}
     */
    static FILE_SYSTEM_VIRTUALIZATION_INVALID_OPERATION => 385

    /**
     * Native name: ERROR_CLOUD_FILE_AUTHENTICATION_FAILED
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_AUTHENTICATION_FAILED => 386

    /**
     * Native name: ERROR_CLOUD_FILE_INSUFFICIENT_RESOURCES
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_INSUFFICIENT_RESOURCES => 387

    /**
     * Native name: ERROR_CLOUD_FILE_NETWORK_UNAVAILABLE
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_NETWORK_UNAVAILABLE => 388

    /**
     * Native name: ERROR_CLOUD_FILE_UNSUCCESSFUL
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_UNSUCCESSFUL => 389

    /**
     * Native name: ERROR_CLOUD_FILE_NOT_UNDER_SYNC_ROOT
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_NOT_UNDER_SYNC_ROOT => 390

    /**
     * Native name: ERROR_CLOUD_FILE_IN_USE
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_IN_USE => 391

    /**
     * Native name: ERROR_CLOUD_FILE_PINNED
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_PINNED => 392

    /**
     * Native name: ERROR_CLOUD_FILE_REQUEST_ABORTED
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_REQUEST_ABORTED => 393

    /**
     * Native name: ERROR_CLOUD_FILE_PROPERTY_CORRUPT
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_PROPERTY_CORRUPT => 394

    /**
     * Native name: ERROR_CLOUD_FILE_ACCESS_DENIED
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_ACCESS_DENIED => 395

    /**
     * Native name: ERROR_CLOUD_FILE_INCOMPATIBLE_HARDLINKS
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_INCOMPATIBLE_HARDLINKS => 396

    /**
     * Native name: ERROR_CLOUD_FILE_PROPERTY_LOCK_CONFLICT
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_PROPERTY_LOCK_CONFLICT => 397

    /**
     * Native name: ERROR_CLOUD_FILE_REQUEST_CANCELED
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_REQUEST_CANCELED => 398

    /**
     * Native name: ERROR_EXTERNAL_SYSKEY_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static EXTERNAL_SYSKEY_NOT_SUPPORTED => 399

    /**
     * Native name: ERROR_THREAD_MODE_ALREADY_BACKGROUND
     * @type {Integer (UInt32)}
     */
    static THREAD_MODE_ALREADY_BACKGROUND => 400

    /**
     * Native name: ERROR_THREAD_MODE_NOT_BACKGROUND
     * @type {Integer (UInt32)}
     */
    static THREAD_MODE_NOT_BACKGROUND => 401

    /**
     * Native name: ERROR_PROCESS_MODE_ALREADY_BACKGROUND
     * @type {Integer (UInt32)}
     */
    static PROCESS_MODE_ALREADY_BACKGROUND => 402

    /**
     * Native name: ERROR_PROCESS_MODE_NOT_BACKGROUND
     * @type {Integer (UInt32)}
     */
    static PROCESS_MODE_NOT_BACKGROUND => 403

    /**
     * Native name: ERROR_CLOUD_FILE_PROVIDER_TERMINATED
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_PROVIDER_TERMINATED => 404

    /**
     * Native name: ERROR_NOT_A_CLOUD_SYNC_ROOT
     * @type {Integer (UInt32)}
     */
    static NOT_A_CLOUD_SYNC_ROOT => 405

    /**
     * Native name: ERROR_FILE_PROTECTED_UNDER_DPL
     * @type {Integer (UInt32)}
     */
    static FILE_PROTECTED_UNDER_DPL => 406

    /**
     * Native name: ERROR_VOLUME_NOT_CLUSTER_ALIGNED
     * @type {Integer (UInt32)}
     */
    static VOLUME_NOT_CLUSTER_ALIGNED => 407

    /**
     * Native name: ERROR_NO_PHYSICALLY_ALIGNED_FREE_SPACE_FOUND
     * @type {Integer (UInt32)}
     */
    static NO_PHYSICALLY_ALIGNED_FREE_SPACE_FOUND => 408

    /**
     * Native name: ERROR_APPX_FILE_NOT_ENCRYPTED
     * @type {Integer (UInt32)}
     */
    static APPX_FILE_NOT_ENCRYPTED => 409

    /**
     * Native name: ERROR_RWRAW_ENCRYPTED_FILE_NOT_ENCRYPTED
     * @type {Integer (UInt32)}
     */
    static RWRAW_ENCRYPTED_FILE_NOT_ENCRYPTED => 410

    /**
     * Native name: ERROR_RWRAW_ENCRYPTED_INVALID_EDATAINFO_FILEOFFSET
     * @type {Integer (UInt32)}
     */
    static RWRAW_ENCRYPTED_INVALID_EDATAINFO_FILEOFFSET => 411

    /**
     * Native name: ERROR_RWRAW_ENCRYPTED_INVALID_EDATAINFO_FILERANGE
     * @type {Integer (UInt32)}
     */
    static RWRAW_ENCRYPTED_INVALID_EDATAINFO_FILERANGE => 412

    /**
     * Native name: ERROR_RWRAW_ENCRYPTED_INVALID_EDATAINFO_PARAMETER
     * @type {Integer (UInt32)}
     */
    static RWRAW_ENCRYPTED_INVALID_EDATAINFO_PARAMETER => 413

    /**
     * Native name: ERROR_LINUX_SUBSYSTEM_NOT_PRESENT
     * @type {Integer (UInt32)}
     */
    static LINUX_SUBSYSTEM_NOT_PRESENT => 414

    /**
     * Native name: ERROR_FT_READ_FAILURE
     * @type {Integer (UInt32)}
     */
    static FT_READ_FAILURE => 415

    /**
     * Native name: ERROR_STORAGE_RESERVE_ID_INVALID
     * @type {Integer (UInt32)}
     */
    static STORAGE_RESERVE_ID_INVALID => 416

    /**
     * Native name: ERROR_STORAGE_RESERVE_DOES_NOT_EXIST
     * @type {Integer (UInt32)}
     */
    static STORAGE_RESERVE_DOES_NOT_EXIST => 417

    /**
     * Native name: ERROR_STORAGE_RESERVE_ALREADY_EXISTS
     * @type {Integer (UInt32)}
     */
    static STORAGE_RESERVE_ALREADY_EXISTS => 418

    /**
     * Native name: ERROR_STORAGE_RESERVE_NOT_EMPTY
     * @type {Integer (UInt32)}
     */
    static STORAGE_RESERVE_NOT_EMPTY => 419

    /**
     * Native name: ERROR_NOT_A_DAX_VOLUME
     * @type {Integer (UInt32)}
     */
    static NOT_A_DAX_VOLUME => 420

    /**
     * Native name: ERROR_NOT_DAX_MAPPABLE
     * @type {Integer (UInt32)}
     */
    static NOT_DAX_MAPPABLE => 421

    /**
     * Native name: ERROR_TIME_SENSITIVE_THREAD
     * @type {Integer (UInt32)}
     */
    static TIME_SENSITIVE_THREAD => 422

    /**
     * Native name: ERROR_DPL_NOT_SUPPORTED_FOR_USER
     * @type {Integer (UInt32)}
     */
    static DPL_NOT_SUPPORTED_FOR_USER => 423

    /**
     * Native name: ERROR_CASE_DIFFERING_NAMES_IN_DIR
     * @type {Integer (UInt32)}
     */
    static CASE_DIFFERING_NAMES_IN_DIR => 424

    /**
     * Native name: ERROR_FILE_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static FILE_NOT_SUPPORTED => 425

    /**
     * Native name: ERROR_CLOUD_FILE_REQUEST_TIMEOUT
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_REQUEST_TIMEOUT => 426

    /**
     * Native name: ERROR_NO_TASK_QUEUE
     * @type {Integer (UInt32)}
     */
    static NO_TASK_QUEUE => 427

    /**
     * Native name: ERROR_SRC_SRV_DLL_LOAD_FAILED
     * @type {Integer (UInt32)}
     */
    static SRC_SRV_DLL_LOAD_FAILED => 428

    /**
     * Native name: ERROR_NOT_SUPPORTED_WITH_BTT
     * @type {Integer (UInt32)}
     */
    static NOT_SUPPORTED_WITH_BTT => 429

    /**
     * Native name: ERROR_ENCRYPTION_DISABLED
     * @type {Integer (UInt32)}
     */
    static ENCRYPTION_DISABLED => 430

    /**
     * Native name: ERROR_ENCRYPTING_METADATA_DISALLOWED
     * @type {Integer (UInt32)}
     */
    static ENCRYPTING_METADATA_DISALLOWED => 431

    /**
     * Native name: ERROR_CANT_CLEAR_ENCRYPTION_FLAG
     * @type {Integer (UInt32)}
     */
    static CANT_CLEAR_ENCRYPTION_FLAG => 432

    /**
     * Native name: ERROR_NO_SUCH_DEVICE
     * @type {Integer (UInt32)}
     */
    static NO_SUCH_DEVICE => 433

    /**
     * Native name: ERROR_CLOUD_FILE_DEHYDRATION_DISALLOWED
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_DEHYDRATION_DISALLOWED => 434

    /**
     * Native name: ERROR_FILE_SNAP_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static FILE_SNAP_IN_PROGRESS => 435

    /**
     * Native name: ERROR_FILE_SNAP_USER_SECTION_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static FILE_SNAP_USER_SECTION_NOT_SUPPORTED => 436

    /**
     * Native name: ERROR_FILE_SNAP_MODIFY_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static FILE_SNAP_MODIFY_NOT_SUPPORTED => 437

    /**
     * Native name: ERROR_FILE_SNAP_IO_NOT_COORDINATED
     * @type {Integer (UInt32)}
     */
    static FILE_SNAP_IO_NOT_COORDINATED => 438

    /**
     * Native name: ERROR_FILE_SNAP_UNEXPECTED_ERROR
     * @type {Integer (UInt32)}
     */
    static FILE_SNAP_UNEXPECTED_ERROR => 439

    /**
     * Native name: ERROR_FILE_SNAP_INVALID_PARAMETER
     * @type {Integer (UInt32)}
     */
    static FILE_SNAP_INVALID_PARAMETER => 440

    /**
     * Native name: ERROR_UNSATISFIED_DEPENDENCIES
     * @type {Integer (UInt32)}
     */
    static UNSATISFIED_DEPENDENCIES => 441

    /**
     * Native name: ERROR_CASE_SENSITIVE_PATH
     * @type {Integer (UInt32)}
     */
    static CASE_SENSITIVE_PATH => 442

    /**
     * Native name: ERROR_UNEXPECTED_NTCACHEMANAGER_ERROR
     * @type {Integer (UInt32)}
     */
    static UNEXPECTED_NTCACHEMANAGER_ERROR => 443

    /**
     * Native name: ERROR_LINUX_SUBSYSTEM_UPDATE_REQUIRED
     * @type {Integer (UInt32)}
     */
    static LINUX_SUBSYSTEM_UPDATE_REQUIRED => 444

    /**
     * Native name: ERROR_DLP_POLICY_WARNS_AGAINST_OPERATION
     * @type {Integer (UInt32)}
     */
    static DLP_POLICY_WARNS_AGAINST_OPERATION => 445

    /**
     * Native name: ERROR_DLP_POLICY_DENIES_OPERATION
     * @type {Integer (UInt32)}
     */
    static DLP_POLICY_DENIES_OPERATION => 446

    /**
     * Native name: ERROR_SECURITY_DENIES_OPERATION
     * @type {Integer (UInt32)}
     */
    static SECURITY_DENIES_OPERATION => 447

    /**
     * Native name: ERROR_UNTRUSTED_MOUNT_POINT
     * @type {Integer (UInt32)}
     */
    static UNTRUSTED_MOUNT_POINT => 448

    /**
     * Native name: ERROR_DLP_POLICY_SILENTLY_FAIL
     * @type {Integer (UInt32)}
     */
    static DLP_POLICY_SILENTLY_FAIL => 449

    /**
     * Native name: ERROR_CAPAUTHZ_NOT_DEVUNLOCKED
     * @type {Integer (UInt32)}
     */
    static CAPAUTHZ_NOT_DEVUNLOCKED => 450

    /**
     * Native name: ERROR_CAPAUTHZ_CHANGE_TYPE
     * @type {Integer (UInt32)}
     */
    static CAPAUTHZ_CHANGE_TYPE => 451

    /**
     * Native name: ERROR_CAPAUTHZ_NOT_PROVISIONED
     * @type {Integer (UInt32)}
     */
    static CAPAUTHZ_NOT_PROVISIONED => 452

    /**
     * Native name: ERROR_CAPAUTHZ_NOT_AUTHORIZED
     * @type {Integer (UInt32)}
     */
    static CAPAUTHZ_NOT_AUTHORIZED => 453

    /**
     * Native name: ERROR_CAPAUTHZ_NO_POLICY
     * @type {Integer (UInt32)}
     */
    static CAPAUTHZ_NO_POLICY => 454

    /**
     * Native name: ERROR_CAPAUTHZ_DB_CORRUPTED
     * @type {Integer (UInt32)}
     */
    static CAPAUTHZ_DB_CORRUPTED => 455

    /**
     * Native name: ERROR_CAPAUTHZ_SCCD_INVALID_CATALOG
     * @type {Integer (UInt32)}
     */
    static CAPAUTHZ_SCCD_INVALID_CATALOG => 456

    /**
     * Native name: ERROR_CAPAUTHZ_SCCD_NO_AUTH_ENTITY
     * @type {Integer (UInt32)}
     */
    static CAPAUTHZ_SCCD_NO_AUTH_ENTITY => 457

    /**
     * Native name: ERROR_CAPAUTHZ_SCCD_PARSE_ERROR
     * @type {Integer (UInt32)}
     */
    static CAPAUTHZ_SCCD_PARSE_ERROR => 458

    /**
     * Native name: ERROR_CAPAUTHZ_SCCD_DEV_MODE_REQUIRED
     * @type {Integer (UInt32)}
     */
    static CAPAUTHZ_SCCD_DEV_MODE_REQUIRED => 459

    /**
     * Native name: ERROR_CAPAUTHZ_SCCD_NO_CAPABILITY_MATCH
     * @type {Integer (UInt32)}
     */
    static CAPAUTHZ_SCCD_NO_CAPABILITY_MATCH => 460

    /**
     * Native name: ERROR_CIMFS_IMAGE_CORRUPT
     * @type {Integer (UInt32)}
     */
    static CIMFS_IMAGE_CORRUPT => 470

    /**
     * Native name: ERROR_CIMFS_IMAGE_VERSION_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static CIMFS_IMAGE_VERSION_NOT_SUPPORTED => 471

    /**
     * Native name: ERROR_STORAGE_STACK_ACCESS_DENIED
     * @type {Integer (UInt32)}
     */
    static STORAGE_STACK_ACCESS_DENIED => 472

    /**
     * Native name: ERROR_INSUFFICIENT_VIRTUAL_ADDR_RESOURCES
     * @type {Integer (UInt32)}
     */
    static INSUFFICIENT_VIRTUAL_ADDR_RESOURCES => 473

    /**
     * Native name: ERROR_INDEX_OUT_OF_BOUNDS
     * @type {Integer (UInt32)}
     */
    static INDEX_OUT_OF_BOUNDS => 474

    /**
     * Native name: ERROR_CLOUD_FILE_US_MESSAGE_TIMEOUT
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_US_MESSAGE_TIMEOUT => 475

    /**
     * Native name: ERROR_NOT_A_DEV_VOLUME
     * @type {Integer (UInt32)}
     */
    static NOT_A_DEV_VOLUME => 476

    /**
     * Native name: ERROR_FS_GUID_MISMATCH
     * @type {Integer (UInt32)}
     */
    static FS_GUID_MISMATCH => 477

    /**
     * Native name: ERROR_CANT_ATTACH_TO_DEV_VOLUME
     * @type {Integer (UInt32)}
     */
    static CANT_ATTACH_TO_DEV_VOLUME => 478

    /**
     * Native name: ERROR_MEMORY_DECOMPRESSION_FAILURE
     * @type {Integer (UInt32)}
     */
    static MEMORY_DECOMPRESSION_FAILURE => 479

    /**
     * Native name: ERROR_PNP_QUERY_REMOVE_DEVICE_TIMEOUT
     * @type {Integer (UInt32)}
     */
    static PNP_QUERY_REMOVE_DEVICE_TIMEOUT => 480

    /**
     * Native name: ERROR_PNP_QUERY_REMOVE_RELATED_DEVICE_TIMEOUT
     * @type {Integer (UInt32)}
     */
    static PNP_QUERY_REMOVE_RELATED_DEVICE_TIMEOUT => 481

    /**
     * Native name: ERROR_PNP_QUERY_REMOVE_UNRELATED_DEVICE_TIMEOUT
     * @type {Integer (UInt32)}
     */
    static PNP_QUERY_REMOVE_UNRELATED_DEVICE_TIMEOUT => 482

    /**
     * Native name: ERROR_DEVICE_HARDWARE_ERROR
     * @type {Integer (UInt32)}
     */
    static DEVICE_HARDWARE_ERROR => 483

    /**
     * Native name: ERROR_INVALID_ADDRESS
     * @type {Integer (UInt32)}
     */
    static INVALID_ADDRESS => 487

    /**
     * Native name: ERROR_HAS_SYSTEM_CRITICAL_FILES
     * @type {Integer (UInt32)}
     */
    static HAS_SYSTEM_CRITICAL_FILES => 488

    /**
     * Native name: ERROR_ENCRYPTED_FILE_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static ENCRYPTED_FILE_NOT_SUPPORTED => 489

    /**
     * Native name: ERROR_SPARSE_FILE_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static SPARSE_FILE_NOT_SUPPORTED => 490

    /**
     * Native name: ERROR_PAGEFILE_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static PAGEFILE_NOT_SUPPORTED => 491

    /**
     * Native name: ERROR_VOLUME_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static VOLUME_NOT_SUPPORTED => 492

    /**
     * Native name: ERROR_NOT_SUPPORTED_WITH_BYPASSIO
     * @type {Integer (UInt32)}
     */
    static NOT_SUPPORTED_WITH_BYPASSIO => 493

    /**
     * Native name: ERROR_NO_BYPASSIO_DRIVER_SUPPORT
     * @type {Integer (UInt32)}
     */
    static NO_BYPASSIO_DRIVER_SUPPORT => 494

    /**
     * Native name: ERROR_NOT_SUPPORTED_WITH_ENCRYPTION
     * @type {Integer (UInt32)}
     */
    static NOT_SUPPORTED_WITH_ENCRYPTION => 495

    /**
     * Native name: ERROR_NOT_SUPPORTED_WITH_COMPRESSION
     * @type {Integer (UInt32)}
     */
    static NOT_SUPPORTED_WITH_COMPRESSION => 496

    /**
     * Native name: ERROR_NOT_SUPPORTED_WITH_REPLICATION
     * @type {Integer (UInt32)}
     */
    static NOT_SUPPORTED_WITH_REPLICATION => 497

    /**
     * Native name: ERROR_NOT_SUPPORTED_WITH_DEDUPLICATION
     * @type {Integer (UInt32)}
     */
    static NOT_SUPPORTED_WITH_DEDUPLICATION => 498

    /**
     * Native name: ERROR_NOT_SUPPORTED_WITH_AUDITING
     * @type {Integer (UInt32)}
     */
    static NOT_SUPPORTED_WITH_AUDITING => 499

    /**
     * Native name: ERROR_USER_PROFILE_LOAD
     * @type {Integer (UInt32)}
     */
    static USER_PROFILE_LOAD => 500

    /**
     * Native name: ERROR_SESSION_KEY_TOO_SHORT
     * @type {Integer (UInt32)}
     */
    static SESSION_KEY_TOO_SHORT => 501

    /**
     * Native name: ERROR_ACCESS_DENIED_APPDATA
     * @type {Integer (UInt32)}
     */
    static ACCESS_DENIED_APPDATA => 502

    /**
     * Native name: ERROR_NOT_SUPPORTED_WITH_MONITORING
     * @type {Integer (UInt32)}
     */
    static NOT_SUPPORTED_WITH_MONITORING => 503

    /**
     * Native name: ERROR_NOT_SUPPORTED_WITH_SNAPSHOT
     * @type {Integer (UInt32)}
     */
    static NOT_SUPPORTED_WITH_SNAPSHOT => 504

    /**
     * Native name: ERROR_NOT_SUPPORTED_WITH_VIRTUALIZATION
     * @type {Integer (UInt32)}
     */
    static NOT_SUPPORTED_WITH_VIRTUALIZATION => 505

    /**
     * Native name: ERROR_BYPASSIO_FLT_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static BYPASSIO_FLT_NOT_SUPPORTED => 506

    /**
     * Native name: ERROR_DEVICE_RESET_REQUIRED
     * @type {Integer (UInt32)}
     */
    static DEVICE_RESET_REQUIRED => 507

    /**
     * Native name: ERROR_VOLUME_WRITE_ACCESS_DENIED
     * @type {Integer (UInt32)}
     */
    static VOLUME_WRITE_ACCESS_DENIED => 508

    /**
     * Native name: ERROR_NOT_SUPPORTED_WITH_CACHED_HANDLE
     * @type {Integer (UInt32)}
     */
    static NOT_SUPPORTED_WITH_CACHED_HANDLE => 509

    /**
     * Native name: ERROR_FS_METADATA_INCONSISTENT
     * @type {Integer (UInt32)}
     */
    static FS_METADATA_INCONSISTENT => 510

    /**
     * Native name: ERROR_BLOCK_WEAK_REFERENCE_INVALID
     * @type {Integer (UInt32)}
     */
    static BLOCK_WEAK_REFERENCE_INVALID => 511

    /**
     * Native name: ERROR_BLOCK_SOURCE_WEAK_REFERENCE_INVALID
     * @type {Integer (UInt32)}
     */
    static BLOCK_SOURCE_WEAK_REFERENCE_INVALID => 512

    /**
     * Native name: ERROR_BLOCK_TARGET_WEAK_REFERENCE_INVALID
     * @type {Integer (UInt32)}
     */
    static BLOCK_TARGET_WEAK_REFERENCE_INVALID => 513

    /**
     * Native name: ERROR_BLOCK_SHARED
     * @type {Integer (UInt32)}
     */
    static BLOCK_SHARED => 514

    /**
     * Native name: ERROR_VOLUME_UPGRADE_NOT_NEEDED
     * @type {Integer (UInt32)}
     */
    static VOLUME_UPGRADE_NOT_NEEDED => 515

    /**
     * Native name: ERROR_VOLUME_UPGRADE_PENDING
     * @type {Integer (UInt32)}
     */
    static VOLUME_UPGRADE_PENDING => 516

    /**
     * Native name: ERROR_VOLUME_UPGRADE_DISABLED
     * @type {Integer (UInt32)}
     */
    static VOLUME_UPGRADE_DISABLED => 517

    /**
     * Native name: ERROR_VOLUME_UPGRADE_DISABLED_TILL_OS_DOWNGRADE_EXPIRED
     * @type {Integer (UInt32)}
     */
    static VOLUME_UPGRADE_DISABLED_TILL_OS_DOWNGRADE_EXPIRED => 518

    /**
     * Native name: ERROR_INVALID_CONFIG_VALUE
     * @type {Integer (UInt32)}
     */
    static INVALID_CONFIG_VALUE => 519

    /**
     * Native name: ERROR_MEMORY_DECOMPRESSION_HW_ERROR
     * @type {Integer (UInt32)}
     */
    static MEMORY_DECOMPRESSION_HW_ERROR => 520

    /**
     * Native name: ERROR_VOLUME_ROLLBACK_DETECTED
     * @type {Integer (UInt32)}
     */
    static VOLUME_ROLLBACK_DETECTED => 521

    /**
     * Native name: ERROR_CLOUD_FILE_HYDRATION_NOT_AVAILABLE
     * @type {Integer (UInt32)}
     */
    static CLOUD_FILE_HYDRATION_NOT_AVAILABLE => 523

    /**
     * Native name: ERROR_SYSTEM_FILE_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static SYSTEM_FILE_NOT_SUPPORTED => 525

    /**
     * Native name: ERROR_ARITHMETIC_OVERFLOW
     * @type {Integer (UInt32)}
     */
    static ARITHMETIC_OVERFLOW => 534

    /**
     * Native name: ERROR_PIPE_CONNECTED
     * @type {Integer (UInt32)}
     */
    static PIPE_CONNECTED => 535

    /**
     * Native name: ERROR_PIPE_LISTENING
     * @type {Integer (UInt32)}
     */
    static PIPE_LISTENING => 536

    /**
     * Native name: ERROR_VERIFIER_STOP
     * @type {Integer (UInt32)}
     */
    static VERIFIER_STOP => 537

    /**
     * Native name: ERROR_ABIOS_ERROR
     * @type {Integer (UInt32)}
     */
    static ABIOS_ERROR => 538

    /**
     * Native name: ERROR_WX86_WARNING
     * @type {Integer (UInt32)}
     */
    static WX86_WARNING => 539

    /**
     * Native name: ERROR_WX86_ERROR
     * @type {Integer (UInt32)}
     */
    static WX86_ERROR => 540

    /**
     * Native name: ERROR_TIMER_NOT_CANCELED
     * @type {Integer (UInt32)}
     */
    static TIMER_NOT_CANCELED => 541

    /**
     * Native name: ERROR_UNWIND
     * @type {Integer (UInt32)}
     */
    static UNWIND => 542

    /**
     * Native name: ERROR_BAD_STACK
     * @type {Integer (UInt32)}
     */
    static BAD_STACK => 543

    /**
     * Native name: ERROR_INVALID_UNWIND_TARGET
     * @type {Integer (UInt32)}
     */
    static INVALID_UNWIND_TARGET => 544

    /**
     * Native name: ERROR_INVALID_PORT_ATTRIBUTES
     * @type {Integer (UInt32)}
     */
    static INVALID_PORT_ATTRIBUTES => 545

    /**
     * Native name: ERROR_PORT_MESSAGE_TOO_LONG
     * @type {Integer (UInt32)}
     */
    static PORT_MESSAGE_TOO_LONG => 546

    /**
     * Native name: ERROR_INVALID_QUOTA_LOWER
     * @type {Integer (UInt32)}
     */
    static INVALID_QUOTA_LOWER => 547

    /**
     * Native name: ERROR_DEVICE_ALREADY_ATTACHED
     * @type {Integer (UInt32)}
     */
    static DEVICE_ALREADY_ATTACHED => 548

    /**
     * Native name: ERROR_INSTRUCTION_MISALIGNMENT
     * @type {Integer (UInt32)}
     */
    static INSTRUCTION_MISALIGNMENT => 549

    /**
     * Native name: ERROR_PROFILING_NOT_STARTED
     * @type {Integer (UInt32)}
     */
    static PROFILING_NOT_STARTED => 550

    /**
     * Native name: ERROR_PROFILING_NOT_STOPPED
     * @type {Integer (UInt32)}
     */
    static PROFILING_NOT_STOPPED => 551

    /**
     * Native name: ERROR_COULD_NOT_INTERPRET
     * @type {Integer (UInt32)}
     */
    static COULD_NOT_INTERPRET => 552

    /**
     * Native name: ERROR_PROFILING_AT_LIMIT
     * @type {Integer (UInt32)}
     */
    static PROFILING_AT_LIMIT => 553

    /**
     * Native name: ERROR_CANT_WAIT
     * @type {Integer (UInt32)}
     */
    static CANT_WAIT => 554

    /**
     * Native name: ERROR_CANT_TERMINATE_SELF
     * @type {Integer (UInt32)}
     */
    static CANT_TERMINATE_SELF => 555

    /**
     * Native name: ERROR_UNEXPECTED_MM_CREATE_ERR
     * @type {Integer (UInt32)}
     */
    static UNEXPECTED_MM_CREATE_ERR => 556

    /**
     * Native name: ERROR_UNEXPECTED_MM_MAP_ERROR
     * @type {Integer (UInt32)}
     */
    static UNEXPECTED_MM_MAP_ERROR => 557

    /**
     * Native name: ERROR_UNEXPECTED_MM_EXTEND_ERR
     * @type {Integer (UInt32)}
     */
    static UNEXPECTED_MM_EXTEND_ERR => 558

    /**
     * Native name: ERROR_BAD_FUNCTION_TABLE
     * @type {Integer (UInt32)}
     */
    static BAD_FUNCTION_TABLE => 559

    /**
     * Native name: ERROR_NO_GUID_TRANSLATION
     * @type {Integer (UInt32)}
     */
    static NO_GUID_TRANSLATION => 560

    /**
     * Native name: ERROR_INVALID_LDT_SIZE
     * @type {Integer (UInt32)}
     */
    static INVALID_LDT_SIZE => 561

    /**
     * Native name: ERROR_INVALID_LDT_OFFSET
     * @type {Integer (UInt32)}
     */
    static INVALID_LDT_OFFSET => 563

    /**
     * Native name: ERROR_INVALID_LDT_DESCRIPTOR
     * @type {Integer (UInt32)}
     */
    static INVALID_LDT_DESCRIPTOR => 564

    /**
     * Native name: ERROR_TOO_MANY_THREADS
     * @type {Integer (UInt32)}
     */
    static TOO_MANY_THREADS => 565

    /**
     * Native name: ERROR_THREAD_NOT_IN_PROCESS
     * @type {Integer (UInt32)}
     */
    static THREAD_NOT_IN_PROCESS => 566

    /**
     * Native name: ERROR_PAGEFILE_QUOTA_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static PAGEFILE_QUOTA_EXCEEDED => 567

    /**
     * Native name: ERROR_LOGON_SERVER_CONFLICT
     * @type {Integer (UInt32)}
     */
    static LOGON_SERVER_CONFLICT => 568

    /**
     * Native name: ERROR_SYNCHRONIZATION_REQUIRED
     * @type {Integer (UInt32)}
     */
    static SYNCHRONIZATION_REQUIRED => 569

    /**
     * Native name: ERROR_NET_OPEN_FAILED
     * @type {Integer (UInt32)}
     */
    static NET_OPEN_FAILED => 570

    /**
     * Native name: ERROR_IO_PRIVILEGE_FAILED
     * @type {Integer (UInt32)}
     */
    static IO_PRIVILEGE_FAILED => 571

    /**
     * Native name: ERROR_CONTROL_C_EXIT
     * @type {Integer (UInt32)}
     */
    static CONTROL_C_EXIT => 572

    /**
     * Native name: ERROR_MISSING_SYSTEMFILE
     * @type {Integer (UInt32)}
     */
    static MISSING_SYSTEMFILE => 573

    /**
     * Native name: ERROR_UNHANDLED_EXCEPTION
     * @type {Integer (UInt32)}
     */
    static UNHANDLED_EXCEPTION => 574

    /**
     * Native name: ERROR_APP_INIT_FAILURE
     * @type {Integer (UInt32)}
     */
    static APP_INIT_FAILURE => 575

    /**
     * Native name: ERROR_PAGEFILE_CREATE_FAILED
     * @type {Integer (UInt32)}
     */
    static PAGEFILE_CREATE_FAILED => 576

    /**
     * Native name: ERROR_INVALID_IMAGE_HASH
     * @type {Integer (UInt32)}
     */
    static INVALID_IMAGE_HASH => 577

    /**
     * Native name: ERROR_NO_PAGEFILE
     * @type {Integer (UInt32)}
     */
    static NO_PAGEFILE => 578

    /**
     * Native name: ERROR_ILLEGAL_FLOAT_CONTEXT
     * @type {Integer (UInt32)}
     */
    static ILLEGAL_FLOAT_CONTEXT => 579

    /**
     * Native name: ERROR_NO_EVENT_PAIR
     * @type {Integer (UInt32)}
     */
    static NO_EVENT_PAIR => 580

    /**
     * Native name: ERROR_DOMAIN_CTRLR_CONFIG_ERROR
     * @type {Integer (UInt32)}
     */
    static DOMAIN_CTRLR_CONFIG_ERROR => 581

    /**
     * Native name: ERROR_ILLEGAL_CHARACTER
     * @type {Integer (UInt32)}
     */
    static ILLEGAL_CHARACTER => 582

    /**
     * Native name: ERROR_UNDEFINED_CHARACTER
     * @type {Integer (UInt32)}
     */
    static UNDEFINED_CHARACTER => 583

    /**
     * Native name: ERROR_FLOPPY_VOLUME
     * @type {Integer (UInt32)}
     */
    static FLOPPY_VOLUME => 584

    /**
     * Native name: ERROR_BIOS_FAILED_TO_CONNECT_INTERRUPT
     * @type {Integer (UInt32)}
     */
    static BIOS_FAILED_TO_CONNECT_INTERRUPT => 585

    /**
     * Native name: ERROR_BACKUP_CONTROLLER
     * @type {Integer (UInt32)}
     */
    static BACKUP_CONTROLLER => 586

    /**
     * Native name: ERROR_MUTANT_LIMIT_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static MUTANT_LIMIT_EXCEEDED => 587

    /**
     * Native name: ERROR_FS_DRIVER_REQUIRED
     * @type {Integer (UInt32)}
     */
    static FS_DRIVER_REQUIRED => 588

    /**
     * Native name: ERROR_CANNOT_LOAD_REGISTRY_FILE
     * @type {Integer (UInt32)}
     */
    static CANNOT_LOAD_REGISTRY_FILE => 589

    /**
     * Native name: ERROR_DEBUG_ATTACH_FAILED
     * @type {Integer (UInt32)}
     */
    static DEBUG_ATTACH_FAILED => 590

    /**
     * Native name: ERROR_SYSTEM_PROCESS_TERMINATED
     * @type {Integer (UInt32)}
     */
    static SYSTEM_PROCESS_TERMINATED => 591

    /**
     * Native name: ERROR_DATA_NOT_ACCEPTED
     * @type {Integer (UInt32)}
     */
    static DATA_NOT_ACCEPTED => 592

    /**
     * Native name: ERROR_VDM_HARD_ERROR
     * @type {Integer (UInt32)}
     */
    static VDM_HARD_ERROR => 593

    /**
     * Native name: ERROR_DRIVER_CANCEL_TIMEOUT
     * @type {Integer (UInt32)}
     */
    static DRIVER_CANCEL_TIMEOUT => 594

    /**
     * Native name: ERROR_REPLY_MESSAGE_MISMATCH
     * @type {Integer (UInt32)}
     */
    static REPLY_MESSAGE_MISMATCH => 595

    /**
     * Native name: ERROR_LOST_WRITEBEHIND_DATA
     * @type {Integer (UInt32)}
     */
    static LOST_WRITEBEHIND_DATA => 596

    /**
     * Native name: ERROR_CLIENT_SERVER_PARAMETERS_INVALID
     * @type {Integer (UInt32)}
     */
    static CLIENT_SERVER_PARAMETERS_INVALID => 597

    /**
     * Native name: ERROR_NOT_TINY_STREAM
     * @type {Integer (UInt32)}
     */
    static NOT_TINY_STREAM => 598

    /**
     * Native name: ERROR_STACK_OVERFLOW_READ
     * @type {Integer (UInt32)}
     */
    static STACK_OVERFLOW_READ => 599

    /**
     * Native name: ERROR_CONVERT_TO_LARGE
     * @type {Integer (UInt32)}
     */
    static CONVERT_TO_LARGE => 600

    /**
     * Native name: ERROR_FOUND_OUT_OF_SCOPE
     * @type {Integer (UInt32)}
     */
    static FOUND_OUT_OF_SCOPE => 601

    /**
     * Native name: ERROR_ALLOCATE_BUCKET
     * @type {Integer (UInt32)}
     */
    static ALLOCATE_BUCKET => 602

    /**
     * Native name: ERROR_MARSHALL_OVERFLOW
     * @type {Integer (UInt32)}
     */
    static MARSHALL_OVERFLOW => 603

    /**
     * Native name: ERROR_INVALID_VARIANT
     * @type {Integer (UInt32)}
     */
    static INVALID_VARIANT => 604

    /**
     * Native name: ERROR_BAD_COMPRESSION_BUFFER
     * @type {Integer (UInt32)}
     */
    static BAD_COMPRESSION_BUFFER => 605

    /**
     * Native name: ERROR_AUDIT_FAILED
     * @type {Integer (UInt32)}
     */
    static AUDIT_FAILED => 606

    /**
     * Native name: ERROR_TIMER_RESOLUTION_NOT_SET
     * @type {Integer (UInt32)}
     */
    static TIMER_RESOLUTION_NOT_SET => 607

    /**
     * Native name: ERROR_INSUFFICIENT_LOGON_INFO
     * @type {Integer (UInt32)}
     */
    static INSUFFICIENT_LOGON_INFO => 608

    /**
     * Native name: ERROR_BAD_DLL_ENTRYPOINT
     * @type {Integer (UInt32)}
     */
    static BAD_DLL_ENTRYPOINT => 609

    /**
     * Native name: ERROR_BAD_SERVICE_ENTRYPOINT
     * @type {Integer (UInt32)}
     */
    static BAD_SERVICE_ENTRYPOINT => 610

    /**
     * Native name: ERROR_IP_ADDRESS_CONFLICT1
     * @type {Integer (UInt32)}
     */
    static IP_ADDRESS_CONFLICT1 => 611

    /**
     * Native name: ERROR_IP_ADDRESS_CONFLICT2
     * @type {Integer (UInt32)}
     */
    static IP_ADDRESS_CONFLICT2 => 612

    /**
     * Native name: ERROR_REGISTRY_QUOTA_LIMIT
     * @type {Integer (UInt32)}
     */
    static REGISTRY_QUOTA_LIMIT => 613

    /**
     * Native name: ERROR_NO_CALLBACK_ACTIVE
     * @type {Integer (UInt32)}
     */
    static NO_CALLBACK_ACTIVE => 614

    /**
     * Native name: ERROR_PWD_TOO_SHORT
     * @type {Integer (UInt32)}
     */
    static PWD_TOO_SHORT => 615

    /**
     * Native name: ERROR_PWD_TOO_RECENT
     * @type {Integer (UInt32)}
     */
    static PWD_TOO_RECENT => 616

    /**
     * Native name: ERROR_PWD_HISTORY_CONFLICT
     * @type {Integer (UInt32)}
     */
    static PWD_HISTORY_CONFLICT => 617

    /**
     * Native name: ERROR_UNSUPPORTED_COMPRESSION
     * @type {Integer (UInt32)}
     */
    static UNSUPPORTED_COMPRESSION => 618

    /**
     * Native name: ERROR_INVALID_HW_PROFILE
     * @type {Integer (UInt32)}
     */
    static INVALID_HW_PROFILE => 619

    /**
     * Native name: ERROR_INVALID_PLUGPLAY_DEVICE_PATH
     * @type {Integer (UInt32)}
     */
    static INVALID_PLUGPLAY_DEVICE_PATH => 620

    /**
     * Native name: ERROR_QUOTA_LIST_INCONSISTENT
     * @type {Integer (UInt32)}
     */
    static QUOTA_LIST_INCONSISTENT => 621

    /**
     * Native name: ERROR_EVALUATION_EXPIRATION
     * @type {Integer (UInt32)}
     */
    static EVALUATION_EXPIRATION => 622

    /**
     * Native name: ERROR_ILLEGAL_DLL_RELOCATION
     * @type {Integer (UInt32)}
     */
    static ILLEGAL_DLL_RELOCATION => 623

    /**
     * Native name: ERROR_DLL_INIT_FAILED_LOGOFF
     * @type {Integer (UInt32)}
     */
    static DLL_INIT_FAILED_LOGOFF => 624

    /**
     * Native name: ERROR_VALIDATE_CONTINUE
     * @type {Integer (UInt32)}
     */
    static VALIDATE_CONTINUE => 625

    /**
     * Native name: ERROR_NO_MORE_MATCHES
     * @type {Integer (UInt32)}
     */
    static NO_MORE_MATCHES => 626

    /**
     * Native name: ERROR_RANGE_LIST_CONFLICT
     * @type {Integer (UInt32)}
     */
    static RANGE_LIST_CONFLICT => 627

    /**
     * Native name: ERROR_SERVER_SID_MISMATCH
     * @type {Integer (UInt32)}
     */
    static SERVER_SID_MISMATCH => 628

    /**
     * Native name: ERROR_CANT_ENABLE_DENY_ONLY
     * @type {Integer (UInt32)}
     */
    static CANT_ENABLE_DENY_ONLY => 629

    /**
     * Native name: ERROR_FLOAT_MULTIPLE_FAULTS
     * @type {Integer (UInt32)}
     */
    static FLOAT_MULTIPLE_FAULTS => 630

    /**
     * Native name: ERROR_FLOAT_MULTIPLE_TRAPS
     * @type {Integer (UInt32)}
     */
    static FLOAT_MULTIPLE_TRAPS => 631

    /**
     * Native name: ERROR_NOINTERFACE
     * @type {Integer (UInt32)}
     */
    static NOINTERFACE => 632

    /**
     * Native name: ERROR_DRIVER_FAILED_SLEEP
     * @type {Integer (UInt32)}
     */
    static DRIVER_FAILED_SLEEP => 633

    /**
     * Native name: ERROR_CORRUPT_SYSTEM_FILE
     * @type {Integer (UInt32)}
     */
    static CORRUPT_SYSTEM_FILE => 634

    /**
     * Native name: ERROR_COMMITMENT_MINIMUM
     * @type {Integer (UInt32)}
     */
    static COMMITMENT_MINIMUM => 635

    /**
     * Native name: ERROR_PNP_RESTART_ENUMERATION
     * @type {Integer (UInt32)}
     */
    static PNP_RESTART_ENUMERATION => 636

    /**
     * Native name: ERROR_SYSTEM_IMAGE_BAD_SIGNATURE
     * @type {Integer (UInt32)}
     */
    static SYSTEM_IMAGE_BAD_SIGNATURE => 637

    /**
     * Native name: ERROR_PNP_REBOOT_REQUIRED
     * @type {Integer (UInt32)}
     */
    static PNP_REBOOT_REQUIRED => 638

    /**
     * Native name: ERROR_INSUFFICIENT_POWER
     * @type {Integer (UInt32)}
     */
    static INSUFFICIENT_POWER => 639

    /**
     * Native name: ERROR_MULTIPLE_FAULT_VIOLATION
     * @type {Integer (UInt32)}
     */
    static MULTIPLE_FAULT_VIOLATION => 640

    /**
     * Native name: ERROR_SYSTEM_SHUTDOWN
     * @type {Integer (UInt32)}
     */
    static SYSTEM_SHUTDOWN => 641

    /**
     * Native name: ERROR_PORT_NOT_SET
     * @type {Integer (UInt32)}
     */
    static PORT_NOT_SET => 642

    /**
     * Native name: ERROR_DS_VERSION_CHECK_FAILURE
     * @type {Integer (UInt32)}
     */
    static DS_VERSION_CHECK_FAILURE => 643

    /**
     * Native name: ERROR_RANGE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static RANGE_NOT_FOUND => 644

    /**
     * Native name: ERROR_NOT_SAFE_MODE_DRIVER
     * @type {Integer (UInt32)}
     */
    static NOT_SAFE_MODE_DRIVER => 646

    /**
     * Native name: ERROR_FAILED_DRIVER_ENTRY
     * @type {Integer (UInt32)}
     */
    static FAILED_DRIVER_ENTRY => 647

    /**
     * Native name: ERROR_DEVICE_ENUMERATION_ERROR
     * @type {Integer (UInt32)}
     */
    static DEVICE_ENUMERATION_ERROR => 648

    /**
     * Native name: ERROR_MOUNT_POINT_NOT_RESOLVED
     * @type {Integer (UInt32)}
     */
    static MOUNT_POINT_NOT_RESOLVED => 649

    /**
     * Native name: ERROR_INVALID_DEVICE_OBJECT_PARAMETER
     * @type {Integer (UInt32)}
     */
    static INVALID_DEVICE_OBJECT_PARAMETER => 650

    /**
     * Native name: ERROR_MCA_OCCURED
     * @type {Integer (UInt32)}
     */
    static MCA_OCCURED => 651

    /**
     * Native name: ERROR_DRIVER_DATABASE_ERROR
     * @type {Integer (UInt32)}
     */
    static DRIVER_DATABASE_ERROR => 652

    /**
     * Native name: ERROR_SYSTEM_HIVE_TOO_LARGE
     * @type {Integer (UInt32)}
     */
    static SYSTEM_HIVE_TOO_LARGE => 653

    /**
     * Native name: ERROR_DRIVER_FAILED_PRIOR_UNLOAD
     * @type {Integer (UInt32)}
     */
    static DRIVER_FAILED_PRIOR_UNLOAD => 654

    /**
     * Native name: ERROR_VOLSNAP_PREPARE_HIBERNATE
     * @type {Integer (UInt32)}
     */
    static VOLSNAP_PREPARE_HIBERNATE => 655

    /**
     * Native name: ERROR_HIBERNATION_FAILURE
     * @type {Integer (UInt32)}
     */
    static HIBERNATION_FAILURE => 656

    /**
     * Native name: ERROR_PWD_TOO_LONG
     * @type {Integer (UInt32)}
     */
    static PWD_TOO_LONG => 657

    /**
     * Native name: ERROR_FILE_SYSTEM_LIMITATION
     * @type {Integer (UInt32)}
     */
    static FILE_SYSTEM_LIMITATION => 665

    /**
     * Native name: ERROR_ASSERTION_FAILURE
     * @type {Integer (UInt32)}
     */
    static ASSERTION_FAILURE => 668

    /**
     * Native name: ERROR_ACPI_ERROR
     * @type {Integer (UInt32)}
     */
    static ACPI_ERROR => 669

    /**
     * Native name: ERROR_WOW_ASSERTION
     * @type {Integer (UInt32)}
     */
    static WOW_ASSERTION => 670

    /**
     * Native name: ERROR_PNP_BAD_MPS_TABLE
     * @type {Integer (UInt32)}
     */
    static PNP_BAD_MPS_TABLE => 671

    /**
     * Native name: ERROR_PNP_TRANSLATION_FAILED
     * @type {Integer (UInt32)}
     */
    static PNP_TRANSLATION_FAILED => 672

    /**
     * Native name: ERROR_PNP_IRQ_TRANSLATION_FAILED
     * @type {Integer (UInt32)}
     */
    static PNP_IRQ_TRANSLATION_FAILED => 673

    /**
     * Native name: ERROR_PNP_INVALID_ID
     * @type {Integer (UInt32)}
     */
    static PNP_INVALID_ID => 674

    /**
     * Native name: ERROR_WAKE_SYSTEM_DEBUGGER
     * @type {Integer (UInt32)}
     */
    static WAKE_SYSTEM_DEBUGGER => 675

    /**
     * Native name: ERROR_HANDLES_CLOSED
     * @type {Integer (UInt32)}
     */
    static HANDLES_CLOSED => 676

    /**
     * Native name: ERROR_EXTRANEOUS_INFORMATION
     * @type {Integer (UInt32)}
     */
    static EXTRANEOUS_INFORMATION => 677

    /**
     * Native name: ERROR_RXACT_COMMIT_NECESSARY
     * @type {Integer (UInt32)}
     */
    static RXACT_COMMIT_NECESSARY => 678

    /**
     * Native name: ERROR_MEDIA_CHECK
     * @type {Integer (UInt32)}
     */
    static MEDIA_CHECK => 679

    /**
     * Native name: ERROR_GUID_SUBSTITUTION_MADE
     * @type {Integer (UInt32)}
     */
    static GUID_SUBSTITUTION_MADE => 680

    /**
     * Native name: ERROR_STOPPED_ON_SYMLINK
     * @type {Integer (UInt32)}
     */
    static STOPPED_ON_SYMLINK => 681

    /**
     * Native name: ERROR_LONGJUMP
     * @type {Integer (UInt32)}
     */
    static LONGJUMP => 682

    /**
     * Native name: ERROR_PLUGPLAY_QUERY_VETOED
     * @type {Integer (UInt32)}
     */
    static PLUGPLAY_QUERY_VETOED => 683

    /**
     * Native name: ERROR_UNWIND_CONSOLIDATE
     * @type {Integer (UInt32)}
     */
    static UNWIND_CONSOLIDATE => 684

    /**
     * Native name: ERROR_REGISTRY_HIVE_RECOVERED
     * @type {Integer (UInt32)}
     */
    static REGISTRY_HIVE_RECOVERED => 685

    /**
     * Native name: ERROR_DLL_MIGHT_BE_INSECURE
     * @type {Integer (UInt32)}
     */
    static DLL_MIGHT_BE_INSECURE => 686

    /**
     * Native name: ERROR_DLL_MIGHT_BE_INCOMPATIBLE
     * @type {Integer (UInt32)}
     */
    static DLL_MIGHT_BE_INCOMPATIBLE => 687

    /**
     * Native name: ERROR_DBG_EXCEPTION_NOT_HANDLED
     * @type {Integer (UInt32)}
     */
    static DBG_EXCEPTION_NOT_HANDLED => 688

    /**
     * Native name: ERROR_DBG_REPLY_LATER
     * @type {Integer (UInt32)}
     */
    static DBG_REPLY_LATER => 689

    /**
     * Native name: ERROR_DBG_UNABLE_TO_PROVIDE_HANDLE
     * @type {Integer (UInt32)}
     */
    static DBG_UNABLE_TO_PROVIDE_HANDLE => 690

    /**
     * Native name: ERROR_DBG_TERMINATE_THREAD
     * @type {Integer (UInt32)}
     */
    static DBG_TERMINATE_THREAD => 691

    /**
     * Native name: ERROR_DBG_TERMINATE_PROCESS
     * @type {Integer (UInt32)}
     */
    static DBG_TERMINATE_PROCESS => 692

    /**
     * Native name: ERROR_DBG_CONTROL_C
     * @type {Integer (UInt32)}
     */
    static DBG_CONTROL_C => 693

    /**
     * Native name: ERROR_DBG_PRINTEXCEPTION_C
     * @type {Integer (UInt32)}
     */
    static DBG_PRINTEXCEPTION_C => 694

    /**
     * Native name: ERROR_DBG_RIPEXCEPTION
     * @type {Integer (UInt32)}
     */
    static DBG_RIPEXCEPTION => 695

    /**
     * Native name: ERROR_DBG_CONTROL_BREAK
     * @type {Integer (UInt32)}
     */
    static DBG_CONTROL_BREAK => 696

    /**
     * Native name: ERROR_DBG_COMMAND_EXCEPTION
     * @type {Integer (UInt32)}
     */
    static DBG_COMMAND_EXCEPTION => 697

    /**
     * Native name: ERROR_OBJECT_NAME_EXISTS
     * @type {Integer (UInt32)}
     */
    static OBJECT_NAME_EXISTS => 698

    /**
     * Native name: ERROR_THREAD_WAS_SUSPENDED
     * @type {Integer (UInt32)}
     */
    static THREAD_WAS_SUSPENDED => 699

    /**
     * Native name: ERROR_IMAGE_NOT_AT_BASE
     * @type {Integer (UInt32)}
     */
    static IMAGE_NOT_AT_BASE => 700

    /**
     * Native name: ERROR_RXACT_STATE_CREATED
     * @type {Integer (UInt32)}
     */
    static RXACT_STATE_CREATED => 701

    /**
     * Native name: ERROR_SEGMENT_NOTIFICATION
     * @type {Integer (UInt32)}
     */
    static SEGMENT_NOTIFICATION => 702

    /**
     * Native name: ERROR_BAD_CURRENT_DIRECTORY
     * @type {Integer (UInt32)}
     */
    static BAD_CURRENT_DIRECTORY => 703

    /**
     * Native name: ERROR_FT_READ_RECOVERY_FROM_BACKUP
     * @type {Integer (UInt32)}
     */
    static FT_READ_RECOVERY_FROM_BACKUP => 704

    /**
     * Native name: ERROR_FT_WRITE_RECOVERY
     * @type {Integer (UInt32)}
     */
    static FT_WRITE_RECOVERY => 705

    /**
     * Native name: ERROR_IMAGE_MACHINE_TYPE_MISMATCH
     * @type {Integer (UInt32)}
     */
    static IMAGE_MACHINE_TYPE_MISMATCH => 706

    /**
     * Native name: ERROR_RECEIVE_PARTIAL
     * @type {Integer (UInt32)}
     */
    static RECEIVE_PARTIAL => 707

    /**
     * Native name: ERROR_RECEIVE_EXPEDITED
     * @type {Integer (UInt32)}
     */
    static RECEIVE_EXPEDITED => 708

    /**
     * Native name: ERROR_RECEIVE_PARTIAL_EXPEDITED
     * @type {Integer (UInt32)}
     */
    static RECEIVE_PARTIAL_EXPEDITED => 709

    /**
     * Native name: ERROR_EVENT_DONE
     * @type {Integer (UInt32)}
     */
    static EVENT_DONE => 710

    /**
     * Native name: ERROR_EVENT_PENDING
     * @type {Integer (UInt32)}
     */
    static EVENT_PENDING => 711

    /**
     * Native name: ERROR_CHECKING_FILE_SYSTEM
     * @type {Integer (UInt32)}
     */
    static CHECKING_FILE_SYSTEM => 712

    /**
     * Native name: ERROR_FATAL_APP_EXIT
     * @type {Integer (UInt32)}
     */
    static FATAL_APP_EXIT => 713

    /**
     * Native name: ERROR_PREDEFINED_HANDLE
     * @type {Integer (UInt32)}
     */
    static PREDEFINED_HANDLE => 714

    /**
     * Native name: ERROR_WAS_UNLOCKED
     * @type {Integer (UInt32)}
     */
    static WAS_UNLOCKED => 715

    /**
     * Native name: ERROR_SERVICE_NOTIFICATION
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFICATION => 716

    /**
     * Native name: ERROR_WAS_LOCKED
     * @type {Integer (UInt32)}
     */
    static WAS_LOCKED => 717

    /**
     * Native name: ERROR_LOG_HARD_ERROR
     * @type {Integer (UInt32)}
     */
    static LOG_HARD_ERROR => 718

    /**
     * Native name: ERROR_ALREADY_WIN32
     * @type {Integer (UInt32)}
     */
    static ALREADY_WIN32 => 719

    /**
     * Native name: ERROR_IMAGE_MACHINE_TYPE_MISMATCH_EXE
     * @type {Integer (UInt32)}
     */
    static IMAGE_MACHINE_TYPE_MISMATCH_EXE => 720

    /**
     * Native name: ERROR_NO_YIELD_PERFORMED
     * @type {Integer (UInt32)}
     */
    static NO_YIELD_PERFORMED => 721

    /**
     * Native name: ERROR_TIMER_RESUME_IGNORED
     * @type {Integer (UInt32)}
     */
    static TIMER_RESUME_IGNORED => 722

    /**
     * Native name: ERROR_ARBITRATION_UNHANDLED
     * @type {Integer (UInt32)}
     */
    static ARBITRATION_UNHANDLED => 723

    /**
     * Native name: ERROR_CARDBUS_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static CARDBUS_NOT_SUPPORTED => 724

    /**
     * Native name: ERROR_MP_PROCESSOR_MISMATCH
     * @type {Integer (UInt32)}
     */
    static MP_PROCESSOR_MISMATCH => 725

    /**
     * Native name: ERROR_HIBERNATED
     * @type {Integer (UInt32)}
     */
    static HIBERNATED => 726

    /**
     * Native name: ERROR_RESUME_HIBERNATION
     * @type {Integer (UInt32)}
     */
    static RESUME_HIBERNATION => 727

    /**
     * Native name: ERROR_FIRMWARE_UPDATED
     * @type {Integer (UInt32)}
     */
    static FIRMWARE_UPDATED => 728

    /**
     * Native name: ERROR_DRIVERS_LEAKING_LOCKED_PAGES
     * @type {Integer (UInt32)}
     */
    static DRIVERS_LEAKING_LOCKED_PAGES => 729

    /**
     * Native name: ERROR_WAKE_SYSTEM
     * @type {Integer (UInt32)}
     */
    static WAKE_SYSTEM => 730

    /**
     * Native name: ERROR_WAIT_1
     * @type {Integer (UInt32)}
     */
    static WAIT_1 => 731

    /**
     * Native name: ERROR_WAIT_2
     * @type {Integer (UInt32)}
     */
    static WAIT_2 => 732

    /**
     * Native name: ERROR_WAIT_3
     * @type {Integer (UInt32)}
     */
    static WAIT_3 => 733

    /**
     * Native name: ERROR_WAIT_63
     * @type {Integer (UInt32)}
     */
    static WAIT_63 => 734

    /**
     * Native name: ERROR_ABANDONED_WAIT_0
     * @type {Integer (UInt32)}
     */
    static ABANDONED_WAIT_0 => 735

    /**
     * Native name: ERROR_ABANDONED_WAIT_63
     * @type {Integer (UInt32)}
     */
    static ABANDONED_WAIT_63 => 736

    /**
     * Native name: ERROR_USER_APC
     * @type {Integer (UInt32)}
     */
    static USER_APC => 737

    /**
     * Native name: ERROR_KERNEL_APC
     * @type {Integer (UInt32)}
     */
    static KERNEL_APC => 738

    /**
     * Native name: ERROR_ALERTED
     * @type {Integer (UInt32)}
     */
    static ALERTED => 739

    /**
     * Native name: ERROR_ELEVATION_REQUIRED
     * @type {Integer (UInt32)}
     */
    static ELEVATION_REQUIRED => 740

    /**
     * Native name: ERROR_REPARSE
     * @type {Integer (UInt32)}
     */
    static REPARSE => 741

    /**
     * Native name: ERROR_OPLOCK_BREAK_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static OPLOCK_BREAK_IN_PROGRESS => 742

    /**
     * Native name: ERROR_VOLUME_MOUNTED
     * @type {Integer (UInt32)}
     */
    static VOLUME_MOUNTED => 743

    /**
     * Native name: ERROR_RXACT_COMMITTED
     * @type {Integer (UInt32)}
     */
    static RXACT_COMMITTED => 744

    /**
     * Native name: ERROR_NOTIFY_CLEANUP
     * @type {Integer (UInt32)}
     */
    static NOTIFY_CLEANUP => 745

    /**
     * Native name: ERROR_PRIMARY_TRANSPORT_CONNECT_FAILED
     * @type {Integer (UInt32)}
     */
    static PRIMARY_TRANSPORT_CONNECT_FAILED => 746

    /**
     * Native name: ERROR_PAGE_FAULT_TRANSITION
     * @type {Integer (UInt32)}
     */
    static PAGE_FAULT_TRANSITION => 747

    /**
     * Native name: ERROR_PAGE_FAULT_DEMAND_ZERO
     * @type {Integer (UInt32)}
     */
    static PAGE_FAULT_DEMAND_ZERO => 748

    /**
     * Native name: ERROR_PAGE_FAULT_COPY_ON_WRITE
     * @type {Integer (UInt32)}
     */
    static PAGE_FAULT_COPY_ON_WRITE => 749

    /**
     * Native name: ERROR_PAGE_FAULT_GUARD_PAGE
     * @type {Integer (UInt32)}
     */
    static PAGE_FAULT_GUARD_PAGE => 750

    /**
     * Native name: ERROR_PAGE_FAULT_PAGING_FILE
     * @type {Integer (UInt32)}
     */
    static PAGE_FAULT_PAGING_FILE => 751

    /**
     * Native name: ERROR_CACHE_PAGE_LOCKED
     * @type {Integer (UInt32)}
     */
    static CACHE_PAGE_LOCKED => 752

    /**
     * Native name: ERROR_CRASH_DUMP
     * @type {Integer (UInt32)}
     */
    static CRASH_DUMP => 753

    /**
     * Native name: ERROR_BUFFER_ALL_ZEROS
     * @type {Integer (UInt32)}
     */
    static BUFFER_ALL_ZEROS => 754

    /**
     * Native name: ERROR_REPARSE_OBJECT
     * @type {Integer (UInt32)}
     */
    static REPARSE_OBJECT => 755

    /**
     * Native name: ERROR_RESOURCE_REQUIREMENTS_CHANGED
     * @type {Integer (UInt32)}
     */
    static RESOURCE_REQUIREMENTS_CHANGED => 756

    /**
     * Native name: ERROR_TRANSLATION_COMPLETE
     * @type {Integer (UInt32)}
     */
    static TRANSLATION_COMPLETE => 757

    /**
     * Native name: ERROR_NOTHING_TO_TERMINATE
     * @type {Integer (UInt32)}
     */
    static NOTHING_TO_TERMINATE => 758

    /**
     * Native name: ERROR_PROCESS_NOT_IN_JOB
     * @type {Integer (UInt32)}
     */
    static PROCESS_NOT_IN_JOB => 759

    /**
     * Native name: ERROR_PROCESS_IN_JOB
     * @type {Integer (UInt32)}
     */
    static PROCESS_IN_JOB => 760

    /**
     * Native name: ERROR_VOLSNAP_HIBERNATE_READY
     * @type {Integer (UInt32)}
     */
    static VOLSNAP_HIBERNATE_READY => 761

    /**
     * Native name: ERROR_FSFILTER_OP_COMPLETED_SUCCESSFULLY
     * @type {Integer (UInt32)}
     */
    static FSFILTER_OP_COMPLETED_SUCCESSFULLY => 762

    /**
     * Native name: ERROR_INTERRUPT_VECTOR_ALREADY_CONNECTED
     * @type {Integer (UInt32)}
     */
    static INTERRUPT_VECTOR_ALREADY_CONNECTED => 763

    /**
     * Native name: ERROR_INTERRUPT_STILL_CONNECTED
     * @type {Integer (UInt32)}
     */
    static INTERRUPT_STILL_CONNECTED => 764

    /**
     * Native name: ERROR_WAIT_FOR_OPLOCK
     * @type {Integer (UInt32)}
     */
    static WAIT_FOR_OPLOCK => 765

    /**
     * Native name: ERROR_DBG_EXCEPTION_HANDLED
     * @type {Integer (UInt32)}
     */
    static DBG_EXCEPTION_HANDLED => 766

    /**
     * Native name: ERROR_DBG_CONTINUE
     * @type {Integer (UInt32)}
     */
    static DBG_CONTINUE => 767

    /**
     * Native name: ERROR_CALLBACK_POP_STACK
     * @type {Integer (UInt32)}
     */
    static CALLBACK_POP_STACK => 768

    /**
     * Native name: ERROR_COMPRESSION_DISABLED
     * @type {Integer (UInt32)}
     */
    static COMPRESSION_DISABLED => 769

    /**
     * Native name: ERROR_CANTFETCHBACKWARDS
     * @type {Integer (UInt32)}
     */
    static CANTFETCHBACKWARDS => 770

    /**
     * Native name: ERROR_CANTSCROLLBACKWARDS
     * @type {Integer (UInt32)}
     */
    static CANTSCROLLBACKWARDS => 771

    /**
     * Native name: ERROR_ROWSNOTRELEASED
     * @type {Integer (UInt32)}
     */
    static ROWSNOTRELEASED => 772

    /**
     * Native name: ERROR_BAD_ACCESSOR_FLAGS
     * @type {Integer (UInt32)}
     */
    static BAD_ACCESSOR_FLAGS => 773

    /**
     * Native name: ERROR_ERRORS_ENCOUNTERED
     * @type {Integer (UInt32)}
     */
    static ERRORS_ENCOUNTERED => 774

    /**
     * Native name: ERROR_NOT_CAPABLE
     * @type {Integer (UInt32)}
     */
    static NOT_CAPABLE => 775

    /**
     * Native name: ERROR_REQUEST_OUT_OF_SEQUENCE
     * @type {Integer (UInt32)}
     */
    static REQUEST_OUT_OF_SEQUENCE => 776

    /**
     * Native name: ERROR_VERSION_PARSE_ERROR
     * @type {Integer (UInt32)}
     */
    static VERSION_PARSE_ERROR => 777

    /**
     * Native name: ERROR_BADSTARTPOSITION
     * @type {Integer (UInt32)}
     */
    static BADSTARTPOSITION => 778

    /**
     * Native name: ERROR_MEMORY_HARDWARE
     * @type {Integer (UInt32)}
     */
    static MEMORY_HARDWARE => 779

    /**
     * Native name: ERROR_DISK_REPAIR_DISABLED
     * @type {Integer (UInt32)}
     */
    static DISK_REPAIR_DISABLED => 780

    /**
     * Native name: ERROR_INSUFFICIENT_RESOURCE_FOR_SPECIFIED_SHARED_SECTION_SIZE
     * @type {Integer (UInt32)}
     */
    static INSUFFICIENT_RESOURCE_FOR_SPECIFIED_SHARED_SECTION_SIZE => 781

    /**
     * Native name: ERROR_SYSTEM_POWERSTATE_TRANSITION
     * @type {Integer (UInt32)}
     */
    static SYSTEM_POWERSTATE_TRANSITION => 782

    /**
     * Native name: ERROR_SYSTEM_POWERSTATE_COMPLEX_TRANSITION
     * @type {Integer (UInt32)}
     */
    static SYSTEM_POWERSTATE_COMPLEX_TRANSITION => 783

    /**
     * Native name: ERROR_MCA_EXCEPTION
     * @type {Integer (UInt32)}
     */
    static MCA_EXCEPTION => 784

    /**
     * Native name: ERROR_ACCESS_AUDIT_BY_POLICY
     * @type {Integer (UInt32)}
     */
    static ACCESS_AUDIT_BY_POLICY => 785

    /**
     * Native name: ERROR_ACCESS_DISABLED_NO_SAFER_UI_BY_POLICY
     * @type {Integer (UInt32)}
     */
    static ACCESS_DISABLED_NO_SAFER_UI_BY_POLICY => 786

    /**
     * Native name: ERROR_ABANDON_HIBERFILE
     * @type {Integer (UInt32)}
     */
    static ABANDON_HIBERFILE => 787

    /**
     * Native name: ERROR_LOST_WRITEBEHIND_DATA_NETWORK_DISCONNECTED
     * @type {Integer (UInt32)}
     */
    static LOST_WRITEBEHIND_DATA_NETWORK_DISCONNECTED => 788

    /**
     * Native name: ERROR_LOST_WRITEBEHIND_DATA_NETWORK_SERVER_ERROR
     * @type {Integer (UInt32)}
     */
    static LOST_WRITEBEHIND_DATA_NETWORK_SERVER_ERROR => 789

    /**
     * Native name: ERROR_LOST_WRITEBEHIND_DATA_LOCAL_DISK_ERROR
     * @type {Integer (UInt32)}
     */
    static LOST_WRITEBEHIND_DATA_LOCAL_DISK_ERROR => 790

    /**
     * Native name: ERROR_BAD_MCFG_TABLE
     * @type {Integer (UInt32)}
     */
    static BAD_MCFG_TABLE => 791

    /**
     * Native name: ERROR_DISK_REPAIR_REDIRECTED
     * @type {Integer (UInt32)}
     */
    static DISK_REPAIR_REDIRECTED => 792

    /**
     * Native name: ERROR_DISK_REPAIR_UNSUCCESSFUL
     * @type {Integer (UInt32)}
     */
    static DISK_REPAIR_UNSUCCESSFUL => 793

    /**
     * Native name: ERROR_CORRUPT_LOG_OVERFULL
     * @type {Integer (UInt32)}
     */
    static CORRUPT_LOG_OVERFULL => 794

    /**
     * Native name: ERROR_CORRUPT_LOG_CORRUPTED
     * @type {Integer (UInt32)}
     */
    static CORRUPT_LOG_CORRUPTED => 795

    /**
     * Native name: ERROR_CORRUPT_LOG_UNAVAILABLE
     * @type {Integer (UInt32)}
     */
    static CORRUPT_LOG_UNAVAILABLE => 796

    /**
     * Native name: ERROR_CORRUPT_LOG_DELETED_FULL
     * @type {Integer (UInt32)}
     */
    static CORRUPT_LOG_DELETED_FULL => 797

    /**
     * Native name: ERROR_CORRUPT_LOG_CLEARED
     * @type {Integer (UInt32)}
     */
    static CORRUPT_LOG_CLEARED => 798

    /**
     * Native name: ERROR_ORPHAN_NAME_EXHAUSTED
     * @type {Integer (UInt32)}
     */
    static ORPHAN_NAME_EXHAUSTED => 799

    /**
     * Native name: ERROR_OPLOCK_SWITCHED_TO_NEW_HANDLE
     * @type {Integer (UInt32)}
     */
    static OPLOCK_SWITCHED_TO_NEW_HANDLE => 800

    /**
     * Native name: ERROR_CANNOT_GRANT_REQUESTED_OPLOCK
     * @type {Integer (UInt32)}
     */
    static CANNOT_GRANT_REQUESTED_OPLOCK => 801

    /**
     * Native name: ERROR_CANNOT_BREAK_OPLOCK
     * @type {Integer (UInt32)}
     */
    static CANNOT_BREAK_OPLOCK => 802

    /**
     * Native name: ERROR_OPLOCK_HANDLE_CLOSED
     * @type {Integer (UInt32)}
     */
    static OPLOCK_HANDLE_CLOSED => 803

    /**
     * Native name: ERROR_NO_ACE_CONDITION
     * @type {Integer (UInt32)}
     */
    static NO_ACE_CONDITION => 804

    /**
     * Native name: ERROR_INVALID_ACE_CONDITION
     * @type {Integer (UInt32)}
     */
    static INVALID_ACE_CONDITION => 805

    /**
     * Native name: ERROR_FILE_HANDLE_REVOKED
     * @type {Integer (UInt32)}
     */
    static FILE_HANDLE_REVOKED => 806

    /**
     * Native name: ERROR_IMAGE_AT_DIFFERENT_BASE
     * @type {Integer (UInt32)}
     */
    static IMAGE_AT_DIFFERENT_BASE => 807

    /**
     * Native name: ERROR_ENCRYPTED_IO_NOT_POSSIBLE
     * @type {Integer (UInt32)}
     */
    static ENCRYPTED_IO_NOT_POSSIBLE => 808

    /**
     * Native name: ERROR_FILE_METADATA_OPTIMIZATION_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static FILE_METADATA_OPTIMIZATION_IN_PROGRESS => 809

    /**
     * Native name: ERROR_QUOTA_ACTIVITY
     * @type {Integer (UInt32)}
     */
    static QUOTA_ACTIVITY => 810

    /**
     * Native name: ERROR_HANDLE_REVOKED
     * @type {Integer (UInt32)}
     */
    static HANDLE_REVOKED => 811

    /**
     * Native name: ERROR_CALLBACK_INVOKE_INLINE
     * @type {Integer (UInt32)}
     */
    static CALLBACK_INVOKE_INLINE => 812

    /**
     * Native name: ERROR_CPU_SET_INVALID
     * @type {Integer (UInt32)}
     */
    static CPU_SET_INVALID => 813

    /**
     * Native name: ERROR_ENCLAVE_NOT_TERMINATED
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_NOT_TERMINATED => 814

    /**
     * Native name: ERROR_ENCLAVE_VIOLATION
     * @type {Integer (UInt32)}
     */
    static ENCLAVE_VIOLATION => 815

    /**
     * Native name: ERROR_SERVER_TRANSPORT_CONFLICT
     * @type {Integer (UInt32)}
     */
    static SERVER_TRANSPORT_CONFLICT => 816

    /**
     * Native name: ERROR_CERTIFICATE_VALIDATION_PREFERENCE_CONFLICT
     * @type {Integer (UInt32)}
     */
    static CERTIFICATE_VALIDATION_PREFERENCE_CONFLICT => 817

    /**
     * Native name: ERROR_FT_READ_FROM_COPY_FAILURE
     * @type {Integer (UInt32)}
     */
    static FT_READ_FROM_COPY_FAILURE => 818

    /**
     * Native name: ERROR_SECTION_DIRECT_MAP_ONLY
     * @type {Integer (UInt32)}
     */
    static SECTION_DIRECT_MAP_ONLY => 819

    /**
     * Native name: ERROR_EA_ACCESS_DENIED
     * @type {Integer (UInt32)}
     */
    static EA_ACCESS_DENIED => 994

    /**
     * Native name: ERROR_OPERATION_ABORTED
     * @type {Integer (UInt32)}
     */
    static OPERATION_ABORTED => 995

    /**
     * Native name: ERROR_IO_INCOMPLETE
     * @type {Integer (UInt32)}
     */
    static IO_INCOMPLETE => 996

    /**
     * Native name: ERROR_IO_PENDING
     * @type {Integer (UInt32)}
     */
    static IO_PENDING => 997

    /**
     * Native name: ERROR_NOACCESS
     * @type {Integer (UInt32)}
     */
    static NOACCESS => 998

    /**
     * Native name: ERROR_SWAPERROR
     * @type {Integer (UInt32)}
     */
    static SWAPERROR => 999

    /**
     * Native name: ERROR_STACK_OVERFLOW
     * @type {Integer (UInt32)}
     */
    static STACK_OVERFLOW => 1001

    /**
     * Native name: ERROR_INVALID_MESSAGE
     * @type {Integer (UInt32)}
     */
    static INVALID_MESSAGE => 1002

    /**
     * Native name: ERROR_CAN_NOT_COMPLETE
     * @type {Integer (UInt32)}
     */
    static CAN_NOT_COMPLETE => 1003

    /**
     * Native name: ERROR_INVALID_FLAGS
     * @type {Integer (UInt32)}
     */
    static INVALID_FLAGS => 1004

    /**
     * Native name: ERROR_UNRECOGNIZED_VOLUME
     * @type {Integer (UInt32)}
     */
    static UNRECOGNIZED_VOLUME => 1005

    /**
     * Native name: ERROR_FILE_INVALID
     * @type {Integer (UInt32)}
     */
    static FILE_INVALID => 1006

    /**
     * Native name: ERROR_FULLSCREEN_MODE
     * @type {Integer (UInt32)}
     */
    static FULLSCREEN_MODE => 1007

    /**
     * Native name: ERROR_NO_TOKEN
     * @type {Integer (UInt32)}
     */
    static NO_TOKEN => 1008

    /**
     * Native name: ERROR_BADDB
     * @type {Integer (UInt32)}
     */
    static BADDB => 1009

    /**
     * Native name: ERROR_BADKEY
     * @type {Integer (UInt32)}
     */
    static BADKEY => 1010

    /**
     * Native name: ERROR_CANTOPEN
     * @type {Integer (UInt32)}
     */
    static CANTOPEN => 1011

    /**
     * Native name: ERROR_CANTREAD
     * @type {Integer (UInt32)}
     */
    static CANTREAD => 1012

    /**
     * Native name: ERROR_CANTWRITE
     * @type {Integer (UInt32)}
     */
    static CANTWRITE => 1013

    /**
     * Native name: ERROR_REGISTRY_RECOVERED
     * @type {Integer (UInt32)}
     */
    static REGISTRY_RECOVERED => 1014

    /**
     * Native name: ERROR_REGISTRY_CORRUPT
     * @type {Integer (UInt32)}
     */
    static REGISTRY_CORRUPT => 1015

    /**
     * Native name: ERROR_REGISTRY_IO_FAILED
     * @type {Integer (UInt32)}
     */
    static REGISTRY_IO_FAILED => 1016

    /**
     * Native name: ERROR_NOT_REGISTRY_FILE
     * @type {Integer (UInt32)}
     */
    static NOT_REGISTRY_FILE => 1017

    /**
     * Native name: ERROR_KEY_DELETED
     * @type {Integer (UInt32)}
     */
    static KEY_DELETED => 1018

    /**
     * Native name: ERROR_NO_LOG_SPACE
     * @type {Integer (UInt32)}
     */
    static NO_LOG_SPACE => 1019

    /**
     * Native name: ERROR_KEY_HAS_CHILDREN
     * @type {Integer (UInt32)}
     */
    static KEY_HAS_CHILDREN => 1020

    /**
     * Native name: ERROR_CHILD_MUST_BE_VOLATILE
     * @type {Integer (UInt32)}
     */
    static CHILD_MUST_BE_VOLATILE => 1021

    /**
     * Native name: ERROR_NOTIFY_ENUM_DIR
     * @type {Integer (UInt32)}
     */
    static NOTIFY_ENUM_DIR => 1022

    /**
     * Native name: ERROR_DEPENDENT_SERVICES_RUNNING
     * @type {Integer (UInt32)}
     */
    static DEPENDENT_SERVICES_RUNNING => 1051

    /**
     * Native name: ERROR_INVALID_SERVICE_CONTROL
     * @type {Integer (UInt32)}
     */
    static INVALID_SERVICE_CONTROL => 1052

    /**
     * Native name: ERROR_SERVICE_REQUEST_TIMEOUT
     * @type {Integer (UInt32)}
     */
    static SERVICE_REQUEST_TIMEOUT => 1053

    /**
     * Native name: ERROR_SERVICE_NO_THREAD
     * @type {Integer (UInt32)}
     */
    static SERVICE_NO_THREAD => 1054

    /**
     * Native name: ERROR_SERVICE_DATABASE_LOCKED
     * @type {Integer (UInt32)}
     */
    static SERVICE_DATABASE_LOCKED => 1055

    /**
     * Native name: ERROR_SERVICE_ALREADY_RUNNING
     * @type {Integer (UInt32)}
     */
    static SERVICE_ALREADY_RUNNING => 1056

    /**
     * Native name: ERROR_INVALID_SERVICE_ACCOUNT
     * @type {Integer (UInt32)}
     */
    static INVALID_SERVICE_ACCOUNT => 1057

    /**
     * Native name: ERROR_SERVICE_DISABLED
     * @type {Integer (UInt32)}
     */
    static SERVICE_DISABLED => 1058

    /**
     * Native name: ERROR_CIRCULAR_DEPENDENCY
     * @type {Integer (UInt32)}
     */
    static CIRCULAR_DEPENDENCY => 1059

    /**
     * Native name: ERROR_SERVICE_DOES_NOT_EXIST
     * @type {Integer (UInt32)}
     */
    static SERVICE_DOES_NOT_EXIST => 1060

    /**
     * Native name: ERROR_SERVICE_CANNOT_ACCEPT_CTRL
     * @type {Integer (UInt32)}
     */
    static SERVICE_CANNOT_ACCEPT_CTRL => 1061

    /**
     * Native name: ERROR_SERVICE_NOT_ACTIVE
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOT_ACTIVE => 1062

    /**
     * Native name: ERROR_FAILED_SERVICE_CONTROLLER_CONNECT
     * @type {Integer (UInt32)}
     */
    static FAILED_SERVICE_CONTROLLER_CONNECT => 1063

    /**
     * Native name: ERROR_EXCEPTION_IN_SERVICE
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_IN_SERVICE => 1064

    /**
     * Native name: ERROR_DATABASE_DOES_NOT_EXIST
     * @type {Integer (UInt32)}
     */
    static DATABASE_DOES_NOT_EXIST => 1065

    /**
     * Native name: ERROR_SERVICE_SPECIFIC_ERROR
     * @type {Integer (UInt32)}
     */
    static SERVICE_SPECIFIC_ERROR => 1066

    /**
     * Native name: ERROR_PROCESS_ABORTED
     * @type {Integer (UInt32)}
     */
    static PROCESS_ABORTED => 1067

    /**
     * Native name: ERROR_SERVICE_DEPENDENCY_FAIL
     * @type {Integer (UInt32)}
     */
    static SERVICE_DEPENDENCY_FAIL => 1068

    /**
     * Native name: ERROR_SERVICE_LOGON_FAILED
     * @type {Integer (UInt32)}
     */
    static SERVICE_LOGON_FAILED => 1069

    /**
     * Native name: ERROR_SERVICE_START_HANG
     * @type {Integer (UInt32)}
     */
    static SERVICE_START_HANG => 1070

    /**
     * Native name: ERROR_INVALID_SERVICE_LOCK
     * @type {Integer (UInt32)}
     */
    static INVALID_SERVICE_LOCK => 1071

    /**
     * Native name: ERROR_SERVICE_MARKED_FOR_DELETE
     * @type {Integer (UInt32)}
     */
    static SERVICE_MARKED_FOR_DELETE => 1072

    /**
     * Native name: ERROR_SERVICE_EXISTS
     * @type {Integer (UInt32)}
     */
    static SERVICE_EXISTS => 1073

    /**
     * Native name: ERROR_ALREADY_RUNNING_LKG
     * @type {Integer (UInt32)}
     */
    static ALREADY_RUNNING_LKG => 1074

    /**
     * Native name: ERROR_SERVICE_DEPENDENCY_DELETED
     * @type {Integer (UInt32)}
     */
    static SERVICE_DEPENDENCY_DELETED => 1075

    /**
     * Native name: ERROR_BOOT_ALREADY_ACCEPTED
     * @type {Integer (UInt32)}
     */
    static BOOT_ALREADY_ACCEPTED => 1076

    /**
     * Native name: ERROR_SERVICE_NEVER_STARTED
     * @type {Integer (UInt32)}
     */
    static SERVICE_NEVER_STARTED => 1077

    /**
     * Native name: ERROR_DUPLICATE_SERVICE_NAME
     * @type {Integer (UInt32)}
     */
    static DUPLICATE_SERVICE_NAME => 1078

    /**
     * Native name: ERROR_DIFFERENT_SERVICE_ACCOUNT
     * @type {Integer (UInt32)}
     */
    static DIFFERENT_SERVICE_ACCOUNT => 1079

    /**
     * Native name: ERROR_CANNOT_DETECT_DRIVER_FAILURE
     * @type {Integer (UInt32)}
     */
    static CANNOT_DETECT_DRIVER_FAILURE => 1080

    /**
     * Native name: ERROR_CANNOT_DETECT_PROCESS_ABORT
     * @type {Integer (UInt32)}
     */
    static CANNOT_DETECT_PROCESS_ABORT => 1081

    /**
     * Native name: ERROR_NO_RECOVERY_PROGRAM
     * @type {Integer (UInt32)}
     */
    static NO_RECOVERY_PROGRAM => 1082

    /**
     * Native name: ERROR_SERVICE_NOT_IN_EXE
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOT_IN_EXE => 1083

    /**
     * Native name: ERROR_NOT_SAFEBOOT_SERVICE
     * @type {Integer (UInt32)}
     */
    static NOT_SAFEBOOT_SERVICE => 1084

    /**
     * Native name: ERROR_END_OF_MEDIA
     * @type {Integer (UInt32)}
     */
    static END_OF_MEDIA => 1100

    /**
     * Native name: ERROR_FILEMARK_DETECTED
     * @type {Integer (UInt32)}
     */
    static FILEMARK_DETECTED => 1101

    /**
     * Native name: ERROR_BEGINNING_OF_MEDIA
     * @type {Integer (UInt32)}
     */
    static BEGINNING_OF_MEDIA => 1102

    /**
     * Native name: ERROR_SETMARK_DETECTED
     * @type {Integer (UInt32)}
     */
    static SETMARK_DETECTED => 1103

    /**
     * Native name: ERROR_NO_DATA_DETECTED
     * @type {Integer (UInt32)}
     */
    static NO_DATA_DETECTED => 1104

    /**
     * Native name: ERROR_PARTITION_FAILURE
     * @type {Integer (UInt32)}
     */
    static PARTITION_FAILURE => 1105

    /**
     * Native name: ERROR_INVALID_BLOCK_LENGTH
     * @type {Integer (UInt32)}
     */
    static INVALID_BLOCK_LENGTH => 1106

    /**
     * Native name: ERROR_DEVICE_NOT_PARTITIONED
     * @type {Integer (UInt32)}
     */
    static DEVICE_NOT_PARTITIONED => 1107

    /**
     * Native name: ERROR_UNABLE_TO_LOCK_MEDIA
     * @type {Integer (UInt32)}
     */
    static UNABLE_TO_LOCK_MEDIA => 1108

    /**
     * Native name: ERROR_UNABLE_TO_UNLOAD_MEDIA
     * @type {Integer (UInt32)}
     */
    static UNABLE_TO_UNLOAD_MEDIA => 1109

    /**
     * Native name: ERROR_MEDIA_CHANGED
     * @type {Integer (UInt32)}
     */
    static MEDIA_CHANGED => 1110

    /**
     * Native name: ERROR_BUS_RESET
     * @type {Integer (UInt32)}
     */
    static BUS_RESET => 1111

    /**
     * Native name: ERROR_NO_MEDIA_IN_DRIVE
     * @type {Integer (UInt32)}
     */
    static NO_MEDIA_IN_DRIVE => 1112

    /**
     * Native name: ERROR_NO_UNICODE_TRANSLATION
     * @type {Integer (UInt32)}
     */
    static NO_UNICODE_TRANSLATION => 1113

    /**
     * Native name: ERROR_DLL_INIT_FAILED
     * @type {Integer (UInt32)}
     */
    static DLL_INIT_FAILED => 1114

    /**
     * Native name: ERROR_SHUTDOWN_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_IN_PROGRESS => 1115

    /**
     * Native name: ERROR_NO_SHUTDOWN_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static NO_SHUTDOWN_IN_PROGRESS => 1116

    /**
     * Native name: ERROR_IO_DEVICE
     * @type {Integer (UInt32)}
     */
    static IO_DEVICE => 1117

    /**
     * Native name: ERROR_SERIAL_NO_DEVICE
     * @type {Integer (UInt32)}
     */
    static SERIAL_NO_DEVICE => 1118

    /**
     * Native name: ERROR_IRQ_BUSY
     * @type {Integer (UInt32)}
     */
    static IRQ_BUSY => 1119

    /**
     * Native name: ERROR_MORE_WRITES
     * @type {Integer (UInt32)}
     */
    static MORE_WRITES => 1120

    /**
     * Native name: ERROR_COUNTER_TIMEOUT
     * @type {Integer (UInt32)}
     */
    static COUNTER_TIMEOUT => 1121

    /**
     * Native name: ERROR_FLOPPY_ID_MARK_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static FLOPPY_ID_MARK_NOT_FOUND => 1122

    /**
     * Native name: ERROR_FLOPPY_WRONG_CYLINDER
     * @type {Integer (UInt32)}
     */
    static FLOPPY_WRONG_CYLINDER => 1123

    /**
     * Native name: ERROR_FLOPPY_UNKNOWN_ERROR
     * @type {Integer (UInt32)}
     */
    static FLOPPY_UNKNOWN_ERROR => 1124

    /**
     * Native name: ERROR_FLOPPY_BAD_REGISTERS
     * @type {Integer (UInt32)}
     */
    static FLOPPY_BAD_REGISTERS => 1125

    /**
     * Native name: ERROR_DISK_RECALIBRATE_FAILED
     * @type {Integer (UInt32)}
     */
    static DISK_RECALIBRATE_FAILED => 1126

    /**
     * Native name: ERROR_DISK_OPERATION_FAILED
     * @type {Integer (UInt32)}
     */
    static DISK_OPERATION_FAILED => 1127

    /**
     * Native name: ERROR_DISK_RESET_FAILED
     * @type {Integer (UInt32)}
     */
    static DISK_RESET_FAILED => 1128

    /**
     * Native name: ERROR_EOM_OVERFLOW
     * @type {Integer (UInt32)}
     */
    static EOM_OVERFLOW => 1129

    /**
     * Native name: ERROR_NOT_ENOUGH_SERVER_MEMORY
     * @type {Integer (UInt32)}
     */
    static NOT_ENOUGH_SERVER_MEMORY => 1130

    /**
     * Native name: ERROR_POSSIBLE_DEADLOCK
     * @type {Integer (UInt32)}
     */
    static POSSIBLE_DEADLOCK => 1131

    /**
     * Native name: ERROR_MAPPED_ALIGNMENT
     * @type {Integer (UInt32)}
     */
    static MAPPED_ALIGNMENT => 1132

    /**
     * Native name: ERROR_SET_POWER_STATE_VETOED
     * @type {Integer (UInt32)}
     */
    static SET_POWER_STATE_VETOED => 1140

    /**
     * Native name: ERROR_SET_POWER_STATE_FAILED
     * @type {Integer (UInt32)}
     */
    static SET_POWER_STATE_FAILED => 1141

    /**
     * Native name: ERROR_TOO_MANY_LINKS
     * @type {Integer (UInt32)}
     */
    static TOO_MANY_LINKS => 1142

    /**
     * Native name: ERROR_OLD_WIN_VERSION
     * @type {Integer (UInt32)}
     */
    static OLD_WIN_VERSION => 1150

    /**
     * Native name: ERROR_APP_WRONG_OS
     * @type {Integer (UInt32)}
     */
    static APP_WRONG_OS => 1151

    /**
     * Native name: ERROR_SINGLE_INSTANCE_APP
     * @type {Integer (UInt32)}
     */
    static SINGLE_INSTANCE_APP => 1152

    /**
     * Native name: ERROR_RMODE_APP
     * @type {Integer (UInt32)}
     */
    static RMODE_APP => 1153

    /**
     * Native name: ERROR_INVALID_DLL
     * @type {Integer (UInt32)}
     */
    static INVALID_DLL => 1154

    /**
     * Native name: ERROR_NO_ASSOCIATION
     * @type {Integer (UInt32)}
     */
    static NO_ASSOCIATION => 1155

    /**
     * Native name: ERROR_DDE_FAIL
     * @type {Integer (UInt32)}
     */
    static DDE_FAIL => 1156

    /**
     * Native name: ERROR_DLL_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static DLL_NOT_FOUND => 1157

    /**
     * Native name: ERROR_NO_MORE_USER_HANDLES
     * @type {Integer (UInt32)}
     */
    static NO_MORE_USER_HANDLES => 1158

    /**
     * Native name: ERROR_MESSAGE_SYNC_ONLY
     * @type {Integer (UInt32)}
     */
    static MESSAGE_SYNC_ONLY => 1159

    /**
     * Native name: ERROR_SOURCE_ELEMENT_EMPTY
     * @type {Integer (UInt32)}
     */
    static SOURCE_ELEMENT_EMPTY => 1160

    /**
     * Native name: ERROR_DESTINATION_ELEMENT_FULL
     * @type {Integer (UInt32)}
     */
    static DESTINATION_ELEMENT_FULL => 1161

    /**
     * Native name: ERROR_ILLEGAL_ELEMENT_ADDRESS
     * @type {Integer (UInt32)}
     */
    static ILLEGAL_ELEMENT_ADDRESS => 1162

    /**
     * Native name: ERROR_MAGAZINE_NOT_PRESENT
     * @type {Integer (UInt32)}
     */
    static MAGAZINE_NOT_PRESENT => 1163

    /**
     * Native name: ERROR_DEVICE_REINITIALIZATION_NEEDED
     * @type {Integer (UInt32)}
     */
    static DEVICE_REINITIALIZATION_NEEDED => 1164

    /**
     * Native name: ERROR_DEVICE_REQUIRES_CLEANING
     * @type {Integer (UInt32)}
     */
    static DEVICE_REQUIRES_CLEANING => 1165

    /**
     * Native name: ERROR_DEVICE_DOOR_OPEN
     * @type {Integer (UInt32)}
     */
    static DEVICE_DOOR_OPEN => 1166

    /**
     * Native name: ERROR_DEVICE_NOT_CONNECTED
     * @type {Integer (UInt32)}
     */
    static DEVICE_NOT_CONNECTED => 1167

    /**
     * Native name: ERROR_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static NOT_FOUND => 1168

    /**
     * Native name: ERROR_NO_MATCH
     * @type {Integer (UInt32)}
     */
    static NO_MATCH => 1169

    /**
     * Native name: ERROR_SET_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static SET_NOT_FOUND => 1170

    /**
     * Native name: ERROR_POINT_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static POINT_NOT_FOUND => 1171

    /**
     * Native name: ERROR_NO_TRACKING_SERVICE
     * @type {Integer (UInt32)}
     */
    static NO_TRACKING_SERVICE => 1172

    /**
     * Native name: ERROR_NO_VOLUME_ID
     * @type {Integer (UInt32)}
     */
    static NO_VOLUME_ID => 1173

    /**
     * Native name: ERROR_UNABLE_TO_REMOVE_REPLACED
     * @type {Integer (UInt32)}
     */
    static UNABLE_TO_REMOVE_REPLACED => 1175

    /**
     * Native name: ERROR_UNABLE_TO_MOVE_REPLACEMENT
     * @type {Integer (UInt32)}
     */
    static UNABLE_TO_MOVE_REPLACEMENT => 1176

    /**
     * Native name: ERROR_UNABLE_TO_MOVE_REPLACEMENT_2
     * @type {Integer (UInt32)}
     */
    static UNABLE_TO_MOVE_REPLACEMENT_2 => 1177

    /**
     * Native name: ERROR_JOURNAL_DELETE_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static JOURNAL_DELETE_IN_PROGRESS => 1178

    /**
     * Native name: ERROR_JOURNAL_NOT_ACTIVE
     * @type {Integer (UInt32)}
     */
    static JOURNAL_NOT_ACTIVE => 1179

    /**
     * Native name: ERROR_POTENTIAL_FILE_FOUND
     * @type {Integer (UInt32)}
     */
    static POTENTIAL_FILE_FOUND => 1180

    /**
     * Native name: ERROR_JOURNAL_ENTRY_DELETED
     * @type {Integer (UInt32)}
     */
    static JOURNAL_ENTRY_DELETED => 1181

    /**
     * Native name: ERROR_PARTITION_TERMINATING
     * @type {Integer (UInt32)}
     */
    static PARTITION_TERMINATING => 1184

    /**
     * Native name: ERROR_SHUTDOWN_IS_SCHEDULED
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_IS_SCHEDULED => 1190

    /**
     * Native name: ERROR_SHUTDOWN_USERS_LOGGED_ON
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_USERS_LOGGED_ON => 1191

    /**
     * Native name: ERROR_SHUTDOWN_DISKS_NOT_IN_MAINTENANCE_MODE
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_DISKS_NOT_IN_MAINTENANCE_MODE => 1192

    /**
     * Native name: ERROR_BAD_DEVICE
     * @type {Integer (UInt32)}
     */
    static BAD_DEVICE => 1200

    /**
     * Native name: ERROR_CONNECTION_UNAVAIL
     * @type {Integer (UInt32)}
     */
    static CONNECTION_UNAVAIL => 1201

    /**
     * Native name: ERROR_DEVICE_ALREADY_REMEMBERED
     * @type {Integer (UInt32)}
     */
    static DEVICE_ALREADY_REMEMBERED => 1202

    /**
     * Native name: ERROR_NO_NET_OR_BAD_PATH
     * @type {Integer (UInt32)}
     */
    static NO_NET_OR_BAD_PATH => 1203

    /**
     * Native name: ERROR_BAD_PROVIDER
     * @type {Integer (UInt32)}
     */
    static BAD_PROVIDER => 1204

    /**
     * Native name: ERROR_CANNOT_OPEN_PROFILE
     * @type {Integer (UInt32)}
     */
    static CANNOT_OPEN_PROFILE => 1205

    /**
     * Native name: ERROR_BAD_PROFILE
     * @type {Integer (UInt32)}
     */
    static BAD_PROFILE => 1206

    /**
     * Native name: ERROR_NOT_CONTAINER
     * @type {Integer (UInt32)}
     */
    static NOT_CONTAINER => 1207

    /**
     * Native name: ERROR_EXTENDED_ERROR
     * @type {Integer (UInt32)}
     */
    static EXTENDED_ERROR => 1208

    /**
     * Native name: ERROR_INVALID_GROUPNAME
     * @type {Integer (UInt32)}
     */
    static INVALID_GROUPNAME => 1209

    /**
     * Native name: ERROR_INVALID_COMPUTERNAME
     * @type {Integer (UInt32)}
     */
    static INVALID_COMPUTERNAME => 1210

    /**
     * Native name: ERROR_INVALID_EVENTNAME
     * @type {Integer (UInt32)}
     */
    static INVALID_EVENTNAME => 1211

    /**
     * Native name: ERROR_INVALID_DOMAINNAME
     * @type {Integer (UInt32)}
     */
    static INVALID_DOMAINNAME => 1212

    /**
     * Native name: ERROR_INVALID_SERVICENAME
     * @type {Integer (UInt32)}
     */
    static INVALID_SERVICENAME => 1213

    /**
     * Native name: ERROR_INVALID_NETNAME
     * @type {Integer (UInt32)}
     */
    static INVALID_NETNAME => 1214

    /**
     * Native name: ERROR_INVALID_SHARENAME
     * @type {Integer (UInt32)}
     */
    static INVALID_SHARENAME => 1215

    /**
     * Native name: ERROR_INVALID_PASSWORDNAME
     * @type {Integer (UInt32)}
     */
    static INVALID_PASSWORDNAME => 1216

    /**
     * Native name: ERROR_INVALID_MESSAGENAME
     * @type {Integer (UInt32)}
     */
    static INVALID_MESSAGENAME => 1217

    /**
     * Native name: ERROR_INVALID_MESSAGEDEST
     * @type {Integer (UInt32)}
     */
    static INVALID_MESSAGEDEST => 1218

    /**
     * Native name: ERROR_SESSION_CREDENTIAL_CONFLICT
     * @type {Integer (UInt32)}
     */
    static SESSION_CREDENTIAL_CONFLICT => 1219

    /**
     * Native name: ERROR_REMOTE_SESSION_LIMIT_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static REMOTE_SESSION_LIMIT_EXCEEDED => 1220

    /**
     * Native name: ERROR_DUP_DOMAINNAME
     * @type {Integer (UInt32)}
     */
    static DUP_DOMAINNAME => 1221

    /**
     * Native name: ERROR_NO_NETWORK
     * @type {Integer (UInt32)}
     */
    static NO_NETWORK => 1222

    /**
     * Native name: ERROR_CANCELLED
     * @type {Integer (UInt32)}
     */
    static CANCELLED => 1223

    /**
     * Native name: ERROR_USER_MAPPED_FILE
     * @type {Integer (UInt32)}
     */
    static USER_MAPPED_FILE => 1224

    /**
     * Native name: ERROR_CONNECTION_REFUSED
     * @type {Integer (UInt32)}
     */
    static CONNECTION_REFUSED => 1225

    /**
     * Native name: ERROR_GRACEFUL_DISCONNECT
     * @type {Integer (UInt32)}
     */
    static GRACEFUL_DISCONNECT => 1226

    /**
     * Native name: ERROR_ADDRESS_ALREADY_ASSOCIATED
     * @type {Integer (UInt32)}
     */
    static ADDRESS_ALREADY_ASSOCIATED => 1227

    /**
     * Native name: ERROR_ADDRESS_NOT_ASSOCIATED
     * @type {Integer (UInt32)}
     */
    static ADDRESS_NOT_ASSOCIATED => 1228

    /**
     * Native name: ERROR_CONNECTION_INVALID
     * @type {Integer (UInt32)}
     */
    static CONNECTION_INVALID => 1229

    /**
     * Native name: ERROR_CONNECTION_ACTIVE
     * @type {Integer (UInt32)}
     */
    static CONNECTION_ACTIVE => 1230

    /**
     * Native name: ERROR_NETWORK_UNREACHABLE
     * @type {Integer (UInt32)}
     */
    static NETWORK_UNREACHABLE => 1231

    /**
     * Native name: ERROR_HOST_UNREACHABLE
     * @type {Integer (UInt32)}
     */
    static HOST_UNREACHABLE => 1232

    /**
     * Native name: ERROR_PROTOCOL_UNREACHABLE
     * @type {Integer (UInt32)}
     */
    static PROTOCOL_UNREACHABLE => 1233

    /**
     * Native name: ERROR_PORT_UNREACHABLE
     * @type {Integer (UInt32)}
     */
    static PORT_UNREACHABLE => 1234

    /**
     * Native name: ERROR_REQUEST_ABORTED
     * @type {Integer (UInt32)}
     */
    static REQUEST_ABORTED => 1235

    /**
     * Native name: ERROR_CONNECTION_ABORTED
     * @type {Integer (UInt32)}
     */
    static CONNECTION_ABORTED => 1236

    /**
     * Native name: ERROR_RETRY
     * @type {Integer (UInt32)}
     */
    static RETRY => 1237

    /**
     * Native name: ERROR_CONNECTION_COUNT_LIMIT
     * @type {Integer (UInt32)}
     */
    static CONNECTION_COUNT_LIMIT => 1238

    /**
     * Native name: ERROR_LOGIN_TIME_RESTRICTION
     * @type {Integer (UInt32)}
     */
    static LOGIN_TIME_RESTRICTION => 1239

    /**
     * Native name: ERROR_LOGIN_WKSTA_RESTRICTION
     * @type {Integer (UInt32)}
     */
    static LOGIN_WKSTA_RESTRICTION => 1240

    /**
     * Native name: ERROR_INCORRECT_ADDRESS
     * @type {Integer (UInt32)}
     */
    static INCORRECT_ADDRESS => 1241

    /**
     * Native name: ERROR_ALREADY_REGISTERED
     * @type {Integer (UInt32)}
     */
    static ALREADY_REGISTERED => 1242

    /**
     * Native name: ERROR_SERVICE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOT_FOUND => 1243

    /**
     * Native name: ERROR_NOT_AUTHENTICATED
     * @type {Integer (UInt32)}
     */
    static NOT_AUTHENTICATED => 1244

    /**
     * Native name: ERROR_NOT_LOGGED_ON
     * @type {Integer (UInt32)}
     */
    static NOT_LOGGED_ON => 1245

    /**
     * Native name: ERROR_CONTINUE
     * @type {Integer (UInt32)}
     */
    static CONTINUE => 1246

    /**
     * Native name: ERROR_ALREADY_INITIALIZED
     * @type {Integer (UInt32)}
     */
    static ALREADY_INITIALIZED => 1247

    /**
     * Native name: ERROR_NO_MORE_DEVICES
     * @type {Integer (UInt32)}
     */
    static NO_MORE_DEVICES => 1248

    /**
     * Native name: ERROR_NO_SUCH_SITE
     * @type {Integer (UInt32)}
     */
    static NO_SUCH_SITE => 1249

    /**
     * Native name: ERROR_DOMAIN_CONTROLLER_EXISTS
     * @type {Integer (UInt32)}
     */
    static DOMAIN_CONTROLLER_EXISTS => 1250

    /**
     * Native name: ERROR_ONLY_IF_CONNECTED
     * @type {Integer (UInt32)}
     */
    static ONLY_IF_CONNECTED => 1251

    /**
     * Native name: ERROR_OVERRIDE_NOCHANGES
     * @type {Integer (UInt32)}
     */
    static OVERRIDE_NOCHANGES => 1252

    /**
     * Native name: ERROR_BAD_USER_PROFILE
     * @type {Integer (UInt32)}
     */
    static BAD_USER_PROFILE => 1253

    /**
     * Native name: ERROR_NOT_SUPPORTED_ON_SBS
     * @type {Integer (UInt32)}
     */
    static NOT_SUPPORTED_ON_SBS => 1254

    /**
     * Native name: ERROR_SERVER_SHUTDOWN_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static SERVER_SHUTDOWN_IN_PROGRESS => 1255

    /**
     * Native name: ERROR_HOST_DOWN
     * @type {Integer (UInt32)}
     */
    static HOST_DOWN => 1256

    /**
     * Native name: ERROR_NON_ACCOUNT_SID
     * @type {Integer (UInt32)}
     */
    static NON_ACCOUNT_SID => 1257

    /**
     * Native name: ERROR_NON_DOMAIN_SID
     * @type {Integer (UInt32)}
     */
    static NON_DOMAIN_SID => 1258

    /**
     * Native name: ERROR_APPHELP_BLOCK
     * @type {Integer (UInt32)}
     */
    static APPHELP_BLOCK => 1259

    /**
     * Native name: ERROR_ACCESS_DISABLED_BY_POLICY
     * @type {Integer (UInt32)}
     */
    static ACCESS_DISABLED_BY_POLICY => 1260

    /**
     * Native name: ERROR_REG_NAT_CONSUMPTION
     * @type {Integer (UInt32)}
     */
    static REG_NAT_CONSUMPTION => 1261

    /**
     * Native name: ERROR_CSCSHARE_OFFLINE
     * @type {Integer (UInt32)}
     */
    static CSCSHARE_OFFLINE => 1262

    /**
     * Native name: ERROR_PKINIT_FAILURE
     * @type {Integer (UInt32)}
     */
    static PKINIT_FAILURE => 1263

    /**
     * Native name: ERROR_SMARTCARD_SUBSYSTEM_FAILURE
     * @type {Integer (UInt32)}
     */
    static SMARTCARD_SUBSYSTEM_FAILURE => 1264

    /**
     * Native name: ERROR_DOWNGRADE_DETECTED
     * @type {Integer (UInt32)}
     */
    static DOWNGRADE_DETECTED => 1265

    /**
     * Native name: ERROR_MACHINE_LOCKED
     * @type {Integer (UInt32)}
     */
    static MACHINE_LOCKED => 1271

    /**
     * Native name: ERROR_SMB_GUEST_LOGON_BLOCKED
     * @type {Integer (UInt32)}
     */
    static SMB_GUEST_LOGON_BLOCKED => 1272

    /**
     * Native name: ERROR_CALLBACK_SUPPLIED_INVALID_DATA
     * @type {Integer (UInt32)}
     */
    static CALLBACK_SUPPLIED_INVALID_DATA => 1273

    /**
     * Native name: ERROR_SYNC_FOREGROUND_REFRESH_REQUIRED
     * @type {Integer (UInt32)}
     */
    static SYNC_FOREGROUND_REFRESH_REQUIRED => 1274

    /**
     * Native name: ERROR_DRIVER_BLOCKED
     * @type {Integer (UInt32)}
     */
    static DRIVER_BLOCKED => 1275

    /**
     * Native name: ERROR_INVALID_IMPORT_OF_NON_DLL
     * @type {Integer (UInt32)}
     */
    static INVALID_IMPORT_OF_NON_DLL => 1276

    /**
     * Native name: ERROR_ACCESS_DISABLED_WEBBLADE
     * @type {Integer (UInt32)}
     */
    static ACCESS_DISABLED_WEBBLADE => 1277

    /**
     * Native name: ERROR_ACCESS_DISABLED_WEBBLADE_TAMPER
     * @type {Integer (UInt32)}
     */
    static ACCESS_DISABLED_WEBBLADE_TAMPER => 1278

    /**
     * Native name: ERROR_RECOVERY_FAILURE
     * @type {Integer (UInt32)}
     */
    static RECOVERY_FAILURE => 1279

    /**
     * Native name: ERROR_ALREADY_FIBER
     * @type {Integer (UInt32)}
     */
    static ALREADY_FIBER => 1280

    /**
     * Native name: ERROR_ALREADY_THREAD
     * @type {Integer (UInt32)}
     */
    static ALREADY_THREAD => 1281

    /**
     * Native name: ERROR_STACK_BUFFER_OVERRUN
     * @type {Integer (UInt32)}
     */
    static STACK_BUFFER_OVERRUN => 1282

    /**
     * Native name: ERROR_PARAMETER_QUOTA_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static PARAMETER_QUOTA_EXCEEDED => 1283

    /**
     * Native name: ERROR_DEBUGGER_INACTIVE
     * @type {Integer (UInt32)}
     */
    static DEBUGGER_INACTIVE => 1284

    /**
     * Native name: ERROR_DELAY_LOAD_FAILED
     * @type {Integer (UInt32)}
     */
    static DELAY_LOAD_FAILED => 1285

    /**
     * Native name: ERROR_VDM_DISALLOWED
     * @type {Integer (UInt32)}
     */
    static VDM_DISALLOWED => 1286

    /**
     * Native name: ERROR_UNIDENTIFIED_ERROR
     * @type {Integer (UInt32)}
     */
    static UNIDENTIFIED_ERROR => 1287

    /**
     * Native name: ERROR_INVALID_CRUNTIME_PARAMETER
     * @type {Integer (UInt32)}
     */
    static INVALID_CRUNTIME_PARAMETER => 1288

    /**
     * Native name: ERROR_BEYOND_VDL
     * @type {Integer (UInt32)}
     */
    static BEYOND_VDL => 1289

    /**
     * Native name: ERROR_INCOMPATIBLE_SERVICE_SID_TYPE
     * @type {Integer (UInt32)}
     */
    static INCOMPATIBLE_SERVICE_SID_TYPE => 1290

    /**
     * Native name: ERROR_DRIVER_PROCESS_TERMINATED
     * @type {Integer (UInt32)}
     */
    static DRIVER_PROCESS_TERMINATED => 1291

    /**
     * Native name: ERROR_IMPLEMENTATION_LIMIT
     * @type {Integer (UInt32)}
     */
    static IMPLEMENTATION_LIMIT => 1292

    /**
     * Native name: ERROR_PROCESS_IS_PROTECTED
     * @type {Integer (UInt32)}
     */
    static PROCESS_IS_PROTECTED => 1293

    /**
     * Native name: ERROR_SERVICE_NOTIFY_CLIENT_LAGGING
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_CLIENT_LAGGING => 1294

    /**
     * Native name: ERROR_DISK_QUOTA_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static DISK_QUOTA_EXCEEDED => 1295

    /**
     * Native name: ERROR_CONTENT_BLOCKED
     * @type {Integer (UInt32)}
     */
    static CONTENT_BLOCKED => 1296

    /**
     * Native name: ERROR_INCOMPATIBLE_SERVICE_PRIVILEGE
     * @type {Integer (UInt32)}
     */
    static INCOMPATIBLE_SERVICE_PRIVILEGE => 1297

    /**
     * Native name: ERROR_APP_HANG
     * @type {Integer (UInt32)}
     */
    static APP_HANG => 1298

    /**
     * Native name: ERROR_INVALID_LABEL
     * @type {Integer (UInt32)}
     */
    static INVALID_LABEL => 1299

    /**
     * Native name: ERROR_NOT_ALL_ASSIGNED
     * @type {Integer (UInt32)}
     */
    static NOT_ALL_ASSIGNED => 1300

    /**
     * Native name: ERROR_SOME_NOT_MAPPED
     * @type {Integer (UInt32)}
     */
    static SOME_NOT_MAPPED => 1301

    /**
     * Native name: ERROR_NO_QUOTAS_FOR_ACCOUNT
     * @type {Integer (UInt32)}
     */
    static NO_QUOTAS_FOR_ACCOUNT => 1302

    /**
     * Native name: ERROR_LOCAL_USER_SESSION_KEY
     * @type {Integer (UInt32)}
     */
    static LOCAL_USER_SESSION_KEY => 1303

    /**
     * Native name: ERROR_NULL_LM_PASSWORD
     * @type {Integer (UInt32)}
     */
    static NULL_LM_PASSWORD => 1304

    /**
     * Native name: ERROR_UNKNOWN_REVISION
     * @type {Integer (UInt32)}
     */
    static UNKNOWN_REVISION => 1305

    /**
     * Native name: ERROR_REVISION_MISMATCH
     * @type {Integer (UInt32)}
     */
    static REVISION_MISMATCH => 1306

    /**
     * Native name: ERROR_INVALID_OWNER
     * @type {Integer (UInt32)}
     */
    static INVALID_OWNER => 1307

    /**
     * Native name: ERROR_INVALID_PRIMARY_GROUP
     * @type {Integer (UInt32)}
     */
    static INVALID_PRIMARY_GROUP => 1308

    /**
     * Native name: ERROR_NO_IMPERSONATION_TOKEN
     * @type {Integer (UInt32)}
     */
    static NO_IMPERSONATION_TOKEN => 1309

    /**
     * Native name: ERROR_CANT_DISABLE_MANDATORY
     * @type {Integer (UInt32)}
     */
    static CANT_DISABLE_MANDATORY => 1310

    /**
     * Native name: ERROR_NO_LOGON_SERVERS
     * @type {Integer (UInt32)}
     */
    static NO_LOGON_SERVERS => 1311

    /**
     * Native name: ERROR_NO_SUCH_LOGON_SESSION
     * @type {Integer (UInt32)}
     */
    static NO_SUCH_LOGON_SESSION => 1312

    /**
     * Native name: ERROR_NO_SUCH_PRIVILEGE
     * @type {Integer (UInt32)}
     */
    static NO_SUCH_PRIVILEGE => 1313

    /**
     * Native name: ERROR_PRIVILEGE_NOT_HELD
     * @type {Integer (UInt32)}
     */
    static PRIVILEGE_NOT_HELD => 1314

    /**
     * Native name: ERROR_INVALID_ACCOUNT_NAME
     * @type {Integer (UInt32)}
     */
    static INVALID_ACCOUNT_NAME => 1315

    /**
     * Native name: ERROR_USER_EXISTS
     * @type {Integer (UInt32)}
     */
    static USER_EXISTS => 1316

    /**
     * Native name: ERROR_NO_SUCH_USER
     * @type {Integer (UInt32)}
     */
    static NO_SUCH_USER => 1317

    /**
     * Native name: ERROR_GROUP_EXISTS
     * @type {Integer (UInt32)}
     */
    static GROUP_EXISTS => 1318

    /**
     * Native name: ERROR_NO_SUCH_GROUP
     * @type {Integer (UInt32)}
     */
    static NO_SUCH_GROUP => 1319

    /**
     * Native name: ERROR_MEMBER_IN_GROUP
     * @type {Integer (UInt32)}
     */
    static MEMBER_IN_GROUP => 1320

    /**
     * Native name: ERROR_MEMBER_NOT_IN_GROUP
     * @type {Integer (UInt32)}
     */
    static MEMBER_NOT_IN_GROUP => 1321

    /**
     * Native name: ERROR_LAST_ADMIN
     * @type {Integer (UInt32)}
     */
    static LAST_ADMIN => 1322

    /**
     * Native name: ERROR_WRONG_PASSWORD
     * @type {Integer (UInt32)}
     */
    static WRONG_PASSWORD => 1323

    /**
     * Native name: ERROR_ILL_FORMED_PASSWORD
     * @type {Integer (UInt32)}
     */
    static ILL_FORMED_PASSWORD => 1324

    /**
     * Native name: ERROR_PASSWORD_RESTRICTION
     * @type {Integer (UInt32)}
     */
    static PASSWORD_RESTRICTION => 1325

    /**
     * Native name: ERROR_LOGON_FAILURE
     * @type {Integer (UInt32)}
     */
    static LOGON_FAILURE => 1326

    /**
     * Native name: ERROR_ACCOUNT_RESTRICTION
     * @type {Integer (UInt32)}
     */
    static ACCOUNT_RESTRICTION => 1327

    /**
     * Native name: ERROR_INVALID_LOGON_HOURS
     * @type {Integer (UInt32)}
     */
    static INVALID_LOGON_HOURS => 1328

    /**
     * Native name: ERROR_INVALID_WORKSTATION
     * @type {Integer (UInt32)}
     */
    static INVALID_WORKSTATION => 1329

    /**
     * Native name: ERROR_PASSWORD_EXPIRED
     * @type {Integer (UInt32)}
     */
    static PASSWORD_EXPIRED => 1330

    /**
     * Native name: ERROR_ACCOUNT_DISABLED
     * @type {Integer (UInt32)}
     */
    static ACCOUNT_DISABLED => 1331

    /**
     * Native name: ERROR_NONE_MAPPED
     * @type {Integer (UInt32)}
     */
    static NONE_MAPPED => 1332

    /**
     * Native name: ERROR_TOO_MANY_LUIDS_REQUESTED
     * @type {Integer (UInt32)}
     */
    static TOO_MANY_LUIDS_REQUESTED => 1333

    /**
     * Native name: ERROR_LUIDS_EXHAUSTED
     * @type {Integer (UInt32)}
     */
    static LUIDS_EXHAUSTED => 1334

    /**
     * Native name: ERROR_INVALID_SUB_AUTHORITY
     * @type {Integer (UInt32)}
     */
    static INVALID_SUB_AUTHORITY => 1335

    /**
     * Native name: ERROR_INVALID_ACL
     * @type {Integer (UInt32)}
     */
    static INVALID_ACL => 1336

    /**
     * Native name: ERROR_INVALID_SID
     * @type {Integer (UInt32)}
     */
    static INVALID_SID => 1337

    /**
     * Native name: ERROR_INVALID_SECURITY_DESCR
     * @type {Integer (UInt32)}
     */
    static INVALID_SECURITY_DESCR => 1338

    /**
     * Native name: ERROR_BAD_INHERITANCE_ACL
     * @type {Integer (UInt32)}
     */
    static BAD_INHERITANCE_ACL => 1340

    /**
     * Native name: ERROR_SERVER_DISABLED
     * @type {Integer (UInt32)}
     */
    static SERVER_DISABLED => 1341

    /**
     * Native name: ERROR_SERVER_NOT_DISABLED
     * @type {Integer (UInt32)}
     */
    static SERVER_NOT_DISABLED => 1342

    /**
     * Native name: ERROR_INVALID_ID_AUTHORITY
     * @type {Integer (UInt32)}
     */
    static INVALID_ID_AUTHORITY => 1343

    /**
     * Native name: ERROR_ALLOTTED_SPACE_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static ALLOTTED_SPACE_EXCEEDED => 1344

    /**
     * Native name: ERROR_INVALID_GROUP_ATTRIBUTES
     * @type {Integer (UInt32)}
     */
    static INVALID_GROUP_ATTRIBUTES => 1345

    /**
     * Native name: ERROR_BAD_IMPERSONATION_LEVEL
     * @type {Integer (UInt32)}
     */
    static BAD_IMPERSONATION_LEVEL => 1346

    /**
     * Native name: ERROR_CANT_OPEN_ANONYMOUS
     * @type {Integer (UInt32)}
     */
    static CANT_OPEN_ANONYMOUS => 1347

    /**
     * Native name: ERROR_BAD_VALIDATION_CLASS
     * @type {Integer (UInt32)}
     */
    static BAD_VALIDATION_CLASS => 1348

    /**
     * Native name: ERROR_BAD_TOKEN_TYPE
     * @type {Integer (UInt32)}
     */
    static BAD_TOKEN_TYPE => 1349

    /**
     * Native name: ERROR_NO_SECURITY_ON_OBJECT
     * @type {Integer (UInt32)}
     */
    static NO_SECURITY_ON_OBJECT => 1350

    /**
     * Native name: ERROR_CANT_ACCESS_DOMAIN_INFO
     * @type {Integer (UInt32)}
     */
    static CANT_ACCESS_DOMAIN_INFO => 1351

    /**
     * Native name: ERROR_INVALID_SERVER_STATE
     * @type {Integer (UInt32)}
     */
    static INVALID_SERVER_STATE => 1352

    /**
     * Native name: ERROR_INVALID_DOMAIN_STATE
     * @type {Integer (UInt32)}
     */
    static INVALID_DOMAIN_STATE => 1353

    /**
     * Native name: ERROR_INVALID_DOMAIN_ROLE
     * @type {Integer (UInt32)}
     */
    static INVALID_DOMAIN_ROLE => 1354

    /**
     * Native name: ERROR_NO_SUCH_DOMAIN
     * @type {Integer (UInt32)}
     */
    static NO_SUCH_DOMAIN => 1355

    /**
     * Native name: ERROR_DOMAIN_EXISTS
     * @type {Integer (UInt32)}
     */
    static DOMAIN_EXISTS => 1356

    /**
     * Native name: ERROR_DOMAIN_LIMIT_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static DOMAIN_LIMIT_EXCEEDED => 1357

    /**
     * Native name: ERROR_INTERNAL_DB_CORRUPTION
     * @type {Integer (UInt32)}
     */
    static INTERNAL_DB_CORRUPTION => 1358

    /**
     * Native name: ERROR_INTERNAL_ERROR
     * @type {Integer (UInt32)}
     */
    static INTERNAL_ERROR => 1359

    /**
     * Native name: ERROR_GENERIC_NOT_MAPPED
     * @type {Integer (UInt32)}
     */
    static GENERIC_NOT_MAPPED => 1360

    /**
     * Native name: ERROR_BAD_DESCRIPTOR_FORMAT
     * @type {Integer (UInt32)}
     */
    static BAD_DESCRIPTOR_FORMAT => 1361

    /**
     * Native name: ERROR_NOT_LOGON_PROCESS
     * @type {Integer (UInt32)}
     */
    static NOT_LOGON_PROCESS => 1362

    /**
     * Native name: ERROR_LOGON_SESSION_EXISTS
     * @type {Integer (UInt32)}
     */
    static LOGON_SESSION_EXISTS => 1363

    /**
     * Native name: ERROR_NO_SUCH_PACKAGE
     * @type {Integer (UInt32)}
     */
    static NO_SUCH_PACKAGE => 1364

    /**
     * Native name: ERROR_BAD_LOGON_SESSION_STATE
     * @type {Integer (UInt32)}
     */
    static BAD_LOGON_SESSION_STATE => 1365

    /**
     * Native name: ERROR_LOGON_SESSION_COLLISION
     * @type {Integer (UInt32)}
     */
    static LOGON_SESSION_COLLISION => 1366

    /**
     * Native name: ERROR_INVALID_LOGON_TYPE
     * @type {Integer (UInt32)}
     */
    static INVALID_LOGON_TYPE => 1367

    /**
     * Native name: ERROR_CANNOT_IMPERSONATE
     * @type {Integer (UInt32)}
     */
    static CANNOT_IMPERSONATE => 1368

    /**
     * Native name: ERROR_RXACT_INVALID_STATE
     * @type {Integer (UInt32)}
     */
    static RXACT_INVALID_STATE => 1369

    /**
     * Native name: ERROR_RXACT_COMMIT_FAILURE
     * @type {Integer (UInt32)}
     */
    static RXACT_COMMIT_FAILURE => 1370

    /**
     * Native name: ERROR_SPECIAL_ACCOUNT
     * @type {Integer (UInt32)}
     */
    static SPECIAL_ACCOUNT => 1371

    /**
     * Native name: ERROR_SPECIAL_GROUP
     * @type {Integer (UInt32)}
     */
    static SPECIAL_GROUP => 1372

    /**
     * Native name: ERROR_SPECIAL_USER
     * @type {Integer (UInt32)}
     */
    static SPECIAL_USER => 1373

    /**
     * Native name: ERROR_MEMBERS_PRIMARY_GROUP
     * @type {Integer (UInt32)}
     */
    static MEMBERS_PRIMARY_GROUP => 1374

    /**
     * Native name: ERROR_TOKEN_ALREADY_IN_USE
     * @type {Integer (UInt32)}
     */
    static TOKEN_ALREADY_IN_USE => 1375

    /**
     * Native name: ERROR_NO_SUCH_ALIAS
     * @type {Integer (UInt32)}
     */
    static NO_SUCH_ALIAS => 1376

    /**
     * Native name: ERROR_MEMBER_NOT_IN_ALIAS
     * @type {Integer (UInt32)}
     */
    static MEMBER_NOT_IN_ALIAS => 1377

    /**
     * Native name: ERROR_MEMBER_IN_ALIAS
     * @type {Integer (UInt32)}
     */
    static MEMBER_IN_ALIAS => 1378

    /**
     * Native name: ERROR_ALIAS_EXISTS
     * @type {Integer (UInt32)}
     */
    static ALIAS_EXISTS => 1379

    /**
     * Native name: ERROR_LOGON_NOT_GRANTED
     * @type {Integer (UInt32)}
     */
    static LOGON_NOT_GRANTED => 1380

    /**
     * Native name: ERROR_TOO_MANY_SECRETS
     * @type {Integer (UInt32)}
     */
    static TOO_MANY_SECRETS => 1381

    /**
     * Native name: ERROR_SECRET_TOO_LONG
     * @type {Integer (UInt32)}
     */
    static SECRET_TOO_LONG => 1382

    /**
     * Native name: ERROR_INTERNAL_DB_ERROR
     * @type {Integer (UInt32)}
     */
    static INTERNAL_DB_ERROR => 1383

    /**
     * Native name: ERROR_TOO_MANY_CONTEXT_IDS
     * @type {Integer (UInt32)}
     */
    static TOO_MANY_CONTEXT_IDS => 1384

    /**
     * Native name: ERROR_LOGON_TYPE_NOT_GRANTED
     * @type {Integer (UInt32)}
     */
    static LOGON_TYPE_NOT_GRANTED => 1385

    /**
     * Native name: ERROR_NT_CROSS_ENCRYPTION_REQUIRED
     * @type {Integer (UInt32)}
     */
    static NT_CROSS_ENCRYPTION_REQUIRED => 1386

    /**
     * Native name: ERROR_NO_SUCH_MEMBER
     * @type {Integer (UInt32)}
     */
    static NO_SUCH_MEMBER => 1387

    /**
     * Native name: ERROR_INVALID_MEMBER
     * @type {Integer (UInt32)}
     */
    static INVALID_MEMBER => 1388

    /**
     * Native name: ERROR_TOO_MANY_SIDS
     * @type {Integer (UInt32)}
     */
    static TOO_MANY_SIDS => 1389

    /**
     * Native name: ERROR_LM_CROSS_ENCRYPTION_REQUIRED
     * @type {Integer (UInt32)}
     */
    static LM_CROSS_ENCRYPTION_REQUIRED => 1390

    /**
     * Native name: ERROR_NO_INHERITANCE
     * @type {Integer (UInt32)}
     */
    static NO_INHERITANCE => 1391

    /**
     * Native name: ERROR_FILE_CORRUPT
     * @type {Integer (UInt32)}
     */
    static FILE_CORRUPT => 1392

    /**
     * Native name: ERROR_DISK_CORRUPT
     * @type {Integer (UInt32)}
     */
    static DISK_CORRUPT => 1393

    /**
     * Native name: ERROR_NO_USER_SESSION_KEY
     * @type {Integer (UInt32)}
     */
    static NO_USER_SESSION_KEY => 1394

    /**
     * Native name: ERROR_LICENSE_QUOTA_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static LICENSE_QUOTA_EXCEEDED => 1395

    /**
     * Native name: ERROR_WRONG_TARGET_NAME
     * @type {Integer (UInt32)}
     */
    static WRONG_TARGET_NAME => 1396

    /**
     * Native name: ERROR_MUTUAL_AUTH_FAILED
     * @type {Integer (UInt32)}
     */
    static MUTUAL_AUTH_FAILED => 1397

    /**
     * Native name: ERROR_TIME_SKEW
     * @type {Integer (UInt32)}
     */
    static TIME_SKEW => 1398

    /**
     * Native name: ERROR_CURRENT_DOMAIN_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static CURRENT_DOMAIN_NOT_ALLOWED => 1399

    /**
     * Native name: ERROR_INVALID_WINDOW_HANDLE
     * @type {Integer (UInt32)}
     */
    static INVALID_WINDOW_HANDLE => 1400

    /**
     * Native name: ERROR_INVALID_MENU_HANDLE
     * @type {Integer (UInt32)}
     */
    static INVALID_MENU_HANDLE => 1401

    /**
     * Native name: ERROR_INVALID_CURSOR_HANDLE
     * @type {Integer (UInt32)}
     */
    static INVALID_CURSOR_HANDLE => 1402

    /**
     * Native name: ERROR_INVALID_ACCEL_HANDLE
     * @type {Integer (UInt32)}
     */
    static INVALID_ACCEL_HANDLE => 1403

    /**
     * Native name: ERROR_INVALID_HOOK_HANDLE
     * @type {Integer (UInt32)}
     */
    static INVALID_HOOK_HANDLE => 1404

    /**
     * Native name: ERROR_INVALID_DWP_HANDLE
     * @type {Integer (UInt32)}
     */
    static INVALID_DWP_HANDLE => 1405

    /**
     * Native name: ERROR_TLW_WITH_WSCHILD
     * @type {Integer (UInt32)}
     */
    static TLW_WITH_WSCHILD => 1406

    /**
     * Native name: ERROR_CANNOT_FIND_WND_CLASS
     * @type {Integer (UInt32)}
     */
    static CANNOT_FIND_WND_CLASS => 1407

    /**
     * Native name: ERROR_WINDOW_OF_OTHER_THREAD
     * @type {Integer (UInt32)}
     */
    static WINDOW_OF_OTHER_THREAD => 1408

    /**
     * Native name: ERROR_HOTKEY_ALREADY_REGISTERED
     * @type {Integer (UInt32)}
     */
    static HOTKEY_ALREADY_REGISTERED => 1409

    /**
     * Native name: ERROR_CLASS_ALREADY_EXISTS
     * @type {Integer (UInt32)}
     */
    static CLASS_ALREADY_EXISTS => 1410

    /**
     * Native name: ERROR_CLASS_DOES_NOT_EXIST
     * @type {Integer (UInt32)}
     */
    static CLASS_DOES_NOT_EXIST => 1411

    /**
     * Native name: ERROR_CLASS_HAS_WINDOWS
     * @type {Integer (UInt32)}
     */
    static CLASS_HAS_WINDOWS => 1412

    /**
     * Native name: ERROR_INVALID_INDEX
     * @type {Integer (UInt32)}
     */
    static INVALID_INDEX => 1413

    /**
     * Native name: ERROR_INVALID_ICON_HANDLE
     * @type {Integer (UInt32)}
     */
    static INVALID_ICON_HANDLE => 1414

    /**
     * Native name: ERROR_PRIVATE_DIALOG_INDEX
     * @type {Integer (UInt32)}
     */
    static PRIVATE_DIALOG_INDEX => 1415

    /**
     * Native name: ERROR_LISTBOX_ID_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static LISTBOX_ID_NOT_FOUND => 1416

    /**
     * Native name: ERROR_NO_WILDCARD_CHARACTERS
     * @type {Integer (UInt32)}
     */
    static NO_WILDCARD_CHARACTERS => 1417

    /**
     * Native name: ERROR_CLIPBOARD_NOT_OPEN
     * @type {Integer (UInt32)}
     */
    static CLIPBOARD_NOT_OPEN => 1418

    /**
     * Native name: ERROR_HOTKEY_NOT_REGISTERED
     * @type {Integer (UInt32)}
     */
    static HOTKEY_NOT_REGISTERED => 1419

    /**
     * Native name: ERROR_WINDOW_NOT_DIALOG
     * @type {Integer (UInt32)}
     */
    static WINDOW_NOT_DIALOG => 1420

    /**
     * Native name: ERROR_CONTROL_ID_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static CONTROL_ID_NOT_FOUND => 1421

    /**
     * Native name: ERROR_INVALID_COMBOBOX_MESSAGE
     * @type {Integer (UInt32)}
     */
    static INVALID_COMBOBOX_MESSAGE => 1422

    /**
     * Native name: ERROR_WINDOW_NOT_COMBOBOX
     * @type {Integer (UInt32)}
     */
    static WINDOW_NOT_COMBOBOX => 1423

    /**
     * Native name: ERROR_INVALID_EDIT_HEIGHT
     * @type {Integer (UInt32)}
     */
    static INVALID_EDIT_HEIGHT => 1424

    /**
     * Native name: ERROR_DC_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static DC_NOT_FOUND => 1425

    /**
     * Native name: ERROR_INVALID_HOOK_FILTER
     * @type {Integer (UInt32)}
     */
    static INVALID_HOOK_FILTER => 1426

    /**
     * Native name: ERROR_INVALID_FILTER_PROC
     * @type {Integer (UInt32)}
     */
    static INVALID_FILTER_PROC => 1427

    /**
     * Native name: ERROR_HOOK_NEEDS_HMOD
     * @type {Integer (UInt32)}
     */
    static HOOK_NEEDS_HMOD => 1428

    /**
     * Native name: ERROR_GLOBAL_ONLY_HOOK
     * @type {Integer (UInt32)}
     */
    static GLOBAL_ONLY_HOOK => 1429

    /**
     * Native name: ERROR_JOURNAL_HOOK_SET
     * @type {Integer (UInt32)}
     */
    static JOURNAL_HOOK_SET => 1430

    /**
     * Native name: ERROR_HOOK_NOT_INSTALLED
     * @type {Integer (UInt32)}
     */
    static HOOK_NOT_INSTALLED => 1431

    /**
     * Native name: ERROR_INVALID_LB_MESSAGE
     * @type {Integer (UInt32)}
     */
    static INVALID_LB_MESSAGE => 1432

    /**
     * Native name: ERROR_SETCOUNT_ON_BAD_LB
     * @type {Integer (UInt32)}
     */
    static SETCOUNT_ON_BAD_LB => 1433

    /**
     * Native name: ERROR_LB_WITHOUT_TABSTOPS
     * @type {Integer (UInt32)}
     */
    static LB_WITHOUT_TABSTOPS => 1434

    /**
     * Native name: ERROR_DESTROY_OBJECT_OF_OTHER_THREAD
     * @type {Integer (UInt32)}
     */
    static DESTROY_OBJECT_OF_OTHER_THREAD => 1435

    /**
     * Native name: ERROR_CHILD_WINDOW_MENU
     * @type {Integer (UInt32)}
     */
    static CHILD_WINDOW_MENU => 1436

    /**
     * Native name: ERROR_NO_SYSTEM_MENU
     * @type {Integer (UInt32)}
     */
    static NO_SYSTEM_MENU => 1437

    /**
     * Native name: ERROR_INVALID_MSGBOX_STYLE
     * @type {Integer (UInt32)}
     */
    static INVALID_MSGBOX_STYLE => 1438

    /**
     * Native name: ERROR_INVALID_SPI_VALUE
     * @type {Integer (UInt32)}
     */
    static INVALID_SPI_VALUE => 1439

    /**
     * Native name: ERROR_SCREEN_ALREADY_LOCKED
     * @type {Integer (UInt32)}
     */
    static SCREEN_ALREADY_LOCKED => 1440

    /**
     * Native name: ERROR_HWNDS_HAVE_DIFF_PARENT
     * @type {Integer (UInt32)}
     */
    static HWNDS_HAVE_DIFF_PARENT => 1441

    /**
     * Native name: ERROR_NOT_CHILD_WINDOW
     * @type {Integer (UInt32)}
     */
    static NOT_CHILD_WINDOW => 1442

    /**
     * Native name: ERROR_INVALID_GW_COMMAND
     * @type {Integer (UInt32)}
     */
    static INVALID_GW_COMMAND => 1443

    /**
     * Native name: ERROR_INVALID_THREAD_ID
     * @type {Integer (UInt32)}
     */
    static INVALID_THREAD_ID => 1444

    /**
     * Native name: ERROR_NON_MDICHILD_WINDOW
     * @type {Integer (UInt32)}
     */
    static NON_MDICHILD_WINDOW => 1445

    /**
     * Native name: ERROR_POPUP_ALREADY_ACTIVE
     * @type {Integer (UInt32)}
     */
    static POPUP_ALREADY_ACTIVE => 1446

    /**
     * Native name: ERROR_NO_SCROLLBARS
     * @type {Integer (UInt32)}
     */
    static NO_SCROLLBARS => 1447

    /**
     * Native name: ERROR_INVALID_SCROLLBAR_RANGE
     * @type {Integer (UInt32)}
     */
    static INVALID_SCROLLBAR_RANGE => 1448

    /**
     * Native name: ERROR_INVALID_SHOWWIN_COMMAND
     * @type {Integer (UInt32)}
     */
    static INVALID_SHOWWIN_COMMAND => 1449

    /**
     * Native name: ERROR_NO_SYSTEM_RESOURCES
     * @type {Integer (UInt32)}
     */
    static NO_SYSTEM_RESOURCES => 1450

    /**
     * Native name: ERROR_NONPAGED_SYSTEM_RESOURCES
     * @type {Integer (UInt32)}
     */
    static NONPAGED_SYSTEM_RESOURCES => 1451

    /**
     * Native name: ERROR_PAGED_SYSTEM_RESOURCES
     * @type {Integer (UInt32)}
     */
    static PAGED_SYSTEM_RESOURCES => 1452

    /**
     * Native name: ERROR_WORKING_SET_QUOTA
     * @type {Integer (UInt32)}
     */
    static WORKING_SET_QUOTA => 1453

    /**
     * Native name: ERROR_PAGEFILE_QUOTA
     * @type {Integer (UInt32)}
     */
    static PAGEFILE_QUOTA => 1454

    /**
     * Native name: ERROR_COMMITMENT_LIMIT
     * @type {Integer (UInt32)}
     */
    static COMMITMENT_LIMIT => 1455

    /**
     * Native name: ERROR_MENU_ITEM_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static MENU_ITEM_NOT_FOUND => 1456

    /**
     * Native name: ERROR_INVALID_KEYBOARD_HANDLE
     * @type {Integer (UInt32)}
     */
    static INVALID_KEYBOARD_HANDLE => 1457

    /**
     * Native name: ERROR_HOOK_TYPE_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static HOOK_TYPE_NOT_ALLOWED => 1458

    /**
     * Native name: ERROR_REQUIRES_INTERACTIVE_WINDOWSTATION
     * @type {Integer (UInt32)}
     */
    static REQUIRES_INTERACTIVE_WINDOWSTATION => 1459

    /**
     * Native name: ERROR_TIMEOUT
     * @type {Integer (UInt32)}
     */
    static TIMEOUT => 1460

    /**
     * Native name: ERROR_INVALID_MONITOR_HANDLE
     * @type {Integer (UInt32)}
     */
    static INVALID_MONITOR_HANDLE => 1461

    /**
     * Native name: ERROR_INCORRECT_SIZE
     * @type {Integer (UInt32)}
     */
    static INCORRECT_SIZE => 1462

    /**
     * Native name: ERROR_SYMLINK_CLASS_DISABLED
     * @type {Integer (UInt32)}
     */
    static SYMLINK_CLASS_DISABLED => 1463

    /**
     * Native name: ERROR_SYMLINK_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static SYMLINK_NOT_SUPPORTED => 1464

    /**
     * Native name: ERROR_XML_PARSE_ERROR
     * @type {Integer (UInt32)}
     */
    static XML_PARSE_ERROR => 1465

    /**
     * Native name: ERROR_XMLDSIG_ERROR
     * @type {Integer (UInt32)}
     */
    static XMLDSIG_ERROR => 1466

    /**
     * Native name: ERROR_RESTART_APPLICATION
     * @type {Integer (UInt32)}
     */
    static RESTART_APPLICATION => 1467

    /**
     * Native name: ERROR_WRONG_COMPARTMENT
     * @type {Integer (UInt32)}
     */
    static WRONG_COMPARTMENT => 1468

    /**
     * Native name: ERROR_AUTHIP_FAILURE
     * @type {Integer (UInt32)}
     */
    static AUTHIP_FAILURE => 1469

    /**
     * Native name: ERROR_NO_NVRAM_RESOURCES
     * @type {Integer (UInt32)}
     */
    static NO_NVRAM_RESOURCES => 1470

    /**
     * Native name: ERROR_NOT_GUI_PROCESS
     * @type {Integer (UInt32)}
     */
    static NOT_GUI_PROCESS => 1471

    /**
     * Native name: ERROR_EVENTLOG_FILE_CORRUPT
     * @type {Integer (UInt32)}
     */
    static EVENTLOG_FILE_CORRUPT => 1500

    /**
     * Native name: ERROR_EVENTLOG_CANT_START
     * @type {Integer (UInt32)}
     */
    static EVENTLOG_CANT_START => 1501

    /**
     * Native name: ERROR_LOG_FILE_FULL
     * @type {Integer (UInt32)}
     */
    static LOG_FILE_FULL => 1502

    /**
     * Native name: ERROR_EVENTLOG_FILE_CHANGED
     * @type {Integer (UInt32)}
     */
    static EVENTLOG_FILE_CHANGED => 1503

    /**
     * Native name: ERROR_CONTAINER_ASSIGNED
     * @type {Integer (UInt32)}
     */
    static CONTAINER_ASSIGNED => 1504

    /**
     * Native name: ERROR_JOB_NO_CONTAINER
     * @type {Integer (UInt32)}
     */
    static JOB_NO_CONTAINER => 1505

    /**
     * Native name: ERROR_INVALID_TASK_NAME
     * @type {Integer (UInt32)}
     */
    static INVALID_TASK_NAME => 1550

    /**
     * Native name: ERROR_INVALID_TASK_INDEX
     * @type {Integer (UInt32)}
     */
    static INVALID_TASK_INDEX => 1551

    /**
     * Native name: ERROR_THREAD_ALREADY_IN_TASK
     * @type {Integer (UInt32)}
     */
    static THREAD_ALREADY_IN_TASK => 1552

    /**
     * Native name: ERROR_INSTALL_SERVICE_FAILURE
     * @type {Integer (UInt32)}
     */
    static INSTALL_SERVICE_FAILURE => 1601

    /**
     * Native name: ERROR_INSTALL_USEREXIT
     * @type {Integer (UInt32)}
     */
    static INSTALL_USEREXIT => 1602

    /**
     * Native name: ERROR_INSTALL_FAILURE
     * @type {Integer (UInt32)}
     */
    static INSTALL_FAILURE => 1603

    /**
     * Native name: ERROR_INSTALL_SUSPEND
     * @type {Integer (UInt32)}
     */
    static INSTALL_SUSPEND => 1604

    /**
     * Native name: ERROR_UNKNOWN_PRODUCT
     * @type {Integer (UInt32)}
     */
    static UNKNOWN_PRODUCT => 1605

    /**
     * Native name: ERROR_UNKNOWN_FEATURE
     * @type {Integer (UInt32)}
     */
    static UNKNOWN_FEATURE => 1606

    /**
     * Native name: ERROR_UNKNOWN_COMPONENT
     * @type {Integer (UInt32)}
     */
    static UNKNOWN_COMPONENT => 1607

    /**
     * Native name: ERROR_UNKNOWN_PROPERTY
     * @type {Integer (UInt32)}
     */
    static UNKNOWN_PROPERTY => 1608

    /**
     * Native name: ERROR_INVALID_HANDLE_STATE
     * @type {Integer (UInt32)}
     */
    static INVALID_HANDLE_STATE => 1609

    /**
     * Native name: ERROR_BAD_CONFIGURATION
     * @type {Integer (UInt32)}
     */
    static BAD_CONFIGURATION => 1610

    /**
     * Native name: ERROR_INDEX_ABSENT
     * @type {Integer (UInt32)}
     */
    static INDEX_ABSENT => 1611

    /**
     * Native name: ERROR_INSTALL_SOURCE_ABSENT
     * @type {Integer (UInt32)}
     */
    static INSTALL_SOURCE_ABSENT => 1612

    /**
     * Native name: ERROR_INSTALL_PACKAGE_VERSION
     * @type {Integer (UInt32)}
     */
    static INSTALL_PACKAGE_VERSION => 1613

    /**
     * Native name: ERROR_PRODUCT_UNINSTALLED
     * @type {Integer (UInt32)}
     */
    static PRODUCT_UNINSTALLED => 1614

    /**
     * Native name: ERROR_BAD_QUERY_SYNTAX
     * @type {Integer (UInt32)}
     */
    static BAD_QUERY_SYNTAX => 1615

    /**
     * Native name: ERROR_INVALID_FIELD
     * @type {Integer (UInt32)}
     */
    static INVALID_FIELD => 1616

    /**
     * Native name: ERROR_DEVICE_REMOVED
     * @type {Integer (UInt32)}
     */
    static DEVICE_REMOVED => 1617

    /**
     * Native name: ERROR_INSTALL_ALREADY_RUNNING
     * @type {Integer (UInt32)}
     */
    static INSTALL_ALREADY_RUNNING => 1618

    /**
     * Native name: ERROR_INSTALL_PACKAGE_OPEN_FAILED
     * @type {Integer (UInt32)}
     */
    static INSTALL_PACKAGE_OPEN_FAILED => 1619

    /**
     * Native name: ERROR_INSTALL_PACKAGE_INVALID
     * @type {Integer (UInt32)}
     */
    static INSTALL_PACKAGE_INVALID => 1620

    /**
     * Native name: ERROR_INSTALL_UI_FAILURE
     * @type {Integer (UInt32)}
     */
    static INSTALL_UI_FAILURE => 1621

    /**
     * Native name: ERROR_INSTALL_LOG_FAILURE
     * @type {Integer (UInt32)}
     */
    static INSTALL_LOG_FAILURE => 1622

    /**
     * Native name: ERROR_INSTALL_LANGUAGE_UNSUPPORTED
     * @type {Integer (UInt32)}
     */
    static INSTALL_LANGUAGE_UNSUPPORTED => 1623

    /**
     * Native name: ERROR_INSTALL_TRANSFORM_FAILURE
     * @type {Integer (UInt32)}
     */
    static INSTALL_TRANSFORM_FAILURE => 1624

    /**
     * Native name: ERROR_INSTALL_PACKAGE_REJECTED
     * @type {Integer (UInt32)}
     */
    static INSTALL_PACKAGE_REJECTED => 1625

    /**
     * Native name: ERROR_FUNCTION_NOT_CALLED
     * @type {Integer (UInt32)}
     */
    static FUNCTION_NOT_CALLED => 1626

    /**
     * Native name: ERROR_FUNCTION_FAILED
     * @type {Integer (UInt32)}
     */
    static FUNCTION_FAILED => 1627

    /**
     * Native name: ERROR_INVALID_TABLE
     * @type {Integer (UInt32)}
     */
    static INVALID_TABLE => 1628

    /**
     * Native name: ERROR_DATATYPE_MISMATCH
     * @type {Integer (UInt32)}
     */
    static DATATYPE_MISMATCH => 1629

    /**
     * Native name: ERROR_UNSUPPORTED_TYPE
     * @type {Integer (UInt32)}
     */
    static UNSUPPORTED_TYPE => 1630

    /**
     * Native name: ERROR_CREATE_FAILED
     * @type {Integer (UInt32)}
     */
    static CREATE_FAILED => 1631

    /**
     * Native name: ERROR_INSTALL_TEMP_UNWRITABLE
     * @type {Integer (UInt32)}
     */
    static INSTALL_TEMP_UNWRITABLE => 1632

    /**
     * Native name: ERROR_INSTALL_PLATFORM_UNSUPPORTED
     * @type {Integer (UInt32)}
     */
    static INSTALL_PLATFORM_UNSUPPORTED => 1633

    /**
     * Native name: ERROR_INSTALL_NOTUSED
     * @type {Integer (UInt32)}
     */
    static INSTALL_NOTUSED => 1634

    /**
     * Native name: ERROR_PATCH_PACKAGE_OPEN_FAILED
     * @type {Integer (UInt32)}
     */
    static PATCH_PACKAGE_OPEN_FAILED => 1635

    /**
     * Native name: ERROR_PATCH_PACKAGE_INVALID
     * @type {Integer (UInt32)}
     */
    static PATCH_PACKAGE_INVALID => 1636

    /**
     * Native name: ERROR_PATCH_PACKAGE_UNSUPPORTED
     * @type {Integer (UInt32)}
     */
    static PATCH_PACKAGE_UNSUPPORTED => 1637

    /**
     * Native name: ERROR_PRODUCT_VERSION
     * @type {Integer (UInt32)}
     */
    static PRODUCT_VERSION => 1638

    /**
     * Native name: ERROR_INVALID_COMMAND_LINE
     * @type {Integer (UInt32)}
     */
    static INVALID_COMMAND_LINE => 1639

    /**
     * Native name: ERROR_INSTALL_REMOTE_DISALLOWED
     * @type {Integer (UInt32)}
     */
    static INSTALL_REMOTE_DISALLOWED => 1640

    /**
     * Native name: ERROR_SUCCESS_REBOOT_INITIATED
     * @type {Integer (UInt32)}
     */
    static SUCCESS_REBOOT_INITIATED => 1641

    /**
     * Native name: ERROR_PATCH_TARGET_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static PATCH_TARGET_NOT_FOUND => 1642

    /**
     * Native name: ERROR_PATCH_PACKAGE_REJECTED
     * @type {Integer (UInt32)}
     */
    static PATCH_PACKAGE_REJECTED => 1643

    /**
     * Native name: ERROR_INSTALL_TRANSFORM_REJECTED
     * @type {Integer (UInt32)}
     */
    static INSTALL_TRANSFORM_REJECTED => 1644

    /**
     * Native name: ERROR_INSTALL_REMOTE_PROHIBITED
     * @type {Integer (UInt32)}
     */
    static INSTALL_REMOTE_PROHIBITED => 1645

    /**
     * Native name: ERROR_PATCH_REMOVAL_UNSUPPORTED
     * @type {Integer (UInt32)}
     */
    static PATCH_REMOVAL_UNSUPPORTED => 1646

    /**
     * Native name: ERROR_UNKNOWN_PATCH
     * @type {Integer (UInt32)}
     */
    static UNKNOWN_PATCH => 1647

    /**
     * Native name: ERROR_PATCH_NO_SEQUENCE
     * @type {Integer (UInt32)}
     */
    static PATCH_NO_SEQUENCE => 1648

    /**
     * Native name: ERROR_PATCH_REMOVAL_DISALLOWED
     * @type {Integer (UInt32)}
     */
    static PATCH_REMOVAL_DISALLOWED => 1649

    /**
     * Native name: ERROR_INVALID_PATCH_XML
     * @type {Integer (UInt32)}
     */
    static INVALID_PATCH_XML => 1650

    /**
     * Native name: ERROR_PATCH_MANAGED_ADVERTISED_PRODUCT
     * @type {Integer (UInt32)}
     */
    static PATCH_MANAGED_ADVERTISED_PRODUCT => 1651

    /**
     * Native name: ERROR_INSTALL_SERVICE_SAFEBOOT
     * @type {Integer (UInt32)}
     */
    static INSTALL_SERVICE_SAFEBOOT => 1652

    /**
     * Native name: ERROR_FAIL_FAST_EXCEPTION
     * @type {Integer (UInt32)}
     */
    static FAIL_FAST_EXCEPTION => 1653

    /**
     * Native name: ERROR_INSTALL_REJECTED
     * @type {Integer (UInt32)}
     */
    static INSTALL_REJECTED => 1654

    /**
     * Native name: ERROR_DYNAMIC_CODE_BLOCKED
     * @type {Integer (UInt32)}
     */
    static DYNAMIC_CODE_BLOCKED => 1655

    /**
     * Native name: ERROR_NOT_SAME_OBJECT
     * @type {Integer (UInt32)}
     */
    static NOT_SAME_OBJECT => 1656

    /**
     * Native name: ERROR_STRICT_CFG_VIOLATION
     * @type {Integer (UInt32)}
     */
    static STRICT_CFG_VIOLATION => 1657

    /**
     * Native name: ERROR_SET_CONTEXT_DENIED
     * @type {Integer (UInt32)}
     */
    static SET_CONTEXT_DENIED => 1660

    /**
     * Native name: ERROR_CROSS_PARTITION_VIOLATION
     * @type {Integer (UInt32)}
     */
    static CROSS_PARTITION_VIOLATION => 1661

    /**
     * Native name: ERROR_RETURN_ADDRESS_HIJACK_ATTEMPT
     * @type {Integer (UInt32)}
     */
    static RETURN_ADDRESS_HIJACK_ATTEMPT => 1662

    /**
     * Native name: ERROR_INVALID_USER_BUFFER
     * @type {Integer (UInt32)}
     */
    static INVALID_USER_BUFFER => 1784

    /**
     * Native name: ERROR_UNRECOGNIZED_MEDIA
     * @type {Integer (UInt32)}
     */
    static UNRECOGNIZED_MEDIA => 1785

    /**
     * Native name: ERROR_NO_TRUST_LSA_SECRET
     * @type {Integer (UInt32)}
     */
    static NO_TRUST_LSA_SECRET => 1786

    /**
     * Native name: ERROR_NO_TRUST_SAM_ACCOUNT
     * @type {Integer (UInt32)}
     */
    static NO_TRUST_SAM_ACCOUNT => 1787

    /**
     * Native name: ERROR_TRUSTED_DOMAIN_FAILURE
     * @type {Integer (UInt32)}
     */
    static TRUSTED_DOMAIN_FAILURE => 1788

    /**
     * Native name: ERROR_TRUSTED_RELATIONSHIP_FAILURE
     * @type {Integer (UInt32)}
     */
    static TRUSTED_RELATIONSHIP_FAILURE => 1789

    /**
     * Native name: ERROR_TRUST_FAILURE
     * @type {Integer (UInt32)}
     */
    static TRUST_FAILURE => 1790

    /**
     * Native name: ERROR_NETLOGON_NOT_STARTED
     * @type {Integer (UInt32)}
     */
    static NETLOGON_NOT_STARTED => 1792

    /**
     * Native name: ERROR_ACCOUNT_EXPIRED
     * @type {Integer (UInt32)}
     */
    static ACCOUNT_EXPIRED => 1793

    /**
     * Native name: ERROR_REDIRECTOR_HAS_OPEN_HANDLES
     * @type {Integer (UInt32)}
     */
    static REDIRECTOR_HAS_OPEN_HANDLES => 1794

    /**
     * Native name: ERROR_PRINTER_DRIVER_ALREADY_INSTALLED
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_ALREADY_INSTALLED => 1795

    /**
     * Native name: ERROR_UNKNOWN_PORT
     * @type {Integer (UInt32)}
     */
    static UNKNOWN_PORT => 1796

    /**
     * Native name: ERROR_UNKNOWN_PRINTER_DRIVER
     * @type {Integer (UInt32)}
     */
    static UNKNOWN_PRINTER_DRIVER => 1797

    /**
     * Native name: ERROR_UNKNOWN_PRINTPROCESSOR
     * @type {Integer (UInt32)}
     */
    static UNKNOWN_PRINTPROCESSOR => 1798

    /**
     * Native name: ERROR_INVALID_SEPARATOR_FILE
     * @type {Integer (UInt32)}
     */
    static INVALID_SEPARATOR_FILE => 1799

    /**
     * Native name: ERROR_INVALID_PRIORITY
     * @type {Integer (UInt32)}
     */
    static INVALID_PRIORITY => 1800

    /**
     * Native name: ERROR_INVALID_PRINTER_NAME
     * @type {Integer (UInt32)}
     */
    static INVALID_PRINTER_NAME => 1801

    /**
     * Native name: ERROR_PRINTER_ALREADY_EXISTS
     * @type {Integer (UInt32)}
     */
    static PRINTER_ALREADY_EXISTS => 1802

    /**
     * Native name: ERROR_INVALID_PRINTER_COMMAND
     * @type {Integer (UInt32)}
     */
    static INVALID_PRINTER_COMMAND => 1803

    /**
     * Native name: ERROR_INVALID_DATATYPE
     * @type {Integer (UInt32)}
     */
    static INVALID_DATATYPE => 1804

    /**
     * Native name: ERROR_INVALID_ENVIRONMENT
     * @type {Integer (UInt32)}
     */
    static INVALID_ENVIRONMENT => 1805

    /**
     * Native name: ERROR_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT
     * @type {Integer (UInt32)}
     */
    static NOLOGON_INTERDOMAIN_TRUST_ACCOUNT => 1807

    /**
     * Native name: ERROR_NOLOGON_WORKSTATION_TRUST_ACCOUNT
     * @type {Integer (UInt32)}
     */
    static NOLOGON_WORKSTATION_TRUST_ACCOUNT => 1808

    /**
     * Native name: ERROR_NOLOGON_SERVER_TRUST_ACCOUNT
     * @type {Integer (UInt32)}
     */
    static NOLOGON_SERVER_TRUST_ACCOUNT => 1809

    /**
     * Native name: ERROR_DOMAIN_TRUST_INCONSISTENT
     * @type {Integer (UInt32)}
     */
    static DOMAIN_TRUST_INCONSISTENT => 1810

    /**
     * Native name: ERROR_SERVER_HAS_OPEN_HANDLES
     * @type {Integer (UInt32)}
     */
    static SERVER_HAS_OPEN_HANDLES => 1811

    /**
     * Native name: ERROR_RESOURCE_DATA_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static RESOURCE_DATA_NOT_FOUND => 1812

    /**
     * Native name: ERROR_RESOURCE_TYPE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static RESOURCE_TYPE_NOT_FOUND => 1813

    /**
     * Native name: ERROR_RESOURCE_NAME_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static RESOURCE_NAME_NOT_FOUND => 1814

    /**
     * Native name: ERROR_RESOURCE_LANG_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static RESOURCE_LANG_NOT_FOUND => 1815

    /**
     * Native name: ERROR_NOT_ENOUGH_QUOTA
     * @type {Integer (UInt32)}
     */
    static NOT_ENOUGH_QUOTA => 1816

    /**
     * Native name: ERROR_INVALID_TIME
     * @type {Integer (UInt32)}
     */
    static INVALID_TIME => 1901

    /**
     * Native name: ERROR_INVALID_FORM_NAME
     * @type {Integer (UInt32)}
     */
    static INVALID_FORM_NAME => 1902

    /**
     * Native name: ERROR_INVALID_FORM_SIZE
     * @type {Integer (UInt32)}
     */
    static INVALID_FORM_SIZE => 1903

    /**
     * Native name: ERROR_ALREADY_WAITING
     * @type {Integer (UInt32)}
     */
    static ALREADY_WAITING => 1904

    /**
     * Native name: ERROR_PRINTER_DELETED
     * @type {Integer (UInt32)}
     */
    static PRINTER_DELETED => 1905

    /**
     * Native name: ERROR_INVALID_PRINTER_STATE
     * @type {Integer (UInt32)}
     */
    static INVALID_PRINTER_STATE => 1906

    /**
     * Native name: ERROR_PASSWORD_MUST_CHANGE
     * @type {Integer (UInt32)}
     */
    static PASSWORD_MUST_CHANGE => 1907

    /**
     * Native name: ERROR_DOMAIN_CONTROLLER_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static DOMAIN_CONTROLLER_NOT_FOUND => 1908

    /**
     * Native name: ERROR_ACCOUNT_LOCKED_OUT
     * @type {Integer (UInt32)}
     */
    static ACCOUNT_LOCKED_OUT => 1909

    /**
     * Native name: ERROR_NO_SITENAME
     * @type {Integer (UInt32)}
     */
    static NO_SITENAME => 1919

    /**
     * Native name: ERROR_CANT_ACCESS_FILE
     * @type {Integer (UInt32)}
     */
    static CANT_ACCESS_FILE => 1920

    /**
     * Native name: ERROR_CANT_RESOLVE_FILENAME
     * @type {Integer (UInt32)}
     */
    static CANT_RESOLVE_FILENAME => 1921

    /**
     * Native name: ERROR_KM_DRIVER_BLOCKED
     * @type {Integer (UInt32)}
     */
    static KM_DRIVER_BLOCKED => 1930

    /**
     * Native name: ERROR_CONTEXT_EXPIRED
     * @type {Integer (UInt32)}
     */
    static CONTEXT_EXPIRED => 1931

    /**
     * Native name: ERROR_PER_USER_TRUST_QUOTA_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static PER_USER_TRUST_QUOTA_EXCEEDED => 1932

    /**
     * Native name: ERROR_ALL_USER_TRUST_QUOTA_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static ALL_USER_TRUST_QUOTA_EXCEEDED => 1933

    /**
     * Native name: ERROR_USER_DELETE_TRUST_QUOTA_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static USER_DELETE_TRUST_QUOTA_EXCEEDED => 1934

    /**
     * Native name: ERROR_AUTHENTICATION_FIREWALL_FAILED
     * @type {Integer (UInt32)}
     */
    static AUTHENTICATION_FIREWALL_FAILED => 1935

    /**
     * Native name: ERROR_REMOTE_PRINT_CONNECTIONS_BLOCKED
     * @type {Integer (UInt32)}
     */
    static REMOTE_PRINT_CONNECTIONS_BLOCKED => 1936

    /**
     * Native name: ERROR_NTLM_BLOCKED
     * @type {Integer (UInt32)}
     */
    static NTLM_BLOCKED => 1937

    /**
     * Native name: ERROR_PASSWORD_CHANGE_REQUIRED
     * @type {Integer (UInt32)}
     */
    static PASSWORD_CHANGE_REQUIRED => 1938

    /**
     * Native name: ERROR_LOST_MODE_LOGON_RESTRICTION
     * @type {Integer (UInt32)}
     */
    static LOST_MODE_LOGON_RESTRICTION => 1939

    /**
     * Native name: ERROR_INVALID_PIXEL_FORMAT
     * @type {Integer (UInt32)}
     */
    static INVALID_PIXEL_FORMAT => 2000

    /**
     * Native name: ERROR_BAD_DRIVER
     * @type {Integer (UInt32)}
     */
    static BAD_DRIVER => 2001

    /**
     * Native name: ERROR_INVALID_WINDOW_STYLE
     * @type {Integer (UInt32)}
     */
    static INVALID_WINDOW_STYLE => 2002

    /**
     * Native name: ERROR_METAFILE_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static METAFILE_NOT_SUPPORTED => 2003

    /**
     * Native name: ERROR_TRANSFORM_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static TRANSFORM_NOT_SUPPORTED => 2004

    /**
     * Native name: ERROR_CLIPPING_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static CLIPPING_NOT_SUPPORTED => 2005

    /**
     * Native name: ERROR_INVALID_CMM
     * @type {Integer (UInt32)}
     */
    static INVALID_CMM => 2010

    /**
     * Native name: ERROR_INVALID_PROFILE
     * @type {Integer (UInt32)}
     */
    static INVALID_PROFILE => 2011

    /**
     * Native name: ERROR_TAG_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static TAG_NOT_FOUND => 2012

    /**
     * Native name: ERROR_TAG_NOT_PRESENT
     * @type {Integer (UInt32)}
     */
    static TAG_NOT_PRESENT => 2013

    /**
     * Native name: ERROR_DUPLICATE_TAG
     * @type {Integer (UInt32)}
     */
    static DUPLICATE_TAG => 2014

    /**
     * Native name: ERROR_PROFILE_NOT_ASSOCIATED_WITH_DEVICE
     * @type {Integer (UInt32)}
     */
    static PROFILE_NOT_ASSOCIATED_WITH_DEVICE => 2015

    /**
     * Native name: ERROR_PROFILE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static PROFILE_NOT_FOUND => 2016

    /**
     * Native name: ERROR_INVALID_COLORSPACE
     * @type {Integer (UInt32)}
     */
    static INVALID_COLORSPACE => 2017

    /**
     * Native name: ERROR_ICM_NOT_ENABLED
     * @type {Integer (UInt32)}
     */
    static ICM_NOT_ENABLED => 2018

    /**
     * Native name: ERROR_DELETING_ICM_XFORM
     * @type {Integer (UInt32)}
     */
    static DELETING_ICM_XFORM => 2019

    /**
     * Native name: ERROR_INVALID_TRANSFORM
     * @type {Integer (UInt32)}
     */
    static INVALID_TRANSFORM => 2020

    /**
     * Native name: ERROR_COLORSPACE_MISMATCH
     * @type {Integer (UInt32)}
     */
    static COLORSPACE_MISMATCH => 2021

    /**
     * Native name: ERROR_INVALID_COLORINDEX
     * @type {Integer (UInt32)}
     */
    static INVALID_COLORINDEX => 2022

    /**
     * Native name: ERROR_PROFILE_DOES_NOT_MATCH_DEVICE
     * @type {Integer (UInt32)}
     */
    static PROFILE_DOES_NOT_MATCH_DEVICE => 2023

    /**
     * Native name: ERROR_CONNECTED_OTHER_PASSWORD
     * @type {Integer (UInt32)}
     */
    static CONNECTED_OTHER_PASSWORD => 2108

    /**
     * Native name: ERROR_CONNECTED_OTHER_PASSWORD_DEFAULT
     * @type {Integer (UInt32)}
     */
    static CONNECTED_OTHER_PASSWORD_DEFAULT => 2109

    /**
     * Native name: ERROR_BAD_USERNAME
     * @type {Integer (UInt32)}
     */
    static BAD_USERNAME => 2202

    /**
     * Native name: ERROR_NOT_CONNECTED
     * @type {Integer (UInt32)}
     */
    static NOT_CONNECTED => 2250

    /**
     * Native name: ERROR_OPEN_FILES
     * @type {Integer (UInt32)}
     */
    static OPEN_FILES => 2401

    /**
     * Native name: ERROR_ACTIVE_CONNECTIONS
     * @type {Integer (UInt32)}
     */
    static ACTIVE_CONNECTIONS => 2402

    /**
     * Native name: ERROR_DEVICE_IN_USE
     * @type {Integer (UInt32)}
     */
    static DEVICE_IN_USE => 2404

    /**
     * Native name: ERROR_UNKNOWN_PRINT_MONITOR
     * @type {Integer (UInt32)}
     */
    static UNKNOWN_PRINT_MONITOR => 3000

    /**
     * Native name: ERROR_PRINTER_DRIVER_IN_USE
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_IN_USE => 3001

    /**
     * Native name: ERROR_SPOOL_FILE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static SPOOL_FILE_NOT_FOUND => 3002

    /**
     * Native name: ERROR_SPL_NO_STARTDOC
     * @type {Integer (UInt32)}
     */
    static SPL_NO_STARTDOC => 3003

    /**
     * Native name: ERROR_SPL_NO_ADDJOB
     * @type {Integer (UInt32)}
     */
    static SPL_NO_ADDJOB => 3004

    /**
     * Native name: ERROR_PRINT_PROCESSOR_ALREADY_INSTALLED
     * @type {Integer (UInt32)}
     */
    static PRINT_PROCESSOR_ALREADY_INSTALLED => 3005

    /**
     * Native name: ERROR_PRINT_MONITOR_ALREADY_INSTALLED
     * @type {Integer (UInt32)}
     */
    static PRINT_MONITOR_ALREADY_INSTALLED => 3006

    /**
     * Native name: ERROR_INVALID_PRINT_MONITOR
     * @type {Integer (UInt32)}
     */
    static INVALID_PRINT_MONITOR => 3007

    /**
     * Native name: ERROR_PRINT_MONITOR_IN_USE
     * @type {Integer (UInt32)}
     */
    static PRINT_MONITOR_IN_USE => 3008

    /**
     * Native name: ERROR_PRINTER_HAS_JOBS_QUEUED
     * @type {Integer (UInt32)}
     */
    static PRINTER_HAS_JOBS_QUEUED => 3009

    /**
     * Native name: ERROR_SUCCESS_REBOOT_REQUIRED
     * @type {Integer (UInt32)}
     */
    static SUCCESS_REBOOT_REQUIRED => 3010

    /**
     * Native name: ERROR_SUCCESS_RESTART_REQUIRED
     * @type {Integer (UInt32)}
     */
    static SUCCESS_RESTART_REQUIRED => 3011

    /**
     * Native name: ERROR_PRINTER_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOT_FOUND => 3012

    /**
     * Native name: ERROR_PRINTER_DRIVER_WARNED
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_WARNED => 3013

    /**
     * Native name: ERROR_PRINTER_DRIVER_BLOCKED
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_BLOCKED => 3014

    /**
     * Native name: ERROR_PRINTER_DRIVER_PACKAGE_IN_USE
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_PACKAGE_IN_USE => 3015

    /**
     * Native name: ERROR_CORE_DRIVER_PACKAGE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static CORE_DRIVER_PACKAGE_NOT_FOUND => 3016

    /**
     * Native name: ERROR_FAIL_REBOOT_REQUIRED
     * @type {Integer (UInt32)}
     */
    static FAIL_REBOOT_REQUIRED => 3017

    /**
     * Native name: ERROR_FAIL_REBOOT_INITIATED
     * @type {Integer (UInt32)}
     */
    static FAIL_REBOOT_INITIATED => 3018

    /**
     * Native name: ERROR_PRINTER_DRIVER_DOWNLOAD_NEEDED
     * @type {Integer (UInt32)}
     */
    static PRINTER_DRIVER_DOWNLOAD_NEEDED => 3019

    /**
     * Native name: ERROR_PRINT_JOB_RESTART_REQUIRED
     * @type {Integer (UInt32)}
     */
    static PRINT_JOB_RESTART_REQUIRED => 3020

    /**
     * Native name: ERROR_INVALID_PRINTER_DRIVER_MANIFEST
     * @type {Integer (UInt32)}
     */
    static INVALID_PRINTER_DRIVER_MANIFEST => 3021

    /**
     * Native name: ERROR_PRINTER_NOT_SHAREABLE
     * @type {Integer (UInt32)}
     */
    static PRINTER_NOT_SHAREABLE => 3022

    /**
     * Native name: ERROR_SERVER_SERVICE_CALL_REQUIRES_SMB1
     * @type {Integer (UInt32)}
     */
    static SERVER_SERVICE_CALL_REQUIRES_SMB1 => 3023

    /**
     * Native name: ERROR_NETWORK_AUTHENTICATION_PROMPT_CANCELED
     * @type {Integer (UInt32)}
     */
    static NETWORK_AUTHENTICATION_PROMPT_CANCELED => 3024

    /**
     * Native name: ERROR_REMOTE_MAILSLOTS_DEPRECATED
     * @type {Integer (UInt32)}
     */
    static REMOTE_MAILSLOTS_DEPRECATED => 3025

    /**
     * Native name: ERROR_REQUEST_PAUSED
     * @type {Integer (UInt32)}
     */
    static REQUEST_PAUSED => 3050

    /**
     * Native name: ERROR_APPEXEC_CONDITION_NOT_SATISFIED
     * @type {Integer (UInt32)}
     */
    static APPEXEC_CONDITION_NOT_SATISFIED => 3060

    /**
     * Native name: ERROR_APPEXEC_HANDLE_INVALIDATED
     * @type {Integer (UInt32)}
     */
    static APPEXEC_HANDLE_INVALIDATED => 3061

    /**
     * Native name: ERROR_APPEXEC_INVALID_HOST_GENERATION
     * @type {Integer (UInt32)}
     */
    static APPEXEC_INVALID_HOST_GENERATION => 3062

    /**
     * Native name: ERROR_APPEXEC_UNEXPECTED_PROCESS_REGISTRATION
     * @type {Integer (UInt32)}
     */
    static APPEXEC_UNEXPECTED_PROCESS_REGISTRATION => 3063

    /**
     * Native name: ERROR_APPEXEC_INVALID_HOST_STATE
     * @type {Integer (UInt32)}
     */
    static APPEXEC_INVALID_HOST_STATE => 3064

    /**
     * Native name: ERROR_APPEXEC_NO_DONOR
     * @type {Integer (UInt32)}
     */
    static APPEXEC_NO_DONOR => 3065

    /**
     * Native name: ERROR_APPEXEC_HOST_ID_MISMATCH
     * @type {Integer (UInt32)}
     */
    static APPEXEC_HOST_ID_MISMATCH => 3066

    /**
     * Native name: ERROR_APPEXEC_UNKNOWN_USER
     * @type {Integer (UInt32)}
     */
    static APPEXEC_UNKNOWN_USER => 3067

    /**
     * Native name: ERROR_APPEXEC_APP_COMPAT_BLOCK
     * @type {Integer (UInt32)}
     */
    static APPEXEC_APP_COMPAT_BLOCK => 3068

    /**
     * Native name: ERROR_APPEXEC_CALLER_WAIT_TIMEOUT
     * @type {Integer (UInt32)}
     */
    static APPEXEC_CALLER_WAIT_TIMEOUT => 3069

    /**
     * Native name: ERROR_APPEXEC_CALLER_WAIT_TIMEOUT_TERMINATION
     * @type {Integer (UInt32)}
     */
    static APPEXEC_CALLER_WAIT_TIMEOUT_TERMINATION => 3070

    /**
     * Native name: ERROR_APPEXEC_CALLER_WAIT_TIMEOUT_LICENSING
     * @type {Integer (UInt32)}
     */
    static APPEXEC_CALLER_WAIT_TIMEOUT_LICENSING => 3071

    /**
     * Native name: ERROR_APPEXEC_CALLER_WAIT_TIMEOUT_RESOURCES
     * @type {Integer (UInt32)}
     */
    static APPEXEC_CALLER_WAIT_TIMEOUT_RESOURCES => 3072

    /**
     * Native name: ERROR_VRF_VOLATILE_CFG_AND_IO_ENABLED
     * @type {Integer (UInt32)}
     */
    static VRF_VOLATILE_CFG_AND_IO_ENABLED => 3080

    /**
     * Native name: ERROR_VRF_VOLATILE_NOT_STOPPABLE
     * @type {Integer (UInt32)}
     */
    static VRF_VOLATILE_NOT_STOPPABLE => 3081

    /**
     * Native name: ERROR_VRF_VOLATILE_SAFE_MODE
     * @type {Integer (UInt32)}
     */
    static VRF_VOLATILE_SAFE_MODE => 3082

    /**
     * Native name: ERROR_VRF_VOLATILE_NOT_RUNNABLE_SYSTEM
     * @type {Integer (UInt32)}
     */
    static VRF_VOLATILE_NOT_RUNNABLE_SYSTEM => 3083

    /**
     * Native name: ERROR_VRF_VOLATILE_NOT_SUPPORTED_RULECLASS
     * @type {Integer (UInt32)}
     */
    static VRF_VOLATILE_NOT_SUPPORTED_RULECLASS => 3084

    /**
     * Native name: ERROR_VRF_VOLATILE_PROTECTED_DRIVER
     * @type {Integer (UInt32)}
     */
    static VRF_VOLATILE_PROTECTED_DRIVER => 3085

    /**
     * Native name: ERROR_VRF_VOLATILE_NMI_REGISTERED
     * @type {Integer (UInt32)}
     */
    static VRF_VOLATILE_NMI_REGISTERED => 3086

    /**
     * Native name: ERROR_VRF_VOLATILE_SETTINGS_CONFLICT
     * @type {Integer (UInt32)}
     */
    static VRF_VOLATILE_SETTINGS_CONFLICT => 3087

    /**
     * Native name: ERROR_CAR_LKD_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static CAR_LKD_IN_PROGRESS => 3088

    /**
     * Native name: ERROR_DIF_ZERO_SIZE_INFORMATION
     * @type {Integer (UInt32)}
     */
    static DIF_ZERO_SIZE_INFORMATION => 3187

    /**
     * Native name: ERROR_DIF_DRIVER_PLUGIN_MISMATCH
     * @type {Integer (UInt32)}
     */
    static DIF_DRIVER_PLUGIN_MISMATCH => 3188

    /**
     * Native name: ERROR_DIF_DRIVER_THUNKS_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static DIF_DRIVER_THUNKS_NOT_ALLOWED => 3189

    /**
     * Native name: ERROR_DIF_IOCALLBACK_NOT_REPLACED
     * @type {Integer (UInt32)}
     */
    static DIF_IOCALLBACK_NOT_REPLACED => 3190

    /**
     * Native name: ERROR_DIF_LIVEDUMP_LIMIT_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static DIF_LIVEDUMP_LIMIT_EXCEEDED => 3191

    /**
     * Native name: ERROR_DIF_VOLATILE_SECTION_NOT_LOCKED
     * @type {Integer (UInt32)}
     */
    static DIF_VOLATILE_SECTION_NOT_LOCKED => 3192

    /**
     * Native name: ERROR_DIF_VOLATILE_DRIVER_HOTPATCHED
     * @type {Integer (UInt32)}
     */
    static DIF_VOLATILE_DRIVER_HOTPATCHED => 3193

    /**
     * Native name: ERROR_DIF_VOLATILE_INVALID_INFO
     * @type {Integer (UInt32)}
     */
    static DIF_VOLATILE_INVALID_INFO => 3194

    /**
     * Native name: ERROR_DIF_VOLATILE_DRIVER_IS_NOT_RUNNING
     * @type {Integer (UInt32)}
     */
    static DIF_VOLATILE_DRIVER_IS_NOT_RUNNING => 3195

    /**
     * Native name: ERROR_DIF_VOLATILE_PLUGIN_IS_NOT_RUNNING
     * @type {Integer (UInt32)}
     */
    static DIF_VOLATILE_PLUGIN_IS_NOT_RUNNING => 3196

    /**
     * Native name: ERROR_DIF_VOLATILE_PLUGIN_CHANGE_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static DIF_VOLATILE_PLUGIN_CHANGE_NOT_ALLOWED => 3197

    /**
     * Native name: ERROR_DIF_VOLATILE_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static DIF_VOLATILE_NOT_ALLOWED => 3198

    /**
     * Native name: ERROR_DIF_BINDING_API_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static DIF_BINDING_API_NOT_FOUND => 3199

    /**
     * Native name: ERROR_IO_REISSUE_AS_CACHED
     * @type {Integer (UInt32)}
     */
    static IO_REISSUE_AS_CACHED => 3950

    /**
     * Native name: ERROR_WINS_INTERNAL
     * @type {Integer (UInt32)}
     */
    static WINS_INTERNAL => 4000

    /**
     * Native name: ERROR_CAN_NOT_DEL_LOCAL_WINS
     * @type {Integer (UInt32)}
     */
    static CAN_NOT_DEL_LOCAL_WINS => 4001

    /**
     * Native name: ERROR_STATIC_INIT
     * @type {Integer (UInt32)}
     */
    static STATIC_INIT => 4002

    /**
     * Native name: ERROR_INC_BACKUP
     * @type {Integer (UInt32)}
     */
    static INC_BACKUP => 4003

    /**
     * Native name: ERROR_FULL_BACKUP
     * @type {Integer (UInt32)}
     */
    static FULL_BACKUP => 4004

    /**
     * Native name: ERROR_REC_NON_EXISTENT
     * @type {Integer (UInt32)}
     */
    static REC_NON_EXISTENT => 4005

    /**
     * Native name: ERROR_RPL_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static RPL_NOT_ALLOWED => 4006

    /**
     * Native name: ERROR_DHCP_ADDRESS_CONFLICT
     * @type {Integer (UInt32)}
     */
    static DHCP_ADDRESS_CONFLICT => 4100

    /**
     * Native name: ERROR_WMI_GUID_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static WMI_GUID_NOT_FOUND => 4200

    /**
     * Native name: ERROR_WMI_INSTANCE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static WMI_INSTANCE_NOT_FOUND => 4201

    /**
     * Native name: ERROR_WMI_ITEMID_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static WMI_ITEMID_NOT_FOUND => 4202

    /**
     * Native name: ERROR_WMI_TRY_AGAIN
     * @type {Integer (UInt32)}
     */
    static WMI_TRY_AGAIN => 4203

    /**
     * Native name: ERROR_WMI_DP_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static WMI_DP_NOT_FOUND => 4204

    /**
     * Native name: ERROR_WMI_UNRESOLVED_INSTANCE_REF
     * @type {Integer (UInt32)}
     */
    static WMI_UNRESOLVED_INSTANCE_REF => 4205

    /**
     * Native name: ERROR_WMI_ALREADY_ENABLED
     * @type {Integer (UInt32)}
     */
    static WMI_ALREADY_ENABLED => 4206

    /**
     * Native name: ERROR_WMI_GUID_DISCONNECTED
     * @type {Integer (UInt32)}
     */
    static WMI_GUID_DISCONNECTED => 4207

    /**
     * Native name: ERROR_WMI_SERVER_UNAVAILABLE
     * @type {Integer (UInt32)}
     */
    static WMI_SERVER_UNAVAILABLE => 4208

    /**
     * Native name: ERROR_WMI_DP_FAILED
     * @type {Integer (UInt32)}
     */
    static WMI_DP_FAILED => 4209

    /**
     * Native name: ERROR_WMI_INVALID_MOF
     * @type {Integer (UInt32)}
     */
    static WMI_INVALID_MOF => 4210

    /**
     * Native name: ERROR_WMI_INVALID_REGINFO
     * @type {Integer (UInt32)}
     */
    static WMI_INVALID_REGINFO => 4211

    /**
     * Native name: ERROR_WMI_ALREADY_DISABLED
     * @type {Integer (UInt32)}
     */
    static WMI_ALREADY_DISABLED => 4212

    /**
     * Native name: ERROR_WMI_READ_ONLY
     * @type {Integer (UInt32)}
     */
    static WMI_READ_ONLY => 4213

    /**
     * Native name: ERROR_WMI_SET_FAILURE
     * @type {Integer (UInt32)}
     */
    static WMI_SET_FAILURE => 4214

    /**
     * Native name: ERROR_NOT_APPCONTAINER
     * @type {Integer (UInt32)}
     */
    static NOT_APPCONTAINER => 4250

    /**
     * Native name: ERROR_APPCONTAINER_REQUIRED
     * @type {Integer (UInt32)}
     */
    static APPCONTAINER_REQUIRED => 4251

    /**
     * Native name: ERROR_NOT_SUPPORTED_IN_APPCONTAINER
     * @type {Integer (UInt32)}
     */
    static NOT_SUPPORTED_IN_APPCONTAINER => 4252

    /**
     * Native name: ERROR_INVALID_PACKAGE_SID_LENGTH
     * @type {Integer (UInt32)}
     */
    static INVALID_PACKAGE_SID_LENGTH => 4253

    /**
     * Native name: ERROR_INVALID_MEDIA
     * @type {Integer (UInt32)}
     */
    static INVALID_MEDIA => 4300

    /**
     * Native name: ERROR_INVALID_LIBRARY
     * @type {Integer (UInt32)}
     */
    static INVALID_LIBRARY => 4301

    /**
     * Native name: ERROR_INVALID_MEDIA_POOL
     * @type {Integer (UInt32)}
     */
    static INVALID_MEDIA_POOL => 4302

    /**
     * Native name: ERROR_DRIVE_MEDIA_MISMATCH
     * @type {Integer (UInt32)}
     */
    static DRIVE_MEDIA_MISMATCH => 4303

    /**
     * Native name: ERROR_MEDIA_OFFLINE
     * @type {Integer (UInt32)}
     */
    static MEDIA_OFFLINE => 4304

    /**
     * Native name: ERROR_LIBRARY_OFFLINE
     * @type {Integer (UInt32)}
     */
    static LIBRARY_OFFLINE => 4305

    /**
     * Native name: ERROR_EMPTY
     * @type {Integer (UInt32)}
     */
    static EMPTY => 4306

    /**
     * Native name: ERROR_NOT_EMPTY
     * @type {Integer (UInt32)}
     */
    static NOT_EMPTY => 4307

    /**
     * Native name: ERROR_MEDIA_UNAVAILABLE
     * @type {Integer (UInt32)}
     */
    static MEDIA_UNAVAILABLE => 4308

    /**
     * Native name: ERROR_RESOURCE_DISABLED
     * @type {Integer (UInt32)}
     */
    static RESOURCE_DISABLED => 4309

    /**
     * Native name: ERROR_INVALID_CLEANER
     * @type {Integer (UInt32)}
     */
    static INVALID_CLEANER => 4310

    /**
     * Native name: ERROR_UNABLE_TO_CLEAN
     * @type {Integer (UInt32)}
     */
    static UNABLE_TO_CLEAN => 4311

    /**
     * Native name: ERROR_OBJECT_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static OBJECT_NOT_FOUND => 4312

    /**
     * Native name: ERROR_DATABASE_FAILURE
     * @type {Integer (UInt32)}
     */
    static DATABASE_FAILURE => 4313

    /**
     * Native name: ERROR_DATABASE_FULL
     * @type {Integer (UInt32)}
     */
    static DATABASE_FULL => 4314

    /**
     * Native name: ERROR_MEDIA_INCOMPATIBLE
     * @type {Integer (UInt32)}
     */
    static MEDIA_INCOMPATIBLE => 4315

    /**
     * Native name: ERROR_RESOURCE_NOT_PRESENT
     * @type {Integer (UInt32)}
     */
    static RESOURCE_NOT_PRESENT => 4316

    /**
     * Native name: ERROR_INVALID_OPERATION
     * @type {Integer (UInt32)}
     */
    static INVALID_OPERATION => 4317

    /**
     * Native name: ERROR_MEDIA_NOT_AVAILABLE
     * @type {Integer (UInt32)}
     */
    static MEDIA_NOT_AVAILABLE => 4318

    /**
     * Native name: ERROR_DEVICE_NOT_AVAILABLE
     * @type {Integer (UInt32)}
     */
    static DEVICE_NOT_AVAILABLE => 4319

    /**
     * Native name: ERROR_REQUEST_REFUSED
     * @type {Integer (UInt32)}
     */
    static REQUEST_REFUSED => 4320

    /**
     * Native name: ERROR_INVALID_DRIVE_OBJECT
     * @type {Integer (UInt32)}
     */
    static INVALID_DRIVE_OBJECT => 4321

    /**
     * Native name: ERROR_LIBRARY_FULL
     * @type {Integer (UInt32)}
     */
    static LIBRARY_FULL => 4322

    /**
     * Native name: ERROR_MEDIUM_NOT_ACCESSIBLE
     * @type {Integer (UInt32)}
     */
    static MEDIUM_NOT_ACCESSIBLE => 4323

    /**
     * Native name: ERROR_UNABLE_TO_LOAD_MEDIUM
     * @type {Integer (UInt32)}
     */
    static UNABLE_TO_LOAD_MEDIUM => 4324

    /**
     * Native name: ERROR_UNABLE_TO_INVENTORY_DRIVE
     * @type {Integer (UInt32)}
     */
    static UNABLE_TO_INVENTORY_DRIVE => 4325

    /**
     * Native name: ERROR_UNABLE_TO_INVENTORY_SLOT
     * @type {Integer (UInt32)}
     */
    static UNABLE_TO_INVENTORY_SLOT => 4326

    /**
     * Native name: ERROR_UNABLE_TO_INVENTORY_TRANSPORT
     * @type {Integer (UInt32)}
     */
    static UNABLE_TO_INVENTORY_TRANSPORT => 4327

    /**
     * Native name: ERROR_TRANSPORT_FULL
     * @type {Integer (UInt32)}
     */
    static TRANSPORT_FULL => 4328

    /**
     * Native name: ERROR_CONTROLLING_IEPORT
     * @type {Integer (UInt32)}
     */
    static CONTROLLING_IEPORT => 4329

    /**
     * Native name: ERROR_UNABLE_TO_EJECT_MOUNTED_MEDIA
     * @type {Integer (UInt32)}
     */
    static UNABLE_TO_EJECT_MOUNTED_MEDIA => 4330

    /**
     * Native name: ERROR_CLEANER_SLOT_SET
     * @type {Integer (UInt32)}
     */
    static CLEANER_SLOT_SET => 4331

    /**
     * Native name: ERROR_CLEANER_SLOT_NOT_SET
     * @type {Integer (UInt32)}
     */
    static CLEANER_SLOT_NOT_SET => 4332

    /**
     * Native name: ERROR_CLEANER_CARTRIDGE_SPENT
     * @type {Integer (UInt32)}
     */
    static CLEANER_CARTRIDGE_SPENT => 4333

    /**
     * Native name: ERROR_UNEXPECTED_OMID
     * @type {Integer (UInt32)}
     */
    static UNEXPECTED_OMID => 4334

    /**
     * Native name: ERROR_CANT_DELETE_LAST_ITEM
     * @type {Integer (UInt32)}
     */
    static CANT_DELETE_LAST_ITEM => 4335

    /**
     * Native name: ERROR_MESSAGE_EXCEEDS_MAX_SIZE
     * @type {Integer (UInt32)}
     */
    static MESSAGE_EXCEEDS_MAX_SIZE => 4336

    /**
     * Native name: ERROR_VOLUME_CONTAINS_SYS_FILES
     * @type {Integer (UInt32)}
     */
    static VOLUME_CONTAINS_SYS_FILES => 4337

    /**
     * Native name: ERROR_INDIGENOUS_TYPE
     * @type {Integer (UInt32)}
     */
    static INDIGENOUS_TYPE => 4338

    /**
     * Native name: ERROR_NO_SUPPORTING_DRIVES
     * @type {Integer (UInt32)}
     */
    static NO_SUPPORTING_DRIVES => 4339

    /**
     * Native name: ERROR_CLEANER_CARTRIDGE_INSTALLED
     * @type {Integer (UInt32)}
     */
    static CLEANER_CARTRIDGE_INSTALLED => 4340

    /**
     * Native name: ERROR_IEPORT_FULL
     * @type {Integer (UInt32)}
     */
    static IEPORT_FULL => 4341

    /**
     * Native name: ERROR_FILE_OFFLINE
     * @type {Integer (UInt32)}
     */
    static FILE_OFFLINE => 4350

    /**
     * Native name: ERROR_REMOTE_STORAGE_NOT_ACTIVE
     * @type {Integer (UInt32)}
     */
    static REMOTE_STORAGE_NOT_ACTIVE => 4351

    /**
     * Native name: ERROR_REMOTE_STORAGE_MEDIA_ERROR
     * @type {Integer (UInt32)}
     */
    static REMOTE_STORAGE_MEDIA_ERROR => 4352

    /**
     * Native name: ERROR_NOT_A_REPARSE_POINT
     * @type {Integer (UInt32)}
     */
    static NOT_A_REPARSE_POINT => 4390

    /**
     * Native name: ERROR_REPARSE_ATTRIBUTE_CONFLICT
     * @type {Integer (UInt32)}
     */
    static REPARSE_ATTRIBUTE_CONFLICT => 4391

    /**
     * Native name: ERROR_INVALID_REPARSE_DATA
     * @type {Integer (UInt32)}
     */
    static INVALID_REPARSE_DATA => 4392

    /**
     * Native name: ERROR_REPARSE_TAG_INVALID
     * @type {Integer (UInt32)}
     */
    static REPARSE_TAG_INVALID => 4393

    /**
     * Native name: ERROR_REPARSE_TAG_MISMATCH
     * @type {Integer (UInt32)}
     */
    static REPARSE_TAG_MISMATCH => 4394

    /**
     * Native name: ERROR_REPARSE_POINT_ENCOUNTERED
     * @type {Integer (UInt32)}
     */
    static REPARSE_POINT_ENCOUNTERED => 4395

    /**
     * Native name: ERROR_APP_DATA_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static APP_DATA_NOT_FOUND => 4400

    /**
     * Native name: ERROR_APP_DATA_EXPIRED
     * @type {Integer (UInt32)}
     */
    static APP_DATA_EXPIRED => 4401

    /**
     * Native name: ERROR_APP_DATA_CORRUPT
     * @type {Integer (UInt32)}
     */
    static APP_DATA_CORRUPT => 4402

    /**
     * Native name: ERROR_APP_DATA_LIMIT_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static APP_DATA_LIMIT_EXCEEDED => 4403

    /**
     * Native name: ERROR_APP_DATA_REBOOT_REQUIRED
     * @type {Integer (UInt32)}
     */
    static APP_DATA_REBOOT_REQUIRED => 4404

    /**
     * Native name: ERROR_SECUREBOOT_ROLLBACK_DETECTED
     * @type {Integer (UInt32)}
     */
    static SECUREBOOT_ROLLBACK_DETECTED => 4420

    /**
     * Native name: ERROR_SECUREBOOT_POLICY_VIOLATION
     * @type {Integer (UInt32)}
     */
    static SECUREBOOT_POLICY_VIOLATION => 4421

    /**
     * Native name: ERROR_SECUREBOOT_INVALID_POLICY
     * @type {Integer (UInt32)}
     */
    static SECUREBOOT_INVALID_POLICY => 4422

    /**
     * Native name: ERROR_SECUREBOOT_POLICY_PUBLISHER_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static SECUREBOOT_POLICY_PUBLISHER_NOT_FOUND => 4423

    /**
     * Native name: ERROR_SECUREBOOT_POLICY_NOT_SIGNED
     * @type {Integer (UInt32)}
     */
    static SECUREBOOT_POLICY_NOT_SIGNED => 4424

    /**
     * Native name: ERROR_SECUREBOOT_NOT_ENABLED
     * @type {Integer (UInt32)}
     */
    static SECUREBOOT_NOT_ENABLED => 4425

    /**
     * Native name: ERROR_SECUREBOOT_FILE_REPLACED
     * @type {Integer (UInt32)}
     */
    static SECUREBOOT_FILE_REPLACED => 4426

    /**
     * Native name: ERROR_SECUREBOOT_POLICY_NOT_AUTHORIZED
     * @type {Integer (UInt32)}
     */
    static SECUREBOOT_POLICY_NOT_AUTHORIZED => 4427

    /**
     * Native name: ERROR_SECUREBOOT_POLICY_UNKNOWN
     * @type {Integer (UInt32)}
     */
    static SECUREBOOT_POLICY_UNKNOWN => 4428

    /**
     * Native name: ERROR_SECUREBOOT_POLICY_MISSING_ANTIROLLBACKVERSION
     * @type {Integer (UInt32)}
     */
    static SECUREBOOT_POLICY_MISSING_ANTIROLLBACKVERSION => 4429

    /**
     * Native name: ERROR_SECUREBOOT_PLATFORM_ID_MISMATCH
     * @type {Integer (UInt32)}
     */
    static SECUREBOOT_PLATFORM_ID_MISMATCH => 4430

    /**
     * Native name: ERROR_SECUREBOOT_POLICY_ROLLBACK_DETECTED
     * @type {Integer (UInt32)}
     */
    static SECUREBOOT_POLICY_ROLLBACK_DETECTED => 4431

    /**
     * Native name: ERROR_SECUREBOOT_POLICY_UPGRADE_MISMATCH
     * @type {Integer (UInt32)}
     */
    static SECUREBOOT_POLICY_UPGRADE_MISMATCH => 4432

    /**
     * Native name: ERROR_SECUREBOOT_REQUIRED_POLICY_FILE_MISSING
     * @type {Integer (UInt32)}
     */
    static SECUREBOOT_REQUIRED_POLICY_FILE_MISSING => 4433

    /**
     * Native name: ERROR_SECUREBOOT_NOT_BASE_POLICY
     * @type {Integer (UInt32)}
     */
    static SECUREBOOT_NOT_BASE_POLICY => 4434

    /**
     * Native name: ERROR_SECUREBOOT_NOT_SUPPLEMENTAL_POLICY
     * @type {Integer (UInt32)}
     */
    static SECUREBOOT_NOT_SUPPLEMENTAL_POLICY => 4435

    /**
     * Native name: ERROR_OFFLOAD_READ_FLT_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static OFFLOAD_READ_FLT_NOT_SUPPORTED => 4440

    /**
     * Native name: ERROR_OFFLOAD_WRITE_FLT_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static OFFLOAD_WRITE_FLT_NOT_SUPPORTED => 4441

    /**
     * Native name: ERROR_OFFLOAD_READ_FILE_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static OFFLOAD_READ_FILE_NOT_SUPPORTED => 4442

    /**
     * Native name: ERROR_OFFLOAD_WRITE_FILE_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static OFFLOAD_WRITE_FILE_NOT_SUPPORTED => 4443

    /**
     * Native name: ERROR_ALREADY_HAS_STREAM_ID
     * @type {Integer (UInt32)}
     */
    static ALREADY_HAS_STREAM_ID => 4444

    /**
     * Native name: ERROR_SMR_GARBAGE_COLLECTION_REQUIRED
     * @type {Integer (UInt32)}
     */
    static SMR_GARBAGE_COLLECTION_REQUIRED => 4445

    /**
     * Native name: ERROR_WOF_WIM_HEADER_CORRUPT
     * @type {Integer (UInt32)}
     */
    static WOF_WIM_HEADER_CORRUPT => 4446

    /**
     * Native name: ERROR_WOF_WIM_RESOURCE_TABLE_CORRUPT
     * @type {Integer (UInt32)}
     */
    static WOF_WIM_RESOURCE_TABLE_CORRUPT => 4447

    /**
     * Native name: ERROR_WOF_FILE_RESOURCE_TABLE_CORRUPT
     * @type {Integer (UInt32)}
     */
    static WOF_FILE_RESOURCE_TABLE_CORRUPT => 4448

    /**
     * Native name: ERROR_OBJECT_IS_IMMUTABLE
     * @type {Integer (UInt32)}
     */
    static OBJECT_IS_IMMUTABLE => 4449

    /**
     * Native name: ERROR_VOLUME_NOT_SIS_ENABLED
     * @type {Integer (UInt32)}
     */
    static VOLUME_NOT_SIS_ENABLED => 4500

    /**
     * Native name: ERROR_SYSTEM_INTEGRITY_ROLLBACK_DETECTED
     * @type {Integer (UInt32)}
     */
    static SYSTEM_INTEGRITY_ROLLBACK_DETECTED => 4550

    /**
     * Native name: ERROR_SYSTEM_INTEGRITY_POLICY_VIOLATION
     * @type {Integer (UInt32)}
     */
    static SYSTEM_INTEGRITY_POLICY_VIOLATION => 4551

    /**
     * Native name: ERROR_SYSTEM_INTEGRITY_INVALID_POLICY
     * @type {Integer (UInt32)}
     */
    static SYSTEM_INTEGRITY_INVALID_POLICY => 4552

    /**
     * Native name: ERROR_SYSTEM_INTEGRITY_POLICY_NOT_SIGNED
     * @type {Integer (UInt32)}
     */
    static SYSTEM_INTEGRITY_POLICY_NOT_SIGNED => 4553

    /**
     * Native name: ERROR_SYSTEM_INTEGRITY_TOO_MANY_POLICIES
     * @type {Integer (UInt32)}
     */
    static SYSTEM_INTEGRITY_TOO_MANY_POLICIES => 4554

    /**
     * Native name: ERROR_SYSTEM_INTEGRITY_SUPPLEMENTAL_POLICY_NOT_AUTHORIZED
     * @type {Integer (UInt32)}
     */
    static SYSTEM_INTEGRITY_SUPPLEMENTAL_POLICY_NOT_AUTHORIZED => 4555

    /**
     * Native name: ERROR_SYSTEM_INTEGRITY_REPUTATION_MALICIOUS
     * @type {Integer (UInt32)}
     */
    static SYSTEM_INTEGRITY_REPUTATION_MALICIOUS => 4556

    /**
     * Native name: ERROR_SYSTEM_INTEGRITY_REPUTATION_PUA
     * @type {Integer (UInt32)}
     */
    static SYSTEM_INTEGRITY_REPUTATION_PUA => 4557

    /**
     * Native name: ERROR_SYSTEM_INTEGRITY_REPUTATION_DANGEROUS_EXT
     * @type {Integer (UInt32)}
     */
    static SYSTEM_INTEGRITY_REPUTATION_DANGEROUS_EXT => 4558

    /**
     * Native name: ERROR_SYSTEM_INTEGRITY_REPUTATION_OFFLINE
     * @type {Integer (UInt32)}
     */
    static SYSTEM_INTEGRITY_REPUTATION_OFFLINE => 4559

    /**
     * Native name: ERROR_VSM_NOT_INITIALIZED
     * @type {Integer (UInt32)}
     */
    static VSM_NOT_INITIALIZED => 4560

    /**
     * Native name: ERROR_VSM_DMA_PROTECTION_NOT_IN_USE
     * @type {Integer (UInt32)}
     */
    static VSM_DMA_PROTECTION_NOT_IN_USE => 4561

    /**
     * Native name: ERROR_VSM_KEY_CI_POLICY_ROLLBACK_DETECTED
     * @type {Integer (UInt32)}
     */
    static VSM_KEY_CI_POLICY_ROLLBACK_DETECTED => 4562

    /**
     * Native name: ERROR_VSMIDK_KEYGEN_FAILURE
     * @type {Integer (UInt32)}
     */
    static VSMIDK_KEYGEN_FAILURE => 4563

    /**
     * Native name: ERROR_VSMIDK_EXPORT_FAILURE
     * @type {Integer (UInt32)}
     */
    static VSMIDK_EXPORT_FAILURE => 4564

    /**
     * Native name: ERROR_VSMIDK_MODULUS_MISMATCH
     * @type {Integer (UInt32)}
     */
    static VSMIDK_MODULUS_MISMATCH => 4565

    /**
     * Native name: ERROR_PLATFORM_MANIFEST_NOT_AUTHORIZED
     * @type {Integer (UInt32)}
     */
    static PLATFORM_MANIFEST_NOT_AUTHORIZED => 4570

    /**
     * Native name: ERROR_PLATFORM_MANIFEST_INVALID
     * @type {Integer (UInt32)}
     */
    static PLATFORM_MANIFEST_INVALID => 4571

    /**
     * Native name: ERROR_PLATFORM_MANIFEST_FILE_NOT_AUTHORIZED
     * @type {Integer (UInt32)}
     */
    static PLATFORM_MANIFEST_FILE_NOT_AUTHORIZED => 4572

    /**
     * Native name: ERROR_PLATFORM_MANIFEST_CATALOG_NOT_AUTHORIZED
     * @type {Integer (UInt32)}
     */
    static PLATFORM_MANIFEST_CATALOG_NOT_AUTHORIZED => 4573

    /**
     * Native name: ERROR_PLATFORM_MANIFEST_BINARY_ID_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static PLATFORM_MANIFEST_BINARY_ID_NOT_FOUND => 4574

    /**
     * Native name: ERROR_PLATFORM_MANIFEST_NOT_ACTIVE
     * @type {Integer (UInt32)}
     */
    static PLATFORM_MANIFEST_NOT_ACTIVE => 4575

    /**
     * Native name: ERROR_PLATFORM_MANIFEST_NOT_SIGNED
     * @type {Integer (UInt32)}
     */
    static PLATFORM_MANIFEST_NOT_SIGNED => 4576

    /**
     * Native name: ERROR_SYSTEM_INTEGRITY_REPUTATION_UNFRIENDLY_FILE
     * @type {Integer (UInt32)}
     */
    static SYSTEM_INTEGRITY_REPUTATION_UNFRIENDLY_FILE => 4580

    /**
     * Native name: ERROR_SYSTEM_INTEGRITY_REPUTATION_UNATTAINABLE
     * @type {Integer (UInt32)}
     */
    static SYSTEM_INTEGRITY_REPUTATION_UNATTAINABLE => 4581

    /**
     * Native name: ERROR_SYSTEM_INTEGRITY_REPUTATION_EXPLICIT_DENY_FILE
     * @type {Integer (UInt32)}
     */
    static SYSTEM_INTEGRITY_REPUTATION_EXPLICIT_DENY_FILE => 4582

    /**
     * Native name: ERROR_SYSTEM_INTEGRITY_WHQL_NOT_SATISFIED
     * @type {Integer (UInt32)}
     */
    static SYSTEM_INTEGRITY_WHQL_NOT_SATISFIED => 4583

    /**
     * Native name: ERROR_DEPENDENT_RESOURCE_EXISTS
     * @type {Integer (UInt32)}
     */
    static DEPENDENT_RESOURCE_EXISTS => 5001

    /**
     * Native name: ERROR_DEPENDENCY_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static DEPENDENCY_NOT_FOUND => 5002

    /**
     * Native name: ERROR_DEPENDENCY_ALREADY_EXISTS
     * @type {Integer (UInt32)}
     */
    static DEPENDENCY_ALREADY_EXISTS => 5003

    /**
     * Native name: ERROR_RESOURCE_NOT_ONLINE
     * @type {Integer (UInt32)}
     */
    static RESOURCE_NOT_ONLINE => 5004

    /**
     * Native name: ERROR_HOST_NODE_NOT_AVAILABLE
     * @type {Integer (UInt32)}
     */
    static HOST_NODE_NOT_AVAILABLE => 5005

    /**
     * Native name: ERROR_RESOURCE_NOT_AVAILABLE
     * @type {Integer (UInt32)}
     */
    static RESOURCE_NOT_AVAILABLE => 5006

    /**
     * Native name: ERROR_RESOURCE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static RESOURCE_NOT_FOUND => 5007

    /**
     * Native name: ERROR_SHUTDOWN_CLUSTER
     * @type {Integer (UInt32)}
     */
    static SHUTDOWN_CLUSTER => 5008

    /**
     * Native name: ERROR_CANT_EVICT_ACTIVE_NODE
     * @type {Integer (UInt32)}
     */
    static CANT_EVICT_ACTIVE_NODE => 5009

    /**
     * Native name: ERROR_OBJECT_ALREADY_EXISTS
     * @type {Integer (UInt32)}
     */
    static OBJECT_ALREADY_EXISTS => 5010

    /**
     * Native name: ERROR_OBJECT_IN_LIST
     * @type {Integer (UInt32)}
     */
    static OBJECT_IN_LIST => 5011

    /**
     * Native name: ERROR_GROUP_NOT_AVAILABLE
     * @type {Integer (UInt32)}
     */
    static GROUP_NOT_AVAILABLE => 5012

    /**
     * Native name: ERROR_GROUP_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static GROUP_NOT_FOUND => 5013

    /**
     * Native name: ERROR_GROUP_NOT_ONLINE
     * @type {Integer (UInt32)}
     */
    static GROUP_NOT_ONLINE => 5014

    /**
     * Native name: ERROR_HOST_NODE_NOT_RESOURCE_OWNER
     * @type {Integer (UInt32)}
     */
    static HOST_NODE_NOT_RESOURCE_OWNER => 5015

    /**
     * Native name: ERROR_HOST_NODE_NOT_GROUP_OWNER
     * @type {Integer (UInt32)}
     */
    static HOST_NODE_NOT_GROUP_OWNER => 5016

    /**
     * Native name: ERROR_RESMON_CREATE_FAILED
     * @type {Integer (UInt32)}
     */
    static RESMON_CREATE_FAILED => 5017

    /**
     * Native name: ERROR_RESMON_ONLINE_FAILED
     * @type {Integer (UInt32)}
     */
    static RESMON_ONLINE_FAILED => 5018

    /**
     * Native name: ERROR_RESOURCE_ONLINE
     * @type {Integer (UInt32)}
     */
    static RESOURCE_ONLINE => 5019

    /**
     * Native name: ERROR_QUORUM_RESOURCE
     * @type {Integer (UInt32)}
     */
    static QUORUM_RESOURCE => 5020

    /**
     * Native name: ERROR_NOT_QUORUM_CAPABLE
     * @type {Integer (UInt32)}
     */
    static NOT_QUORUM_CAPABLE => 5021

    /**
     * Native name: ERROR_CLUSTER_SHUTTING_DOWN
     * @type {Integer (UInt32)}
     */
    static CLUSTER_SHUTTING_DOWN => 5022

    /**
     * Native name: ERROR_INVALID_STATE
     * @type {Integer (UInt32)}
     */
    static INVALID_STATE => 5023

    /**
     * Native name: ERROR_RESOURCE_PROPERTIES_STORED
     * @type {Integer (UInt32)}
     */
    static RESOURCE_PROPERTIES_STORED => 5024

    /**
     * Native name: ERROR_NOT_QUORUM_CLASS
     * @type {Integer (UInt32)}
     */
    static NOT_QUORUM_CLASS => 5025

    /**
     * Native name: ERROR_CORE_RESOURCE
     * @type {Integer (UInt32)}
     */
    static CORE_RESOURCE => 5026

    /**
     * Native name: ERROR_QUORUM_RESOURCE_ONLINE_FAILED
     * @type {Integer (UInt32)}
     */
    static QUORUM_RESOURCE_ONLINE_FAILED => 5027

    /**
     * Native name: ERROR_QUORUMLOG_OPEN_FAILED
     * @type {Integer (UInt32)}
     */
    static QUORUMLOG_OPEN_FAILED => 5028

    /**
     * Native name: ERROR_CLUSTERLOG_CORRUPT
     * @type {Integer (UInt32)}
     */
    static CLUSTERLOG_CORRUPT => 5029

    /**
     * Native name: ERROR_CLUSTERLOG_RECORD_EXCEEDS_MAXSIZE
     * @type {Integer (UInt32)}
     */
    static CLUSTERLOG_RECORD_EXCEEDS_MAXSIZE => 5030

    /**
     * Native name: ERROR_CLUSTERLOG_EXCEEDS_MAXSIZE
     * @type {Integer (UInt32)}
     */
    static CLUSTERLOG_EXCEEDS_MAXSIZE => 5031

    /**
     * Native name: ERROR_CLUSTERLOG_CHKPOINT_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static CLUSTERLOG_CHKPOINT_NOT_FOUND => 5032

    /**
     * Native name: ERROR_CLUSTERLOG_NOT_ENOUGH_SPACE
     * @type {Integer (UInt32)}
     */
    static CLUSTERLOG_NOT_ENOUGH_SPACE => 5033

    /**
     * Native name: ERROR_QUORUM_OWNER_ALIVE
     * @type {Integer (UInt32)}
     */
    static QUORUM_OWNER_ALIVE => 5034

    /**
     * Native name: ERROR_NETWORK_NOT_AVAILABLE
     * @type {Integer (UInt32)}
     */
    static NETWORK_NOT_AVAILABLE => 5035

    /**
     * Native name: ERROR_NODE_NOT_AVAILABLE
     * @type {Integer (UInt32)}
     */
    static NODE_NOT_AVAILABLE => 5036

    /**
     * Native name: ERROR_ALL_NODES_NOT_AVAILABLE
     * @type {Integer (UInt32)}
     */
    static ALL_NODES_NOT_AVAILABLE => 5037

    /**
     * Native name: ERROR_RESOURCE_FAILED
     * @type {Integer (UInt32)}
     */
    static RESOURCE_FAILED => 5038

    /**
     * Native name: ERROR_CLUSTER_INVALID_NODE
     * @type {Integer (UInt32)}
     */
    static CLUSTER_INVALID_NODE => 5039

    /**
     * Native name: ERROR_CLUSTER_NODE_EXISTS
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NODE_EXISTS => 5040

    /**
     * Native name: ERROR_CLUSTER_JOIN_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static CLUSTER_JOIN_IN_PROGRESS => 5041

    /**
     * Native name: ERROR_CLUSTER_NODE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NODE_NOT_FOUND => 5042

    /**
     * Native name: ERROR_CLUSTER_LOCAL_NODE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static CLUSTER_LOCAL_NODE_NOT_FOUND => 5043

    /**
     * Native name: ERROR_CLUSTER_NETWORK_EXISTS
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NETWORK_EXISTS => 5044

    /**
     * Native name: ERROR_CLUSTER_NETWORK_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NETWORK_NOT_FOUND => 5045

    /**
     * Native name: ERROR_CLUSTER_NETINTERFACE_EXISTS
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NETINTERFACE_EXISTS => 5046

    /**
     * Native name: ERROR_CLUSTER_NETINTERFACE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NETINTERFACE_NOT_FOUND => 5047

    /**
     * Native name: ERROR_CLUSTER_INVALID_REQUEST
     * @type {Integer (UInt32)}
     */
    static CLUSTER_INVALID_REQUEST => 5048

    /**
     * Native name: ERROR_CLUSTER_INVALID_NETWORK_PROVIDER
     * @type {Integer (UInt32)}
     */
    static CLUSTER_INVALID_NETWORK_PROVIDER => 5049

    /**
     * Native name: ERROR_CLUSTER_NODE_DOWN
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NODE_DOWN => 5050

    /**
     * Native name: ERROR_CLUSTER_NODE_UNREACHABLE
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NODE_UNREACHABLE => 5051

    /**
     * Native name: ERROR_CLUSTER_NODE_NOT_MEMBER
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NODE_NOT_MEMBER => 5052

    /**
     * Native name: ERROR_CLUSTER_JOIN_NOT_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static CLUSTER_JOIN_NOT_IN_PROGRESS => 5053

    /**
     * Native name: ERROR_CLUSTER_INVALID_NETWORK
     * @type {Integer (UInt32)}
     */
    static CLUSTER_INVALID_NETWORK => 5054

    /**
     * Native name: ERROR_CLUSTER_NODE_UP
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NODE_UP => 5056

    /**
     * Native name: ERROR_CLUSTER_IPADDR_IN_USE
     * @type {Integer (UInt32)}
     */
    static CLUSTER_IPADDR_IN_USE => 5057

    /**
     * Native name: ERROR_CLUSTER_NODE_NOT_PAUSED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NODE_NOT_PAUSED => 5058

    /**
     * Native name: ERROR_CLUSTER_NO_SECURITY_CONTEXT
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NO_SECURITY_CONTEXT => 5059

    /**
     * Native name: ERROR_CLUSTER_NETWORK_NOT_INTERNAL
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NETWORK_NOT_INTERNAL => 5060

    /**
     * Native name: ERROR_CLUSTER_NODE_ALREADY_UP
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NODE_ALREADY_UP => 5061

    /**
     * Native name: ERROR_CLUSTER_NODE_ALREADY_DOWN
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NODE_ALREADY_DOWN => 5062

    /**
     * Native name: ERROR_CLUSTER_NETWORK_ALREADY_ONLINE
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NETWORK_ALREADY_ONLINE => 5063

    /**
     * Native name: ERROR_CLUSTER_NETWORK_ALREADY_OFFLINE
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NETWORK_ALREADY_OFFLINE => 5064

    /**
     * Native name: ERROR_CLUSTER_NODE_ALREADY_MEMBER
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NODE_ALREADY_MEMBER => 5065

    /**
     * Native name: ERROR_CLUSTER_LAST_INTERNAL_NETWORK
     * @type {Integer (UInt32)}
     */
    static CLUSTER_LAST_INTERNAL_NETWORK => 5066

    /**
     * Native name: ERROR_CLUSTER_NETWORK_HAS_DEPENDENTS
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NETWORK_HAS_DEPENDENTS => 5067

    /**
     * Native name: ERROR_INVALID_OPERATION_ON_QUORUM
     * @type {Integer (UInt32)}
     */
    static INVALID_OPERATION_ON_QUORUM => 5068

    /**
     * Native name: ERROR_DEPENDENCY_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static DEPENDENCY_NOT_ALLOWED => 5069

    /**
     * Native name: ERROR_CLUSTER_NODE_PAUSED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NODE_PAUSED => 5070

    /**
     * Native name: ERROR_NODE_CANT_HOST_RESOURCE
     * @type {Integer (UInt32)}
     */
    static NODE_CANT_HOST_RESOURCE => 5071

    /**
     * Native name: ERROR_CLUSTER_NODE_NOT_READY
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NODE_NOT_READY => 5072

    /**
     * Native name: ERROR_CLUSTER_NODE_SHUTTING_DOWN
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NODE_SHUTTING_DOWN => 5073

    /**
     * Native name: ERROR_CLUSTER_JOIN_ABORTED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_JOIN_ABORTED => 5074

    /**
     * Native name: ERROR_CLUSTER_INCOMPATIBLE_VERSIONS
     * @type {Integer (UInt32)}
     */
    static CLUSTER_INCOMPATIBLE_VERSIONS => 5075

    /**
     * Native name: ERROR_CLUSTER_MAXNUM_OF_RESOURCES_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_MAXNUM_OF_RESOURCES_EXCEEDED => 5076

    /**
     * Native name: ERROR_CLUSTER_SYSTEM_CONFIG_CHANGED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_SYSTEM_CONFIG_CHANGED => 5077

    /**
     * Native name: ERROR_CLUSTER_RESOURCE_TYPE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESOURCE_TYPE_NOT_FOUND => 5078

    /**
     * Native name: ERROR_CLUSTER_RESTYPE_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESTYPE_NOT_SUPPORTED => 5079

    /**
     * Native name: ERROR_CLUSTER_RESNAME_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESNAME_NOT_FOUND => 5080

    /**
     * Native name: ERROR_CLUSTER_NO_RPC_PACKAGES_REGISTERED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NO_RPC_PACKAGES_REGISTERED => 5081

    /**
     * Native name: ERROR_CLUSTER_OWNER_NOT_IN_PREFLIST
     * @type {Integer (UInt32)}
     */
    static CLUSTER_OWNER_NOT_IN_PREFLIST => 5082

    /**
     * Native name: ERROR_CLUSTER_DATABASE_SEQMISMATCH
     * @type {Integer (UInt32)}
     */
    static CLUSTER_DATABASE_SEQMISMATCH => 5083

    /**
     * Native name: ERROR_RESMON_INVALID_STATE
     * @type {Integer (UInt32)}
     */
    static RESMON_INVALID_STATE => 5084

    /**
     * Native name: ERROR_CLUSTER_GUM_NOT_LOCKER
     * @type {Integer (UInt32)}
     */
    static CLUSTER_GUM_NOT_LOCKER => 5085

    /**
     * Native name: ERROR_QUORUM_DISK_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static QUORUM_DISK_NOT_FOUND => 5086

    /**
     * Native name: ERROR_DATABASE_BACKUP_CORRUPT
     * @type {Integer (UInt32)}
     */
    static DATABASE_BACKUP_CORRUPT => 5087

    /**
     * Native name: ERROR_CLUSTER_NODE_ALREADY_HAS_DFS_ROOT
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NODE_ALREADY_HAS_DFS_ROOT => 5088

    /**
     * Native name: ERROR_RESOURCE_PROPERTY_UNCHANGEABLE
     * @type {Integer (UInt32)}
     */
    static RESOURCE_PROPERTY_UNCHANGEABLE => 5089

    /**
     * Native name: ERROR_NO_ADMIN_ACCESS_POINT
     * @type {Integer (UInt32)}
     */
    static NO_ADMIN_ACCESS_POINT => 5090

    /**
     * Native name: ERROR_CLUSTER_MEMBERSHIP_INVALID_STATE
     * @type {Integer (UInt32)}
     */
    static CLUSTER_MEMBERSHIP_INVALID_STATE => 5890

    /**
     * Native name: ERROR_CLUSTER_QUORUMLOG_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static CLUSTER_QUORUMLOG_NOT_FOUND => 5891

    /**
     * Native name: ERROR_CLUSTER_MEMBERSHIP_HALT
     * @type {Integer (UInt32)}
     */
    static CLUSTER_MEMBERSHIP_HALT => 5892

    /**
     * Native name: ERROR_CLUSTER_INSTANCE_ID_MISMATCH
     * @type {Integer (UInt32)}
     */
    static CLUSTER_INSTANCE_ID_MISMATCH => 5893

    /**
     * Native name: ERROR_CLUSTER_NETWORK_NOT_FOUND_FOR_IP
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NETWORK_NOT_FOUND_FOR_IP => 5894

    /**
     * Native name: ERROR_CLUSTER_PROPERTY_DATA_TYPE_MISMATCH
     * @type {Integer (UInt32)}
     */
    static CLUSTER_PROPERTY_DATA_TYPE_MISMATCH => 5895

    /**
     * Native name: ERROR_CLUSTER_EVICT_WITHOUT_CLEANUP
     * @type {Integer (UInt32)}
     */
    static CLUSTER_EVICT_WITHOUT_CLEANUP => 5896

    /**
     * Native name: ERROR_CLUSTER_PARAMETER_MISMATCH
     * @type {Integer (UInt32)}
     */
    static CLUSTER_PARAMETER_MISMATCH => 5897

    /**
     * Native name: ERROR_NODE_CANNOT_BE_CLUSTERED
     * @type {Integer (UInt32)}
     */
    static NODE_CANNOT_BE_CLUSTERED => 5898

    /**
     * Native name: ERROR_CLUSTER_WRONG_OS_VERSION
     * @type {Integer (UInt32)}
     */
    static CLUSTER_WRONG_OS_VERSION => 5899

    /**
     * Native name: ERROR_CLUSTER_CANT_CREATE_DUP_CLUSTER_NAME
     * @type {Integer (UInt32)}
     */
    static CLUSTER_CANT_CREATE_DUP_CLUSTER_NAME => 5900

    /**
     * Native name: ERROR_CLUSCFG_ALREADY_COMMITTED
     * @type {Integer (UInt32)}
     */
    static CLUSCFG_ALREADY_COMMITTED => 5901

    /**
     * Native name: ERROR_CLUSCFG_ROLLBACK_FAILED
     * @type {Integer (UInt32)}
     */
    static CLUSCFG_ROLLBACK_FAILED => 5902

    /**
     * Native name: ERROR_CLUSCFG_SYSTEM_DISK_DRIVE_LETTER_CONFLICT
     * @type {Integer (UInt32)}
     */
    static CLUSCFG_SYSTEM_DISK_DRIVE_LETTER_CONFLICT => 5903

    /**
     * Native name: ERROR_CLUSTER_OLD_VERSION
     * @type {Integer (UInt32)}
     */
    static CLUSTER_OLD_VERSION => 5904

    /**
     * Native name: ERROR_CLUSTER_MISMATCHED_COMPUTER_ACCT_NAME
     * @type {Integer (UInt32)}
     */
    static CLUSTER_MISMATCHED_COMPUTER_ACCT_NAME => 5905

    /**
     * Native name: ERROR_CLUSTER_NO_NET_ADAPTERS
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NO_NET_ADAPTERS => 5906

    /**
     * Native name: ERROR_CLUSTER_POISONED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_POISONED => 5907

    /**
     * Native name: ERROR_CLUSTER_GROUP_MOVING
     * @type {Integer (UInt32)}
     */
    static CLUSTER_GROUP_MOVING => 5908

    /**
     * Native name: ERROR_CLUSTER_RESOURCE_TYPE_BUSY
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESOURCE_TYPE_BUSY => 5909

    /**
     * Native name: ERROR_RESOURCE_CALL_TIMED_OUT
     * @type {Integer (UInt32)}
     */
    static RESOURCE_CALL_TIMED_OUT => 5910

    /**
     * Native name: ERROR_INVALID_CLUSTER_IPV6_ADDRESS
     * @type {Integer (UInt32)}
     */
    static INVALID_CLUSTER_IPV6_ADDRESS => 5911

    /**
     * Native name: ERROR_CLUSTER_INTERNAL_INVALID_FUNCTION
     * @type {Integer (UInt32)}
     */
    static CLUSTER_INTERNAL_INVALID_FUNCTION => 5912

    /**
     * Native name: ERROR_CLUSTER_PARAMETER_OUT_OF_BOUNDS
     * @type {Integer (UInt32)}
     */
    static CLUSTER_PARAMETER_OUT_OF_BOUNDS => 5913

    /**
     * Native name: ERROR_CLUSTER_PARTIAL_SEND
     * @type {Integer (UInt32)}
     */
    static CLUSTER_PARTIAL_SEND => 5914

    /**
     * Native name: ERROR_CLUSTER_REGISTRY_INVALID_FUNCTION
     * @type {Integer (UInt32)}
     */
    static CLUSTER_REGISTRY_INVALID_FUNCTION => 5915

    /**
     * Native name: ERROR_CLUSTER_INVALID_STRING_TERMINATION
     * @type {Integer (UInt32)}
     */
    static CLUSTER_INVALID_STRING_TERMINATION => 5916

    /**
     * Native name: ERROR_CLUSTER_INVALID_STRING_FORMAT
     * @type {Integer (UInt32)}
     */
    static CLUSTER_INVALID_STRING_FORMAT => 5917

    /**
     * Native name: ERROR_CLUSTER_DATABASE_TRANSACTION_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static CLUSTER_DATABASE_TRANSACTION_IN_PROGRESS => 5918

    /**
     * Native name: ERROR_CLUSTER_DATABASE_TRANSACTION_NOT_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static CLUSTER_DATABASE_TRANSACTION_NOT_IN_PROGRESS => 5919

    /**
     * Native name: ERROR_CLUSTER_NULL_DATA
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NULL_DATA => 5920

    /**
     * Native name: ERROR_CLUSTER_PARTIAL_READ
     * @type {Integer (UInt32)}
     */
    static CLUSTER_PARTIAL_READ => 5921

    /**
     * Native name: ERROR_CLUSTER_PARTIAL_WRITE
     * @type {Integer (UInt32)}
     */
    static CLUSTER_PARTIAL_WRITE => 5922

    /**
     * Native name: ERROR_CLUSTER_CANT_DESERIALIZE_DATA
     * @type {Integer (UInt32)}
     */
    static CLUSTER_CANT_DESERIALIZE_DATA => 5923

    /**
     * Native name: ERROR_DEPENDENT_RESOURCE_PROPERTY_CONFLICT
     * @type {Integer (UInt32)}
     */
    static DEPENDENT_RESOURCE_PROPERTY_CONFLICT => 5924

    /**
     * Native name: ERROR_CLUSTER_NO_QUORUM
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NO_QUORUM => 5925

    /**
     * Native name: ERROR_CLUSTER_INVALID_IPV6_NETWORK
     * @type {Integer (UInt32)}
     */
    static CLUSTER_INVALID_IPV6_NETWORK => 5926

    /**
     * Native name: ERROR_CLUSTER_INVALID_IPV6_TUNNEL_NETWORK
     * @type {Integer (UInt32)}
     */
    static CLUSTER_INVALID_IPV6_TUNNEL_NETWORK => 5927

    /**
     * Native name: ERROR_QUORUM_NOT_ALLOWED_IN_THIS_GROUP
     * @type {Integer (UInt32)}
     */
    static QUORUM_NOT_ALLOWED_IN_THIS_GROUP => 5928

    /**
     * Native name: ERROR_DEPENDENCY_TREE_TOO_COMPLEX
     * @type {Integer (UInt32)}
     */
    static DEPENDENCY_TREE_TOO_COMPLEX => 5929

    /**
     * Native name: ERROR_EXCEPTION_IN_RESOURCE_CALL
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_IN_RESOURCE_CALL => 5930

    /**
     * Native name: ERROR_CLUSTER_RHS_FAILED_INITIALIZATION
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RHS_FAILED_INITIALIZATION => 5931

    /**
     * Native name: ERROR_CLUSTER_NOT_INSTALLED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NOT_INSTALLED => 5932

    /**
     * Native name: ERROR_CLUSTER_RESOURCES_MUST_BE_ONLINE_ON_THE_SAME_NODE
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESOURCES_MUST_BE_ONLINE_ON_THE_SAME_NODE => 5933

    /**
     * Native name: ERROR_CLUSTER_MAX_NODES_IN_CLUSTER
     * @type {Integer (UInt32)}
     */
    static CLUSTER_MAX_NODES_IN_CLUSTER => 5934

    /**
     * Native name: ERROR_CLUSTER_TOO_MANY_NODES
     * @type {Integer (UInt32)}
     */
    static CLUSTER_TOO_MANY_NODES => 5935

    /**
     * Native name: ERROR_CLUSTER_OBJECT_ALREADY_USED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_OBJECT_ALREADY_USED => 5936

    /**
     * Native name: ERROR_NONCORE_GROUPS_FOUND
     * @type {Integer (UInt32)}
     */
    static NONCORE_GROUPS_FOUND => 5937

    /**
     * Native name: ERROR_FILE_SHARE_RESOURCE_CONFLICT
     * @type {Integer (UInt32)}
     */
    static FILE_SHARE_RESOURCE_CONFLICT => 5938

    /**
     * Native name: ERROR_CLUSTER_EVICT_INVALID_REQUEST
     * @type {Integer (UInt32)}
     */
    static CLUSTER_EVICT_INVALID_REQUEST => 5939

    /**
     * Native name: ERROR_CLUSTER_SINGLETON_RESOURCE
     * @type {Integer (UInt32)}
     */
    static CLUSTER_SINGLETON_RESOURCE => 5940

    /**
     * Native name: ERROR_CLUSTER_GROUP_SINGLETON_RESOURCE
     * @type {Integer (UInt32)}
     */
    static CLUSTER_GROUP_SINGLETON_RESOURCE => 5941

    /**
     * Native name: ERROR_CLUSTER_RESOURCE_PROVIDER_FAILED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESOURCE_PROVIDER_FAILED => 5942

    /**
     * Native name: ERROR_CLUSTER_RESOURCE_CONFIGURATION_ERROR
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESOURCE_CONFIGURATION_ERROR => 5943

    /**
     * Native name: ERROR_CLUSTER_GROUP_BUSY
     * @type {Integer (UInt32)}
     */
    static CLUSTER_GROUP_BUSY => 5944

    /**
     * Native name: ERROR_CLUSTER_NOT_SHARED_VOLUME
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NOT_SHARED_VOLUME => 5945

    /**
     * Native name: ERROR_CLUSTER_INVALID_SECURITY_DESCRIPTOR
     * @type {Integer (UInt32)}
     */
    static CLUSTER_INVALID_SECURITY_DESCRIPTOR => 5946

    /**
     * Native name: ERROR_CLUSTER_SHARED_VOLUMES_IN_USE
     * @type {Integer (UInt32)}
     */
    static CLUSTER_SHARED_VOLUMES_IN_USE => 5947

    /**
     * Native name: ERROR_CLUSTER_USE_SHARED_VOLUMES_API
     * @type {Integer (UInt32)}
     */
    static CLUSTER_USE_SHARED_VOLUMES_API => 5948

    /**
     * Native name: ERROR_CLUSTER_BACKUP_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static CLUSTER_BACKUP_IN_PROGRESS => 5949

    /**
     * Native name: ERROR_NON_CSV_PATH
     * @type {Integer (UInt32)}
     */
    static NON_CSV_PATH => 5950

    /**
     * Native name: ERROR_CSV_VOLUME_NOT_LOCAL
     * @type {Integer (UInt32)}
     */
    static CSV_VOLUME_NOT_LOCAL => 5951

    /**
     * Native name: ERROR_CLUSTER_WATCHDOG_TERMINATING
     * @type {Integer (UInt32)}
     */
    static CLUSTER_WATCHDOG_TERMINATING => 5952

    /**
     * Native name: ERROR_CLUSTER_RESOURCE_VETOED_MOVE_INCOMPATIBLE_NODES
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESOURCE_VETOED_MOVE_INCOMPATIBLE_NODES => 5953

    /**
     * Native name: ERROR_CLUSTER_INVALID_NODE_WEIGHT
     * @type {Integer (UInt32)}
     */
    static CLUSTER_INVALID_NODE_WEIGHT => 5954

    /**
     * Native name: ERROR_CLUSTER_RESOURCE_VETOED_CALL
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESOURCE_VETOED_CALL => 5955

    /**
     * Native name: ERROR_RESMON_SYSTEM_RESOURCES_LACKING
     * @type {Integer (UInt32)}
     */
    static RESMON_SYSTEM_RESOURCES_LACKING => 5956

    /**
     * Native name: ERROR_CLUSTER_RESOURCE_VETOED_MOVE_NOT_ENOUGH_RESOURCES_ON_DESTINATION
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESOURCE_VETOED_MOVE_NOT_ENOUGH_RESOURCES_ON_DESTINATION => 5957

    /**
     * Native name: ERROR_CLUSTER_RESOURCE_VETOED_MOVE_NOT_ENOUGH_RESOURCES_ON_SOURCE
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESOURCE_VETOED_MOVE_NOT_ENOUGH_RESOURCES_ON_SOURCE => 5958

    /**
     * Native name: ERROR_CLUSTER_GROUP_QUEUED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_GROUP_QUEUED => 5959

    /**
     * Native name: ERROR_CLUSTER_RESOURCE_LOCKED_STATUS
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESOURCE_LOCKED_STATUS => 5960

    /**
     * Native name: ERROR_CLUSTER_SHARED_VOLUME_FAILOVER_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_SHARED_VOLUME_FAILOVER_NOT_ALLOWED => 5961

    /**
     * Native name: ERROR_CLUSTER_NODE_DRAIN_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NODE_DRAIN_IN_PROGRESS => 5962

    /**
     * Native name: ERROR_CLUSTER_DISK_NOT_CONNECTED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_DISK_NOT_CONNECTED => 5963

    /**
     * Native name: ERROR_DISK_NOT_CSV_CAPABLE
     * @type {Integer (UInt32)}
     */
    static DISK_NOT_CSV_CAPABLE => 5964

    /**
     * Native name: ERROR_RESOURCE_NOT_IN_AVAILABLE_STORAGE
     * @type {Integer (UInt32)}
     */
    static RESOURCE_NOT_IN_AVAILABLE_STORAGE => 5965

    /**
     * Native name: ERROR_CLUSTER_SHARED_VOLUME_REDIRECTED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_SHARED_VOLUME_REDIRECTED => 5966

    /**
     * Native name: ERROR_CLUSTER_SHARED_VOLUME_NOT_REDIRECTED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_SHARED_VOLUME_NOT_REDIRECTED => 5967

    /**
     * Native name: ERROR_CLUSTER_CANNOT_RETURN_PROPERTIES
     * @type {Integer (UInt32)}
     */
    static CLUSTER_CANNOT_RETURN_PROPERTIES => 5968

    /**
     * Native name: ERROR_CLUSTER_RESOURCE_CONTAINS_UNSUPPORTED_DIFF_AREA_FOR_SHARED_VOLUMES
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESOURCE_CONTAINS_UNSUPPORTED_DIFF_AREA_FOR_SHARED_VOLUMES => 5969

    /**
     * Native name: ERROR_CLUSTER_RESOURCE_IS_IN_MAINTENANCE_MODE
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESOURCE_IS_IN_MAINTENANCE_MODE => 5970

    /**
     * Native name: ERROR_CLUSTER_AFFINITY_CONFLICT
     * @type {Integer (UInt32)}
     */
    static CLUSTER_AFFINITY_CONFLICT => 5971

    /**
     * Native name: ERROR_CLUSTER_RESOURCE_IS_REPLICA_VIRTUAL_MACHINE
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESOURCE_IS_REPLICA_VIRTUAL_MACHINE => 5972

    /**
     * Native name: ERROR_CLUSTER_UPGRADE_INCOMPATIBLE_VERSIONS
     * @type {Integer (UInt32)}
     */
    static CLUSTER_UPGRADE_INCOMPATIBLE_VERSIONS => 5973

    /**
     * Native name: ERROR_CLUSTER_UPGRADE_FIX_QUORUM_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_UPGRADE_FIX_QUORUM_NOT_SUPPORTED => 5974

    /**
     * Native name: ERROR_CLUSTER_UPGRADE_RESTART_REQUIRED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_UPGRADE_RESTART_REQUIRED => 5975

    /**
     * Native name: ERROR_CLUSTER_UPGRADE_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static CLUSTER_UPGRADE_IN_PROGRESS => 5976

    /**
     * Native name: ERROR_CLUSTER_UPGRADE_INCOMPLETE
     * @type {Integer (UInt32)}
     */
    static CLUSTER_UPGRADE_INCOMPLETE => 5977

    /**
     * Native name: ERROR_CLUSTER_NODE_IN_GRACE_PERIOD
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NODE_IN_GRACE_PERIOD => 5978

    /**
     * Native name: ERROR_CLUSTER_CSV_IO_PAUSE_TIMEOUT
     * @type {Integer (UInt32)}
     */
    static CLUSTER_CSV_IO_PAUSE_TIMEOUT => 5979

    /**
     * Native name: ERROR_NODE_NOT_ACTIVE_CLUSTER_MEMBER
     * @type {Integer (UInt32)}
     */
    static NODE_NOT_ACTIVE_CLUSTER_MEMBER => 5980

    /**
     * Native name: ERROR_CLUSTER_RESOURCE_NOT_MONITORED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESOURCE_NOT_MONITORED => 5981

    /**
     * Native name: ERROR_CLUSTER_RESOURCE_DOES_NOT_SUPPORT_UNMONITORED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESOURCE_DOES_NOT_SUPPORT_UNMONITORED => 5982

    /**
     * Native name: ERROR_CLUSTER_RESOURCE_IS_REPLICATED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_RESOURCE_IS_REPLICATED => 5983

    /**
     * Native name: ERROR_CLUSTER_NODE_ISOLATED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NODE_ISOLATED => 5984

    /**
     * Native name: ERROR_CLUSTER_NODE_QUARANTINED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_NODE_QUARANTINED => 5985

    /**
     * Native name: ERROR_CLUSTER_DATABASE_UPDATE_CONDITION_FAILED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_DATABASE_UPDATE_CONDITION_FAILED => 5986

    /**
     * Native name: ERROR_CLUSTER_SPACE_DEGRADED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_SPACE_DEGRADED => 5987

    /**
     * Native name: ERROR_CLUSTER_TOKEN_DELEGATION_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static CLUSTER_TOKEN_DELEGATION_NOT_SUPPORTED => 5988

    /**
     * Native name: ERROR_CLUSTER_CSV_INVALID_HANDLE
     * @type {Integer (UInt32)}
     */
    static CLUSTER_CSV_INVALID_HANDLE => 5989

    /**
     * Native name: ERROR_CLUSTER_CSV_SUPPORTED_ONLY_ON_COORDINATOR
     * @type {Integer (UInt32)}
     */
    static CLUSTER_CSV_SUPPORTED_ONLY_ON_COORDINATOR => 5990

    /**
     * Native name: ERROR_GROUPSET_NOT_AVAILABLE
     * @type {Integer (UInt32)}
     */
    static GROUPSET_NOT_AVAILABLE => 5991

    /**
     * Native name: ERROR_GROUPSET_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static GROUPSET_NOT_FOUND => 5992

    /**
     * Native name: ERROR_GROUPSET_CANT_PROVIDE
     * @type {Integer (UInt32)}
     */
    static GROUPSET_CANT_PROVIDE => 5993

    /**
     * Native name: ERROR_CLUSTER_FAULT_DOMAIN_PARENT_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static CLUSTER_FAULT_DOMAIN_PARENT_NOT_FOUND => 5994

    /**
     * Native name: ERROR_CLUSTER_FAULT_DOMAIN_INVALID_HIERARCHY
     * @type {Integer (UInt32)}
     */
    static CLUSTER_FAULT_DOMAIN_INVALID_HIERARCHY => 5995

    /**
     * Native name: ERROR_CLUSTER_FAULT_DOMAIN_FAILED_S2D_VALIDATION
     * @type {Integer (UInt32)}
     */
    static CLUSTER_FAULT_DOMAIN_FAILED_S2D_VALIDATION => 5996

    /**
     * Native name: ERROR_CLUSTER_FAULT_DOMAIN_S2D_CONNECTIVITY_LOSS
     * @type {Integer (UInt32)}
     */
    static CLUSTER_FAULT_DOMAIN_S2D_CONNECTIVITY_LOSS => 5997

    /**
     * Native name: ERROR_CLUSTER_INVALID_INFRASTRUCTURE_FILESERVER_NAME
     * @type {Integer (UInt32)}
     */
    static CLUSTER_INVALID_INFRASTRUCTURE_FILESERVER_NAME => 5998

    /**
     * Native name: ERROR_CLUSTERSET_MANAGEMENT_CLUSTER_UNREACHABLE
     * @type {Integer (UInt32)}
     */
    static CLUSTERSET_MANAGEMENT_CLUSTER_UNREACHABLE => 5999

    /**
     * Native name: ERROR_ENCRYPTION_FAILED
     * @type {Integer (UInt32)}
     */
    static ENCRYPTION_FAILED => 6000

    /**
     * Native name: ERROR_DECRYPTION_FAILED
     * @type {Integer (UInt32)}
     */
    static DECRYPTION_FAILED => 6001

    /**
     * Native name: ERROR_FILE_ENCRYPTED
     * @type {Integer (UInt32)}
     */
    static FILE_ENCRYPTED => 6002

    /**
     * Native name: ERROR_NO_RECOVERY_POLICY
     * @type {Integer (UInt32)}
     */
    static NO_RECOVERY_POLICY => 6003

    /**
     * Native name: ERROR_NO_EFS
     * @type {Integer (UInt32)}
     */
    static NO_EFS => 6004

    /**
     * Native name: ERROR_WRONG_EFS
     * @type {Integer (UInt32)}
     */
    static WRONG_EFS => 6005

    /**
     * Native name: ERROR_NO_USER_KEYS
     * @type {Integer (UInt32)}
     */
    static NO_USER_KEYS => 6006

    /**
     * Native name: ERROR_FILE_NOT_ENCRYPTED
     * @type {Integer (UInt32)}
     */
    static FILE_NOT_ENCRYPTED => 6007

    /**
     * Native name: ERROR_NOT_EXPORT_FORMAT
     * @type {Integer (UInt32)}
     */
    static NOT_EXPORT_FORMAT => 6008

    /**
     * Native name: ERROR_FILE_READ_ONLY
     * @type {Integer (UInt32)}
     */
    static FILE_READ_ONLY => 6009

    /**
     * Native name: ERROR_DIR_EFS_DISALLOWED
     * @type {Integer (UInt32)}
     */
    static DIR_EFS_DISALLOWED => 6010

    /**
     * Native name: ERROR_EFS_SERVER_NOT_TRUSTED
     * @type {Integer (UInt32)}
     */
    static EFS_SERVER_NOT_TRUSTED => 6011

    /**
     * Native name: ERROR_BAD_RECOVERY_POLICY
     * @type {Integer (UInt32)}
     */
    static BAD_RECOVERY_POLICY => 6012

    /**
     * Native name: ERROR_EFS_ALG_BLOB_TOO_BIG
     * @type {Integer (UInt32)}
     */
    static EFS_ALG_BLOB_TOO_BIG => 6013

    /**
     * Native name: ERROR_VOLUME_NOT_SUPPORT_EFS
     * @type {Integer (UInt32)}
     */
    static VOLUME_NOT_SUPPORT_EFS => 6014

    /**
     * Native name: ERROR_EFS_DISABLED
     * @type {Integer (UInt32)}
     */
    static EFS_DISABLED => 6015

    /**
     * Native name: ERROR_EFS_VERSION_NOT_SUPPORT
     * @type {Integer (UInt32)}
     */
    static EFS_VERSION_NOT_SUPPORT => 6016

    /**
     * Native name: ERROR_CS_ENCRYPTION_INVALID_SERVER_RESPONSE
     * @type {Integer (UInt32)}
     */
    static CS_ENCRYPTION_INVALID_SERVER_RESPONSE => 6017

    /**
     * Native name: ERROR_CS_ENCRYPTION_UNSUPPORTED_SERVER
     * @type {Integer (UInt32)}
     */
    static CS_ENCRYPTION_UNSUPPORTED_SERVER => 6018

    /**
     * Native name: ERROR_CS_ENCRYPTION_EXISTING_ENCRYPTED_FILE
     * @type {Integer (UInt32)}
     */
    static CS_ENCRYPTION_EXISTING_ENCRYPTED_FILE => 6019

    /**
     * Native name: ERROR_CS_ENCRYPTION_NEW_ENCRYPTED_FILE
     * @type {Integer (UInt32)}
     */
    static CS_ENCRYPTION_NEW_ENCRYPTED_FILE => 6020

    /**
     * Native name: ERROR_CS_ENCRYPTION_FILE_NOT_CSE
     * @type {Integer (UInt32)}
     */
    static CS_ENCRYPTION_FILE_NOT_CSE => 6021

    /**
     * Native name: ERROR_ENCRYPTION_POLICY_DENIES_OPERATION
     * @type {Integer (UInt32)}
     */
    static ENCRYPTION_POLICY_DENIES_OPERATION => 6022

    /**
     * Native name: ERROR_WIP_ENCRYPTION_FAILED
     * @type {Integer (UInt32)}
     */
    static WIP_ENCRYPTION_FAILED => 6023

    /**
     * Native name: ERROR_PDE_ENCRYPTION_UNAVAILABLE_FAILURE
     * @type {Integer (UInt32)}
     */
    static PDE_ENCRYPTION_UNAVAILABLE_FAILURE => 6024

    /**
     * Native name: ERROR_PDE_DECRYPTION_UNAVAILABLE_FAILURE
     * @type {Integer (UInt32)}
     */
    static PDE_DECRYPTION_UNAVAILABLE_FAILURE => 6025

    /**
     * Native name: ERROR_PDE_DECRYPTION_UNAVAILABLE
     * @type {Integer (UInt32)}
     */
    static PDE_DECRYPTION_UNAVAILABLE => 6026

    /**
     * Native name: ERROR_NO_BROWSER_SERVERS_FOUND
     * @type {Integer (UInt32)}
     */
    static NO_BROWSER_SERVERS_FOUND => 6118

    /**
     * Native name: ERROR_CLUSTER_OBJECT_IS_CLUSTER_SET_VM
     * @type {Integer (UInt32)}
     */
    static CLUSTER_OBJECT_IS_CLUSTER_SET_VM => 6250

    /**
     * Native name: ERROR_CNU_TEMPLATE_ALREADY_EXISTS
     * @type {Integer (UInt32)}
     */
    static CNU_TEMPLATE_ALREADY_EXISTS => 6251

    /**
     * Native name: ERROR_CNU_TEMPLATE_NAME_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static CNU_TEMPLATE_NAME_NOT_FOUND => 6252

    /**
     * Native name: ERROR_CNU_RUN_NAME_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static CNU_RUN_NAME_NOT_FOUND => 6253

    /**
     * Native name: ERROR_CNU_RUN_ALREADY_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static CNU_RUN_ALREADY_IN_PROGRESS => 6254

    /**
     * Native name: ERROR_CNU_RUN_NOT_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static CNU_RUN_NOT_IN_PROGRESS => 6255

    /**
     * Native name: ERROR_CNU_NOT_READY
     * @type {Integer (UInt32)}
     */
    static CNU_NOT_READY => 6256

    /**
     * Native name: ERROR_CAMERA_INVALID_CONFIGURATION
     * @type {Integer (UInt32)}
     */
    static CAMERA_INVALID_CONFIGURATION => 6350

    /**
     * Native name: ERROR_CAMERA_INSUFFICIENT_BANDWIDTH
     * @type {Integer (UInt32)}
     */
    static CAMERA_INSUFFICIENT_BANDWIDTH => 6351

    /**
     * Native name: ERROR_LOG_SECTOR_INVALID
     * @type {Integer (UInt32)}
     */
    static LOG_SECTOR_INVALID => 6600

    /**
     * Native name: ERROR_LOG_SECTOR_PARITY_INVALID
     * @type {Integer (UInt32)}
     */
    static LOG_SECTOR_PARITY_INVALID => 6601

    /**
     * Native name: ERROR_LOG_SECTOR_REMAPPED
     * @type {Integer (UInt32)}
     */
    static LOG_SECTOR_REMAPPED => 6602

    /**
     * Native name: ERROR_LOG_BLOCK_INCOMPLETE
     * @type {Integer (UInt32)}
     */
    static LOG_BLOCK_INCOMPLETE => 6603

    /**
     * Native name: ERROR_LOG_INVALID_RANGE
     * @type {Integer (UInt32)}
     */
    static LOG_INVALID_RANGE => 6604

    /**
     * Native name: ERROR_LOG_BLOCKS_EXHAUSTED
     * @type {Integer (UInt32)}
     */
    static LOG_BLOCKS_EXHAUSTED => 6605

    /**
     * Native name: ERROR_LOG_READ_CONTEXT_INVALID
     * @type {Integer (UInt32)}
     */
    static LOG_READ_CONTEXT_INVALID => 6606

    /**
     * Native name: ERROR_LOG_RESTART_INVALID
     * @type {Integer (UInt32)}
     */
    static LOG_RESTART_INVALID => 6607

    /**
     * Native name: ERROR_LOG_BLOCK_VERSION
     * @type {Integer (UInt32)}
     */
    static LOG_BLOCK_VERSION => 6608

    /**
     * Native name: ERROR_LOG_BLOCK_INVALID
     * @type {Integer (UInt32)}
     */
    static LOG_BLOCK_INVALID => 6609

    /**
     * Native name: ERROR_LOG_READ_MODE_INVALID
     * @type {Integer (UInt32)}
     */
    static LOG_READ_MODE_INVALID => 6610

    /**
     * Native name: ERROR_LOG_NO_RESTART
     * @type {Integer (UInt32)}
     */
    static LOG_NO_RESTART => 6611

    /**
     * Native name: ERROR_LOG_METADATA_CORRUPT
     * @type {Integer (UInt32)}
     */
    static LOG_METADATA_CORRUPT => 6612

    /**
     * Native name: ERROR_LOG_METADATA_INVALID
     * @type {Integer (UInt32)}
     */
    static LOG_METADATA_INVALID => 6613

    /**
     * Native name: ERROR_LOG_METADATA_INCONSISTENT
     * @type {Integer (UInt32)}
     */
    static LOG_METADATA_INCONSISTENT => 6614

    /**
     * Native name: ERROR_LOG_RESERVATION_INVALID
     * @type {Integer (UInt32)}
     */
    static LOG_RESERVATION_INVALID => 6615

    /**
     * Native name: ERROR_LOG_CANT_DELETE
     * @type {Integer (UInt32)}
     */
    static LOG_CANT_DELETE => 6616

    /**
     * Native name: ERROR_LOG_CONTAINER_LIMIT_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static LOG_CONTAINER_LIMIT_EXCEEDED => 6617

    /**
     * Native name: ERROR_LOG_START_OF_LOG
     * @type {Integer (UInt32)}
     */
    static LOG_START_OF_LOG => 6618

    /**
     * Native name: ERROR_LOG_POLICY_ALREADY_INSTALLED
     * @type {Integer (UInt32)}
     */
    static LOG_POLICY_ALREADY_INSTALLED => 6619

    /**
     * Native name: ERROR_LOG_POLICY_NOT_INSTALLED
     * @type {Integer (UInt32)}
     */
    static LOG_POLICY_NOT_INSTALLED => 6620

    /**
     * Native name: ERROR_LOG_POLICY_INVALID
     * @type {Integer (UInt32)}
     */
    static LOG_POLICY_INVALID => 6621

    /**
     * Native name: ERROR_LOG_POLICY_CONFLICT
     * @type {Integer (UInt32)}
     */
    static LOG_POLICY_CONFLICT => 6622

    /**
     * Native name: ERROR_LOG_PINNED_ARCHIVE_TAIL
     * @type {Integer (UInt32)}
     */
    static LOG_PINNED_ARCHIVE_TAIL => 6623

    /**
     * Native name: ERROR_LOG_RECORD_NONEXISTENT
     * @type {Integer (UInt32)}
     */
    static LOG_RECORD_NONEXISTENT => 6624

    /**
     * Native name: ERROR_LOG_RECORDS_RESERVED_INVALID
     * @type {Integer (UInt32)}
     */
    static LOG_RECORDS_RESERVED_INVALID => 6625

    /**
     * Native name: ERROR_LOG_SPACE_RESERVED_INVALID
     * @type {Integer (UInt32)}
     */
    static LOG_SPACE_RESERVED_INVALID => 6626

    /**
     * Native name: ERROR_LOG_TAIL_INVALID
     * @type {Integer (UInt32)}
     */
    static LOG_TAIL_INVALID => 6627

    /**
     * Native name: ERROR_LOG_FULL
     * @type {Integer (UInt32)}
     */
    static LOG_FULL => 6628

    /**
     * Native name: ERROR_COULD_NOT_RESIZE_LOG
     * @type {Integer (UInt32)}
     */
    static COULD_NOT_RESIZE_LOG => 6629

    /**
     * Native name: ERROR_LOG_MULTIPLEXED
     * @type {Integer (UInt32)}
     */
    static LOG_MULTIPLEXED => 6630

    /**
     * Native name: ERROR_LOG_DEDICATED
     * @type {Integer (UInt32)}
     */
    static LOG_DEDICATED => 6631

    /**
     * Native name: ERROR_LOG_ARCHIVE_NOT_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static LOG_ARCHIVE_NOT_IN_PROGRESS => 6632

    /**
     * Native name: ERROR_LOG_ARCHIVE_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static LOG_ARCHIVE_IN_PROGRESS => 6633

    /**
     * Native name: ERROR_LOG_EPHEMERAL
     * @type {Integer (UInt32)}
     */
    static LOG_EPHEMERAL => 6634

    /**
     * Native name: ERROR_LOG_NOT_ENOUGH_CONTAINERS
     * @type {Integer (UInt32)}
     */
    static LOG_NOT_ENOUGH_CONTAINERS => 6635

    /**
     * Native name: ERROR_LOG_CLIENT_ALREADY_REGISTERED
     * @type {Integer (UInt32)}
     */
    static LOG_CLIENT_ALREADY_REGISTERED => 6636

    /**
     * Native name: ERROR_LOG_CLIENT_NOT_REGISTERED
     * @type {Integer (UInt32)}
     */
    static LOG_CLIENT_NOT_REGISTERED => 6637

    /**
     * Native name: ERROR_LOG_FULL_HANDLER_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static LOG_FULL_HANDLER_IN_PROGRESS => 6638

    /**
     * Native name: ERROR_LOG_CONTAINER_READ_FAILED
     * @type {Integer (UInt32)}
     */
    static LOG_CONTAINER_READ_FAILED => 6639

    /**
     * Native name: ERROR_LOG_CONTAINER_WRITE_FAILED
     * @type {Integer (UInt32)}
     */
    static LOG_CONTAINER_WRITE_FAILED => 6640

    /**
     * Native name: ERROR_LOG_CONTAINER_OPEN_FAILED
     * @type {Integer (UInt32)}
     */
    static LOG_CONTAINER_OPEN_FAILED => 6641

    /**
     * Native name: ERROR_LOG_CONTAINER_STATE_INVALID
     * @type {Integer (UInt32)}
     */
    static LOG_CONTAINER_STATE_INVALID => 6642

    /**
     * Native name: ERROR_LOG_STATE_INVALID
     * @type {Integer (UInt32)}
     */
    static LOG_STATE_INVALID => 6643

    /**
     * Native name: ERROR_LOG_PINNED
     * @type {Integer (UInt32)}
     */
    static LOG_PINNED => 6644

    /**
     * Native name: ERROR_LOG_METADATA_FLUSH_FAILED
     * @type {Integer (UInt32)}
     */
    static LOG_METADATA_FLUSH_FAILED => 6645

    /**
     * Native name: ERROR_LOG_INCONSISTENT_SECURITY
     * @type {Integer (UInt32)}
     */
    static LOG_INCONSISTENT_SECURITY => 6646

    /**
     * Native name: ERROR_LOG_APPENDED_FLUSH_FAILED
     * @type {Integer (UInt32)}
     */
    static LOG_APPENDED_FLUSH_FAILED => 6647

    /**
     * Native name: ERROR_LOG_PINNED_RESERVATION
     * @type {Integer (UInt32)}
     */
    static LOG_PINNED_RESERVATION => 6648

    /**
     * Native name: ERROR_INVALID_TRANSACTION
     * @type {Integer (UInt32)}
     */
    static INVALID_TRANSACTION => 6700

    /**
     * Native name: ERROR_TRANSACTION_NOT_ACTIVE
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_NOT_ACTIVE => 6701

    /**
     * Native name: ERROR_TRANSACTION_REQUEST_NOT_VALID
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_REQUEST_NOT_VALID => 6702

    /**
     * Native name: ERROR_TRANSACTION_NOT_REQUESTED
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_NOT_REQUESTED => 6703

    /**
     * Native name: ERROR_TRANSACTION_ALREADY_ABORTED
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_ALREADY_ABORTED => 6704

    /**
     * Native name: ERROR_TRANSACTION_ALREADY_COMMITTED
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_ALREADY_COMMITTED => 6705

    /**
     * Native name: ERROR_TM_INITIALIZATION_FAILED
     * @type {Integer (UInt32)}
     */
    static TM_INITIALIZATION_FAILED => 6706

    /**
     * Native name: ERROR_RESOURCEMANAGER_READ_ONLY
     * @type {Integer (UInt32)}
     */
    static RESOURCEMANAGER_READ_ONLY => 6707

    /**
     * Native name: ERROR_TRANSACTION_NOT_JOINED
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_NOT_JOINED => 6708

    /**
     * Native name: ERROR_TRANSACTION_SUPERIOR_EXISTS
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_SUPERIOR_EXISTS => 6709

    /**
     * Native name: ERROR_CRM_PROTOCOL_ALREADY_EXISTS
     * @type {Integer (UInt32)}
     */
    static CRM_PROTOCOL_ALREADY_EXISTS => 6710

    /**
     * Native name: ERROR_TRANSACTION_PROPAGATION_FAILED
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_PROPAGATION_FAILED => 6711

    /**
     * Native name: ERROR_CRM_PROTOCOL_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static CRM_PROTOCOL_NOT_FOUND => 6712

    /**
     * Native name: ERROR_TRANSACTION_INVALID_MARSHALL_BUFFER
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_INVALID_MARSHALL_BUFFER => 6713

    /**
     * Native name: ERROR_CURRENT_TRANSACTION_NOT_VALID
     * @type {Integer (UInt32)}
     */
    static CURRENT_TRANSACTION_NOT_VALID => 6714

    /**
     * Native name: ERROR_TRANSACTION_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_NOT_FOUND => 6715

    /**
     * Native name: ERROR_RESOURCEMANAGER_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static RESOURCEMANAGER_NOT_FOUND => 6716

    /**
     * Native name: ERROR_ENLISTMENT_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static ENLISTMENT_NOT_FOUND => 6717

    /**
     * Native name: ERROR_TRANSACTIONMANAGER_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static TRANSACTIONMANAGER_NOT_FOUND => 6718

    /**
     * Native name: ERROR_TRANSACTIONMANAGER_NOT_ONLINE
     * @type {Integer (UInt32)}
     */
    static TRANSACTIONMANAGER_NOT_ONLINE => 6719

    /**
     * Native name: ERROR_TRANSACTIONMANAGER_RECOVERY_NAME_COLLISION
     * @type {Integer (UInt32)}
     */
    static TRANSACTIONMANAGER_RECOVERY_NAME_COLLISION => 6720

    /**
     * Native name: ERROR_TRANSACTION_NOT_ROOT
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_NOT_ROOT => 6721

    /**
     * Native name: ERROR_TRANSACTION_OBJECT_EXPIRED
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_OBJECT_EXPIRED => 6722

    /**
     * Native name: ERROR_TRANSACTION_RESPONSE_NOT_ENLISTED
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_RESPONSE_NOT_ENLISTED => 6723

    /**
     * Native name: ERROR_TRANSACTION_RECORD_TOO_LONG
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_RECORD_TOO_LONG => 6724

    /**
     * Native name: ERROR_IMPLICIT_TRANSACTION_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static IMPLICIT_TRANSACTION_NOT_SUPPORTED => 6725

    /**
     * Native name: ERROR_TRANSACTION_INTEGRITY_VIOLATED
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_INTEGRITY_VIOLATED => 6726

    /**
     * Native name: ERROR_TRANSACTIONMANAGER_IDENTITY_MISMATCH
     * @type {Integer (UInt32)}
     */
    static TRANSACTIONMANAGER_IDENTITY_MISMATCH => 6727

    /**
     * Native name: ERROR_RM_CANNOT_BE_FROZEN_FOR_SNAPSHOT
     * @type {Integer (UInt32)}
     */
    static RM_CANNOT_BE_FROZEN_FOR_SNAPSHOT => 6728

    /**
     * Native name: ERROR_TRANSACTION_MUST_WRITETHROUGH
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_MUST_WRITETHROUGH => 6729

    /**
     * Native name: ERROR_TRANSACTION_NO_SUPERIOR
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_NO_SUPERIOR => 6730

    /**
     * Native name: ERROR_HEURISTIC_DAMAGE_POSSIBLE
     * @type {Integer (UInt32)}
     */
    static HEURISTIC_DAMAGE_POSSIBLE => 6731

    /**
     * Native name: ERROR_TRANSACTIONAL_CONFLICT
     * @type {Integer (UInt32)}
     */
    static TRANSACTIONAL_CONFLICT => 6800

    /**
     * Native name: ERROR_RM_NOT_ACTIVE
     * @type {Integer (UInt32)}
     */
    static RM_NOT_ACTIVE => 6801

    /**
     * Native name: ERROR_RM_METADATA_CORRUPT
     * @type {Integer (UInt32)}
     */
    static RM_METADATA_CORRUPT => 6802

    /**
     * Native name: ERROR_DIRECTORY_NOT_RM
     * @type {Integer (UInt32)}
     */
    static DIRECTORY_NOT_RM => 6803

    /**
     * Native name: ERROR_TRANSACTIONS_UNSUPPORTED_REMOTE
     * @type {Integer (UInt32)}
     */
    static TRANSACTIONS_UNSUPPORTED_REMOTE => 6805

    /**
     * Native name: ERROR_LOG_RESIZE_INVALID_SIZE
     * @type {Integer (UInt32)}
     */
    static LOG_RESIZE_INVALID_SIZE => 6806

    /**
     * Native name: ERROR_OBJECT_NO_LONGER_EXISTS
     * @type {Integer (UInt32)}
     */
    static OBJECT_NO_LONGER_EXISTS => 6807

    /**
     * Native name: ERROR_STREAM_MINIVERSION_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static STREAM_MINIVERSION_NOT_FOUND => 6808

    /**
     * Native name: ERROR_STREAM_MINIVERSION_NOT_VALID
     * @type {Integer (UInt32)}
     */
    static STREAM_MINIVERSION_NOT_VALID => 6809

    /**
     * Native name: ERROR_MINIVERSION_INACCESSIBLE_FROM_SPECIFIED_TRANSACTION
     * @type {Integer (UInt32)}
     */
    static MINIVERSION_INACCESSIBLE_FROM_SPECIFIED_TRANSACTION => 6810

    /**
     * Native name: ERROR_CANT_OPEN_MINIVERSION_WITH_MODIFY_INTENT
     * @type {Integer (UInt32)}
     */
    static CANT_OPEN_MINIVERSION_WITH_MODIFY_INTENT => 6811

    /**
     * Native name: ERROR_CANT_CREATE_MORE_STREAM_MINIVERSIONS
     * @type {Integer (UInt32)}
     */
    static CANT_CREATE_MORE_STREAM_MINIVERSIONS => 6812

    /**
     * Native name: ERROR_REMOTE_FILE_VERSION_MISMATCH
     * @type {Integer (UInt32)}
     */
    static REMOTE_FILE_VERSION_MISMATCH => 6814

    /**
     * Native name: ERROR_HANDLE_NO_LONGER_VALID
     * @type {Integer (UInt32)}
     */
    static HANDLE_NO_LONGER_VALID => 6815

    /**
     * Native name: ERROR_NO_TXF_METADATA
     * @type {Integer (UInt32)}
     */
    static NO_TXF_METADATA => 6816

    /**
     * Native name: ERROR_LOG_CORRUPTION_DETECTED
     * @type {Integer (UInt32)}
     */
    static LOG_CORRUPTION_DETECTED => 6817

    /**
     * Native name: ERROR_CANT_RECOVER_WITH_HANDLE_OPEN
     * @type {Integer (UInt32)}
     */
    static CANT_RECOVER_WITH_HANDLE_OPEN => 6818

    /**
     * Native name: ERROR_RM_DISCONNECTED
     * @type {Integer (UInt32)}
     */
    static RM_DISCONNECTED => 6819

    /**
     * Native name: ERROR_ENLISTMENT_NOT_SUPERIOR
     * @type {Integer (UInt32)}
     */
    static ENLISTMENT_NOT_SUPERIOR => 6820

    /**
     * Native name: ERROR_RECOVERY_NOT_NEEDED
     * @type {Integer (UInt32)}
     */
    static RECOVERY_NOT_NEEDED => 6821

    /**
     * Native name: ERROR_RM_ALREADY_STARTED
     * @type {Integer (UInt32)}
     */
    static RM_ALREADY_STARTED => 6822

    /**
     * Native name: ERROR_FILE_IDENTITY_NOT_PERSISTENT
     * @type {Integer (UInt32)}
     */
    static FILE_IDENTITY_NOT_PERSISTENT => 6823

    /**
     * Native name: ERROR_CANT_BREAK_TRANSACTIONAL_DEPENDENCY
     * @type {Integer (UInt32)}
     */
    static CANT_BREAK_TRANSACTIONAL_DEPENDENCY => 6824

    /**
     * Native name: ERROR_CANT_CROSS_RM_BOUNDARY
     * @type {Integer (UInt32)}
     */
    static CANT_CROSS_RM_BOUNDARY => 6825

    /**
     * Native name: ERROR_TXF_DIR_NOT_EMPTY
     * @type {Integer (UInt32)}
     */
    static TXF_DIR_NOT_EMPTY => 6826

    /**
     * Native name: ERROR_INDOUBT_TRANSACTIONS_EXIST
     * @type {Integer (UInt32)}
     */
    static INDOUBT_TRANSACTIONS_EXIST => 6827

    /**
     * Native name: ERROR_TM_VOLATILE
     * @type {Integer (UInt32)}
     */
    static TM_VOLATILE => 6828

    /**
     * Native name: ERROR_ROLLBACK_TIMER_EXPIRED
     * @type {Integer (UInt32)}
     */
    static ROLLBACK_TIMER_EXPIRED => 6829

    /**
     * Native name: ERROR_TXF_ATTRIBUTE_CORRUPT
     * @type {Integer (UInt32)}
     */
    static TXF_ATTRIBUTE_CORRUPT => 6830

    /**
     * Native name: ERROR_EFS_NOT_ALLOWED_IN_TRANSACTION
     * @type {Integer (UInt32)}
     */
    static EFS_NOT_ALLOWED_IN_TRANSACTION => 6831

    /**
     * Native name: ERROR_TRANSACTIONAL_OPEN_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static TRANSACTIONAL_OPEN_NOT_ALLOWED => 6832

    /**
     * Native name: ERROR_LOG_GROWTH_FAILED
     * @type {Integer (UInt32)}
     */
    static LOG_GROWTH_FAILED => 6833

    /**
     * Native name: ERROR_TRANSACTED_MAPPING_UNSUPPORTED_REMOTE
     * @type {Integer (UInt32)}
     */
    static TRANSACTED_MAPPING_UNSUPPORTED_REMOTE => 6834

    /**
     * Native name: ERROR_TXF_METADATA_ALREADY_PRESENT
     * @type {Integer (UInt32)}
     */
    static TXF_METADATA_ALREADY_PRESENT => 6835

    /**
     * Native name: ERROR_TRANSACTION_SCOPE_CALLBACKS_NOT_SET
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_SCOPE_CALLBACKS_NOT_SET => 6836

    /**
     * Native name: ERROR_TRANSACTION_REQUIRED_PROMOTION
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_REQUIRED_PROMOTION => 6837

    /**
     * Native name: ERROR_CANNOT_EXECUTE_FILE_IN_TRANSACTION
     * @type {Integer (UInt32)}
     */
    static CANNOT_EXECUTE_FILE_IN_TRANSACTION => 6838

    /**
     * Native name: ERROR_TRANSACTIONS_NOT_FROZEN
     * @type {Integer (UInt32)}
     */
    static TRANSACTIONS_NOT_FROZEN => 6839

    /**
     * Native name: ERROR_TRANSACTION_FREEZE_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_FREEZE_IN_PROGRESS => 6840

    /**
     * Native name: ERROR_NOT_SNAPSHOT_VOLUME
     * @type {Integer (UInt32)}
     */
    static NOT_SNAPSHOT_VOLUME => 6841

    /**
     * Native name: ERROR_NO_SAVEPOINT_WITH_OPEN_FILES
     * @type {Integer (UInt32)}
     */
    static NO_SAVEPOINT_WITH_OPEN_FILES => 6842

    /**
     * Native name: ERROR_DATA_LOST_REPAIR
     * @type {Integer (UInt32)}
     */
    static DATA_LOST_REPAIR => 6843

    /**
     * Native name: ERROR_SPARSE_NOT_ALLOWED_IN_TRANSACTION
     * @type {Integer (UInt32)}
     */
    static SPARSE_NOT_ALLOWED_IN_TRANSACTION => 6844

    /**
     * Native name: ERROR_TM_IDENTITY_MISMATCH
     * @type {Integer (UInt32)}
     */
    static TM_IDENTITY_MISMATCH => 6845

    /**
     * Native name: ERROR_FLOATED_SECTION
     * @type {Integer (UInt32)}
     */
    static FLOATED_SECTION => 6846

    /**
     * Native name: ERROR_CANNOT_ACCEPT_TRANSACTED_WORK
     * @type {Integer (UInt32)}
     */
    static CANNOT_ACCEPT_TRANSACTED_WORK => 6847

    /**
     * Native name: ERROR_CANNOT_ABORT_TRANSACTIONS
     * @type {Integer (UInt32)}
     */
    static CANNOT_ABORT_TRANSACTIONS => 6848

    /**
     * Native name: ERROR_BAD_CLUSTERS
     * @type {Integer (UInt32)}
     */
    static BAD_CLUSTERS => 6849

    /**
     * Native name: ERROR_COMPRESSION_NOT_ALLOWED_IN_TRANSACTION
     * @type {Integer (UInt32)}
     */
    static COMPRESSION_NOT_ALLOWED_IN_TRANSACTION => 6850

    /**
     * Native name: ERROR_VOLUME_DIRTY
     * @type {Integer (UInt32)}
     */
    static VOLUME_DIRTY => 6851

    /**
     * Native name: ERROR_NO_LINK_TRACKING_IN_TRANSACTION
     * @type {Integer (UInt32)}
     */
    static NO_LINK_TRACKING_IN_TRANSACTION => 6852

    /**
     * Native name: ERROR_OPERATION_NOT_SUPPORTED_IN_TRANSACTION
     * @type {Integer (UInt32)}
     */
    static OPERATION_NOT_SUPPORTED_IN_TRANSACTION => 6853

    /**
     * Native name: ERROR_EXPIRED_HANDLE
     * @type {Integer (UInt32)}
     */
    static EXPIRED_HANDLE => 6854

    /**
     * Native name: ERROR_TRANSACTION_NOT_ENLISTED
     * @type {Integer (UInt32)}
     */
    static TRANSACTION_NOT_ENLISTED => 6855

    /**
     * Native name: ERROR_ENLISTMENT_NOT_INITIALIZED
     * @type {Integer (UInt32)}
     */
    static ENLISTMENT_NOT_INITIALIZED => 6856

    /**
     * Native name: ERROR_CTX_WINSTATION_NAME_INVALID
     * @type {Integer (UInt32)}
     */
    static CTX_WINSTATION_NAME_INVALID => 7001

    /**
     * Native name: ERROR_CTX_INVALID_PD
     * @type {Integer (UInt32)}
     */
    static CTX_INVALID_PD => 7002

    /**
     * Native name: ERROR_CTX_PD_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static CTX_PD_NOT_FOUND => 7003

    /**
     * Native name: ERROR_CTX_WD_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static CTX_WD_NOT_FOUND => 7004

    /**
     * Native name: ERROR_CTX_CANNOT_MAKE_EVENTLOG_ENTRY
     * @type {Integer (UInt32)}
     */
    static CTX_CANNOT_MAKE_EVENTLOG_ENTRY => 7005

    /**
     * Native name: ERROR_CTX_SERVICE_NAME_COLLISION
     * @type {Integer (UInt32)}
     */
    static CTX_SERVICE_NAME_COLLISION => 7006

    /**
     * Native name: ERROR_CTX_CLOSE_PENDING
     * @type {Integer (UInt32)}
     */
    static CTX_CLOSE_PENDING => 7007

    /**
     * Native name: ERROR_CTX_NO_OUTBUF
     * @type {Integer (UInt32)}
     */
    static CTX_NO_OUTBUF => 7008

    /**
     * Native name: ERROR_CTX_MODEM_INF_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static CTX_MODEM_INF_NOT_FOUND => 7009

    /**
     * Native name: ERROR_CTX_INVALID_MODEMNAME
     * @type {Integer (UInt32)}
     */
    static CTX_INVALID_MODEMNAME => 7010

    /**
     * Native name: ERROR_CTX_MODEM_RESPONSE_ERROR
     * @type {Integer (UInt32)}
     */
    static CTX_MODEM_RESPONSE_ERROR => 7011

    /**
     * Native name: ERROR_CTX_MODEM_RESPONSE_TIMEOUT
     * @type {Integer (UInt32)}
     */
    static CTX_MODEM_RESPONSE_TIMEOUT => 7012

    /**
     * Native name: ERROR_CTX_MODEM_RESPONSE_NO_CARRIER
     * @type {Integer (UInt32)}
     */
    static CTX_MODEM_RESPONSE_NO_CARRIER => 7013

    /**
     * Native name: ERROR_CTX_MODEM_RESPONSE_NO_DIALTONE
     * @type {Integer (UInt32)}
     */
    static CTX_MODEM_RESPONSE_NO_DIALTONE => 7014

    /**
     * Native name: ERROR_CTX_MODEM_RESPONSE_BUSY
     * @type {Integer (UInt32)}
     */
    static CTX_MODEM_RESPONSE_BUSY => 7015

    /**
     * Native name: ERROR_CTX_MODEM_RESPONSE_VOICE
     * @type {Integer (UInt32)}
     */
    static CTX_MODEM_RESPONSE_VOICE => 7016

    /**
     * Native name: ERROR_CTX_TD_ERROR
     * @type {Integer (UInt32)}
     */
    static CTX_TD_ERROR => 7017

    /**
     * Native name: ERROR_CTX_WINSTATION_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static CTX_WINSTATION_NOT_FOUND => 7022

    /**
     * Native name: ERROR_CTX_WINSTATION_ALREADY_EXISTS
     * @type {Integer (UInt32)}
     */
    static CTX_WINSTATION_ALREADY_EXISTS => 7023

    /**
     * Native name: ERROR_CTX_WINSTATION_BUSY
     * @type {Integer (UInt32)}
     */
    static CTX_WINSTATION_BUSY => 7024

    /**
     * Native name: ERROR_CTX_BAD_VIDEO_MODE
     * @type {Integer (UInt32)}
     */
    static CTX_BAD_VIDEO_MODE => 7025

    /**
     * Native name: ERROR_CTX_GRAPHICS_INVALID
     * @type {Integer (UInt32)}
     */
    static CTX_GRAPHICS_INVALID => 7035

    /**
     * Native name: ERROR_CTX_LOGON_DISABLED
     * @type {Integer (UInt32)}
     */
    static CTX_LOGON_DISABLED => 7037

    /**
     * Native name: ERROR_CTX_NOT_CONSOLE
     * @type {Integer (UInt32)}
     */
    static CTX_NOT_CONSOLE => 7038

    /**
     * Native name: ERROR_CTX_CLIENT_QUERY_TIMEOUT
     * @type {Integer (UInt32)}
     */
    static CTX_CLIENT_QUERY_TIMEOUT => 7040

    /**
     * Native name: ERROR_CTX_CONSOLE_DISCONNECT
     * @type {Integer (UInt32)}
     */
    static CTX_CONSOLE_DISCONNECT => 7041

    /**
     * Native name: ERROR_CTX_CONSOLE_CONNECT
     * @type {Integer (UInt32)}
     */
    static CTX_CONSOLE_CONNECT => 7042

    /**
     * Native name: ERROR_CTX_SHADOW_DENIED
     * @type {Integer (UInt32)}
     */
    static CTX_SHADOW_DENIED => 7044

    /**
     * Native name: ERROR_CTX_WINSTATION_ACCESS_DENIED
     * @type {Integer (UInt32)}
     */
    static CTX_WINSTATION_ACCESS_DENIED => 7045

    /**
     * Native name: ERROR_CTX_INVALID_WD
     * @type {Integer (UInt32)}
     */
    static CTX_INVALID_WD => 7049

    /**
     * Native name: ERROR_CTX_SHADOW_INVALID
     * @type {Integer (UInt32)}
     */
    static CTX_SHADOW_INVALID => 7050

    /**
     * Native name: ERROR_CTX_SHADOW_DISABLED
     * @type {Integer (UInt32)}
     */
    static CTX_SHADOW_DISABLED => 7051

    /**
     * Native name: ERROR_CTX_CLIENT_LICENSE_IN_USE
     * @type {Integer (UInt32)}
     */
    static CTX_CLIENT_LICENSE_IN_USE => 7052

    /**
     * Native name: ERROR_CTX_CLIENT_LICENSE_NOT_SET
     * @type {Integer (UInt32)}
     */
    static CTX_CLIENT_LICENSE_NOT_SET => 7053

    /**
     * Native name: ERROR_CTX_LICENSE_NOT_AVAILABLE
     * @type {Integer (UInt32)}
     */
    static CTX_LICENSE_NOT_AVAILABLE => 7054

    /**
     * Native name: ERROR_CTX_LICENSE_CLIENT_INVALID
     * @type {Integer (UInt32)}
     */
    static CTX_LICENSE_CLIENT_INVALID => 7055

    /**
     * Native name: ERROR_CTX_LICENSE_EXPIRED
     * @type {Integer (UInt32)}
     */
    static CTX_LICENSE_EXPIRED => 7056

    /**
     * Native name: ERROR_CTX_SHADOW_NOT_RUNNING
     * @type {Integer (UInt32)}
     */
    static CTX_SHADOW_NOT_RUNNING => 7057

    /**
     * Native name: ERROR_CTX_SHADOW_ENDED_BY_MODE_CHANGE
     * @type {Integer (UInt32)}
     */
    static CTX_SHADOW_ENDED_BY_MODE_CHANGE => 7058

    /**
     * Native name: ERROR_ACTIVATION_COUNT_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static ACTIVATION_COUNT_EXCEEDED => 7059

    /**
     * Native name: ERROR_CTX_WINSTATIONS_DISABLED
     * @type {Integer (UInt32)}
     */
    static CTX_WINSTATIONS_DISABLED => 7060

    /**
     * Native name: ERROR_CTX_ENCRYPTION_LEVEL_REQUIRED
     * @type {Integer (UInt32)}
     */
    static CTX_ENCRYPTION_LEVEL_REQUIRED => 7061

    /**
     * Native name: ERROR_CTX_SESSION_IN_USE
     * @type {Integer (UInt32)}
     */
    static CTX_SESSION_IN_USE => 7062

    /**
     * Native name: ERROR_CTX_NO_FORCE_LOGOFF
     * @type {Integer (UInt32)}
     */
    static CTX_NO_FORCE_LOGOFF => 7063

    /**
     * Native name: ERROR_CTX_ACCOUNT_RESTRICTION
     * @type {Integer (UInt32)}
     */
    static CTX_ACCOUNT_RESTRICTION => 7064

    /**
     * Native name: ERROR_RDP_PROTOCOL_ERROR
     * @type {Integer (UInt32)}
     */
    static RDP_PROTOCOL_ERROR => 7065

    /**
     * Native name: ERROR_CTX_CDM_CONNECT
     * @type {Integer (UInt32)}
     */
    static CTX_CDM_CONNECT => 7066

    /**
     * Native name: ERROR_CTX_CDM_DISCONNECT
     * @type {Integer (UInt32)}
     */
    static CTX_CDM_DISCONNECT => 7067

    /**
     * Native name: ERROR_CTX_SECURITY_LAYER_ERROR
     * @type {Integer (UInt32)}
     */
    static CTX_SECURITY_LAYER_ERROR => 7068

    /**
     * Native name: ERROR_TS_INCOMPATIBLE_SESSIONS
     * @type {Integer (UInt32)}
     */
    static TS_INCOMPATIBLE_SESSIONS => 7069

    /**
     * Native name: ERROR_TS_VIDEO_SUBSYSTEM_ERROR
     * @type {Integer (UInt32)}
     */
    static TS_VIDEO_SUBSYSTEM_ERROR => 7070

    /**
     * Native name: ERROR_DS_NOT_INSTALLED
     * @type {Integer (UInt32)}
     */
    static DS_NOT_INSTALLED => 8200

    /**
     * Native name: ERROR_DS_MEMBERSHIP_EVALUATED_LOCALLY
     * @type {Integer (UInt32)}
     */
    static DS_MEMBERSHIP_EVALUATED_LOCALLY => 8201

    /**
     * Native name: ERROR_DS_NO_ATTRIBUTE_OR_VALUE
     * @type {Integer (UInt32)}
     */
    static DS_NO_ATTRIBUTE_OR_VALUE => 8202

    /**
     * Native name: ERROR_DS_INVALID_ATTRIBUTE_SYNTAX
     * @type {Integer (UInt32)}
     */
    static DS_INVALID_ATTRIBUTE_SYNTAX => 8203

    /**
     * Native name: ERROR_DS_ATTRIBUTE_TYPE_UNDEFINED
     * @type {Integer (UInt32)}
     */
    static DS_ATTRIBUTE_TYPE_UNDEFINED => 8204

    /**
     * Native name: ERROR_DS_ATTRIBUTE_OR_VALUE_EXISTS
     * @type {Integer (UInt32)}
     */
    static DS_ATTRIBUTE_OR_VALUE_EXISTS => 8205

    /**
     * Native name: ERROR_DS_BUSY
     * @type {Integer (UInt32)}
     */
    static DS_BUSY => 8206

    /**
     * Native name: ERROR_DS_UNAVAILABLE
     * @type {Integer (UInt32)}
     */
    static DS_UNAVAILABLE => 8207

    /**
     * Native name: ERROR_DS_NO_RIDS_ALLOCATED
     * @type {Integer (UInt32)}
     */
    static DS_NO_RIDS_ALLOCATED => 8208

    /**
     * Native name: ERROR_DS_NO_MORE_RIDS
     * @type {Integer (UInt32)}
     */
    static DS_NO_MORE_RIDS => 8209

    /**
     * Native name: ERROR_DS_INCORRECT_ROLE_OWNER
     * @type {Integer (UInt32)}
     */
    static DS_INCORRECT_ROLE_OWNER => 8210

    /**
     * Native name: ERROR_DS_RIDMGR_INIT_ERROR
     * @type {Integer (UInt32)}
     */
    static DS_RIDMGR_INIT_ERROR => 8211

    /**
     * Native name: ERROR_DS_OBJ_CLASS_VIOLATION
     * @type {Integer (UInt32)}
     */
    static DS_OBJ_CLASS_VIOLATION => 8212

    /**
     * Native name: ERROR_DS_CANT_ON_NON_LEAF
     * @type {Integer (UInt32)}
     */
    static DS_CANT_ON_NON_LEAF => 8213

    /**
     * Native name: ERROR_DS_CANT_ON_RDN
     * @type {Integer (UInt32)}
     */
    static DS_CANT_ON_RDN => 8214

    /**
     * Native name: ERROR_DS_CANT_MOD_OBJ_CLASS
     * @type {Integer (UInt32)}
     */
    static DS_CANT_MOD_OBJ_CLASS => 8215

    /**
     * Native name: ERROR_DS_CROSS_DOM_MOVE_ERROR
     * @type {Integer (UInt32)}
     */
    static DS_CROSS_DOM_MOVE_ERROR => 8216

    /**
     * Native name: ERROR_DS_GC_NOT_AVAILABLE
     * @type {Integer (UInt32)}
     */
    static DS_GC_NOT_AVAILABLE => 8217

    /**
     * Native name: ERROR_SHARED_POLICY
     * @type {Integer (UInt32)}
     */
    static SHARED_POLICY => 8218

    /**
     * Native name: ERROR_POLICY_OBJECT_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static POLICY_OBJECT_NOT_FOUND => 8219

    /**
     * Native name: ERROR_POLICY_ONLY_IN_DS
     * @type {Integer (UInt32)}
     */
    static POLICY_ONLY_IN_DS => 8220

    /**
     * Native name: ERROR_PROMOTION_ACTIVE
     * @type {Integer (UInt32)}
     */
    static PROMOTION_ACTIVE => 8221

    /**
     * Native name: ERROR_NO_PROMOTION_ACTIVE
     * @type {Integer (UInt32)}
     */
    static NO_PROMOTION_ACTIVE => 8222

    /**
     * Native name: ERROR_DS_OPERATIONS_ERROR
     * @type {Integer (UInt32)}
     */
    static DS_OPERATIONS_ERROR => 8224

    /**
     * Native name: ERROR_DS_PROTOCOL_ERROR
     * @type {Integer (UInt32)}
     */
    static DS_PROTOCOL_ERROR => 8225

    /**
     * Native name: ERROR_DS_TIMELIMIT_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static DS_TIMELIMIT_EXCEEDED => 8226

    /**
     * Native name: ERROR_DS_SIZELIMIT_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static DS_SIZELIMIT_EXCEEDED => 8227

    /**
     * Native name: ERROR_DS_ADMIN_LIMIT_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static DS_ADMIN_LIMIT_EXCEEDED => 8228

    /**
     * Native name: ERROR_DS_COMPARE_FALSE
     * @type {Integer (UInt32)}
     */
    static DS_COMPARE_FALSE => 8229

    /**
     * Native name: ERROR_DS_COMPARE_TRUE
     * @type {Integer (UInt32)}
     */
    static DS_COMPARE_TRUE => 8230

    /**
     * Native name: ERROR_DS_AUTH_METHOD_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static DS_AUTH_METHOD_NOT_SUPPORTED => 8231

    /**
     * Native name: ERROR_DS_STRONG_AUTH_REQUIRED
     * @type {Integer (UInt32)}
     */
    static DS_STRONG_AUTH_REQUIRED => 8232

    /**
     * Native name: ERROR_DS_INAPPROPRIATE_AUTH
     * @type {Integer (UInt32)}
     */
    static DS_INAPPROPRIATE_AUTH => 8233

    /**
     * Native name: ERROR_DS_AUTH_UNKNOWN
     * @type {Integer (UInt32)}
     */
    static DS_AUTH_UNKNOWN => 8234

    /**
     * Native name: ERROR_DS_REFERRAL
     * @type {Integer (UInt32)}
     */
    static DS_REFERRAL => 8235

    /**
     * Native name: ERROR_DS_UNAVAILABLE_CRIT_EXTENSION
     * @type {Integer (UInt32)}
     */
    static DS_UNAVAILABLE_CRIT_EXTENSION => 8236

    /**
     * Native name: ERROR_DS_CONFIDENTIALITY_REQUIRED
     * @type {Integer (UInt32)}
     */
    static DS_CONFIDENTIALITY_REQUIRED => 8237

    /**
     * Native name: ERROR_DS_INAPPROPRIATE_MATCHING
     * @type {Integer (UInt32)}
     */
    static DS_INAPPROPRIATE_MATCHING => 8238

    /**
     * Native name: ERROR_DS_CONSTRAINT_VIOLATION
     * @type {Integer (UInt32)}
     */
    static DS_CONSTRAINT_VIOLATION => 8239

    /**
     * Native name: ERROR_DS_NO_SUCH_OBJECT
     * @type {Integer (UInt32)}
     */
    static DS_NO_SUCH_OBJECT => 8240

    /**
     * Native name: ERROR_DS_ALIAS_PROBLEM
     * @type {Integer (UInt32)}
     */
    static DS_ALIAS_PROBLEM => 8241

    /**
     * Native name: ERROR_DS_INVALID_DN_SYNTAX
     * @type {Integer (UInt32)}
     */
    static DS_INVALID_DN_SYNTAX => 8242

    /**
     * Native name: ERROR_DS_IS_LEAF
     * @type {Integer (UInt32)}
     */
    static DS_IS_LEAF => 8243

    /**
     * Native name: ERROR_DS_ALIAS_DEREF_PROBLEM
     * @type {Integer (UInt32)}
     */
    static DS_ALIAS_DEREF_PROBLEM => 8244

    /**
     * Native name: ERROR_DS_UNWILLING_TO_PERFORM
     * @type {Integer (UInt32)}
     */
    static DS_UNWILLING_TO_PERFORM => 8245

    /**
     * Native name: ERROR_DS_LOOP_DETECT
     * @type {Integer (UInt32)}
     */
    static DS_LOOP_DETECT => 8246

    /**
     * Native name: ERROR_DS_NAMING_VIOLATION
     * @type {Integer (UInt32)}
     */
    static DS_NAMING_VIOLATION => 8247

    /**
     * Native name: ERROR_DS_OBJECT_RESULTS_TOO_LARGE
     * @type {Integer (UInt32)}
     */
    static DS_OBJECT_RESULTS_TOO_LARGE => 8248

    /**
     * Native name: ERROR_DS_AFFECTS_MULTIPLE_DSAS
     * @type {Integer (UInt32)}
     */
    static DS_AFFECTS_MULTIPLE_DSAS => 8249

    /**
     * Native name: ERROR_DS_SERVER_DOWN
     * @type {Integer (UInt32)}
     */
    static DS_SERVER_DOWN => 8250

    /**
     * Native name: ERROR_DS_LOCAL_ERROR
     * @type {Integer (UInt32)}
     */
    static DS_LOCAL_ERROR => 8251

    /**
     * Native name: ERROR_DS_ENCODING_ERROR
     * @type {Integer (UInt32)}
     */
    static DS_ENCODING_ERROR => 8252

    /**
     * Native name: ERROR_DS_DECODING_ERROR
     * @type {Integer (UInt32)}
     */
    static DS_DECODING_ERROR => 8253

    /**
     * Native name: ERROR_DS_FILTER_UNKNOWN
     * @type {Integer (UInt32)}
     */
    static DS_FILTER_UNKNOWN => 8254

    /**
     * Native name: ERROR_DS_PARAM_ERROR
     * @type {Integer (UInt32)}
     */
    static DS_PARAM_ERROR => 8255

    /**
     * Native name: ERROR_DS_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static DS_NOT_SUPPORTED => 8256

    /**
     * Native name: ERROR_DS_NO_RESULTS_RETURNED
     * @type {Integer (UInt32)}
     */
    static DS_NO_RESULTS_RETURNED => 8257

    /**
     * Native name: ERROR_DS_CONTROL_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static DS_CONTROL_NOT_FOUND => 8258

    /**
     * Native name: ERROR_DS_CLIENT_LOOP
     * @type {Integer (UInt32)}
     */
    static DS_CLIENT_LOOP => 8259

    /**
     * Native name: ERROR_DS_REFERRAL_LIMIT_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static DS_REFERRAL_LIMIT_EXCEEDED => 8260

    /**
     * Native name: ERROR_DS_SORT_CONTROL_MISSING
     * @type {Integer (UInt32)}
     */
    static DS_SORT_CONTROL_MISSING => 8261

    /**
     * Native name: ERROR_DS_OFFSET_RANGE_ERROR
     * @type {Integer (UInt32)}
     */
    static DS_OFFSET_RANGE_ERROR => 8262

    /**
     * Native name: ERROR_DS_RIDMGR_DISABLED
     * @type {Integer (UInt32)}
     */
    static DS_RIDMGR_DISABLED => 8263

    /**
     * Native name: ERROR_DS_ROOT_MUST_BE_NC
     * @type {Integer (UInt32)}
     */
    static DS_ROOT_MUST_BE_NC => 8301

    /**
     * Native name: ERROR_DS_ADD_REPLICA_INHIBITED
     * @type {Integer (UInt32)}
     */
    static DS_ADD_REPLICA_INHIBITED => 8302

    /**
     * Native name: ERROR_DS_ATT_NOT_DEF_IN_SCHEMA
     * @type {Integer (UInt32)}
     */
    static DS_ATT_NOT_DEF_IN_SCHEMA => 8303

    /**
     * Native name: ERROR_DS_MAX_OBJ_SIZE_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static DS_MAX_OBJ_SIZE_EXCEEDED => 8304

    /**
     * Native name: ERROR_DS_OBJ_STRING_NAME_EXISTS
     * @type {Integer (UInt32)}
     */
    static DS_OBJ_STRING_NAME_EXISTS => 8305

    /**
     * Native name: ERROR_DS_NO_RDN_DEFINED_IN_SCHEMA
     * @type {Integer (UInt32)}
     */
    static DS_NO_RDN_DEFINED_IN_SCHEMA => 8306

    /**
     * Native name: ERROR_DS_RDN_DOESNT_MATCH_SCHEMA
     * @type {Integer (UInt32)}
     */
    static DS_RDN_DOESNT_MATCH_SCHEMA => 8307

    /**
     * Native name: ERROR_DS_NO_REQUESTED_ATTS_FOUND
     * @type {Integer (UInt32)}
     */
    static DS_NO_REQUESTED_ATTS_FOUND => 8308

    /**
     * Native name: ERROR_DS_USER_BUFFER_TO_SMALL
     * @type {Integer (UInt32)}
     */
    static DS_USER_BUFFER_TO_SMALL => 8309

    /**
     * Native name: ERROR_DS_ATT_IS_NOT_ON_OBJ
     * @type {Integer (UInt32)}
     */
    static DS_ATT_IS_NOT_ON_OBJ => 8310

    /**
     * Native name: ERROR_DS_ILLEGAL_MOD_OPERATION
     * @type {Integer (UInt32)}
     */
    static DS_ILLEGAL_MOD_OPERATION => 8311

    /**
     * Native name: ERROR_DS_OBJ_TOO_LARGE
     * @type {Integer (UInt32)}
     */
    static DS_OBJ_TOO_LARGE => 8312

    /**
     * Native name: ERROR_DS_BAD_INSTANCE_TYPE
     * @type {Integer (UInt32)}
     */
    static DS_BAD_INSTANCE_TYPE => 8313

    /**
     * Native name: ERROR_DS_MASTERDSA_REQUIRED
     * @type {Integer (UInt32)}
     */
    static DS_MASTERDSA_REQUIRED => 8314

    /**
     * Native name: ERROR_DS_OBJECT_CLASS_REQUIRED
     * @type {Integer (UInt32)}
     */
    static DS_OBJECT_CLASS_REQUIRED => 8315

    /**
     * Native name: ERROR_DS_MISSING_REQUIRED_ATT
     * @type {Integer (UInt32)}
     */
    static DS_MISSING_REQUIRED_ATT => 8316

    /**
     * Native name: ERROR_DS_ATT_NOT_DEF_FOR_CLASS
     * @type {Integer (UInt32)}
     */
    static DS_ATT_NOT_DEF_FOR_CLASS => 8317

    /**
     * Native name: ERROR_DS_ATT_ALREADY_EXISTS
     * @type {Integer (UInt32)}
     */
    static DS_ATT_ALREADY_EXISTS => 8318

    /**
     * Native name: ERROR_DS_CANT_ADD_ATT_VALUES
     * @type {Integer (UInt32)}
     */
    static DS_CANT_ADD_ATT_VALUES => 8320

    /**
     * Native name: ERROR_DS_SINGLE_VALUE_CONSTRAINT
     * @type {Integer (UInt32)}
     */
    static DS_SINGLE_VALUE_CONSTRAINT => 8321

    /**
     * Native name: ERROR_DS_RANGE_CONSTRAINT
     * @type {Integer (UInt32)}
     */
    static DS_RANGE_CONSTRAINT => 8322

    /**
     * Native name: ERROR_DS_ATT_VAL_ALREADY_EXISTS
     * @type {Integer (UInt32)}
     */
    static DS_ATT_VAL_ALREADY_EXISTS => 8323

    /**
     * Native name: ERROR_DS_CANT_REM_MISSING_ATT
     * @type {Integer (UInt32)}
     */
    static DS_CANT_REM_MISSING_ATT => 8324

    /**
     * Native name: ERROR_DS_CANT_REM_MISSING_ATT_VAL
     * @type {Integer (UInt32)}
     */
    static DS_CANT_REM_MISSING_ATT_VAL => 8325

    /**
     * Native name: ERROR_DS_ROOT_CANT_BE_SUBREF
     * @type {Integer (UInt32)}
     */
    static DS_ROOT_CANT_BE_SUBREF => 8326

    /**
     * Native name: ERROR_DS_NO_CHAINING
     * @type {Integer (UInt32)}
     */
    static DS_NO_CHAINING => 8327

    /**
     * Native name: ERROR_DS_NO_CHAINED_EVAL
     * @type {Integer (UInt32)}
     */
    static DS_NO_CHAINED_EVAL => 8328

    /**
     * Native name: ERROR_DS_NO_PARENT_OBJECT
     * @type {Integer (UInt32)}
     */
    static DS_NO_PARENT_OBJECT => 8329

    /**
     * Native name: ERROR_DS_PARENT_IS_AN_ALIAS
     * @type {Integer (UInt32)}
     */
    static DS_PARENT_IS_AN_ALIAS => 8330

    /**
     * Native name: ERROR_DS_CANT_MIX_MASTER_AND_REPS
     * @type {Integer (UInt32)}
     */
    static DS_CANT_MIX_MASTER_AND_REPS => 8331

    /**
     * Native name: ERROR_DS_CHILDREN_EXIST
     * @type {Integer (UInt32)}
     */
    static DS_CHILDREN_EXIST => 8332

    /**
     * Native name: ERROR_DS_OBJ_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static DS_OBJ_NOT_FOUND => 8333

    /**
     * Native name: ERROR_DS_ALIASED_OBJ_MISSING
     * @type {Integer (UInt32)}
     */
    static DS_ALIASED_OBJ_MISSING => 8334

    /**
     * Native name: ERROR_DS_BAD_NAME_SYNTAX
     * @type {Integer (UInt32)}
     */
    static DS_BAD_NAME_SYNTAX => 8335

    /**
     * Native name: ERROR_DS_ALIAS_POINTS_TO_ALIAS
     * @type {Integer (UInt32)}
     */
    static DS_ALIAS_POINTS_TO_ALIAS => 8336

    /**
     * Native name: ERROR_DS_CANT_DEREF_ALIAS
     * @type {Integer (UInt32)}
     */
    static DS_CANT_DEREF_ALIAS => 8337

    /**
     * Native name: ERROR_DS_OUT_OF_SCOPE
     * @type {Integer (UInt32)}
     */
    static DS_OUT_OF_SCOPE => 8338

    /**
     * Native name: ERROR_DS_OBJECT_BEING_REMOVED
     * @type {Integer (UInt32)}
     */
    static DS_OBJECT_BEING_REMOVED => 8339

    /**
     * Native name: ERROR_DS_CANT_DELETE_DSA_OBJ
     * @type {Integer (UInt32)}
     */
    static DS_CANT_DELETE_DSA_OBJ => 8340

    /**
     * Native name: ERROR_DS_GENERIC_ERROR
     * @type {Integer (UInt32)}
     */
    static DS_GENERIC_ERROR => 8341

    /**
     * Native name: ERROR_DS_DSA_MUST_BE_INT_MASTER
     * @type {Integer (UInt32)}
     */
    static DS_DSA_MUST_BE_INT_MASTER => 8342

    /**
     * Native name: ERROR_DS_CLASS_NOT_DSA
     * @type {Integer (UInt32)}
     */
    static DS_CLASS_NOT_DSA => 8343

    /**
     * Native name: ERROR_DS_INSUFF_ACCESS_RIGHTS
     * @type {Integer (UInt32)}
     */
    static DS_INSUFF_ACCESS_RIGHTS => 8344

    /**
     * Native name: ERROR_DS_ILLEGAL_SUPERIOR
     * @type {Integer (UInt32)}
     */
    static DS_ILLEGAL_SUPERIOR => 8345

    /**
     * Native name: ERROR_DS_ATTRIBUTE_OWNED_BY_SAM
     * @type {Integer (UInt32)}
     */
    static DS_ATTRIBUTE_OWNED_BY_SAM => 8346

    /**
     * Native name: ERROR_DS_NAME_TOO_MANY_PARTS
     * @type {Integer (UInt32)}
     */
    static DS_NAME_TOO_MANY_PARTS => 8347

    /**
     * Native name: ERROR_DS_NAME_TOO_LONG
     * @type {Integer (UInt32)}
     */
    static DS_NAME_TOO_LONG => 8348

    /**
     * Native name: ERROR_DS_NAME_VALUE_TOO_LONG
     * @type {Integer (UInt32)}
     */
    static DS_NAME_VALUE_TOO_LONG => 8349

    /**
     * Native name: ERROR_DS_NAME_UNPARSEABLE
     * @type {Integer (UInt32)}
     */
    static DS_NAME_UNPARSEABLE => 8350

    /**
     * Native name: ERROR_DS_NAME_TYPE_UNKNOWN
     * @type {Integer (UInt32)}
     */
    static DS_NAME_TYPE_UNKNOWN => 8351

    /**
     * Native name: ERROR_DS_NOT_AN_OBJECT
     * @type {Integer (UInt32)}
     */
    static DS_NOT_AN_OBJECT => 8352

    /**
     * Native name: ERROR_DS_SEC_DESC_TOO_SHORT
     * @type {Integer (UInt32)}
     */
    static DS_SEC_DESC_TOO_SHORT => 8353

    /**
     * Native name: ERROR_DS_SEC_DESC_INVALID
     * @type {Integer (UInt32)}
     */
    static DS_SEC_DESC_INVALID => 8354

    /**
     * Native name: ERROR_DS_NO_DELETED_NAME
     * @type {Integer (UInt32)}
     */
    static DS_NO_DELETED_NAME => 8355

    /**
     * Native name: ERROR_DS_SUBREF_MUST_HAVE_PARENT
     * @type {Integer (UInt32)}
     */
    static DS_SUBREF_MUST_HAVE_PARENT => 8356

    /**
     * Native name: ERROR_DS_NCNAME_MUST_BE_NC
     * @type {Integer (UInt32)}
     */
    static DS_NCNAME_MUST_BE_NC => 8357

    /**
     * Native name: ERROR_DS_CANT_ADD_SYSTEM_ONLY
     * @type {Integer (UInt32)}
     */
    static DS_CANT_ADD_SYSTEM_ONLY => 8358

    /**
     * Native name: ERROR_DS_CLASS_MUST_BE_CONCRETE
     * @type {Integer (UInt32)}
     */
    static DS_CLASS_MUST_BE_CONCRETE => 8359

    /**
     * Native name: ERROR_DS_INVALID_DMD
     * @type {Integer (UInt32)}
     */
    static DS_INVALID_DMD => 8360

    /**
     * Native name: ERROR_DS_OBJ_GUID_EXISTS
     * @type {Integer (UInt32)}
     */
    static DS_OBJ_GUID_EXISTS => 8361

    /**
     * Native name: ERROR_DS_NOT_ON_BACKLINK
     * @type {Integer (UInt32)}
     */
    static DS_NOT_ON_BACKLINK => 8362

    /**
     * Native name: ERROR_DS_NO_CROSSREF_FOR_NC
     * @type {Integer (UInt32)}
     */
    static DS_NO_CROSSREF_FOR_NC => 8363

    /**
     * Native name: ERROR_DS_SHUTTING_DOWN
     * @type {Integer (UInt32)}
     */
    static DS_SHUTTING_DOWN => 8364

    /**
     * Native name: ERROR_DS_UNKNOWN_OPERATION
     * @type {Integer (UInt32)}
     */
    static DS_UNKNOWN_OPERATION => 8365

    /**
     * Native name: ERROR_DS_INVALID_ROLE_OWNER
     * @type {Integer (UInt32)}
     */
    static DS_INVALID_ROLE_OWNER => 8366

    /**
     * Native name: ERROR_DS_COULDNT_CONTACT_FSMO
     * @type {Integer (UInt32)}
     */
    static DS_COULDNT_CONTACT_FSMO => 8367

    /**
     * Native name: ERROR_DS_CROSS_NC_DN_RENAME
     * @type {Integer (UInt32)}
     */
    static DS_CROSS_NC_DN_RENAME => 8368

    /**
     * Native name: ERROR_DS_CANT_MOD_SYSTEM_ONLY
     * @type {Integer (UInt32)}
     */
    static DS_CANT_MOD_SYSTEM_ONLY => 8369

    /**
     * Native name: ERROR_DS_REPLICATOR_ONLY
     * @type {Integer (UInt32)}
     */
    static DS_REPLICATOR_ONLY => 8370

    /**
     * Native name: ERROR_DS_OBJ_CLASS_NOT_DEFINED
     * @type {Integer (UInt32)}
     */
    static DS_OBJ_CLASS_NOT_DEFINED => 8371

    /**
     * Native name: ERROR_DS_OBJ_CLASS_NOT_SUBCLASS
     * @type {Integer (UInt32)}
     */
    static DS_OBJ_CLASS_NOT_SUBCLASS => 8372

    /**
     * Native name: ERROR_DS_NAME_REFERENCE_INVALID
     * @type {Integer (UInt32)}
     */
    static DS_NAME_REFERENCE_INVALID => 8373

    /**
     * Native name: ERROR_DS_CROSS_REF_EXISTS
     * @type {Integer (UInt32)}
     */
    static DS_CROSS_REF_EXISTS => 8374

    /**
     * Native name: ERROR_DS_CANT_DEL_MASTER_CROSSREF
     * @type {Integer (UInt32)}
     */
    static DS_CANT_DEL_MASTER_CROSSREF => 8375

    /**
     * Native name: ERROR_DS_SUBTREE_NOTIFY_NOT_NC_HEAD
     * @type {Integer (UInt32)}
     */
    static DS_SUBTREE_NOTIFY_NOT_NC_HEAD => 8376

    /**
     * Native name: ERROR_DS_NOTIFY_FILTER_TOO_COMPLEX
     * @type {Integer (UInt32)}
     */
    static DS_NOTIFY_FILTER_TOO_COMPLEX => 8377

    /**
     * Native name: ERROR_DS_DUP_RDN
     * @type {Integer (UInt32)}
     */
    static DS_DUP_RDN => 8378

    /**
     * Native name: ERROR_DS_DUP_OID
     * @type {Integer (UInt32)}
     */
    static DS_DUP_OID => 8379

    /**
     * Native name: ERROR_DS_DUP_MAPI_ID
     * @type {Integer (UInt32)}
     */
    static DS_DUP_MAPI_ID => 8380

    /**
     * Native name: ERROR_DS_DUP_SCHEMA_ID_GUID
     * @type {Integer (UInt32)}
     */
    static DS_DUP_SCHEMA_ID_GUID => 8381

    /**
     * Native name: ERROR_DS_DUP_LDAP_DISPLAY_NAME
     * @type {Integer (UInt32)}
     */
    static DS_DUP_LDAP_DISPLAY_NAME => 8382

    /**
     * Native name: ERROR_DS_SEMANTIC_ATT_TEST
     * @type {Integer (UInt32)}
     */
    static DS_SEMANTIC_ATT_TEST => 8383

    /**
     * Native name: ERROR_DS_SYNTAX_MISMATCH
     * @type {Integer (UInt32)}
     */
    static DS_SYNTAX_MISMATCH => 8384

    /**
     * Native name: ERROR_DS_EXISTS_IN_MUST_HAVE
     * @type {Integer (UInt32)}
     */
    static DS_EXISTS_IN_MUST_HAVE => 8385

    /**
     * Native name: ERROR_DS_EXISTS_IN_MAY_HAVE
     * @type {Integer (UInt32)}
     */
    static DS_EXISTS_IN_MAY_HAVE => 8386

    /**
     * Native name: ERROR_DS_NONEXISTENT_MAY_HAVE
     * @type {Integer (UInt32)}
     */
    static DS_NONEXISTENT_MAY_HAVE => 8387

    /**
     * Native name: ERROR_DS_NONEXISTENT_MUST_HAVE
     * @type {Integer (UInt32)}
     */
    static DS_NONEXISTENT_MUST_HAVE => 8388

    /**
     * Native name: ERROR_DS_AUX_CLS_TEST_FAIL
     * @type {Integer (UInt32)}
     */
    static DS_AUX_CLS_TEST_FAIL => 8389

    /**
     * Native name: ERROR_DS_NONEXISTENT_POSS_SUP
     * @type {Integer (UInt32)}
     */
    static DS_NONEXISTENT_POSS_SUP => 8390

    /**
     * Native name: ERROR_DS_SUB_CLS_TEST_FAIL
     * @type {Integer (UInt32)}
     */
    static DS_SUB_CLS_TEST_FAIL => 8391

    /**
     * Native name: ERROR_DS_BAD_RDN_ATT_ID_SYNTAX
     * @type {Integer (UInt32)}
     */
    static DS_BAD_RDN_ATT_ID_SYNTAX => 8392

    /**
     * Native name: ERROR_DS_EXISTS_IN_AUX_CLS
     * @type {Integer (UInt32)}
     */
    static DS_EXISTS_IN_AUX_CLS => 8393

    /**
     * Native name: ERROR_DS_EXISTS_IN_SUB_CLS
     * @type {Integer (UInt32)}
     */
    static DS_EXISTS_IN_SUB_CLS => 8394

    /**
     * Native name: ERROR_DS_EXISTS_IN_POSS_SUP
     * @type {Integer (UInt32)}
     */
    static DS_EXISTS_IN_POSS_SUP => 8395

    /**
     * Native name: ERROR_DS_RECALCSCHEMA_FAILED
     * @type {Integer (UInt32)}
     */
    static DS_RECALCSCHEMA_FAILED => 8396

    /**
     * Native name: ERROR_DS_TREE_DELETE_NOT_FINISHED
     * @type {Integer (UInt32)}
     */
    static DS_TREE_DELETE_NOT_FINISHED => 8397

    /**
     * Native name: ERROR_DS_CANT_DELETE
     * @type {Integer (UInt32)}
     */
    static DS_CANT_DELETE => 8398

    /**
     * Native name: ERROR_DS_ATT_SCHEMA_REQ_ID
     * @type {Integer (UInt32)}
     */
    static DS_ATT_SCHEMA_REQ_ID => 8399

    /**
     * Native name: ERROR_DS_BAD_ATT_SCHEMA_SYNTAX
     * @type {Integer (UInt32)}
     */
    static DS_BAD_ATT_SCHEMA_SYNTAX => 8400

    /**
     * Native name: ERROR_DS_CANT_CACHE_ATT
     * @type {Integer (UInt32)}
     */
    static DS_CANT_CACHE_ATT => 8401

    /**
     * Native name: ERROR_DS_CANT_CACHE_CLASS
     * @type {Integer (UInt32)}
     */
    static DS_CANT_CACHE_CLASS => 8402

    /**
     * Native name: ERROR_DS_CANT_REMOVE_ATT_CACHE
     * @type {Integer (UInt32)}
     */
    static DS_CANT_REMOVE_ATT_CACHE => 8403

    /**
     * Native name: ERROR_DS_CANT_REMOVE_CLASS_CACHE
     * @type {Integer (UInt32)}
     */
    static DS_CANT_REMOVE_CLASS_CACHE => 8404

    /**
     * Native name: ERROR_DS_CANT_RETRIEVE_DN
     * @type {Integer (UInt32)}
     */
    static DS_CANT_RETRIEVE_DN => 8405

    /**
     * Native name: ERROR_DS_MISSING_SUPREF
     * @type {Integer (UInt32)}
     */
    static DS_MISSING_SUPREF => 8406

    /**
     * Native name: ERROR_DS_CANT_RETRIEVE_INSTANCE
     * @type {Integer (UInt32)}
     */
    static DS_CANT_RETRIEVE_INSTANCE => 8407

    /**
     * Native name: ERROR_DS_CODE_INCONSISTENCY
     * @type {Integer (UInt32)}
     */
    static DS_CODE_INCONSISTENCY => 8408

    /**
     * Native name: ERROR_DS_DATABASE_ERROR
     * @type {Integer (UInt32)}
     */
    static DS_DATABASE_ERROR => 8409

    /**
     * Native name: ERROR_DS_GOVERNSID_MISSING
     * @type {Integer (UInt32)}
     */
    static DS_GOVERNSID_MISSING => 8410

    /**
     * Native name: ERROR_DS_MISSING_EXPECTED_ATT
     * @type {Integer (UInt32)}
     */
    static DS_MISSING_EXPECTED_ATT => 8411

    /**
     * Native name: ERROR_DS_NCNAME_MISSING_CR_REF
     * @type {Integer (UInt32)}
     */
    static DS_NCNAME_MISSING_CR_REF => 8412

    /**
     * Native name: ERROR_DS_SECURITY_CHECKING_ERROR
     * @type {Integer (UInt32)}
     */
    static DS_SECURITY_CHECKING_ERROR => 8413

    /**
     * Native name: ERROR_DS_SCHEMA_NOT_LOADED
     * @type {Integer (UInt32)}
     */
    static DS_SCHEMA_NOT_LOADED => 8414

    /**
     * Native name: ERROR_DS_SCHEMA_ALLOC_FAILED
     * @type {Integer (UInt32)}
     */
    static DS_SCHEMA_ALLOC_FAILED => 8415

    /**
     * Native name: ERROR_DS_ATT_SCHEMA_REQ_SYNTAX
     * @type {Integer (UInt32)}
     */
    static DS_ATT_SCHEMA_REQ_SYNTAX => 8416

    /**
     * Native name: ERROR_DS_GCVERIFY_ERROR
     * @type {Integer (UInt32)}
     */
    static DS_GCVERIFY_ERROR => 8417

    /**
     * Native name: ERROR_DS_DRA_SCHEMA_MISMATCH
     * @type {Integer (UInt32)}
     */
    static DS_DRA_SCHEMA_MISMATCH => 8418

    /**
     * Native name: ERROR_DS_CANT_FIND_DSA_OBJ
     * @type {Integer (UInt32)}
     */
    static DS_CANT_FIND_DSA_OBJ => 8419

    /**
     * Native name: ERROR_DS_CANT_FIND_EXPECTED_NC
     * @type {Integer (UInt32)}
     */
    static DS_CANT_FIND_EXPECTED_NC => 8420

    /**
     * Native name: ERROR_DS_CANT_FIND_NC_IN_CACHE
     * @type {Integer (UInt32)}
     */
    static DS_CANT_FIND_NC_IN_CACHE => 8421

    /**
     * Native name: ERROR_DS_CANT_RETRIEVE_CHILD
     * @type {Integer (UInt32)}
     */
    static DS_CANT_RETRIEVE_CHILD => 8422

    /**
     * Native name: ERROR_DS_SECURITY_ILLEGAL_MODIFY
     * @type {Integer (UInt32)}
     */
    static DS_SECURITY_ILLEGAL_MODIFY => 8423

    /**
     * Native name: ERROR_DS_CANT_REPLACE_HIDDEN_REC
     * @type {Integer (UInt32)}
     */
    static DS_CANT_REPLACE_HIDDEN_REC => 8424

    /**
     * Native name: ERROR_DS_BAD_HIERARCHY_FILE
     * @type {Integer (UInt32)}
     */
    static DS_BAD_HIERARCHY_FILE => 8425

    /**
     * Native name: ERROR_DS_BUILD_HIERARCHY_TABLE_FAILED
     * @type {Integer (UInt32)}
     */
    static DS_BUILD_HIERARCHY_TABLE_FAILED => 8426

    /**
     * Native name: ERROR_DS_CONFIG_PARAM_MISSING
     * @type {Integer (UInt32)}
     */
    static DS_CONFIG_PARAM_MISSING => 8427

    /**
     * Native name: ERROR_DS_COUNTING_AB_INDICES_FAILED
     * @type {Integer (UInt32)}
     */
    static DS_COUNTING_AB_INDICES_FAILED => 8428

    /**
     * Native name: ERROR_DS_HIERARCHY_TABLE_MALLOC_FAILED
     * @type {Integer (UInt32)}
     */
    static DS_HIERARCHY_TABLE_MALLOC_FAILED => 8429

    /**
     * Native name: ERROR_DS_INTERNAL_FAILURE
     * @type {Integer (UInt32)}
     */
    static DS_INTERNAL_FAILURE => 8430

    /**
     * Native name: ERROR_DS_UNKNOWN_ERROR
     * @type {Integer (UInt32)}
     */
    static DS_UNKNOWN_ERROR => 8431

    /**
     * Native name: ERROR_DS_ROOT_REQUIRES_CLASS_TOP
     * @type {Integer (UInt32)}
     */
    static DS_ROOT_REQUIRES_CLASS_TOP => 8432

    /**
     * Native name: ERROR_DS_REFUSING_FSMO_ROLES
     * @type {Integer (UInt32)}
     */
    static DS_REFUSING_FSMO_ROLES => 8433

    /**
     * Native name: ERROR_DS_MISSING_FSMO_SETTINGS
     * @type {Integer (UInt32)}
     */
    static DS_MISSING_FSMO_SETTINGS => 8434

    /**
     * Native name: ERROR_DS_UNABLE_TO_SURRENDER_ROLES
     * @type {Integer (UInt32)}
     */
    static DS_UNABLE_TO_SURRENDER_ROLES => 8435

    /**
     * Native name: ERROR_DS_DRA_GENERIC
     * @type {Integer (UInt32)}
     */
    static DS_DRA_GENERIC => 8436

    /**
     * Native name: ERROR_DS_DRA_INVALID_PARAMETER
     * @type {Integer (UInt32)}
     */
    static DS_DRA_INVALID_PARAMETER => 8437

    /**
     * Native name: ERROR_DS_DRA_BUSY
     * @type {Integer (UInt32)}
     */
    static DS_DRA_BUSY => 8438

    /**
     * Native name: ERROR_DS_DRA_BAD_DN
     * @type {Integer (UInt32)}
     */
    static DS_DRA_BAD_DN => 8439

    /**
     * Native name: ERROR_DS_DRA_BAD_NC
     * @type {Integer (UInt32)}
     */
    static DS_DRA_BAD_NC => 8440

    /**
     * Native name: ERROR_DS_DRA_DN_EXISTS
     * @type {Integer (UInt32)}
     */
    static DS_DRA_DN_EXISTS => 8441

    /**
     * Native name: ERROR_DS_DRA_INTERNAL_ERROR
     * @type {Integer (UInt32)}
     */
    static DS_DRA_INTERNAL_ERROR => 8442

    /**
     * Native name: ERROR_DS_DRA_INCONSISTENT_DIT
     * @type {Integer (UInt32)}
     */
    static DS_DRA_INCONSISTENT_DIT => 8443

    /**
     * Native name: ERROR_DS_DRA_CONNECTION_FAILED
     * @type {Integer (UInt32)}
     */
    static DS_DRA_CONNECTION_FAILED => 8444

    /**
     * Native name: ERROR_DS_DRA_BAD_INSTANCE_TYPE
     * @type {Integer (UInt32)}
     */
    static DS_DRA_BAD_INSTANCE_TYPE => 8445

    /**
     * Native name: ERROR_DS_DRA_OUT_OF_MEM
     * @type {Integer (UInt32)}
     */
    static DS_DRA_OUT_OF_MEM => 8446

    /**
     * Native name: ERROR_DS_DRA_MAIL_PROBLEM
     * @type {Integer (UInt32)}
     */
    static DS_DRA_MAIL_PROBLEM => 8447

    /**
     * Native name: ERROR_DS_DRA_REF_ALREADY_EXISTS
     * @type {Integer (UInt32)}
     */
    static DS_DRA_REF_ALREADY_EXISTS => 8448

    /**
     * Native name: ERROR_DS_DRA_REF_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static DS_DRA_REF_NOT_FOUND => 8449

    /**
     * Native name: ERROR_DS_DRA_OBJ_IS_REP_SOURCE
     * @type {Integer (UInt32)}
     */
    static DS_DRA_OBJ_IS_REP_SOURCE => 8450

    /**
     * Native name: ERROR_DS_DRA_DB_ERROR
     * @type {Integer (UInt32)}
     */
    static DS_DRA_DB_ERROR => 8451

    /**
     * Native name: ERROR_DS_DRA_NO_REPLICA
     * @type {Integer (UInt32)}
     */
    static DS_DRA_NO_REPLICA => 8452

    /**
     * Native name: ERROR_DS_DRA_ACCESS_DENIED
     * @type {Integer (UInt32)}
     */
    static DS_DRA_ACCESS_DENIED => 8453

    /**
     * Native name: ERROR_DS_DRA_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static DS_DRA_NOT_SUPPORTED => 8454

    /**
     * Native name: ERROR_DS_DRA_RPC_CANCELLED
     * @type {Integer (UInt32)}
     */
    static DS_DRA_RPC_CANCELLED => 8455

    /**
     * Native name: ERROR_DS_DRA_SOURCE_DISABLED
     * @type {Integer (UInt32)}
     */
    static DS_DRA_SOURCE_DISABLED => 8456

    /**
     * Native name: ERROR_DS_DRA_SINK_DISABLED
     * @type {Integer (UInt32)}
     */
    static DS_DRA_SINK_DISABLED => 8457

    /**
     * Native name: ERROR_DS_DRA_NAME_COLLISION
     * @type {Integer (UInt32)}
     */
    static DS_DRA_NAME_COLLISION => 8458

    /**
     * Native name: ERROR_DS_DRA_SOURCE_REINSTALLED
     * @type {Integer (UInt32)}
     */
    static DS_DRA_SOURCE_REINSTALLED => 8459

    /**
     * Native name: ERROR_DS_DRA_MISSING_PARENT
     * @type {Integer (UInt32)}
     */
    static DS_DRA_MISSING_PARENT => 8460

    /**
     * Native name: ERROR_DS_DRA_PREEMPTED
     * @type {Integer (UInt32)}
     */
    static DS_DRA_PREEMPTED => 8461

    /**
     * Native name: ERROR_DS_DRA_ABANDON_SYNC
     * @type {Integer (UInt32)}
     */
    static DS_DRA_ABANDON_SYNC => 8462

    /**
     * Native name: ERROR_DS_DRA_SHUTDOWN
     * @type {Integer (UInt32)}
     */
    static DS_DRA_SHUTDOWN => 8463

    /**
     * Native name: ERROR_DS_DRA_INCOMPATIBLE_PARTIAL_SET
     * @type {Integer (UInt32)}
     */
    static DS_DRA_INCOMPATIBLE_PARTIAL_SET => 8464

    /**
     * Native name: ERROR_DS_DRA_SOURCE_IS_PARTIAL_REPLICA
     * @type {Integer (UInt32)}
     */
    static DS_DRA_SOURCE_IS_PARTIAL_REPLICA => 8465

    /**
     * Native name: ERROR_DS_DRA_EXTN_CONNECTION_FAILED
     * @type {Integer (UInt32)}
     */
    static DS_DRA_EXTN_CONNECTION_FAILED => 8466

    /**
     * Native name: ERROR_DS_INSTALL_SCHEMA_MISMATCH
     * @type {Integer (UInt32)}
     */
    static DS_INSTALL_SCHEMA_MISMATCH => 8467

    /**
     * Native name: ERROR_DS_DUP_LINK_ID
     * @type {Integer (UInt32)}
     */
    static DS_DUP_LINK_ID => 8468

    /**
     * Native name: ERROR_DS_NAME_ERROR_RESOLVING
     * @type {Integer (UInt32)}
     */
    static DS_NAME_ERROR_RESOLVING => 8469

    /**
     * Native name: ERROR_DS_NAME_ERROR_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static DS_NAME_ERROR_NOT_FOUND => 8470

    /**
     * Native name: ERROR_DS_NAME_ERROR_NOT_UNIQUE
     * @type {Integer (UInt32)}
     */
    static DS_NAME_ERROR_NOT_UNIQUE => 8471

    /**
     * Native name: ERROR_DS_NAME_ERROR_NO_MAPPING
     * @type {Integer (UInt32)}
     */
    static DS_NAME_ERROR_NO_MAPPING => 8472

    /**
     * Native name: ERROR_DS_NAME_ERROR_DOMAIN_ONLY
     * @type {Integer (UInt32)}
     */
    static DS_NAME_ERROR_DOMAIN_ONLY => 8473

    /**
     * Native name: ERROR_DS_NAME_ERROR_NO_SYNTACTICAL_MAPPING
     * @type {Integer (UInt32)}
     */
    static DS_NAME_ERROR_NO_SYNTACTICAL_MAPPING => 8474

    /**
     * Native name: ERROR_DS_CONSTRUCTED_ATT_MOD
     * @type {Integer (UInt32)}
     */
    static DS_CONSTRUCTED_ATT_MOD => 8475

    /**
     * Native name: ERROR_DS_WRONG_OM_OBJ_CLASS
     * @type {Integer (UInt32)}
     */
    static DS_WRONG_OM_OBJ_CLASS => 8476

    /**
     * Native name: ERROR_DS_DRA_REPL_PENDING
     * @type {Integer (UInt32)}
     */
    static DS_DRA_REPL_PENDING => 8477

    /**
     * Native name: ERROR_DS_DS_REQUIRED
     * @type {Integer (UInt32)}
     */
    static DS_DS_REQUIRED => 8478

    /**
     * Native name: ERROR_DS_INVALID_LDAP_DISPLAY_NAME
     * @type {Integer (UInt32)}
     */
    static DS_INVALID_LDAP_DISPLAY_NAME => 8479

    /**
     * Native name: ERROR_DS_NON_BASE_SEARCH
     * @type {Integer (UInt32)}
     */
    static DS_NON_BASE_SEARCH => 8480

    /**
     * Native name: ERROR_DS_CANT_RETRIEVE_ATTS
     * @type {Integer (UInt32)}
     */
    static DS_CANT_RETRIEVE_ATTS => 8481

    /**
     * Native name: ERROR_DS_BACKLINK_WITHOUT_LINK
     * @type {Integer (UInt32)}
     */
    static DS_BACKLINK_WITHOUT_LINK => 8482

    /**
     * Native name: ERROR_DS_EPOCH_MISMATCH
     * @type {Integer (UInt32)}
     */
    static DS_EPOCH_MISMATCH => 8483

    /**
     * Native name: ERROR_DS_SRC_NAME_MISMATCH
     * @type {Integer (UInt32)}
     */
    static DS_SRC_NAME_MISMATCH => 8484

    /**
     * Native name: ERROR_DS_SRC_AND_DST_NC_IDENTICAL
     * @type {Integer (UInt32)}
     */
    static DS_SRC_AND_DST_NC_IDENTICAL => 8485

    /**
     * Native name: ERROR_DS_DST_NC_MISMATCH
     * @type {Integer (UInt32)}
     */
    static DS_DST_NC_MISMATCH => 8486

    /**
     * Native name: ERROR_DS_NOT_AUTHORITIVE_FOR_DST_NC
     * @type {Integer (UInt32)}
     */
    static DS_NOT_AUTHORITIVE_FOR_DST_NC => 8487

    /**
     * Native name: ERROR_DS_SRC_GUID_MISMATCH
     * @type {Integer (UInt32)}
     */
    static DS_SRC_GUID_MISMATCH => 8488

    /**
     * Native name: ERROR_DS_CANT_MOVE_DELETED_OBJECT
     * @type {Integer (UInt32)}
     */
    static DS_CANT_MOVE_DELETED_OBJECT => 8489

    /**
     * Native name: ERROR_DS_PDC_OPERATION_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static DS_PDC_OPERATION_IN_PROGRESS => 8490

    /**
     * Native name: ERROR_DS_CROSS_DOMAIN_CLEANUP_REQD
     * @type {Integer (UInt32)}
     */
    static DS_CROSS_DOMAIN_CLEANUP_REQD => 8491

    /**
     * Native name: ERROR_DS_ILLEGAL_XDOM_MOVE_OPERATION
     * @type {Integer (UInt32)}
     */
    static DS_ILLEGAL_XDOM_MOVE_OPERATION => 8492

    /**
     * Native name: ERROR_DS_CANT_WITH_ACCT_GROUP_MEMBERSHPS
     * @type {Integer (UInt32)}
     */
    static DS_CANT_WITH_ACCT_GROUP_MEMBERSHPS => 8493

    /**
     * Native name: ERROR_DS_NC_MUST_HAVE_NC_PARENT
     * @type {Integer (UInt32)}
     */
    static DS_NC_MUST_HAVE_NC_PARENT => 8494

    /**
     * Native name: ERROR_DS_CR_IMPOSSIBLE_TO_VALIDATE
     * @type {Integer (UInt32)}
     */
    static DS_CR_IMPOSSIBLE_TO_VALIDATE => 8495

    /**
     * Native name: ERROR_DS_DST_DOMAIN_NOT_NATIVE
     * @type {Integer (UInt32)}
     */
    static DS_DST_DOMAIN_NOT_NATIVE => 8496

    /**
     * Native name: ERROR_DS_MISSING_INFRASTRUCTURE_CONTAINER
     * @type {Integer (UInt32)}
     */
    static DS_MISSING_INFRASTRUCTURE_CONTAINER => 8497

    /**
     * Native name: ERROR_DS_CANT_MOVE_ACCOUNT_GROUP
     * @type {Integer (UInt32)}
     */
    static DS_CANT_MOVE_ACCOUNT_GROUP => 8498

    /**
     * Native name: ERROR_DS_CANT_MOVE_RESOURCE_GROUP
     * @type {Integer (UInt32)}
     */
    static DS_CANT_MOVE_RESOURCE_GROUP => 8499

    /**
     * Native name: ERROR_DS_INVALID_SEARCH_FLAG
     * @type {Integer (UInt32)}
     */
    static DS_INVALID_SEARCH_FLAG => 8500

    /**
     * Native name: ERROR_DS_NO_TREE_DELETE_ABOVE_NC
     * @type {Integer (UInt32)}
     */
    static DS_NO_TREE_DELETE_ABOVE_NC => 8501

    /**
     * Native name: ERROR_DS_COULDNT_LOCK_TREE_FOR_DELETE
     * @type {Integer (UInt32)}
     */
    static DS_COULDNT_LOCK_TREE_FOR_DELETE => 8502

    /**
     * Native name: ERROR_DS_COULDNT_IDENTIFY_OBJECTS_FOR_TREE_DELETE
     * @type {Integer (UInt32)}
     */
    static DS_COULDNT_IDENTIFY_OBJECTS_FOR_TREE_DELETE => 8503

    /**
     * Native name: ERROR_DS_SAM_INIT_FAILURE
     * @type {Integer (UInt32)}
     */
    static DS_SAM_INIT_FAILURE => 8504

    /**
     * Native name: ERROR_DS_SENSITIVE_GROUP_VIOLATION
     * @type {Integer (UInt32)}
     */
    static DS_SENSITIVE_GROUP_VIOLATION => 8505

    /**
     * Native name: ERROR_DS_CANT_MOD_PRIMARYGROUPID
     * @type {Integer (UInt32)}
     */
    static DS_CANT_MOD_PRIMARYGROUPID => 8506

    /**
     * Native name: ERROR_DS_ILLEGAL_BASE_SCHEMA_MOD
     * @type {Integer (UInt32)}
     */
    static DS_ILLEGAL_BASE_SCHEMA_MOD => 8507

    /**
     * Native name: ERROR_DS_NONSAFE_SCHEMA_CHANGE
     * @type {Integer (UInt32)}
     */
    static DS_NONSAFE_SCHEMA_CHANGE => 8508

    /**
     * Native name: ERROR_DS_SCHEMA_UPDATE_DISALLOWED
     * @type {Integer (UInt32)}
     */
    static DS_SCHEMA_UPDATE_DISALLOWED => 8509

    /**
     * Native name: ERROR_DS_CANT_CREATE_UNDER_SCHEMA
     * @type {Integer (UInt32)}
     */
    static DS_CANT_CREATE_UNDER_SCHEMA => 8510

    /**
     * Native name: ERROR_DS_INSTALL_NO_SRC_SCH_VERSION
     * @type {Integer (UInt32)}
     */
    static DS_INSTALL_NO_SRC_SCH_VERSION => 8511

    /**
     * Native name: ERROR_DS_INSTALL_NO_SCH_VERSION_IN_INIFILE
     * @type {Integer (UInt32)}
     */
    static DS_INSTALL_NO_SCH_VERSION_IN_INIFILE => 8512

    /**
     * Native name: ERROR_DS_INVALID_GROUP_TYPE
     * @type {Integer (UInt32)}
     */
    static DS_INVALID_GROUP_TYPE => 8513

    /**
     * Native name: ERROR_DS_NO_NEST_GLOBALGROUP_IN_MIXEDDOMAIN
     * @type {Integer (UInt32)}
     */
    static DS_NO_NEST_GLOBALGROUP_IN_MIXEDDOMAIN => 8514

    /**
     * Native name: ERROR_DS_NO_NEST_LOCALGROUP_IN_MIXEDDOMAIN
     * @type {Integer (UInt32)}
     */
    static DS_NO_NEST_LOCALGROUP_IN_MIXEDDOMAIN => 8515

    /**
     * Native name: ERROR_DS_GLOBAL_CANT_HAVE_LOCAL_MEMBER
     * @type {Integer (UInt32)}
     */
    static DS_GLOBAL_CANT_HAVE_LOCAL_MEMBER => 8516

    /**
     * Native name: ERROR_DS_GLOBAL_CANT_HAVE_UNIVERSAL_MEMBER
     * @type {Integer (UInt32)}
     */
    static DS_GLOBAL_CANT_HAVE_UNIVERSAL_MEMBER => 8517

    /**
     * Native name: ERROR_DS_UNIVERSAL_CANT_HAVE_LOCAL_MEMBER
     * @type {Integer (UInt32)}
     */
    static DS_UNIVERSAL_CANT_HAVE_LOCAL_MEMBER => 8518

    /**
     * Native name: ERROR_DS_GLOBAL_CANT_HAVE_CROSSDOMAIN_MEMBER
     * @type {Integer (UInt32)}
     */
    static DS_GLOBAL_CANT_HAVE_CROSSDOMAIN_MEMBER => 8519

    /**
     * Native name: ERROR_DS_LOCAL_CANT_HAVE_CROSSDOMAIN_LOCAL_MEMBER
     * @type {Integer (UInt32)}
     */
    static DS_LOCAL_CANT_HAVE_CROSSDOMAIN_LOCAL_MEMBER => 8520

    /**
     * Native name: ERROR_DS_HAVE_PRIMARY_MEMBERS
     * @type {Integer (UInt32)}
     */
    static DS_HAVE_PRIMARY_MEMBERS => 8521

    /**
     * Native name: ERROR_DS_STRING_SD_CONVERSION_FAILED
     * @type {Integer (UInt32)}
     */
    static DS_STRING_SD_CONVERSION_FAILED => 8522

    /**
     * Native name: ERROR_DS_NAMING_MASTER_GC
     * @type {Integer (UInt32)}
     */
    static DS_NAMING_MASTER_GC => 8523

    /**
     * Native name: ERROR_DS_DNS_LOOKUP_FAILURE
     * @type {Integer (UInt32)}
     */
    static DS_DNS_LOOKUP_FAILURE => 8524

    /**
     * Native name: ERROR_DS_COULDNT_UPDATE_SPNS
     * @type {Integer (UInt32)}
     */
    static DS_COULDNT_UPDATE_SPNS => 8525

    /**
     * Native name: ERROR_DS_CANT_RETRIEVE_SD
     * @type {Integer (UInt32)}
     */
    static DS_CANT_RETRIEVE_SD => 8526

    /**
     * Native name: ERROR_DS_KEY_NOT_UNIQUE
     * @type {Integer (UInt32)}
     */
    static DS_KEY_NOT_UNIQUE => 8527

    /**
     * Native name: ERROR_DS_WRONG_LINKED_ATT_SYNTAX
     * @type {Integer (UInt32)}
     */
    static DS_WRONG_LINKED_ATT_SYNTAX => 8528

    /**
     * Native name: ERROR_DS_SAM_NEED_BOOTKEY_PASSWORD
     * @type {Integer (UInt32)}
     */
    static DS_SAM_NEED_BOOTKEY_PASSWORD => 8529

    /**
     * Native name: ERROR_DS_SAM_NEED_BOOTKEY_FLOPPY
     * @type {Integer (UInt32)}
     */
    static DS_SAM_NEED_BOOTKEY_FLOPPY => 8530

    /**
     * Native name: ERROR_DS_CANT_START
     * @type {Integer (UInt32)}
     */
    static DS_CANT_START => 8531

    /**
     * Native name: ERROR_DS_INIT_FAILURE
     * @type {Integer (UInt32)}
     */
    static DS_INIT_FAILURE => 8532

    /**
     * Native name: ERROR_DS_NO_PKT_PRIVACY_ON_CONNECTION
     * @type {Integer (UInt32)}
     */
    static DS_NO_PKT_PRIVACY_ON_CONNECTION => 8533

    /**
     * Native name: ERROR_DS_SOURCE_DOMAIN_IN_FOREST
     * @type {Integer (UInt32)}
     */
    static DS_SOURCE_DOMAIN_IN_FOREST => 8534

    /**
     * Native name: ERROR_DS_DESTINATION_DOMAIN_NOT_IN_FOREST
     * @type {Integer (UInt32)}
     */
    static DS_DESTINATION_DOMAIN_NOT_IN_FOREST => 8535

    /**
     * Native name: ERROR_DS_DESTINATION_AUDITING_NOT_ENABLED
     * @type {Integer (UInt32)}
     */
    static DS_DESTINATION_AUDITING_NOT_ENABLED => 8536

    /**
     * Native name: ERROR_DS_CANT_FIND_DC_FOR_SRC_DOMAIN
     * @type {Integer (UInt32)}
     */
    static DS_CANT_FIND_DC_FOR_SRC_DOMAIN => 8537

    /**
     * Native name: ERROR_DS_SRC_OBJ_NOT_GROUP_OR_USER
     * @type {Integer (UInt32)}
     */
    static DS_SRC_OBJ_NOT_GROUP_OR_USER => 8538

    /**
     * Native name: ERROR_DS_SRC_SID_EXISTS_IN_FOREST
     * @type {Integer (UInt32)}
     */
    static DS_SRC_SID_EXISTS_IN_FOREST => 8539

    /**
     * Native name: ERROR_DS_SRC_AND_DST_OBJECT_CLASS_MISMATCH
     * @type {Integer (UInt32)}
     */
    static DS_SRC_AND_DST_OBJECT_CLASS_MISMATCH => 8540

    /**
     * Native name: ERROR_SAM_INIT_FAILURE
     * @type {Integer (UInt32)}
     */
    static SAM_INIT_FAILURE => 8541

    /**
     * Native name: ERROR_DS_DRA_SCHEMA_INFO_SHIP
     * @type {Integer (UInt32)}
     */
    static DS_DRA_SCHEMA_INFO_SHIP => 8542

    /**
     * Native name: ERROR_DS_DRA_SCHEMA_CONFLICT
     * @type {Integer (UInt32)}
     */
    static DS_DRA_SCHEMA_CONFLICT => 8543

    /**
     * Native name: ERROR_DS_DRA_EARLIER_SCHEMA_CONFLICT
     * @type {Integer (UInt32)}
     */
    static DS_DRA_EARLIER_SCHEMA_CONFLICT => 8544

    /**
     * Native name: ERROR_DS_DRA_OBJ_NC_MISMATCH
     * @type {Integer (UInt32)}
     */
    static DS_DRA_OBJ_NC_MISMATCH => 8545

    /**
     * Native name: ERROR_DS_NC_STILL_HAS_DSAS
     * @type {Integer (UInt32)}
     */
    static DS_NC_STILL_HAS_DSAS => 8546

    /**
     * Native name: ERROR_DS_GC_REQUIRED
     * @type {Integer (UInt32)}
     */
    static DS_GC_REQUIRED => 8547

    /**
     * Native name: ERROR_DS_LOCAL_MEMBER_OF_LOCAL_ONLY
     * @type {Integer (UInt32)}
     */
    static DS_LOCAL_MEMBER_OF_LOCAL_ONLY => 8548

    /**
     * Native name: ERROR_DS_NO_FPO_IN_UNIVERSAL_GROUPS
     * @type {Integer (UInt32)}
     */
    static DS_NO_FPO_IN_UNIVERSAL_GROUPS => 8549

    /**
     * Native name: ERROR_DS_CANT_ADD_TO_GC
     * @type {Integer (UInt32)}
     */
    static DS_CANT_ADD_TO_GC => 8550

    /**
     * Native name: ERROR_DS_NO_CHECKPOINT_WITH_PDC
     * @type {Integer (UInt32)}
     */
    static DS_NO_CHECKPOINT_WITH_PDC => 8551

    /**
     * Native name: ERROR_DS_SOURCE_AUDITING_NOT_ENABLED
     * @type {Integer (UInt32)}
     */
    static DS_SOURCE_AUDITING_NOT_ENABLED => 8552

    /**
     * Native name: ERROR_DS_CANT_CREATE_IN_NONDOMAIN_NC
     * @type {Integer (UInt32)}
     */
    static DS_CANT_CREATE_IN_NONDOMAIN_NC => 8553

    /**
     * Native name: ERROR_DS_INVALID_NAME_FOR_SPN
     * @type {Integer (UInt32)}
     */
    static DS_INVALID_NAME_FOR_SPN => 8554

    /**
     * Native name: ERROR_DS_FILTER_USES_CONTRUCTED_ATTRS
     * @type {Integer (UInt32)}
     */
    static DS_FILTER_USES_CONTRUCTED_ATTRS => 8555

    /**
     * Native name: ERROR_DS_UNICODEPWD_NOT_IN_QUOTES
     * @type {Integer (UInt32)}
     */
    static DS_UNICODEPWD_NOT_IN_QUOTES => 8556

    /**
     * Native name: ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED => 8557

    /**
     * Native name: ERROR_DS_MUST_BE_RUN_ON_DST_DC
     * @type {Integer (UInt32)}
     */
    static DS_MUST_BE_RUN_ON_DST_DC => 8558

    /**
     * Native name: ERROR_DS_SRC_DC_MUST_BE_SP4_OR_GREATER
     * @type {Integer (UInt32)}
     */
    static DS_SRC_DC_MUST_BE_SP4_OR_GREATER => 8559

    /**
     * Native name: ERROR_DS_CANT_TREE_DELETE_CRITICAL_OBJ
     * @type {Integer (UInt32)}
     */
    static DS_CANT_TREE_DELETE_CRITICAL_OBJ => 8560

    /**
     * Native name: ERROR_DS_INIT_FAILURE_CONSOLE
     * @type {Integer (UInt32)}
     */
    static DS_INIT_FAILURE_CONSOLE => 8561

    /**
     * Native name: ERROR_DS_SAM_INIT_FAILURE_CONSOLE
     * @type {Integer (UInt32)}
     */
    static DS_SAM_INIT_FAILURE_CONSOLE => 8562

    /**
     * Native name: ERROR_DS_FOREST_VERSION_TOO_HIGH
     * @type {Integer (UInt32)}
     */
    static DS_FOREST_VERSION_TOO_HIGH => 8563

    /**
     * Native name: ERROR_DS_DOMAIN_VERSION_TOO_HIGH
     * @type {Integer (UInt32)}
     */
    static DS_DOMAIN_VERSION_TOO_HIGH => 8564

    /**
     * Native name: ERROR_DS_FOREST_VERSION_TOO_LOW
     * @type {Integer (UInt32)}
     */
    static DS_FOREST_VERSION_TOO_LOW => 8565

    /**
     * Native name: ERROR_DS_DOMAIN_VERSION_TOO_LOW
     * @type {Integer (UInt32)}
     */
    static DS_DOMAIN_VERSION_TOO_LOW => 8566

    /**
     * Native name: ERROR_DS_INCOMPATIBLE_VERSION
     * @type {Integer (UInt32)}
     */
    static DS_INCOMPATIBLE_VERSION => 8567

    /**
     * Native name: ERROR_DS_LOW_DSA_VERSION
     * @type {Integer (UInt32)}
     */
    static DS_LOW_DSA_VERSION => 8568

    /**
     * Native name: ERROR_DS_NO_BEHAVIOR_VERSION_IN_MIXEDDOMAIN
     * @type {Integer (UInt32)}
     */
    static DS_NO_BEHAVIOR_VERSION_IN_MIXEDDOMAIN => 8569

    /**
     * Native name: ERROR_DS_NOT_SUPPORTED_SORT_ORDER
     * @type {Integer (UInt32)}
     */
    static DS_NOT_SUPPORTED_SORT_ORDER => 8570

    /**
     * Native name: ERROR_DS_NAME_NOT_UNIQUE
     * @type {Integer (UInt32)}
     */
    static DS_NAME_NOT_UNIQUE => 8571

    /**
     * Native name: ERROR_DS_MACHINE_ACCOUNT_CREATED_PRENT4
     * @type {Integer (UInt32)}
     */
    static DS_MACHINE_ACCOUNT_CREATED_PRENT4 => 8572

    /**
     * Native name: ERROR_DS_OUT_OF_VERSION_STORE
     * @type {Integer (UInt32)}
     */
    static DS_OUT_OF_VERSION_STORE => 8573

    /**
     * Native name: ERROR_DS_INCOMPATIBLE_CONTROLS_USED
     * @type {Integer (UInt32)}
     */
    static DS_INCOMPATIBLE_CONTROLS_USED => 8574

    /**
     * Native name: ERROR_DS_NO_REF_DOMAIN
     * @type {Integer (UInt32)}
     */
    static DS_NO_REF_DOMAIN => 8575

    /**
     * Native name: ERROR_DS_RESERVED_LINK_ID
     * @type {Integer (UInt32)}
     */
    static DS_RESERVED_LINK_ID => 8576

    /**
     * Native name: ERROR_DS_LINK_ID_NOT_AVAILABLE
     * @type {Integer (UInt32)}
     */
    static DS_LINK_ID_NOT_AVAILABLE => 8577

    /**
     * Native name: ERROR_DS_AG_CANT_HAVE_UNIVERSAL_MEMBER
     * @type {Integer (UInt32)}
     */
    static DS_AG_CANT_HAVE_UNIVERSAL_MEMBER => 8578

    /**
     * Native name: ERROR_DS_MODIFYDN_DISALLOWED_BY_INSTANCE_TYPE
     * @type {Integer (UInt32)}
     */
    static DS_MODIFYDN_DISALLOWED_BY_INSTANCE_TYPE => 8579

    /**
     * Native name: ERROR_DS_NO_OBJECT_MOVE_IN_SCHEMA_NC
     * @type {Integer (UInt32)}
     */
    static DS_NO_OBJECT_MOVE_IN_SCHEMA_NC => 8580

    /**
     * Native name: ERROR_DS_MODIFYDN_DISALLOWED_BY_FLAG
     * @type {Integer (UInt32)}
     */
    static DS_MODIFYDN_DISALLOWED_BY_FLAG => 8581

    /**
     * Native name: ERROR_DS_MODIFYDN_WRONG_GRANDPARENT
     * @type {Integer (UInt32)}
     */
    static DS_MODIFYDN_WRONG_GRANDPARENT => 8582

    /**
     * Native name: ERROR_DS_NAME_ERROR_TRUST_REFERRAL
     * @type {Integer (UInt32)}
     */
    static DS_NAME_ERROR_TRUST_REFERRAL => 8583

    /**
     * Native name: ERROR_NOT_SUPPORTED_ON_STANDARD_SERVER
     * @type {Integer (UInt32)}
     */
    static NOT_SUPPORTED_ON_STANDARD_SERVER => 8584

    /**
     * Native name: ERROR_DS_CANT_ACCESS_REMOTE_PART_OF_AD
     * @type {Integer (UInt32)}
     */
    static DS_CANT_ACCESS_REMOTE_PART_OF_AD => 8585

    /**
     * Native name: ERROR_DS_CR_IMPOSSIBLE_TO_VALIDATE_V2
     * @type {Integer (UInt32)}
     */
    static DS_CR_IMPOSSIBLE_TO_VALIDATE_V2 => 8586

    /**
     * Native name: ERROR_DS_THREAD_LIMIT_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static DS_THREAD_LIMIT_EXCEEDED => 8587

    /**
     * Native name: ERROR_DS_NOT_CLOSEST
     * @type {Integer (UInt32)}
     */
    static DS_NOT_CLOSEST => 8588

    /**
     * Native name: ERROR_DS_CANT_DERIVE_SPN_WITHOUT_SERVER_REF
     * @type {Integer (UInt32)}
     */
    static DS_CANT_DERIVE_SPN_WITHOUT_SERVER_REF => 8589

    /**
     * Native name: ERROR_DS_SINGLE_USER_MODE_FAILED
     * @type {Integer (UInt32)}
     */
    static DS_SINGLE_USER_MODE_FAILED => 8590

    /**
     * Native name: ERROR_DS_NTDSCRIPT_SYNTAX_ERROR
     * @type {Integer (UInt32)}
     */
    static DS_NTDSCRIPT_SYNTAX_ERROR => 8591

    /**
     * Native name: ERROR_DS_NTDSCRIPT_PROCESS_ERROR
     * @type {Integer (UInt32)}
     */
    static DS_NTDSCRIPT_PROCESS_ERROR => 8592

    /**
     * Native name: ERROR_DS_DIFFERENT_REPL_EPOCHS
     * @type {Integer (UInt32)}
     */
    static DS_DIFFERENT_REPL_EPOCHS => 8593

    /**
     * Native name: ERROR_DS_DRS_EXTENSIONS_CHANGED
     * @type {Integer (UInt32)}
     */
    static DS_DRS_EXTENSIONS_CHANGED => 8594

    /**
     * Native name: ERROR_DS_REPLICA_SET_CHANGE_NOT_ALLOWED_ON_DISABLED_CR
     * @type {Integer (UInt32)}
     */
    static DS_REPLICA_SET_CHANGE_NOT_ALLOWED_ON_DISABLED_CR => 8595

    /**
     * Native name: ERROR_DS_NO_MSDS_INTID
     * @type {Integer (UInt32)}
     */
    static DS_NO_MSDS_INTID => 8596

    /**
     * Native name: ERROR_DS_DUP_MSDS_INTID
     * @type {Integer (UInt32)}
     */
    static DS_DUP_MSDS_INTID => 8597

    /**
     * Native name: ERROR_DS_EXISTS_IN_RDNATTID
     * @type {Integer (UInt32)}
     */
    static DS_EXISTS_IN_RDNATTID => 8598

    /**
     * Native name: ERROR_DS_AUTHORIZATION_FAILED
     * @type {Integer (UInt32)}
     */
    static DS_AUTHORIZATION_FAILED => 8599

    /**
     * Native name: ERROR_DS_INVALID_SCRIPT
     * @type {Integer (UInt32)}
     */
    static DS_INVALID_SCRIPT => 8600

    /**
     * Native name: ERROR_DS_REMOTE_CROSSREF_OP_FAILED
     * @type {Integer (UInt32)}
     */
    static DS_REMOTE_CROSSREF_OP_FAILED => 8601

    /**
     * Native name: ERROR_DS_CROSS_REF_BUSY
     * @type {Integer (UInt32)}
     */
    static DS_CROSS_REF_BUSY => 8602

    /**
     * Native name: ERROR_DS_CANT_DERIVE_SPN_FOR_DELETED_DOMAIN
     * @type {Integer (UInt32)}
     */
    static DS_CANT_DERIVE_SPN_FOR_DELETED_DOMAIN => 8603

    /**
     * Native name: ERROR_DS_CANT_DEMOTE_WITH_WRITEABLE_NC
     * @type {Integer (UInt32)}
     */
    static DS_CANT_DEMOTE_WITH_WRITEABLE_NC => 8604

    /**
     * Native name: ERROR_DS_DUPLICATE_ID_FOUND
     * @type {Integer (UInt32)}
     */
    static DS_DUPLICATE_ID_FOUND => 8605

    /**
     * Native name: ERROR_DS_INSUFFICIENT_ATTR_TO_CREATE_OBJECT
     * @type {Integer (UInt32)}
     */
    static DS_INSUFFICIENT_ATTR_TO_CREATE_OBJECT => 8606

    /**
     * Native name: ERROR_DS_GROUP_CONVERSION_ERROR
     * @type {Integer (UInt32)}
     */
    static DS_GROUP_CONVERSION_ERROR => 8607

    /**
     * Native name: ERROR_DS_CANT_MOVE_APP_BASIC_GROUP
     * @type {Integer (UInt32)}
     */
    static DS_CANT_MOVE_APP_BASIC_GROUP => 8608

    /**
     * Native name: ERROR_DS_CANT_MOVE_APP_QUERY_GROUP
     * @type {Integer (UInt32)}
     */
    static DS_CANT_MOVE_APP_QUERY_GROUP => 8609

    /**
     * Native name: ERROR_DS_ROLE_NOT_VERIFIED
     * @type {Integer (UInt32)}
     */
    static DS_ROLE_NOT_VERIFIED => 8610

    /**
     * Native name: ERROR_DS_WKO_CONTAINER_CANNOT_BE_SPECIAL
     * @type {Integer (UInt32)}
     */
    static DS_WKO_CONTAINER_CANNOT_BE_SPECIAL => 8611

    /**
     * Native name: ERROR_DS_DOMAIN_RENAME_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static DS_DOMAIN_RENAME_IN_PROGRESS => 8612

    /**
     * Native name: ERROR_DS_EXISTING_AD_CHILD_NC
     * @type {Integer (UInt32)}
     */
    static DS_EXISTING_AD_CHILD_NC => 8613

    /**
     * Native name: ERROR_DS_REPL_LIFETIME_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static DS_REPL_LIFETIME_EXCEEDED => 8614

    /**
     * Native name: ERROR_DS_DISALLOWED_IN_SYSTEM_CONTAINER
     * @type {Integer (UInt32)}
     */
    static DS_DISALLOWED_IN_SYSTEM_CONTAINER => 8615

    /**
     * Native name: ERROR_DS_LDAP_SEND_QUEUE_FULL
     * @type {Integer (UInt32)}
     */
    static DS_LDAP_SEND_QUEUE_FULL => 8616

    /**
     * Native name: ERROR_DS_DRA_OUT_SCHEDULE_WINDOW
     * @type {Integer (UInt32)}
     */
    static DS_DRA_OUT_SCHEDULE_WINDOW => 8617

    /**
     * Native name: ERROR_DS_POLICY_NOT_KNOWN
     * @type {Integer (UInt32)}
     */
    static DS_POLICY_NOT_KNOWN => 8618

    /**
     * Native name: ERROR_NO_SITE_SETTINGS_OBJECT
     * @type {Integer (UInt32)}
     */
    static NO_SITE_SETTINGS_OBJECT => 8619

    /**
     * Native name: ERROR_NO_SECRETS
     * @type {Integer (UInt32)}
     */
    static NO_SECRETS => 8620

    /**
     * Native name: ERROR_NO_WRITABLE_DC_FOUND
     * @type {Integer (UInt32)}
     */
    static NO_WRITABLE_DC_FOUND => 8621

    /**
     * Native name: ERROR_DS_NO_SERVER_OBJECT
     * @type {Integer (UInt32)}
     */
    static DS_NO_SERVER_OBJECT => 8622

    /**
     * Native name: ERROR_DS_NO_NTDSA_OBJECT
     * @type {Integer (UInt32)}
     */
    static DS_NO_NTDSA_OBJECT => 8623

    /**
     * Native name: ERROR_DS_NON_ASQ_SEARCH
     * @type {Integer (UInt32)}
     */
    static DS_NON_ASQ_SEARCH => 8624

    /**
     * Native name: ERROR_DS_AUDIT_FAILURE
     * @type {Integer (UInt32)}
     */
    static DS_AUDIT_FAILURE => 8625

    /**
     * Native name: ERROR_DS_INVALID_SEARCH_FLAG_SUBTREE
     * @type {Integer (UInt32)}
     */
    static DS_INVALID_SEARCH_FLAG_SUBTREE => 8626

    /**
     * Native name: ERROR_DS_INVALID_SEARCH_FLAG_TUPLE
     * @type {Integer (UInt32)}
     */
    static DS_INVALID_SEARCH_FLAG_TUPLE => 8627

    /**
     * Native name: ERROR_DS_HIERARCHY_TABLE_TOO_DEEP
     * @type {Integer (UInt32)}
     */
    static DS_HIERARCHY_TABLE_TOO_DEEP => 8628

    /**
     * Native name: ERROR_DS_DRA_CORRUPT_UTD_VECTOR
     * @type {Integer (UInt32)}
     */
    static DS_DRA_CORRUPT_UTD_VECTOR => 8629

    /**
     * Native name: ERROR_DS_DRA_SECRETS_DENIED
     * @type {Integer (UInt32)}
     */
    static DS_DRA_SECRETS_DENIED => 8630

    /**
     * Native name: ERROR_DS_RESERVED_MAPI_ID
     * @type {Integer (UInt32)}
     */
    static DS_RESERVED_MAPI_ID => 8631

    /**
     * Native name: ERROR_DS_MAPI_ID_NOT_AVAILABLE
     * @type {Integer (UInt32)}
     */
    static DS_MAPI_ID_NOT_AVAILABLE => 8632

    /**
     * Native name: ERROR_DS_DRA_MISSING_KRBTGT_SECRET
     * @type {Integer (UInt32)}
     */
    static DS_DRA_MISSING_KRBTGT_SECRET => 8633

    /**
     * Native name: ERROR_DS_DOMAIN_NAME_EXISTS_IN_FOREST
     * @type {Integer (UInt32)}
     */
    static DS_DOMAIN_NAME_EXISTS_IN_FOREST => 8634

    /**
     * Native name: ERROR_DS_FLAT_NAME_EXISTS_IN_FOREST
     * @type {Integer (UInt32)}
     */
    static DS_FLAT_NAME_EXISTS_IN_FOREST => 8635

    /**
     * Native name: ERROR_INVALID_USER_PRINCIPAL_NAME
     * @type {Integer (UInt32)}
     */
    static INVALID_USER_PRINCIPAL_NAME => 8636

    /**
     * Native name: ERROR_DS_OID_MAPPED_GROUP_CANT_HAVE_MEMBERS
     * @type {Integer (UInt32)}
     */
    static DS_OID_MAPPED_GROUP_CANT_HAVE_MEMBERS => 8637

    /**
     * Native name: ERROR_DS_OID_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static DS_OID_NOT_FOUND => 8638

    /**
     * Native name: ERROR_DS_DRA_RECYCLED_TARGET
     * @type {Integer (UInt32)}
     */
    static DS_DRA_RECYCLED_TARGET => 8639

    /**
     * Native name: ERROR_DS_DISALLOWED_NC_REDIRECT
     * @type {Integer (UInt32)}
     */
    static DS_DISALLOWED_NC_REDIRECT => 8640

    /**
     * Native name: ERROR_DS_HIGH_ADLDS_FFL
     * @type {Integer (UInt32)}
     */
    static DS_HIGH_ADLDS_FFL => 8641

    /**
     * Native name: ERROR_DS_HIGH_DSA_VERSION
     * @type {Integer (UInt32)}
     */
    static DS_HIGH_DSA_VERSION => 8642

    /**
     * Native name: ERROR_DS_LOW_ADLDS_FFL
     * @type {Integer (UInt32)}
     */
    static DS_LOW_ADLDS_FFL => 8643

    /**
     * Native name: ERROR_DOMAIN_SID_SAME_AS_LOCAL_WORKSTATION
     * @type {Integer (UInt32)}
     */
    static DOMAIN_SID_SAME_AS_LOCAL_WORKSTATION => 8644

    /**
     * Native name: ERROR_DS_UNDELETE_SAM_VALIDATION_FAILED
     * @type {Integer (UInt32)}
     */
    static DS_UNDELETE_SAM_VALIDATION_FAILED => 8645

    /**
     * Native name: ERROR_INCORRECT_ACCOUNT_TYPE
     * @type {Integer (UInt32)}
     */
    static INCORRECT_ACCOUNT_TYPE => 8646

    /**
     * Native name: ERROR_DS_SPN_VALUE_NOT_UNIQUE_IN_FOREST
     * @type {Integer (UInt32)}
     */
    static DS_SPN_VALUE_NOT_UNIQUE_IN_FOREST => 8647

    /**
     * Native name: ERROR_DS_UPN_VALUE_NOT_UNIQUE_IN_FOREST
     * @type {Integer (UInt32)}
     */
    static DS_UPN_VALUE_NOT_UNIQUE_IN_FOREST => 8648

    /**
     * Native name: ERROR_DS_MISSING_FOREST_TRUST
     * @type {Integer (UInt32)}
     */
    static DS_MISSING_FOREST_TRUST => 8649

    /**
     * Native name: ERROR_DS_VALUE_KEY_NOT_UNIQUE
     * @type {Integer (UInt32)}
     */
    static DS_VALUE_KEY_NOT_UNIQUE => 8650

    /**
     * Native name: ERROR_WEAK_WHFBKEY_BLOCKED
     * @type {Integer (UInt32)}
     */
    static WEAK_WHFBKEY_BLOCKED => 8651

    /**
     * Native name: ERROR_DS_PER_ATTRIBUTE_AUTHZ_FAILED_DURING_ADD
     * @type {Integer (UInt32)}
     */
    static DS_PER_ATTRIBUTE_AUTHZ_FAILED_DURING_ADD => 8652

    /**
     * Native name: ERROR_LOCAL_POLICY_MODIFICATION_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static LOCAL_POLICY_MODIFICATION_NOT_SUPPORTED => 8653

    /**
     * Native name: ERROR_POLICY_CONTROLLED_ACCOUNT
     * @type {Integer (UInt32)}
     */
    static POLICY_CONTROLLED_ACCOUNT => 8654

    /**
     * Native name: ERROR_LAPS_LEGACY_SCHEMA_MISSING
     * @type {Integer (UInt32)}
     */
    static LAPS_LEGACY_SCHEMA_MISSING => 8655

    /**
     * Native name: ERROR_LAPS_SCHEMA_MISSING
     * @type {Integer (UInt32)}
     */
    static LAPS_SCHEMA_MISSING => 8656

    /**
     * Native name: ERROR_LAPS_ENCRYPTION_REQUIRES_2016_DFL
     * @type {Integer (UInt32)}
     */
    static LAPS_ENCRYPTION_REQUIRES_2016_DFL => 8657

    /**
     * Native name: ERROR_LAPS_PROCESS_TERMINATED
     * @type {Integer (UInt32)}
     */
    static LAPS_PROCESS_TERMINATED => 8658

    /**
     * Native name: ERROR_DS_JET_RECORD_TOO_BIG
     * @type {Integer (UInt32)}
     */
    static DS_JET_RECORD_TOO_BIG => 8659

    /**
     * Native name: ERROR_DS_REPLICA_PAGE_SIZE_MISMATCH
     * @type {Integer (UInt32)}
     */
    static DS_REPLICA_PAGE_SIZE_MISMATCH => 8660

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RESPONSE_CODES_BASE => 9000

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RCODE_NO_ERROR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_MASK => 9000

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RCODE_FORMAT_ERROR => 9001

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RCODE_SERVER_FAILURE => 9002

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RCODE_NAME_ERROR => 9003

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RCODE_NOT_IMPLEMENTED => 9004

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RCODE_REFUSED => 9005

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RCODE_YXDOMAIN => 9006

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RCODE_YXRRSET => 9007

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RCODE_NXRRSET => 9008

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RCODE_NOTAUTH => 9009

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RCODE_NOTZONE => 9010

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RCODE_BADSIG => 9016

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RCODE_BADKEY => 9017

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RCODE_BADTIME => 9018

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RCODE_LAST => 9018

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DNSSEC_BASE => 9100

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_KEYMASTER_REQUIRED => 9101

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NOT_ALLOWED_ON_SIGNED_ZONE => 9102

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NSEC3_INCOMPATIBLE_WITH_RSA_SHA1 => 9103

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NOT_ENOUGH_SIGNING_KEY_DESCRIPTORS => 9104

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_UNSUPPORTED_ALGORITHM => 9105

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_KEY_SIZE => 9106

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_SIGNING_KEY_NOT_ACCESSIBLE => 9107

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_KSP_DOES_NOT_SUPPORT_PROTECTION => 9108

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_UNEXPECTED_DATA_PROTECTION_ERROR => 9109

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_UNEXPECTED_CNG_ERROR => 9110

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_UNKNOWN_SIGNING_PARAMETER_VERSION => 9111

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_KSP_NOT_ACCESSIBLE => 9112

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_TOO_MANY_SKDS => 9113

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_ROLLOVER_PERIOD => 9114

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_INITIAL_ROLLOVER_OFFSET => 9115

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ROLLOVER_IN_PROGRESS => 9116

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_STANDBY_KEY_NOT_PRESENT => 9117

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NOT_ALLOWED_ON_ZSK => 9118

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NOT_ALLOWED_ON_ACTIVE_SKD => 9119

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ROLLOVER_ALREADY_QUEUED => 9120

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NOT_ALLOWED_ON_UNSIGNED_ZONE => 9121

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_BAD_KEYMASTER => 9122

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_SIGNATURE_VALIDITY_PERIOD => 9123

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_NSEC3_ITERATION_COUNT => 9124

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DNSSEC_IS_DISABLED => 9125

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_XML => 9126

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NO_VALID_TRUST_ANCHORS => 9127

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ROLLOVER_NOT_POKEABLE => 9128

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NSEC3_NAME_COLLISION => 9129

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NSEC_INCOMPATIBLE_WITH_NSEC3_RSA_SHA1 => 9130

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_PACKET_FMT_BASE => 9500

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_BAD_PACKET => 9502

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NO_PACKET => 9503

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RCODE => 9504

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_UNSECURE_PACKET => 9505

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NO_MEMORY => 14

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_NAME => 123

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_DATA => 13

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_GENERAL_API_BASE => 9550

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_TYPE => 9551

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_IP_ADDRESS => 9552

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_PROPERTY => 9553

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_TRY_AGAIN_LATER => 9554

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NOT_UNIQUE => 9555

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NON_RFC_NAME => 9556

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_NAME_CHAR => 9560

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NUMERIC_NAME => 9561

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NOT_ALLOWED_ON_ROOT_SERVER => 9562

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NOT_ALLOWED_UNDER_DELEGATION => 9563

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_CANNOT_FIND_ROOT_HINTS => 9564

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INCONSISTENT_ROOT_HINTS => 9565

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DWORD_VALUE_TOO_SMALL => 9566

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DWORD_VALUE_TOO_LARGE => 9567

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_BACKGROUND_LOADING => 9568

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NOT_ALLOWED_ON_RODC => 9569

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NOT_ALLOWED_UNDER_DNAME => 9570

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DELEGATION_REQUIRED => 9571

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_POLICY_TABLE => 9572

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ADDRESS_REQUIRED => 9573

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ZONE_BASE => 9600

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ZONE_DOES_NOT_EXIST => 9601

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NO_ZONE_INFO => 9602

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_ZONE_OPERATION => 9603

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ZONE_CONFIGURATION_ERROR => 9604

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ZONE_HAS_NO_SOA_RECORD => 9605

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ZONE_HAS_NO_NS_RECORDS => 9606

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ZONE_LOCKED => 9607

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ZONE_CREATION_FAILED => 9608

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ZONE_ALREADY_EXISTS => 9609

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_AUTOZONE_ALREADY_EXISTS => 9610

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_ZONE_TYPE => 9611

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_SECONDARY_REQUIRES_MASTER_IP => 9612

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ZONE_NOT_SECONDARY => 9613

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NEED_SECONDARY_ADDRESSES => 9614

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_WINS_INIT_FAILED => 9615

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NEED_WINS_SERVERS => 9616

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NBSTAT_INIT_FAILED => 9617

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_SOA_DELETE_INVALID => 9618

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_FORWARDER_ALREADY_EXISTS => 9619

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ZONE_REQUIRES_MASTER_IP => 9620

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ZONE_IS_SHUTDOWN => 9621

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ZONE_LOCKED_FOR_SIGNING => 9622

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DATAFILE_BASE => 9650

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_PRIMARY_REQUIRES_DATAFILE => 9651

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_DATAFILE_NAME => 9652

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DATAFILE_OPEN_FAILURE => 9653

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_FILE_WRITEBACK_FAILED => 9654

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DATAFILE_PARSING => 9655

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DATABASE_BASE => 9700

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RECORD_DOES_NOT_EXIST => 9701

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RECORD_FORMAT => 9702

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NODE_CREATION_FAILED => 9703

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_UNKNOWN_RECORD_TYPE => 9704

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RECORD_TIMED_OUT => 9705

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NAME_NOT_IN_ZONE => 9706

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_CNAME_LOOP => 9707

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NODE_IS_CNAME => 9708

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_CNAME_COLLISION => 9709

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RECORD_ONLY_AT_ZONE_ROOT => 9710

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RECORD_ALREADY_EXISTS => 9711

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_SECONDARY_DATA => 9712

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NO_CREATE_CACHE_DATA => 9713

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NAME_DOES_NOT_EXIST => 9714

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DS_UNAVAILABLE => 9717

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DS_ZONE_ALREADY_EXISTS => 9718

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NO_BOOTFILE_IF_DS_ZONE => 9719

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NODE_IS_DNAME => 9720

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DNAME_COLLISION => 9721

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ALIAS_LOOP => 9722

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_OPERATION_BASE => 9750

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_AXFR => 9752

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_SECURE_BASE => 9800

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_SETUP_BASE => 9850

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NO_TCPIP => 9851

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NO_DNS_SERVERS => 9852

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DP_BASE => 9900

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DP_DOES_NOT_EXIST => 9901

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DP_ALREADY_EXISTS => 9902

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DP_NOT_ENLISTED => 9903

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DP_ALREADY_ENLISTED => 9904

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DP_NOT_AVAILABLE => 9905

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DP_FSMO_ERROR => 9906

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RRL_NOT_ENABLED => 9911

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RRL_INVALID_WINDOW_SIZE => 9912

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RRL_INVALID_IPV4_PREFIX => 9913

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RRL_INVALID_IPV6_PREFIX => 9914

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RRL_INVALID_TC_RATE => 9915

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RRL_INVALID_LEAK_RATE => 9916

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_RRL_LEAK_RATE_LESSTHAN_TC_RATE => 9917

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_VIRTUALIZATION_INSTANCE_ALREADY_EXISTS => 9921

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_VIRTUALIZATION_INSTANCE_DOES_NOT_EXIST => 9922

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_VIRTUALIZATION_TREE_LOCKED => 9923

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVAILD_VIRTUALIZATION_INSTANCE_NAME => 9924

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DEFAULT_VIRTUALIZATION_INSTANCE => 9925

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ZONESCOPE_ALREADY_EXISTS => 9951

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ZONESCOPE_DOES_NOT_EXIST => 9952

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DEFAULT_ZONESCOPE => 9953

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_ZONESCOPE_NAME => 9954

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_NOT_ALLOWED_WITH_ZONESCOPES => 9955

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_LOAD_ZONESCOPE_FAILED => 9956

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ZONESCOPE_FILE_WRITEBACK_FAILED => 9957

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_SCOPE_NAME => 9958

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_SCOPE_DOES_NOT_EXIST => 9959

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_DEFAULT_SCOPE => 9960

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_SCOPE_OPERATION => 9961

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_SCOPE_LOCKED => 9962

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_SCOPE_ALREADY_EXISTS => 9963

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_POLICY_ALREADY_EXISTS => 9971

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_POLICY_DOES_NOT_EXIST => 9972

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_POLICY_INVALID_CRITERIA => 9973

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_POLICY_INVALID_SETTINGS => 9974

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_CLIENT_SUBNET_IS_ACCESSED => 9975

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_CLIENT_SUBNET_DOES_NOT_EXIST => 9976

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_CLIENT_SUBNET_ALREADY_EXISTS => 9977

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_SUBNET_DOES_NOT_EXIST => 9978

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_SUBNET_ALREADY_EXISTS => 9979

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_POLICY_LOCKED => 9980

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_POLICY_INVALID_WEIGHT => 9981

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_POLICY_INVALID_NAME => 9982

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_POLICY_MISSING_CRITERIA => 9983

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_INVALID_CLIENT_SUBNET_NAME => 9984

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_POLICY_PROCESSING_ORDER_INVALID => 9985

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_POLICY_SCOPE_MISSING => 9986

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_POLICY_SCOPE_NOT_ALLOWED => 9987

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_SERVERSCOPE_IS_REFERENCED => 9988

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_ZONESCOPE_IS_REFERENCED => 9989

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_POLICY_INVALID_CRITERIA_CLIENT_SUBNET => 9990

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_POLICY_INVALID_CRITERIA_TRANSPORT_PROTOCOL => 9991

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_POLICY_INVALID_CRITERIA_NETWORK_PROTOCOL => 9992

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_POLICY_INVALID_CRITERIA_INTERFACE => 9993

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_POLICY_INVALID_CRITERIA_FQDN => 9994

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_POLICY_INVALID_CRITERIA_QUERY_TYPE => 9995

    /**
     * @type {Integer (UInt32)}
     */
    static DNS_ERROR_POLICY_INVALID_CRITERIA_TIME_OF_DAY => 9996

    /**
     * Native name: ERROR_IPSEC_QM_POLICY_EXISTS
     * @type {Integer (UInt32)}
     */
    static IPSEC_QM_POLICY_EXISTS => 13000

    /**
     * Native name: ERROR_IPSEC_QM_POLICY_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static IPSEC_QM_POLICY_NOT_FOUND => 13001

    /**
     * Native name: ERROR_IPSEC_QM_POLICY_IN_USE
     * @type {Integer (UInt32)}
     */
    static IPSEC_QM_POLICY_IN_USE => 13002

    /**
     * Native name: ERROR_IPSEC_MM_POLICY_EXISTS
     * @type {Integer (UInt32)}
     */
    static IPSEC_MM_POLICY_EXISTS => 13003

    /**
     * Native name: ERROR_IPSEC_MM_POLICY_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static IPSEC_MM_POLICY_NOT_FOUND => 13004

    /**
     * Native name: ERROR_IPSEC_MM_POLICY_IN_USE
     * @type {Integer (UInt32)}
     */
    static IPSEC_MM_POLICY_IN_USE => 13005

    /**
     * Native name: ERROR_IPSEC_MM_FILTER_EXISTS
     * @type {Integer (UInt32)}
     */
    static IPSEC_MM_FILTER_EXISTS => 13006

    /**
     * Native name: ERROR_IPSEC_MM_FILTER_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static IPSEC_MM_FILTER_NOT_FOUND => 13007

    /**
     * Native name: ERROR_IPSEC_TRANSPORT_FILTER_EXISTS
     * @type {Integer (UInt32)}
     */
    static IPSEC_TRANSPORT_FILTER_EXISTS => 13008

    /**
     * Native name: ERROR_IPSEC_TRANSPORT_FILTER_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static IPSEC_TRANSPORT_FILTER_NOT_FOUND => 13009

    /**
     * Native name: ERROR_IPSEC_MM_AUTH_EXISTS
     * @type {Integer (UInt32)}
     */
    static IPSEC_MM_AUTH_EXISTS => 13010

    /**
     * Native name: ERROR_IPSEC_MM_AUTH_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static IPSEC_MM_AUTH_NOT_FOUND => 13011

    /**
     * Native name: ERROR_IPSEC_MM_AUTH_IN_USE
     * @type {Integer (UInt32)}
     */
    static IPSEC_MM_AUTH_IN_USE => 13012

    /**
     * Native name: ERROR_IPSEC_DEFAULT_MM_POLICY_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static IPSEC_DEFAULT_MM_POLICY_NOT_FOUND => 13013

    /**
     * Native name: ERROR_IPSEC_DEFAULT_MM_AUTH_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static IPSEC_DEFAULT_MM_AUTH_NOT_FOUND => 13014

    /**
     * Native name: ERROR_IPSEC_DEFAULT_QM_POLICY_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static IPSEC_DEFAULT_QM_POLICY_NOT_FOUND => 13015

    /**
     * Native name: ERROR_IPSEC_TUNNEL_FILTER_EXISTS
     * @type {Integer (UInt32)}
     */
    static IPSEC_TUNNEL_FILTER_EXISTS => 13016

    /**
     * Native name: ERROR_IPSEC_TUNNEL_FILTER_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static IPSEC_TUNNEL_FILTER_NOT_FOUND => 13017

    /**
     * Native name: ERROR_IPSEC_MM_FILTER_PENDING_DELETION
     * @type {Integer (UInt32)}
     */
    static IPSEC_MM_FILTER_PENDING_DELETION => 13018

    /**
     * Native name: ERROR_IPSEC_TRANSPORT_FILTER_PENDING_DELETION
     * @type {Integer (UInt32)}
     */
    static IPSEC_TRANSPORT_FILTER_PENDING_DELETION => 13019

    /**
     * Native name: ERROR_IPSEC_TUNNEL_FILTER_PENDING_DELETION
     * @type {Integer (UInt32)}
     */
    static IPSEC_TUNNEL_FILTER_PENDING_DELETION => 13020

    /**
     * Native name: ERROR_IPSEC_MM_POLICY_PENDING_DELETION
     * @type {Integer (UInt32)}
     */
    static IPSEC_MM_POLICY_PENDING_DELETION => 13021

    /**
     * Native name: ERROR_IPSEC_MM_AUTH_PENDING_DELETION
     * @type {Integer (UInt32)}
     */
    static IPSEC_MM_AUTH_PENDING_DELETION => 13022

    /**
     * Native name: ERROR_IPSEC_QM_POLICY_PENDING_DELETION
     * @type {Integer (UInt32)}
     */
    static IPSEC_QM_POLICY_PENDING_DELETION => 13023

    /**
     * Native name: ERROR_IPSEC_IKE_NEG_STATUS_BEGIN
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_NEG_STATUS_BEGIN => 13800

    /**
     * Native name: ERROR_IPSEC_IKE_AUTH_FAIL
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_AUTH_FAIL => 13801

    /**
     * Native name: ERROR_IPSEC_IKE_ATTRIB_FAIL
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_ATTRIB_FAIL => 13802

    /**
     * Native name: ERROR_IPSEC_IKE_NEGOTIATION_PENDING
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_NEGOTIATION_PENDING => 13803

    /**
     * Native name: ERROR_IPSEC_IKE_GENERAL_PROCESSING_ERROR
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_GENERAL_PROCESSING_ERROR => 13804

    /**
     * Native name: ERROR_IPSEC_IKE_TIMED_OUT
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_TIMED_OUT => 13805

    /**
     * Native name: ERROR_IPSEC_IKE_NO_CERT
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_NO_CERT => 13806

    /**
     * Native name: ERROR_IPSEC_IKE_SA_DELETED
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_SA_DELETED => 13807

    /**
     * Native name: ERROR_IPSEC_IKE_SA_REAPED
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_SA_REAPED => 13808

    /**
     * Native name: ERROR_IPSEC_IKE_MM_ACQUIRE_DROP
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_MM_ACQUIRE_DROP => 13809

    /**
     * Native name: ERROR_IPSEC_IKE_QM_ACQUIRE_DROP
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_QM_ACQUIRE_DROP => 13810

    /**
     * Native name: ERROR_IPSEC_IKE_QUEUE_DROP_MM
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_QUEUE_DROP_MM => 13811

    /**
     * Native name: ERROR_IPSEC_IKE_QUEUE_DROP_NO_MM
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_QUEUE_DROP_NO_MM => 13812

    /**
     * Native name: ERROR_IPSEC_IKE_DROP_NO_RESPONSE
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_DROP_NO_RESPONSE => 13813

    /**
     * Native name: ERROR_IPSEC_IKE_MM_DELAY_DROP
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_MM_DELAY_DROP => 13814

    /**
     * Native name: ERROR_IPSEC_IKE_QM_DELAY_DROP
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_QM_DELAY_DROP => 13815

    /**
     * Native name: ERROR_IPSEC_IKE_ERROR
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_ERROR => 13816

    /**
     * Native name: ERROR_IPSEC_IKE_CRL_FAILED
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_CRL_FAILED => 13817

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_KEY_USAGE
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_KEY_USAGE => 13818

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_CERT_TYPE
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_CERT_TYPE => 13819

    /**
     * Native name: ERROR_IPSEC_IKE_NO_PRIVATE_KEY
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_NO_PRIVATE_KEY => 13820

    /**
     * Native name: ERROR_IPSEC_IKE_SIMULTANEOUS_REKEY
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_SIMULTANEOUS_REKEY => 13821

    /**
     * Native name: ERROR_IPSEC_IKE_DH_FAIL
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_DH_FAIL => 13822

    /**
     * Native name: ERROR_IPSEC_IKE_CRITICAL_PAYLOAD_NOT_RECOGNIZED
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_CRITICAL_PAYLOAD_NOT_RECOGNIZED => 13823

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_HEADER
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_HEADER => 13824

    /**
     * Native name: ERROR_IPSEC_IKE_NO_POLICY
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_NO_POLICY => 13825

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_SIGNATURE
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_SIGNATURE => 13826

    /**
     * Native name: ERROR_IPSEC_IKE_KERBEROS_ERROR
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_KERBEROS_ERROR => 13827

    /**
     * Native name: ERROR_IPSEC_IKE_NO_PUBLIC_KEY
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_NO_PUBLIC_KEY => 13828

    /**
     * Native name: ERROR_IPSEC_IKE_PROCESS_ERR
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_PROCESS_ERR => 13829

    /**
     * Native name: ERROR_IPSEC_IKE_PROCESS_ERR_SA
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_PROCESS_ERR_SA => 13830

    /**
     * Native name: ERROR_IPSEC_IKE_PROCESS_ERR_PROP
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_PROCESS_ERR_PROP => 13831

    /**
     * Native name: ERROR_IPSEC_IKE_PROCESS_ERR_TRANS
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_PROCESS_ERR_TRANS => 13832

    /**
     * Native name: ERROR_IPSEC_IKE_PROCESS_ERR_KE
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_PROCESS_ERR_KE => 13833

    /**
     * Native name: ERROR_IPSEC_IKE_PROCESS_ERR_ID
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_PROCESS_ERR_ID => 13834

    /**
     * Native name: ERROR_IPSEC_IKE_PROCESS_ERR_CERT
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_PROCESS_ERR_CERT => 13835

    /**
     * Native name: ERROR_IPSEC_IKE_PROCESS_ERR_CERT_REQ
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_PROCESS_ERR_CERT_REQ => 13836

    /**
     * Native name: ERROR_IPSEC_IKE_PROCESS_ERR_HASH
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_PROCESS_ERR_HASH => 13837

    /**
     * Native name: ERROR_IPSEC_IKE_PROCESS_ERR_SIG
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_PROCESS_ERR_SIG => 13838

    /**
     * Native name: ERROR_IPSEC_IKE_PROCESS_ERR_NONCE
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_PROCESS_ERR_NONCE => 13839

    /**
     * Native name: ERROR_IPSEC_IKE_PROCESS_ERR_NOTIFY
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_PROCESS_ERR_NOTIFY => 13840

    /**
     * Native name: ERROR_IPSEC_IKE_PROCESS_ERR_DELETE
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_PROCESS_ERR_DELETE => 13841

    /**
     * Native name: ERROR_IPSEC_IKE_PROCESS_ERR_VENDOR
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_PROCESS_ERR_VENDOR => 13842

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_PAYLOAD
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_PAYLOAD => 13843

    /**
     * Native name: ERROR_IPSEC_IKE_LOAD_SOFT_SA
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_LOAD_SOFT_SA => 13844

    /**
     * Native name: ERROR_IPSEC_IKE_SOFT_SA_TORN_DOWN
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_SOFT_SA_TORN_DOWN => 13845

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_COOKIE
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_COOKIE => 13846

    /**
     * Native name: ERROR_IPSEC_IKE_NO_PEER_CERT
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_NO_PEER_CERT => 13847

    /**
     * Native name: ERROR_IPSEC_IKE_PEER_CRL_FAILED
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_PEER_CRL_FAILED => 13848

    /**
     * Native name: ERROR_IPSEC_IKE_POLICY_CHANGE
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_POLICY_CHANGE => 13849

    /**
     * Native name: ERROR_IPSEC_IKE_NO_MM_POLICY
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_NO_MM_POLICY => 13850

    /**
     * Native name: ERROR_IPSEC_IKE_NOTCBPRIV
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_NOTCBPRIV => 13851

    /**
     * Native name: ERROR_IPSEC_IKE_SECLOADFAIL
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_SECLOADFAIL => 13852

    /**
     * Native name: ERROR_IPSEC_IKE_FAILSSPINIT
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_FAILSSPINIT => 13853

    /**
     * Native name: ERROR_IPSEC_IKE_FAILQUERYSSP
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_FAILQUERYSSP => 13854

    /**
     * Native name: ERROR_IPSEC_IKE_SRVACQFAIL
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_SRVACQFAIL => 13855

    /**
     * Native name: ERROR_IPSEC_IKE_SRVQUERYCRED
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_SRVQUERYCRED => 13856

    /**
     * Native name: ERROR_IPSEC_IKE_GETSPIFAIL
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_GETSPIFAIL => 13857

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_FILTER
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_FILTER => 13858

    /**
     * Native name: ERROR_IPSEC_IKE_OUT_OF_MEMORY
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_OUT_OF_MEMORY => 13859

    /**
     * Native name: ERROR_IPSEC_IKE_ADD_UPDATE_KEY_FAILED
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_ADD_UPDATE_KEY_FAILED => 13860

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_POLICY
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_POLICY => 13861

    /**
     * Native name: ERROR_IPSEC_IKE_UNKNOWN_DOI
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_UNKNOWN_DOI => 13862

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_SITUATION
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_SITUATION => 13863

    /**
     * Native name: ERROR_IPSEC_IKE_DH_FAILURE
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_DH_FAILURE => 13864

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_GROUP
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_GROUP => 13865

    /**
     * Native name: ERROR_IPSEC_IKE_ENCRYPT
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_ENCRYPT => 13866

    /**
     * Native name: ERROR_IPSEC_IKE_DECRYPT
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_DECRYPT => 13867

    /**
     * Native name: ERROR_IPSEC_IKE_POLICY_MATCH
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_POLICY_MATCH => 13868

    /**
     * Native name: ERROR_IPSEC_IKE_UNSUPPORTED_ID
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_UNSUPPORTED_ID => 13869

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_HASH
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_HASH => 13870

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_HASH_ALG
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_HASH_ALG => 13871

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_HASH_SIZE
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_HASH_SIZE => 13872

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_ENCRYPT_ALG
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_ENCRYPT_ALG => 13873

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_AUTH_ALG
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_AUTH_ALG => 13874

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_SIG
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_SIG => 13875

    /**
     * Native name: ERROR_IPSEC_IKE_LOAD_FAILED
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_LOAD_FAILED => 13876

    /**
     * Native name: ERROR_IPSEC_IKE_RPC_DELETE
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_RPC_DELETE => 13877

    /**
     * Native name: ERROR_IPSEC_IKE_BENIGN_REINIT
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_BENIGN_REINIT => 13878

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_RESPONDER_LIFETIME_NOTIFY
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_RESPONDER_LIFETIME_NOTIFY => 13879

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_MAJOR_VERSION
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_MAJOR_VERSION => 13880

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_CERT_KEYLEN
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_CERT_KEYLEN => 13881

    /**
     * Native name: ERROR_IPSEC_IKE_MM_LIMIT
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_MM_LIMIT => 13882

    /**
     * Native name: ERROR_IPSEC_IKE_NEGOTIATION_DISABLED
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_NEGOTIATION_DISABLED => 13883

    /**
     * Native name: ERROR_IPSEC_IKE_QM_LIMIT
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_QM_LIMIT => 13884

    /**
     * Native name: ERROR_IPSEC_IKE_MM_EXPIRED
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_MM_EXPIRED => 13885

    /**
     * Native name: ERROR_IPSEC_IKE_PEER_MM_ASSUMED_INVALID
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_PEER_MM_ASSUMED_INVALID => 13886

    /**
     * Native name: ERROR_IPSEC_IKE_CERT_CHAIN_POLICY_MISMATCH
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_CERT_CHAIN_POLICY_MISMATCH => 13887

    /**
     * Native name: ERROR_IPSEC_IKE_UNEXPECTED_MESSAGE_ID
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_UNEXPECTED_MESSAGE_ID => 13888

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_AUTH_PAYLOAD
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_AUTH_PAYLOAD => 13889

    /**
     * Native name: ERROR_IPSEC_IKE_DOS_COOKIE_SENT
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_DOS_COOKIE_SENT => 13890

    /**
     * Native name: ERROR_IPSEC_IKE_SHUTTING_DOWN
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_SHUTTING_DOWN => 13891

    /**
     * Native name: ERROR_IPSEC_IKE_CGA_AUTH_FAILED
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_CGA_AUTH_FAILED => 13892

    /**
     * Native name: ERROR_IPSEC_IKE_PROCESS_ERR_NATOA
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_PROCESS_ERR_NATOA => 13893

    /**
     * Native name: ERROR_IPSEC_IKE_INVALID_MM_FOR_QM
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INVALID_MM_FOR_QM => 13894

    /**
     * Native name: ERROR_IPSEC_IKE_QM_EXPIRED
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_QM_EXPIRED => 13895

    /**
     * Native name: ERROR_IPSEC_IKE_TOO_MANY_FILTERS
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_TOO_MANY_FILTERS => 13896

    /**
     * Native name: ERROR_IPSEC_IKE_NEG_STATUS_END
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_NEG_STATUS_END => 13897

    /**
     * Native name: ERROR_IPSEC_IKE_KILL_DUMMY_NAP_TUNNEL
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_KILL_DUMMY_NAP_TUNNEL => 13898

    /**
     * Native name: ERROR_IPSEC_IKE_INNER_IP_ASSIGNMENT_FAILURE
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_INNER_IP_ASSIGNMENT_FAILURE => 13899

    /**
     * Native name: ERROR_IPSEC_IKE_REQUIRE_CP_PAYLOAD_MISSING
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_REQUIRE_CP_PAYLOAD_MISSING => 13900

    /**
     * Native name: ERROR_IPSEC_KEY_MODULE_IMPERSONATION_NEGOTIATION_PENDING
     * @type {Integer (UInt32)}
     */
    static IPSEC_KEY_MODULE_IMPERSONATION_NEGOTIATION_PENDING => 13901

    /**
     * Native name: ERROR_IPSEC_IKE_COEXISTENCE_SUPPRESS
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_COEXISTENCE_SUPPRESS => 13902

    /**
     * Native name: ERROR_IPSEC_IKE_RATELIMIT_DROP
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_RATELIMIT_DROP => 13903

    /**
     * Native name: ERROR_IPSEC_IKE_PEER_DOESNT_SUPPORT_MOBIKE
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_PEER_DOESNT_SUPPORT_MOBIKE => 13904

    /**
     * Native name: ERROR_IPSEC_IKE_AUTHORIZATION_FAILURE
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_AUTHORIZATION_FAILURE => 13905

    /**
     * Native name: ERROR_IPSEC_IKE_STRONG_CRED_AUTHORIZATION_FAILURE
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_STRONG_CRED_AUTHORIZATION_FAILURE => 13906

    /**
     * Native name: ERROR_IPSEC_IKE_AUTHORIZATION_FAILURE_WITH_OPTIONAL_RETRY
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_AUTHORIZATION_FAILURE_WITH_OPTIONAL_RETRY => 13907

    /**
     * Native name: ERROR_IPSEC_IKE_STRONG_CRED_AUTHORIZATION_AND_CERTMAP_FAILURE
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_STRONG_CRED_AUTHORIZATION_AND_CERTMAP_FAILURE => 13908

    /**
     * Native name: ERROR_IPSEC_IKE_NEG_STATUS_EXTENDED_END
     * @type {Integer (UInt32)}
     */
    static IPSEC_IKE_NEG_STATUS_EXTENDED_END => 13909

    /**
     * Native name: ERROR_IPSEC_BAD_SPI
     * @type {Integer (UInt32)}
     */
    static IPSEC_BAD_SPI => 13910

    /**
     * Native name: ERROR_IPSEC_SA_LIFETIME_EXPIRED
     * @type {Integer (UInt32)}
     */
    static IPSEC_SA_LIFETIME_EXPIRED => 13911

    /**
     * Native name: ERROR_IPSEC_WRONG_SA
     * @type {Integer (UInt32)}
     */
    static IPSEC_WRONG_SA => 13912

    /**
     * Native name: ERROR_IPSEC_REPLAY_CHECK_FAILED
     * @type {Integer (UInt32)}
     */
    static IPSEC_REPLAY_CHECK_FAILED => 13913

    /**
     * Native name: ERROR_IPSEC_INVALID_PACKET
     * @type {Integer (UInt32)}
     */
    static IPSEC_INVALID_PACKET => 13914

    /**
     * Native name: ERROR_IPSEC_INTEGRITY_CHECK_FAILED
     * @type {Integer (UInt32)}
     */
    static IPSEC_INTEGRITY_CHECK_FAILED => 13915

    /**
     * Native name: ERROR_IPSEC_CLEAR_TEXT_DROP
     * @type {Integer (UInt32)}
     */
    static IPSEC_CLEAR_TEXT_DROP => 13916

    /**
     * Native name: ERROR_IPSEC_AUTH_FIREWALL_DROP
     * @type {Integer (UInt32)}
     */
    static IPSEC_AUTH_FIREWALL_DROP => 13917

    /**
     * Native name: ERROR_IPSEC_THROTTLE_DROP
     * @type {Integer (UInt32)}
     */
    static IPSEC_THROTTLE_DROP => 13918

    /**
     * Native name: ERROR_IPSEC_DOSP_BLOCK
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_BLOCK => 13925

    /**
     * Native name: ERROR_IPSEC_DOSP_RECEIVED_MULTICAST
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_RECEIVED_MULTICAST => 13926

    /**
     * Native name: ERROR_IPSEC_DOSP_INVALID_PACKET
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_INVALID_PACKET => 13927

    /**
     * Native name: ERROR_IPSEC_DOSP_STATE_LOOKUP_FAILED
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_STATE_LOOKUP_FAILED => 13928

    /**
     * Native name: ERROR_IPSEC_DOSP_MAX_ENTRIES
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_MAX_ENTRIES => 13929

    /**
     * Native name: ERROR_IPSEC_DOSP_KEYMOD_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_KEYMOD_NOT_ALLOWED => 13930

    /**
     * Native name: ERROR_IPSEC_DOSP_NOT_INSTALLED
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_NOT_INSTALLED => 13931

    /**
     * Native name: ERROR_IPSEC_DOSP_MAX_PER_IP_RATELIMIT_QUEUES
     * @type {Integer (UInt32)}
     */
    static IPSEC_DOSP_MAX_PER_IP_RATELIMIT_QUEUES => 13932

    /**
     * Native name: ERROR_SXS_SECTION_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static SXS_SECTION_NOT_FOUND => 14000

    /**
     * Native name: ERROR_SXS_CANT_GEN_ACTCTX
     * @type {Integer (UInt32)}
     */
    static SXS_CANT_GEN_ACTCTX => 14001

    /**
     * Native name: ERROR_SXS_INVALID_ACTCTXDATA_FORMAT
     * @type {Integer (UInt32)}
     */
    static SXS_INVALID_ACTCTXDATA_FORMAT => 14002

    /**
     * Native name: ERROR_SXS_ASSEMBLY_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static SXS_ASSEMBLY_NOT_FOUND => 14003

    /**
     * Native name: ERROR_SXS_MANIFEST_FORMAT_ERROR
     * @type {Integer (UInt32)}
     */
    static SXS_MANIFEST_FORMAT_ERROR => 14004

    /**
     * Native name: ERROR_SXS_MANIFEST_PARSE_ERROR
     * @type {Integer (UInt32)}
     */
    static SXS_MANIFEST_PARSE_ERROR => 14005

    /**
     * Native name: ERROR_SXS_ACTIVATION_CONTEXT_DISABLED
     * @type {Integer (UInt32)}
     */
    static SXS_ACTIVATION_CONTEXT_DISABLED => 14006

    /**
     * Native name: ERROR_SXS_KEY_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static SXS_KEY_NOT_FOUND => 14007

    /**
     * Native name: ERROR_SXS_VERSION_CONFLICT
     * @type {Integer (UInt32)}
     */
    static SXS_VERSION_CONFLICT => 14008

    /**
     * Native name: ERROR_SXS_WRONG_SECTION_TYPE
     * @type {Integer (UInt32)}
     */
    static SXS_WRONG_SECTION_TYPE => 14009

    /**
     * Native name: ERROR_SXS_THREAD_QUERIES_DISABLED
     * @type {Integer (UInt32)}
     */
    static SXS_THREAD_QUERIES_DISABLED => 14010

    /**
     * Native name: ERROR_SXS_PROCESS_DEFAULT_ALREADY_SET
     * @type {Integer (UInt32)}
     */
    static SXS_PROCESS_DEFAULT_ALREADY_SET => 14011

    /**
     * Native name: ERROR_SXS_UNKNOWN_ENCODING_GROUP
     * @type {Integer (UInt32)}
     */
    static SXS_UNKNOWN_ENCODING_GROUP => 14012

    /**
     * Native name: ERROR_SXS_UNKNOWN_ENCODING
     * @type {Integer (UInt32)}
     */
    static SXS_UNKNOWN_ENCODING => 14013

    /**
     * Native name: ERROR_SXS_INVALID_XML_NAMESPACE_URI
     * @type {Integer (UInt32)}
     */
    static SXS_INVALID_XML_NAMESPACE_URI => 14014

    /**
     * Native name: ERROR_SXS_ROOT_MANIFEST_DEPENDENCY_NOT_INSTALLED
     * @type {Integer (UInt32)}
     */
    static SXS_ROOT_MANIFEST_DEPENDENCY_NOT_INSTALLED => 14015

    /**
     * Native name: ERROR_SXS_LEAF_MANIFEST_DEPENDENCY_NOT_INSTALLED
     * @type {Integer (UInt32)}
     */
    static SXS_LEAF_MANIFEST_DEPENDENCY_NOT_INSTALLED => 14016

    /**
     * Native name: ERROR_SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE
     * @type {Integer (UInt32)}
     */
    static SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE => 14017

    /**
     * Native name: ERROR_SXS_MANIFEST_MISSING_REQUIRED_DEFAULT_NAMESPACE
     * @type {Integer (UInt32)}
     */
    static SXS_MANIFEST_MISSING_REQUIRED_DEFAULT_NAMESPACE => 14018

    /**
     * Native name: ERROR_SXS_MANIFEST_INVALID_REQUIRED_DEFAULT_NAMESPACE
     * @type {Integer (UInt32)}
     */
    static SXS_MANIFEST_INVALID_REQUIRED_DEFAULT_NAMESPACE => 14019

    /**
     * Native name: ERROR_SXS_PRIVATE_MANIFEST_CROSS_PATH_WITH_REPARSE_POINT
     * @type {Integer (UInt32)}
     */
    static SXS_PRIVATE_MANIFEST_CROSS_PATH_WITH_REPARSE_POINT => 14020

    /**
     * Native name: ERROR_SXS_DUPLICATE_DLL_NAME
     * @type {Integer (UInt32)}
     */
    static SXS_DUPLICATE_DLL_NAME => 14021

    /**
     * Native name: ERROR_SXS_DUPLICATE_WINDOWCLASS_NAME
     * @type {Integer (UInt32)}
     */
    static SXS_DUPLICATE_WINDOWCLASS_NAME => 14022

    /**
     * Native name: ERROR_SXS_DUPLICATE_CLSID
     * @type {Integer (UInt32)}
     */
    static SXS_DUPLICATE_CLSID => 14023

    /**
     * Native name: ERROR_SXS_DUPLICATE_IID
     * @type {Integer (UInt32)}
     */
    static SXS_DUPLICATE_IID => 14024

    /**
     * Native name: ERROR_SXS_DUPLICATE_TLBID
     * @type {Integer (UInt32)}
     */
    static SXS_DUPLICATE_TLBID => 14025

    /**
     * Native name: ERROR_SXS_DUPLICATE_PROGID
     * @type {Integer (UInt32)}
     */
    static SXS_DUPLICATE_PROGID => 14026

    /**
     * Native name: ERROR_SXS_DUPLICATE_ASSEMBLY_NAME
     * @type {Integer (UInt32)}
     */
    static SXS_DUPLICATE_ASSEMBLY_NAME => 14027

    /**
     * Native name: ERROR_SXS_FILE_HASH_MISMATCH
     * @type {Integer (UInt32)}
     */
    static SXS_FILE_HASH_MISMATCH => 14028

    /**
     * Native name: ERROR_SXS_POLICY_PARSE_ERROR
     * @type {Integer (UInt32)}
     */
    static SXS_POLICY_PARSE_ERROR => 14029

    /**
     * Native name: ERROR_SXS_XML_E_MISSINGQUOTE
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_MISSINGQUOTE => 14030

    /**
     * Native name: ERROR_SXS_XML_E_COMMENTSYNTAX
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_COMMENTSYNTAX => 14031

    /**
     * Native name: ERROR_SXS_XML_E_BADSTARTNAMECHAR
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_BADSTARTNAMECHAR => 14032

    /**
     * Native name: ERROR_SXS_XML_E_BADNAMECHAR
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_BADNAMECHAR => 14033

    /**
     * Native name: ERROR_SXS_XML_E_BADCHARINSTRING
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_BADCHARINSTRING => 14034

    /**
     * Native name: ERROR_SXS_XML_E_XMLDECLSYNTAX
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_XMLDECLSYNTAX => 14035

    /**
     * Native name: ERROR_SXS_XML_E_BADCHARDATA
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_BADCHARDATA => 14036

    /**
     * Native name: ERROR_SXS_XML_E_MISSINGWHITESPACE
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_MISSINGWHITESPACE => 14037

    /**
     * Native name: ERROR_SXS_XML_E_EXPECTINGTAGEND
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_EXPECTINGTAGEND => 14038

    /**
     * Native name: ERROR_SXS_XML_E_MISSINGSEMICOLON
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_MISSINGSEMICOLON => 14039

    /**
     * Native name: ERROR_SXS_XML_E_UNBALANCEDPAREN
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_UNBALANCEDPAREN => 14040

    /**
     * Native name: ERROR_SXS_XML_E_INTERNALERROR
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_INTERNALERROR => 14041

    /**
     * Native name: ERROR_SXS_XML_E_UNEXPECTED_WHITESPACE
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_UNEXPECTED_WHITESPACE => 14042

    /**
     * Native name: ERROR_SXS_XML_E_INCOMPLETE_ENCODING
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_INCOMPLETE_ENCODING => 14043

    /**
     * Native name: ERROR_SXS_XML_E_MISSING_PAREN
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_MISSING_PAREN => 14044

    /**
     * Native name: ERROR_SXS_XML_E_EXPECTINGCLOSEQUOTE
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_EXPECTINGCLOSEQUOTE => 14045

    /**
     * Native name: ERROR_SXS_XML_E_MULTIPLE_COLONS
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_MULTIPLE_COLONS => 14046

    /**
     * Native name: ERROR_SXS_XML_E_INVALID_DECIMAL
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_INVALID_DECIMAL => 14047

    /**
     * Native name: ERROR_SXS_XML_E_INVALID_HEXIDECIMAL
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_INVALID_HEXIDECIMAL => 14048

    /**
     * Native name: ERROR_SXS_XML_E_INVALID_UNICODE
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_INVALID_UNICODE => 14049

    /**
     * Native name: ERROR_SXS_XML_E_WHITESPACEORQUESTIONMARK
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_WHITESPACEORQUESTIONMARK => 14050

    /**
     * Native name: ERROR_SXS_XML_E_UNEXPECTEDENDTAG
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_UNEXPECTEDENDTAG => 14051

    /**
     * Native name: ERROR_SXS_XML_E_UNCLOSEDTAG
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_UNCLOSEDTAG => 14052

    /**
     * Native name: ERROR_SXS_XML_E_DUPLICATEATTRIBUTE
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_DUPLICATEATTRIBUTE => 14053

    /**
     * Native name: ERROR_SXS_XML_E_MULTIPLEROOTS
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_MULTIPLEROOTS => 14054

    /**
     * Native name: ERROR_SXS_XML_E_INVALIDATROOTLEVEL
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_INVALIDATROOTLEVEL => 14055

    /**
     * Native name: ERROR_SXS_XML_E_BADXMLDECL
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_BADXMLDECL => 14056

    /**
     * Native name: ERROR_SXS_XML_E_MISSINGROOT
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_MISSINGROOT => 14057

    /**
     * Native name: ERROR_SXS_XML_E_UNEXPECTEDEOF
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_UNEXPECTEDEOF => 14058

    /**
     * Native name: ERROR_SXS_XML_E_BADPEREFINSUBSET
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_BADPEREFINSUBSET => 14059

    /**
     * Native name: ERROR_SXS_XML_E_UNCLOSEDSTARTTAG
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_UNCLOSEDSTARTTAG => 14060

    /**
     * Native name: ERROR_SXS_XML_E_UNCLOSEDENDTAG
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_UNCLOSEDENDTAG => 14061

    /**
     * Native name: ERROR_SXS_XML_E_UNCLOSEDSTRING
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_UNCLOSEDSTRING => 14062

    /**
     * Native name: ERROR_SXS_XML_E_UNCLOSEDCOMMENT
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_UNCLOSEDCOMMENT => 14063

    /**
     * Native name: ERROR_SXS_XML_E_UNCLOSEDDECL
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_UNCLOSEDDECL => 14064

    /**
     * Native name: ERROR_SXS_XML_E_UNCLOSEDCDATA
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_UNCLOSEDCDATA => 14065

    /**
     * Native name: ERROR_SXS_XML_E_RESERVEDNAMESPACE
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_RESERVEDNAMESPACE => 14066

    /**
     * Native name: ERROR_SXS_XML_E_INVALIDENCODING
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_INVALIDENCODING => 14067

    /**
     * Native name: ERROR_SXS_XML_E_INVALIDSWITCH
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_INVALIDSWITCH => 14068

    /**
     * Native name: ERROR_SXS_XML_E_BADXMLCASE
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_BADXMLCASE => 14069

    /**
     * Native name: ERROR_SXS_XML_E_INVALID_STANDALONE
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_INVALID_STANDALONE => 14070

    /**
     * Native name: ERROR_SXS_XML_E_UNEXPECTED_STANDALONE
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_UNEXPECTED_STANDALONE => 14071

    /**
     * Native name: ERROR_SXS_XML_E_INVALID_VERSION
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_INVALID_VERSION => 14072

    /**
     * Native name: ERROR_SXS_XML_E_MISSINGEQUALS
     * @type {Integer (UInt32)}
     */
    static SXS_XML_E_MISSINGEQUALS => 14073

    /**
     * Native name: ERROR_SXS_PROTECTION_RECOVERY_FAILED
     * @type {Integer (UInt32)}
     */
    static SXS_PROTECTION_RECOVERY_FAILED => 14074

    /**
     * Native name: ERROR_SXS_PROTECTION_PUBLIC_KEY_TOO_SHORT
     * @type {Integer (UInt32)}
     */
    static SXS_PROTECTION_PUBLIC_KEY_TOO_SHORT => 14075

    /**
     * Native name: ERROR_SXS_PROTECTION_CATALOG_NOT_VALID
     * @type {Integer (UInt32)}
     */
    static SXS_PROTECTION_CATALOG_NOT_VALID => 14076

    /**
     * Native name: ERROR_SXS_UNTRANSLATABLE_HRESULT
     * @type {Integer (UInt32)}
     */
    static SXS_UNTRANSLATABLE_HRESULT => 14077

    /**
     * Native name: ERROR_SXS_PROTECTION_CATALOG_FILE_MISSING
     * @type {Integer (UInt32)}
     */
    static SXS_PROTECTION_CATALOG_FILE_MISSING => 14078

    /**
     * Native name: ERROR_SXS_MISSING_ASSEMBLY_IDENTITY_ATTRIBUTE
     * @type {Integer (UInt32)}
     */
    static SXS_MISSING_ASSEMBLY_IDENTITY_ATTRIBUTE => 14079

    /**
     * Native name: ERROR_SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE_NAME
     * @type {Integer (UInt32)}
     */
    static SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE_NAME => 14080

    /**
     * Native name: ERROR_SXS_ASSEMBLY_MISSING
     * @type {Integer (UInt32)}
     */
    static SXS_ASSEMBLY_MISSING => 14081

    /**
     * Native name: ERROR_SXS_CORRUPT_ACTIVATION_STACK
     * @type {Integer (UInt32)}
     */
    static SXS_CORRUPT_ACTIVATION_STACK => 14082

    /**
     * Native name: ERROR_SXS_CORRUPTION
     * @type {Integer (UInt32)}
     */
    static SXS_CORRUPTION => 14083

    /**
     * Native name: ERROR_SXS_EARLY_DEACTIVATION
     * @type {Integer (UInt32)}
     */
    static SXS_EARLY_DEACTIVATION => 14084

    /**
     * Native name: ERROR_SXS_INVALID_DEACTIVATION
     * @type {Integer (UInt32)}
     */
    static SXS_INVALID_DEACTIVATION => 14085

    /**
     * Native name: ERROR_SXS_MULTIPLE_DEACTIVATION
     * @type {Integer (UInt32)}
     */
    static SXS_MULTIPLE_DEACTIVATION => 14086

    /**
     * Native name: ERROR_SXS_PROCESS_TERMINATION_REQUESTED
     * @type {Integer (UInt32)}
     */
    static SXS_PROCESS_TERMINATION_REQUESTED => 14087

    /**
     * Native name: ERROR_SXS_RELEASE_ACTIVATION_CONTEXT
     * @type {Integer (UInt32)}
     */
    static SXS_RELEASE_ACTIVATION_CONTEXT => 14088

    /**
     * Native name: ERROR_SXS_SYSTEM_DEFAULT_ACTIVATION_CONTEXT_EMPTY
     * @type {Integer (UInt32)}
     */
    static SXS_SYSTEM_DEFAULT_ACTIVATION_CONTEXT_EMPTY => 14089

    /**
     * Native name: ERROR_SXS_INVALID_IDENTITY_ATTRIBUTE_VALUE
     * @type {Integer (UInt32)}
     */
    static SXS_INVALID_IDENTITY_ATTRIBUTE_VALUE => 14090

    /**
     * Native name: ERROR_SXS_INVALID_IDENTITY_ATTRIBUTE_NAME
     * @type {Integer (UInt32)}
     */
    static SXS_INVALID_IDENTITY_ATTRIBUTE_NAME => 14091

    /**
     * Native name: ERROR_SXS_IDENTITY_DUPLICATE_ATTRIBUTE
     * @type {Integer (UInt32)}
     */
    static SXS_IDENTITY_DUPLICATE_ATTRIBUTE => 14092

    /**
     * Native name: ERROR_SXS_IDENTITY_PARSE_ERROR
     * @type {Integer (UInt32)}
     */
    static SXS_IDENTITY_PARSE_ERROR => 14093

    /**
     * Native name: ERROR_MALFORMED_SUBSTITUTION_STRING
     * @type {Integer (UInt32)}
     */
    static MALFORMED_SUBSTITUTION_STRING => 14094

    /**
     * Native name: ERROR_SXS_INCORRECT_PUBLIC_KEY_TOKEN
     * @type {Integer (UInt32)}
     */
    static SXS_INCORRECT_PUBLIC_KEY_TOKEN => 14095

    /**
     * Native name: ERROR_UNMAPPED_SUBSTITUTION_STRING
     * @type {Integer (UInt32)}
     */
    static UNMAPPED_SUBSTITUTION_STRING => 14096

    /**
     * Native name: ERROR_SXS_ASSEMBLY_NOT_LOCKED
     * @type {Integer (UInt32)}
     */
    static SXS_ASSEMBLY_NOT_LOCKED => 14097

    /**
     * Native name: ERROR_SXS_COMPONENT_STORE_CORRUPT
     * @type {Integer (UInt32)}
     */
    static SXS_COMPONENT_STORE_CORRUPT => 14098

    /**
     * Native name: ERROR_ADVANCED_INSTALLER_FAILED
     * @type {Integer (UInt32)}
     */
    static ADVANCED_INSTALLER_FAILED => 14099

    /**
     * Native name: ERROR_XML_ENCODING_MISMATCH
     * @type {Integer (UInt32)}
     */
    static XML_ENCODING_MISMATCH => 14100

    /**
     * Native name: ERROR_SXS_MANIFEST_IDENTITY_SAME_BUT_CONTENTS_DIFFERENT
     * @type {Integer (UInt32)}
     */
    static SXS_MANIFEST_IDENTITY_SAME_BUT_CONTENTS_DIFFERENT => 14101

    /**
     * Native name: ERROR_SXS_IDENTITIES_DIFFERENT
     * @type {Integer (UInt32)}
     */
    static SXS_IDENTITIES_DIFFERENT => 14102

    /**
     * Native name: ERROR_SXS_ASSEMBLY_IS_NOT_A_DEPLOYMENT
     * @type {Integer (UInt32)}
     */
    static SXS_ASSEMBLY_IS_NOT_A_DEPLOYMENT => 14103

    /**
     * Native name: ERROR_SXS_FILE_NOT_PART_OF_ASSEMBLY
     * @type {Integer (UInt32)}
     */
    static SXS_FILE_NOT_PART_OF_ASSEMBLY => 14104

    /**
     * Native name: ERROR_SXS_MANIFEST_TOO_BIG
     * @type {Integer (UInt32)}
     */
    static SXS_MANIFEST_TOO_BIG => 14105

    /**
     * Native name: ERROR_SXS_SETTING_NOT_REGISTERED
     * @type {Integer (UInt32)}
     */
    static SXS_SETTING_NOT_REGISTERED => 14106

    /**
     * Native name: ERROR_SXS_TRANSACTION_CLOSURE_INCOMPLETE
     * @type {Integer (UInt32)}
     */
    static SXS_TRANSACTION_CLOSURE_INCOMPLETE => 14107

    /**
     * Native name: ERROR_SMI_PRIMITIVE_INSTALLER_FAILED
     * @type {Integer (UInt32)}
     */
    static SMI_PRIMITIVE_INSTALLER_FAILED => 14108

    /**
     * Native name: ERROR_GENERIC_COMMAND_FAILED
     * @type {Integer (UInt32)}
     */
    static GENERIC_COMMAND_FAILED => 14109

    /**
     * Native name: ERROR_SXS_FILE_HASH_MISSING
     * @type {Integer (UInt32)}
     */
    static SXS_FILE_HASH_MISSING => 14110

    /**
     * Native name: ERROR_SXS_DUPLICATE_ACTIVATABLE_CLASS
     * @type {Integer (UInt32)}
     */
    static SXS_DUPLICATE_ACTIVATABLE_CLASS => 14111

    /**
     * Native name: ERROR_EVT_INVALID_CHANNEL_PATH
     * @type {Integer (UInt32)}
     */
    static EVT_INVALID_CHANNEL_PATH => 15000

    /**
     * Native name: ERROR_EVT_INVALID_QUERY
     * @type {Integer (UInt32)}
     */
    static EVT_INVALID_QUERY => 15001

    /**
     * Native name: ERROR_EVT_PUBLISHER_METADATA_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static EVT_PUBLISHER_METADATA_NOT_FOUND => 15002

    /**
     * Native name: ERROR_EVT_EVENT_TEMPLATE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static EVT_EVENT_TEMPLATE_NOT_FOUND => 15003

    /**
     * Native name: ERROR_EVT_INVALID_PUBLISHER_NAME
     * @type {Integer (UInt32)}
     */
    static EVT_INVALID_PUBLISHER_NAME => 15004

    /**
     * Native name: ERROR_EVT_INVALID_EVENT_DATA
     * @type {Integer (UInt32)}
     */
    static EVT_INVALID_EVENT_DATA => 15005

    /**
     * Native name: ERROR_EVT_CHANNEL_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static EVT_CHANNEL_NOT_FOUND => 15007

    /**
     * Native name: ERROR_EVT_MALFORMED_XML_TEXT
     * @type {Integer (UInt32)}
     */
    static EVT_MALFORMED_XML_TEXT => 15008

    /**
     * Native name: ERROR_EVT_SUBSCRIPTION_TO_DIRECT_CHANNEL
     * @type {Integer (UInt32)}
     */
    static EVT_SUBSCRIPTION_TO_DIRECT_CHANNEL => 15009

    /**
     * Native name: ERROR_EVT_CONFIGURATION_ERROR
     * @type {Integer (UInt32)}
     */
    static EVT_CONFIGURATION_ERROR => 15010

    /**
     * Native name: ERROR_EVT_QUERY_RESULT_STALE
     * @type {Integer (UInt32)}
     */
    static EVT_QUERY_RESULT_STALE => 15011

    /**
     * Native name: ERROR_EVT_QUERY_RESULT_INVALID_POSITION
     * @type {Integer (UInt32)}
     */
    static EVT_QUERY_RESULT_INVALID_POSITION => 15012

    /**
     * Native name: ERROR_EVT_NON_VALIDATING_MSXML
     * @type {Integer (UInt32)}
     */
    static EVT_NON_VALIDATING_MSXML => 15013

    /**
     * Native name: ERROR_EVT_FILTER_ALREADYSCOPED
     * @type {Integer (UInt32)}
     */
    static EVT_FILTER_ALREADYSCOPED => 15014

    /**
     * Native name: ERROR_EVT_FILTER_NOTELTSET
     * @type {Integer (UInt32)}
     */
    static EVT_FILTER_NOTELTSET => 15015

    /**
     * Native name: ERROR_EVT_FILTER_INVARG
     * @type {Integer (UInt32)}
     */
    static EVT_FILTER_INVARG => 15016

    /**
     * Native name: ERROR_EVT_FILTER_INVTEST
     * @type {Integer (UInt32)}
     */
    static EVT_FILTER_INVTEST => 15017

    /**
     * Native name: ERROR_EVT_FILTER_INVTYPE
     * @type {Integer (UInt32)}
     */
    static EVT_FILTER_INVTYPE => 15018

    /**
     * Native name: ERROR_EVT_FILTER_PARSEERR
     * @type {Integer (UInt32)}
     */
    static EVT_FILTER_PARSEERR => 15019

    /**
     * Native name: ERROR_EVT_FILTER_UNSUPPORTEDOP
     * @type {Integer (UInt32)}
     */
    static EVT_FILTER_UNSUPPORTEDOP => 15020

    /**
     * Native name: ERROR_EVT_FILTER_UNEXPECTEDTOKEN
     * @type {Integer (UInt32)}
     */
    static EVT_FILTER_UNEXPECTEDTOKEN => 15021

    /**
     * Native name: ERROR_EVT_INVALID_OPERATION_OVER_ENABLED_DIRECT_CHANNEL
     * @type {Integer (UInt32)}
     */
    static EVT_INVALID_OPERATION_OVER_ENABLED_DIRECT_CHANNEL => 15022

    /**
     * Native name: ERROR_EVT_INVALID_CHANNEL_PROPERTY_VALUE
     * @type {Integer (UInt32)}
     */
    static EVT_INVALID_CHANNEL_PROPERTY_VALUE => 15023

    /**
     * Native name: ERROR_EVT_INVALID_PUBLISHER_PROPERTY_VALUE
     * @type {Integer (UInt32)}
     */
    static EVT_INVALID_PUBLISHER_PROPERTY_VALUE => 15024

    /**
     * Native name: ERROR_EVT_CHANNEL_CANNOT_ACTIVATE
     * @type {Integer (UInt32)}
     */
    static EVT_CHANNEL_CANNOT_ACTIVATE => 15025

    /**
     * Native name: ERROR_EVT_FILTER_TOO_COMPLEX
     * @type {Integer (UInt32)}
     */
    static EVT_FILTER_TOO_COMPLEX => 15026

    /**
     * Native name: ERROR_EVT_MESSAGE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static EVT_MESSAGE_NOT_FOUND => 15027

    /**
     * Native name: ERROR_EVT_MESSAGE_ID_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static EVT_MESSAGE_ID_NOT_FOUND => 15028

    /**
     * Native name: ERROR_EVT_UNRESOLVED_VALUE_INSERT
     * @type {Integer (UInt32)}
     */
    static EVT_UNRESOLVED_VALUE_INSERT => 15029

    /**
     * Native name: ERROR_EVT_UNRESOLVED_PARAMETER_INSERT
     * @type {Integer (UInt32)}
     */
    static EVT_UNRESOLVED_PARAMETER_INSERT => 15030

    /**
     * Native name: ERROR_EVT_MAX_INSERTS_REACHED
     * @type {Integer (UInt32)}
     */
    static EVT_MAX_INSERTS_REACHED => 15031

    /**
     * Native name: ERROR_EVT_EVENT_DEFINITION_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static EVT_EVENT_DEFINITION_NOT_FOUND => 15032

    /**
     * Native name: ERROR_EVT_MESSAGE_LOCALE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static EVT_MESSAGE_LOCALE_NOT_FOUND => 15033

    /**
     * Native name: ERROR_EVT_VERSION_TOO_OLD
     * @type {Integer (UInt32)}
     */
    static EVT_VERSION_TOO_OLD => 15034

    /**
     * Native name: ERROR_EVT_VERSION_TOO_NEW
     * @type {Integer (UInt32)}
     */
    static EVT_VERSION_TOO_NEW => 15035

    /**
     * Native name: ERROR_EVT_CANNOT_OPEN_CHANNEL_OF_QUERY
     * @type {Integer (UInt32)}
     */
    static EVT_CANNOT_OPEN_CHANNEL_OF_QUERY => 15036

    /**
     * Native name: ERROR_EVT_PUBLISHER_DISABLED
     * @type {Integer (UInt32)}
     */
    static EVT_PUBLISHER_DISABLED => 15037

    /**
     * Native name: ERROR_EVT_FILTER_OUT_OF_RANGE
     * @type {Integer (UInt32)}
     */
    static EVT_FILTER_OUT_OF_RANGE => 15038

    /**
     * Native name: ERROR_EC_SUBSCRIPTION_CANNOT_ACTIVATE
     * @type {Integer (UInt32)}
     */
    static EC_SUBSCRIPTION_CANNOT_ACTIVATE => 15080

    /**
     * Native name: ERROR_EC_LOG_DISABLED
     * @type {Integer (UInt32)}
     */
    static EC_LOG_DISABLED => 15081

    /**
     * Native name: ERROR_EC_CIRCULAR_FORWARDING
     * @type {Integer (UInt32)}
     */
    static EC_CIRCULAR_FORWARDING => 15082

    /**
     * Native name: ERROR_EC_CREDSTORE_FULL
     * @type {Integer (UInt32)}
     */
    static EC_CREDSTORE_FULL => 15083

    /**
     * Native name: ERROR_EC_CRED_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static EC_CRED_NOT_FOUND => 15084

    /**
     * Native name: ERROR_EC_NO_ACTIVE_CHANNEL
     * @type {Integer (UInt32)}
     */
    static EC_NO_ACTIVE_CHANNEL => 15085

    /**
     * Native name: ERROR_MUI_FILE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static MUI_FILE_NOT_FOUND => 15100

    /**
     * Native name: ERROR_MUI_INVALID_FILE
     * @type {Integer (UInt32)}
     */
    static MUI_INVALID_FILE => 15101

    /**
     * Native name: ERROR_MUI_INVALID_RC_CONFIG
     * @type {Integer (UInt32)}
     */
    static MUI_INVALID_RC_CONFIG => 15102

    /**
     * Native name: ERROR_MUI_INVALID_LOCALE_NAME
     * @type {Integer (UInt32)}
     */
    static MUI_INVALID_LOCALE_NAME => 15103

    /**
     * Native name: ERROR_MUI_INVALID_ULTIMATEFALLBACK_NAME
     * @type {Integer (UInt32)}
     */
    static MUI_INVALID_ULTIMATEFALLBACK_NAME => 15104

    /**
     * Native name: ERROR_MUI_FILE_NOT_LOADED
     * @type {Integer (UInt32)}
     */
    static MUI_FILE_NOT_LOADED => 15105

    /**
     * Native name: ERROR_RESOURCE_ENUM_USER_STOP
     * @type {Integer (UInt32)}
     */
    static RESOURCE_ENUM_USER_STOP => 15106

    /**
     * Native name: ERROR_MUI_INTLSETTINGS_UILANG_NOT_INSTALLED
     * @type {Integer (UInt32)}
     */
    static MUI_INTLSETTINGS_UILANG_NOT_INSTALLED => 15107

    /**
     * Native name: ERROR_MUI_INTLSETTINGS_INVALID_LOCALE_NAME
     * @type {Integer (UInt32)}
     */
    static MUI_INTLSETTINGS_INVALID_LOCALE_NAME => 15108

    /**
     * Native name: ERROR_MRM_RUNTIME_NO_DEFAULT_OR_NEUTRAL_RESOURCE
     * @type {Integer (UInt32)}
     */
    static MRM_RUNTIME_NO_DEFAULT_OR_NEUTRAL_RESOURCE => 15110

    /**
     * Native name: ERROR_MRM_INVALID_PRICONFIG
     * @type {Integer (UInt32)}
     */
    static MRM_INVALID_PRICONFIG => 15111

    /**
     * Native name: ERROR_MRM_INVALID_FILE_TYPE
     * @type {Integer (UInt32)}
     */
    static MRM_INVALID_FILE_TYPE => 15112

    /**
     * Native name: ERROR_MRM_UNKNOWN_QUALIFIER
     * @type {Integer (UInt32)}
     */
    static MRM_UNKNOWN_QUALIFIER => 15113

    /**
     * Native name: ERROR_MRM_INVALID_QUALIFIER_VALUE
     * @type {Integer (UInt32)}
     */
    static MRM_INVALID_QUALIFIER_VALUE => 15114

    /**
     * Native name: ERROR_MRM_NO_CANDIDATE
     * @type {Integer (UInt32)}
     */
    static MRM_NO_CANDIDATE => 15115

    /**
     * Native name: ERROR_MRM_NO_MATCH_OR_DEFAULT_CANDIDATE
     * @type {Integer (UInt32)}
     */
    static MRM_NO_MATCH_OR_DEFAULT_CANDIDATE => 15116

    /**
     * Native name: ERROR_MRM_RESOURCE_TYPE_MISMATCH
     * @type {Integer (UInt32)}
     */
    static MRM_RESOURCE_TYPE_MISMATCH => 15117

    /**
     * Native name: ERROR_MRM_DUPLICATE_MAP_NAME
     * @type {Integer (UInt32)}
     */
    static MRM_DUPLICATE_MAP_NAME => 15118

    /**
     * Native name: ERROR_MRM_DUPLICATE_ENTRY
     * @type {Integer (UInt32)}
     */
    static MRM_DUPLICATE_ENTRY => 15119

    /**
     * Native name: ERROR_MRM_INVALID_RESOURCE_IDENTIFIER
     * @type {Integer (UInt32)}
     */
    static MRM_INVALID_RESOURCE_IDENTIFIER => 15120

    /**
     * Native name: ERROR_MRM_FILEPATH_TOO_LONG
     * @type {Integer (UInt32)}
     */
    static MRM_FILEPATH_TOO_LONG => 15121

    /**
     * Native name: ERROR_MRM_UNSUPPORTED_DIRECTORY_TYPE
     * @type {Integer (UInt32)}
     */
    static MRM_UNSUPPORTED_DIRECTORY_TYPE => 15122

    /**
     * Native name: ERROR_MRM_INVALID_PRI_FILE
     * @type {Integer (UInt32)}
     */
    static MRM_INVALID_PRI_FILE => 15126

    /**
     * Native name: ERROR_MRM_NAMED_RESOURCE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static MRM_NAMED_RESOURCE_NOT_FOUND => 15127

    /**
     * Native name: ERROR_MRM_MAP_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static MRM_MAP_NOT_FOUND => 15135

    /**
     * Native name: ERROR_MRM_UNSUPPORTED_PROFILE_TYPE
     * @type {Integer (UInt32)}
     */
    static MRM_UNSUPPORTED_PROFILE_TYPE => 15136

    /**
     * Native name: ERROR_MRM_INVALID_QUALIFIER_OPERATOR
     * @type {Integer (UInt32)}
     */
    static MRM_INVALID_QUALIFIER_OPERATOR => 15137

    /**
     * Native name: ERROR_MRM_INDETERMINATE_QUALIFIER_VALUE
     * @type {Integer (UInt32)}
     */
    static MRM_INDETERMINATE_QUALIFIER_VALUE => 15138

    /**
     * Native name: ERROR_MRM_AUTOMERGE_ENABLED
     * @type {Integer (UInt32)}
     */
    static MRM_AUTOMERGE_ENABLED => 15139

    /**
     * Native name: ERROR_MRM_TOO_MANY_RESOURCES
     * @type {Integer (UInt32)}
     */
    static MRM_TOO_MANY_RESOURCES => 15140

    /**
     * Native name: ERROR_MRM_UNSUPPORTED_FILE_TYPE_FOR_MERGE
     * @type {Integer (UInt32)}
     */
    static MRM_UNSUPPORTED_FILE_TYPE_FOR_MERGE => 15141

    /**
     * Native name: ERROR_MRM_UNSUPPORTED_FILE_TYPE_FOR_LOAD_UNLOAD_PRI_FILE
     * @type {Integer (UInt32)}
     */
    static MRM_UNSUPPORTED_FILE_TYPE_FOR_LOAD_UNLOAD_PRI_FILE => 15142

    /**
     * Native name: ERROR_MRM_NO_CURRENT_VIEW_ON_THREAD
     * @type {Integer (UInt32)}
     */
    static MRM_NO_CURRENT_VIEW_ON_THREAD => 15143

    /**
     * Native name: ERROR_DIFFERENT_PROFILE_RESOURCE_MANAGER_EXIST
     * @type {Integer (UInt32)}
     */
    static DIFFERENT_PROFILE_RESOURCE_MANAGER_EXIST => 15144

    /**
     * Native name: ERROR_OPERATION_NOT_ALLOWED_FROM_SYSTEM_COMPONENT
     * @type {Integer (UInt32)}
     */
    static OPERATION_NOT_ALLOWED_FROM_SYSTEM_COMPONENT => 15145

    /**
     * Native name: ERROR_MRM_DIRECT_REF_TO_NON_DEFAULT_RESOURCE
     * @type {Integer (UInt32)}
     */
    static MRM_DIRECT_REF_TO_NON_DEFAULT_RESOURCE => 15146

    /**
     * Native name: ERROR_MRM_GENERATION_COUNT_MISMATCH
     * @type {Integer (UInt32)}
     */
    static MRM_GENERATION_COUNT_MISMATCH => 15147

    /**
     * Native name: ERROR_PRI_MERGE_VERSION_MISMATCH
     * @type {Integer (UInt32)}
     */
    static PRI_MERGE_VERSION_MISMATCH => 15148

    /**
     * Native name: ERROR_PRI_MERGE_MISSING_SCHEMA
     * @type {Integer (UInt32)}
     */
    static PRI_MERGE_MISSING_SCHEMA => 15149

    /**
     * Native name: ERROR_PRI_MERGE_LOAD_FILE_FAILED
     * @type {Integer (UInt32)}
     */
    static PRI_MERGE_LOAD_FILE_FAILED => 15150

    /**
     * Native name: ERROR_PRI_MERGE_ADD_FILE_FAILED
     * @type {Integer (UInt32)}
     */
    static PRI_MERGE_ADD_FILE_FAILED => 15151

    /**
     * Native name: ERROR_PRI_MERGE_WRITE_FILE_FAILED
     * @type {Integer (UInt32)}
     */
    static PRI_MERGE_WRITE_FILE_FAILED => 15152

    /**
     * Native name: ERROR_PRI_MERGE_MULTIPLE_PACKAGE_FAMILIES_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static PRI_MERGE_MULTIPLE_PACKAGE_FAMILIES_NOT_ALLOWED => 15153

    /**
     * Native name: ERROR_PRI_MERGE_MULTIPLE_MAIN_PACKAGES_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static PRI_MERGE_MULTIPLE_MAIN_PACKAGES_NOT_ALLOWED => 15154

    /**
     * Native name: ERROR_PRI_MERGE_BUNDLE_PACKAGES_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static PRI_MERGE_BUNDLE_PACKAGES_NOT_ALLOWED => 15155

    /**
     * Native name: ERROR_PRI_MERGE_MAIN_PACKAGE_REQUIRED
     * @type {Integer (UInt32)}
     */
    static PRI_MERGE_MAIN_PACKAGE_REQUIRED => 15156

    /**
     * Native name: ERROR_PRI_MERGE_RESOURCE_PACKAGE_REQUIRED
     * @type {Integer (UInt32)}
     */
    static PRI_MERGE_RESOURCE_PACKAGE_REQUIRED => 15157

    /**
     * Native name: ERROR_PRI_MERGE_INVALID_FILE_NAME
     * @type {Integer (UInt32)}
     */
    static PRI_MERGE_INVALID_FILE_NAME => 15158

    /**
     * Native name: ERROR_MRM_PACKAGE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static MRM_PACKAGE_NOT_FOUND => 15159

    /**
     * Native name: ERROR_MRM_MISSING_DEFAULT_LANGUAGE
     * @type {Integer (UInt32)}
     */
    static MRM_MISSING_DEFAULT_LANGUAGE => 15160

    /**
     * Native name: ERROR_MRM_SCOPE_ITEM_CONFLICT
     * @type {Integer (UInt32)}
     */
    static MRM_SCOPE_ITEM_CONFLICT => 15161

    /**
     * Native name: ERROR_MCA_INVALID_CAPABILITIES_STRING
     * @type {Integer (UInt32)}
     */
    static MCA_INVALID_CAPABILITIES_STRING => 15200

    /**
     * Native name: ERROR_MCA_INVALID_VCP_VERSION
     * @type {Integer (UInt32)}
     */
    static MCA_INVALID_VCP_VERSION => 15201

    /**
     * Native name: ERROR_MCA_MONITOR_VIOLATES_MCCS_SPECIFICATION
     * @type {Integer (UInt32)}
     */
    static MCA_MONITOR_VIOLATES_MCCS_SPECIFICATION => 15202

    /**
     * Native name: ERROR_MCA_MCCS_VERSION_MISMATCH
     * @type {Integer (UInt32)}
     */
    static MCA_MCCS_VERSION_MISMATCH => 15203

    /**
     * Native name: ERROR_MCA_UNSUPPORTED_MCCS_VERSION
     * @type {Integer (UInt32)}
     */
    static MCA_UNSUPPORTED_MCCS_VERSION => 15204

    /**
     * Native name: ERROR_MCA_INTERNAL_ERROR
     * @type {Integer (UInt32)}
     */
    static MCA_INTERNAL_ERROR => 15205

    /**
     * Native name: ERROR_MCA_INVALID_TECHNOLOGY_TYPE_RETURNED
     * @type {Integer (UInt32)}
     */
    static MCA_INVALID_TECHNOLOGY_TYPE_RETURNED => 15206

    /**
     * Native name: ERROR_MCA_UNSUPPORTED_COLOR_TEMPERATURE
     * @type {Integer (UInt32)}
     */
    static MCA_UNSUPPORTED_COLOR_TEMPERATURE => 15207

    /**
     * Native name: ERROR_AMBIGUOUS_SYSTEM_DEVICE
     * @type {Integer (UInt32)}
     */
    static AMBIGUOUS_SYSTEM_DEVICE => 15250

    /**
     * Native name: ERROR_SYSTEM_DEVICE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static SYSTEM_DEVICE_NOT_FOUND => 15299

    /**
     * Native name: ERROR_HASH_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static HASH_NOT_SUPPORTED => 15300

    /**
     * Native name: ERROR_HASH_NOT_PRESENT
     * @type {Integer (UInt32)}
     */
    static HASH_NOT_PRESENT => 15301

    /**
     * Native name: ERROR_SECONDARY_IC_PROVIDER_NOT_REGISTERED
     * @type {Integer (UInt32)}
     */
    static SECONDARY_IC_PROVIDER_NOT_REGISTERED => 15321

    /**
     * Native name: ERROR_GPIO_CLIENT_INFORMATION_INVALID
     * @type {Integer (UInt32)}
     */
    static GPIO_CLIENT_INFORMATION_INVALID => 15322

    /**
     * Native name: ERROR_GPIO_VERSION_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static GPIO_VERSION_NOT_SUPPORTED => 15323

    /**
     * Native name: ERROR_GPIO_INVALID_REGISTRATION_PACKET
     * @type {Integer (UInt32)}
     */
    static GPIO_INVALID_REGISTRATION_PACKET => 15324

    /**
     * Native name: ERROR_GPIO_OPERATION_DENIED
     * @type {Integer (UInt32)}
     */
    static GPIO_OPERATION_DENIED => 15325

    /**
     * Native name: ERROR_GPIO_INCOMPATIBLE_CONNECT_MODE
     * @type {Integer (UInt32)}
     */
    static GPIO_INCOMPATIBLE_CONNECT_MODE => 15326

    /**
     * Native name: ERROR_GPIO_INTERRUPT_ALREADY_UNMASKED
     * @type {Integer (UInt32)}
     */
    static GPIO_INTERRUPT_ALREADY_UNMASKED => 15327

    /**
     * Native name: ERROR_CANNOT_COMPOSE_APISET_EXTENSION
     * @type {Integer (UInt32)}
     */
    static CANNOT_COMPOSE_APISET_EXTENSION => 15380

    /**
     * Native name: ERROR_APISET_SCHEMA_VERSION_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static APISET_SCHEMA_VERSION_NOT_SUPPORTED => 15381

    /**
     * Native name: ERROR_CANNOT_SWITCH_RUNLEVEL
     * @type {Integer (UInt32)}
     */
    static CANNOT_SWITCH_RUNLEVEL => 15400

    /**
     * Native name: ERROR_INVALID_RUNLEVEL_SETTING
     * @type {Integer (UInt32)}
     */
    static INVALID_RUNLEVEL_SETTING => 15401

    /**
     * Native name: ERROR_RUNLEVEL_SWITCH_TIMEOUT
     * @type {Integer (UInt32)}
     */
    static RUNLEVEL_SWITCH_TIMEOUT => 15402

    /**
     * Native name: ERROR_RUNLEVEL_SWITCH_AGENT_TIMEOUT
     * @type {Integer (UInt32)}
     */
    static RUNLEVEL_SWITCH_AGENT_TIMEOUT => 15403

    /**
     * Native name: ERROR_RUNLEVEL_SWITCH_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static RUNLEVEL_SWITCH_IN_PROGRESS => 15404

    /**
     * Native name: ERROR_SERVICES_FAILED_AUTOSTART
     * @type {Integer (UInt32)}
     */
    static SERVICES_FAILED_AUTOSTART => 15405

    /**
     * Native name: ERROR_COM_TASK_STOP_PENDING
     * @type {Integer (UInt32)}
     */
    static COM_TASK_STOP_PENDING => 15501

    /**
     * Native name: ERROR_INSTALL_OPEN_PACKAGE_FAILED
     * @type {Integer (UInt32)}
     */
    static INSTALL_OPEN_PACKAGE_FAILED => 15600

    /**
     * Native name: ERROR_INSTALL_PACKAGE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static INSTALL_PACKAGE_NOT_FOUND => 15601

    /**
     * Native name: ERROR_INSTALL_INVALID_PACKAGE
     * @type {Integer (UInt32)}
     */
    static INSTALL_INVALID_PACKAGE => 15602

    /**
     * Native name: ERROR_INSTALL_RESOLVE_DEPENDENCY_FAILED
     * @type {Integer (UInt32)}
     */
    static INSTALL_RESOLVE_DEPENDENCY_FAILED => 15603

    /**
     * Native name: ERROR_INSTALL_OUT_OF_DISK_SPACE
     * @type {Integer (UInt32)}
     */
    static INSTALL_OUT_OF_DISK_SPACE => 15604

    /**
     * Native name: ERROR_INSTALL_NETWORK_FAILURE
     * @type {Integer (UInt32)}
     */
    static INSTALL_NETWORK_FAILURE => 15605

    /**
     * Native name: ERROR_INSTALL_REGISTRATION_FAILURE
     * @type {Integer (UInt32)}
     */
    static INSTALL_REGISTRATION_FAILURE => 15606

    /**
     * Native name: ERROR_INSTALL_DEREGISTRATION_FAILURE
     * @type {Integer (UInt32)}
     */
    static INSTALL_DEREGISTRATION_FAILURE => 15607

    /**
     * Native name: ERROR_INSTALL_CANCEL
     * @type {Integer (UInt32)}
     */
    static INSTALL_CANCEL => 15608

    /**
     * Native name: ERROR_INSTALL_FAILED
     * @type {Integer (UInt32)}
     */
    static INSTALL_FAILED => 15609

    /**
     * Native name: ERROR_REMOVE_FAILED
     * @type {Integer (UInt32)}
     */
    static REMOVE_FAILED => 15610

    /**
     * Native name: ERROR_PACKAGE_ALREADY_EXISTS
     * @type {Integer (UInt32)}
     */
    static PACKAGE_ALREADY_EXISTS => 15611

    /**
     * Native name: ERROR_NEEDS_REMEDIATION
     * @type {Integer (UInt32)}
     */
    static NEEDS_REMEDIATION => 15612

    /**
     * Native name: ERROR_INSTALL_PREREQUISITE_FAILED
     * @type {Integer (UInt32)}
     */
    static INSTALL_PREREQUISITE_FAILED => 15613

    /**
     * Native name: ERROR_PACKAGE_REPOSITORY_CORRUPTED
     * @type {Integer (UInt32)}
     */
    static PACKAGE_REPOSITORY_CORRUPTED => 15614

    /**
     * Native name: ERROR_INSTALL_POLICY_FAILURE
     * @type {Integer (UInt32)}
     */
    static INSTALL_POLICY_FAILURE => 15615

    /**
     * Native name: ERROR_PACKAGE_UPDATING
     * @type {Integer (UInt32)}
     */
    static PACKAGE_UPDATING => 15616

    /**
     * Native name: ERROR_DEPLOYMENT_BLOCKED_BY_POLICY
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_BLOCKED_BY_POLICY => 15617

    /**
     * Native name: ERROR_PACKAGES_IN_USE
     * @type {Integer (UInt32)}
     */
    static PACKAGES_IN_USE => 15618

    /**
     * Native name: ERROR_RECOVERY_FILE_CORRUPT
     * @type {Integer (UInt32)}
     */
    static RECOVERY_FILE_CORRUPT => 15619

    /**
     * Native name: ERROR_INVALID_STAGED_SIGNATURE
     * @type {Integer (UInt32)}
     */
    static INVALID_STAGED_SIGNATURE => 15620

    /**
     * Native name: ERROR_DELETING_EXISTING_APPLICATIONDATA_STORE_FAILED
     * @type {Integer (UInt32)}
     */
    static DELETING_EXISTING_APPLICATIONDATA_STORE_FAILED => 15621

    /**
     * Native name: ERROR_INSTALL_PACKAGE_DOWNGRADE
     * @type {Integer (UInt32)}
     */
    static INSTALL_PACKAGE_DOWNGRADE => 15622

    /**
     * Native name: ERROR_SYSTEM_NEEDS_REMEDIATION
     * @type {Integer (UInt32)}
     */
    static SYSTEM_NEEDS_REMEDIATION => 15623

    /**
     * Native name: ERROR_APPX_INTEGRITY_FAILURE_CLR_NGEN
     * @type {Integer (UInt32)}
     */
    static APPX_INTEGRITY_FAILURE_CLR_NGEN => 15624

    /**
     * Native name: ERROR_RESILIENCY_FILE_CORRUPT
     * @type {Integer (UInt32)}
     */
    static RESILIENCY_FILE_CORRUPT => 15625

    /**
     * Native name: ERROR_INSTALL_FIREWALL_SERVICE_NOT_RUNNING
     * @type {Integer (UInt32)}
     */
    static INSTALL_FIREWALL_SERVICE_NOT_RUNNING => 15626

    /**
     * Native name: ERROR_PACKAGE_MOVE_FAILED
     * @type {Integer (UInt32)}
     */
    static PACKAGE_MOVE_FAILED => 15627

    /**
     * Native name: ERROR_INSTALL_VOLUME_NOT_EMPTY
     * @type {Integer (UInt32)}
     */
    static INSTALL_VOLUME_NOT_EMPTY => 15628

    /**
     * Native name: ERROR_INSTALL_VOLUME_OFFLINE
     * @type {Integer (UInt32)}
     */
    static INSTALL_VOLUME_OFFLINE => 15629

    /**
     * Native name: ERROR_INSTALL_VOLUME_CORRUPT
     * @type {Integer (UInt32)}
     */
    static INSTALL_VOLUME_CORRUPT => 15630

    /**
     * Native name: ERROR_NEEDS_REGISTRATION
     * @type {Integer (UInt32)}
     */
    static NEEDS_REGISTRATION => 15631

    /**
     * Native name: ERROR_INSTALL_WRONG_PROCESSOR_ARCHITECTURE
     * @type {Integer (UInt32)}
     */
    static INSTALL_WRONG_PROCESSOR_ARCHITECTURE => 15632

    /**
     * Native name: ERROR_DEV_SIDELOAD_LIMIT_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static DEV_SIDELOAD_LIMIT_EXCEEDED => 15633

    /**
     * Native name: ERROR_INSTALL_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE
     * @type {Integer (UInt32)}
     */
    static INSTALL_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE => 15634

    /**
     * Native name: ERROR_PACKAGE_NOT_SUPPORTED_ON_FILESYSTEM
     * @type {Integer (UInt32)}
     */
    static PACKAGE_NOT_SUPPORTED_ON_FILESYSTEM => 15635

    /**
     * Native name: ERROR_PACKAGE_MOVE_BLOCKED_BY_STREAMING
     * @type {Integer (UInt32)}
     */
    static PACKAGE_MOVE_BLOCKED_BY_STREAMING => 15636

    /**
     * Native name: ERROR_INSTALL_OPTIONAL_PACKAGE_APPLICATIONID_NOT_UNIQUE
     * @type {Integer (UInt32)}
     */
    static INSTALL_OPTIONAL_PACKAGE_APPLICATIONID_NOT_UNIQUE => 15637

    /**
     * Native name: ERROR_PACKAGE_STAGING_ONHOLD
     * @type {Integer (UInt32)}
     */
    static PACKAGE_STAGING_ONHOLD => 15638

    /**
     * Native name: ERROR_INSTALL_INVALID_RELATED_SET_UPDATE
     * @type {Integer (UInt32)}
     */
    static INSTALL_INVALID_RELATED_SET_UPDATE => 15639

    /**
     * Native name: ERROR_INSTALL_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE_FULLTRUST_CAPABILITY
     * @type {Integer (UInt32)}
     */
    static INSTALL_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE_FULLTRUST_CAPABILITY => 15640

    /**
     * Native name: ERROR_DEPLOYMENT_BLOCKED_BY_USER_LOG_OFF
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_BLOCKED_BY_USER_LOG_OFF => 15641

    /**
     * Native name: ERROR_PROVISION_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE_PROVISIONED
     * @type {Integer (UInt32)}
     */
    static PROVISION_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE_PROVISIONED => 15642

    /**
     * Native name: ERROR_PACKAGES_REPUTATION_CHECK_FAILED
     * @type {Integer (UInt32)}
     */
    static PACKAGES_REPUTATION_CHECK_FAILED => 15643

    /**
     * Native name: ERROR_PACKAGES_REPUTATION_CHECK_TIMEDOUT
     * @type {Integer (UInt32)}
     */
    static PACKAGES_REPUTATION_CHECK_TIMEDOUT => 15644

    /**
     * Native name: ERROR_DEPLOYMENT_OPTION_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_OPTION_NOT_SUPPORTED => 15645

    /**
     * Native name: ERROR_APPINSTALLER_ACTIVATION_BLOCKED
     * @type {Integer (UInt32)}
     */
    static APPINSTALLER_ACTIVATION_BLOCKED => 15646

    /**
     * Native name: ERROR_REGISTRATION_FROM_REMOTE_DRIVE_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static REGISTRATION_FROM_REMOTE_DRIVE_NOT_SUPPORTED => 15647

    /**
     * Native name: ERROR_APPX_RAW_DATA_WRITE_FAILED
     * @type {Integer (UInt32)}
     */
    static APPX_RAW_DATA_WRITE_FAILED => 15648

    /**
     * Native name: ERROR_DEPLOYMENT_BLOCKED_BY_VOLUME_POLICY_PACKAGE
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_BLOCKED_BY_VOLUME_POLICY_PACKAGE => 15649

    /**
     * Native name: ERROR_DEPLOYMENT_BLOCKED_BY_VOLUME_POLICY_MACHINE
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_BLOCKED_BY_VOLUME_POLICY_MACHINE => 15650

    /**
     * Native name: ERROR_DEPLOYMENT_BLOCKED_BY_PROFILE_POLICY
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_BLOCKED_BY_PROFILE_POLICY => 15651

    /**
     * Native name: ERROR_DEPLOYMENT_FAILED_CONFLICTING_MUTABLE_PACKAGE_DIRECTORY
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_FAILED_CONFLICTING_MUTABLE_PACKAGE_DIRECTORY => 15652

    /**
     * Native name: ERROR_SINGLETON_RESOURCE_INSTALLED_IN_ACTIVE_USER
     * @type {Integer (UInt32)}
     */
    static SINGLETON_RESOURCE_INSTALLED_IN_ACTIVE_USER => 15653

    /**
     * Native name: ERROR_DIFFERENT_VERSION_OF_PACKAGED_SERVICE_INSTALLED
     * @type {Integer (UInt32)}
     */
    static DIFFERENT_VERSION_OF_PACKAGED_SERVICE_INSTALLED => 15654

    /**
     * Native name: ERROR_SERVICE_EXISTS_AS_NON_PACKAGED_SERVICE
     * @type {Integer (UInt32)}
     */
    static SERVICE_EXISTS_AS_NON_PACKAGED_SERVICE => 15655

    /**
     * Native name: ERROR_PACKAGED_SERVICE_REQUIRES_ADMIN_PRIVILEGES
     * @type {Integer (UInt32)}
     */
    static PACKAGED_SERVICE_REQUIRES_ADMIN_PRIVILEGES => 15656

    /**
     * Native name: ERROR_REDIRECTION_TO_DEFAULT_ACCOUNT_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static REDIRECTION_TO_DEFAULT_ACCOUNT_NOT_ALLOWED => 15657

    /**
     * Native name: ERROR_PACKAGE_LACKS_CAPABILITY_TO_DEPLOY_ON_HOST
     * @type {Integer (UInt32)}
     */
    static PACKAGE_LACKS_CAPABILITY_TO_DEPLOY_ON_HOST => 15658

    /**
     * Native name: ERROR_UNSIGNED_PACKAGE_INVALID_CONTENT
     * @type {Integer (UInt32)}
     */
    static UNSIGNED_PACKAGE_INVALID_CONTENT => 15659

    /**
     * Native name: ERROR_UNSIGNED_PACKAGE_INVALID_PUBLISHER_NAMESPACE
     * @type {Integer (UInt32)}
     */
    static UNSIGNED_PACKAGE_INVALID_PUBLISHER_NAMESPACE => 15660

    /**
     * Native name: ERROR_SIGNED_PACKAGE_INVALID_PUBLISHER_NAMESPACE
     * @type {Integer (UInt32)}
     */
    static SIGNED_PACKAGE_INVALID_PUBLISHER_NAMESPACE => 15661

    /**
     * Native name: ERROR_PACKAGE_EXTERNAL_LOCATION_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static PACKAGE_EXTERNAL_LOCATION_NOT_ALLOWED => 15662

    /**
     * Native name: ERROR_INSTALL_FULLTRUST_HOSTRUNTIME_REQUIRES_MAIN_PACKAGE_FULLTRUST_CAPABILITY
     * @type {Integer (UInt32)}
     */
    static INSTALL_FULLTRUST_HOSTRUNTIME_REQUIRES_MAIN_PACKAGE_FULLTRUST_CAPABILITY => 15663

    /**
     * Native name: ERROR_PACKAGE_LACKS_CAPABILITY_FOR_MANDATORY_STARTUPTASKS
     * @type {Integer (UInt32)}
     */
    static PACKAGE_LACKS_CAPABILITY_FOR_MANDATORY_STARTUPTASKS => 15664

    /**
     * Native name: ERROR_INSTALL_RESOLVE_HOSTRUNTIME_DEPENDENCY_FAILED
     * @type {Integer (UInt32)}
     */
    static INSTALL_RESOLVE_HOSTRUNTIME_DEPENDENCY_FAILED => 15665

    /**
     * Native name: ERROR_MACHINE_SCOPE_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static MACHINE_SCOPE_NOT_ALLOWED => 15666

    /**
     * Native name: ERROR_CLASSIC_COMPAT_MODE_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static CLASSIC_COMPAT_MODE_NOT_ALLOWED => 15667

    /**
     * Native name: ERROR_STAGEFROMUPDATEAGENT_PACKAGE_NOT_APPLICABLE
     * @type {Integer (UInt32)}
     */
    static STAGEFROMUPDATEAGENT_PACKAGE_NOT_APPLICABLE => 15668

    /**
     * Native name: ERROR_PACKAGE_NOT_REGISTERED_FOR_USER
     * @type {Integer (UInt32)}
     */
    static PACKAGE_NOT_REGISTERED_FOR_USER => 15669

    /**
     * Native name: ERROR_PACKAGE_NAME_MISMATCH
     * @type {Integer (UInt32)}
     */
    static PACKAGE_NAME_MISMATCH => 15670

    /**
     * Native name: ERROR_APPINSTALLER_URI_IN_USE
     * @type {Integer (UInt32)}
     */
    static APPINSTALLER_URI_IN_USE => 15671

    /**
     * Native name: ERROR_APPINSTALLER_IS_MANAGED_BY_SYSTEM
     * @type {Integer (UInt32)}
     */
    static APPINSTALLER_IS_MANAGED_BY_SYSTEM => 15672

    /**
     * Native name: ERROR_SERVICE_BLOCKED_BY_SYSPREP_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static SERVICE_BLOCKED_BY_SYSPREP_IN_PROGRESS => 15673

    /**
     * Native name: ERROR_UNSUPPORTED_ARM32_PACKAGE_REQUIRES_REMEDIAITON
     * @type {Integer (UInt32)}
     */
    static UNSUPPORTED_ARM32_PACKAGE_REQUIRES_REMEDIAITON => 15674

    /**
     * Native name: ERROR_UUP_PRODUCT_NOT_APPLICABLE
     * @type {Integer (UInt32)}
     */
    static UUP_PRODUCT_NOT_APPLICABLE => 15675

    /**
     * Native name: ERROR_BLOCKED_BY_PENDING_PACKAGE_REMOVAL
     * @type {Integer (UInt32)}
     */
    static BLOCKED_BY_PENDING_PACKAGE_REMOVAL => 15676

    /**
     * Native name: ERROR_PACKAGE_REPOSITORY_ROOT_CORRUPTED
     * @type {Integer (UInt32)}
     */
    static PACKAGE_REPOSITORY_ROOT_CORRUPTED => 15677

    /**
     * Native name: ERROR_PACKAGE_MANIFEST_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static PACKAGE_MANIFEST_NOT_FOUND => 15678

    /**
     * Native name: ERROR_DEPLOYMENT_BLOCKED_BY_REMOVEDEFAULTPACKAGES_POLICY
     * @type {Integer (UInt32)}
     */
    static DEPLOYMENT_BLOCKED_BY_REMOVEDEFAULTPACKAGES_POLICY => 15679

    /**
     * Native name: ERROR_URI_BLOCKED_BY_POLICY_MSIXALLOWEDZONES
     * @type {Integer (UInt32)}
     */
    static URI_BLOCKED_BY_POLICY_MSIXALLOWEDZONES => 15680

    /**
     * Native name: ERROR_URI_RECOMMENDED_BLOCK_BY_SMARTSCREEN
     * @type {Integer (UInt32)}
     */
    static URI_RECOMMENDED_BLOCK_BY_SMARTSCREEN => 15681

    /**
     * @type {Integer (UInt32)}
     */
    static APPMODEL_ERROR_NO_PACKAGE => 15700

    /**
     * @type {Integer (UInt32)}
     */
    static APPMODEL_ERROR_PACKAGE_RUNTIME_CORRUPT => 15701

    /**
     * @type {Integer (UInt32)}
     */
    static APPMODEL_ERROR_PACKAGE_IDENTITY_CORRUPT => 15702

    /**
     * @type {Integer (UInt32)}
     */
    static APPMODEL_ERROR_NO_APPLICATION => 15703

    /**
     * @type {Integer (UInt32)}
     */
    static APPMODEL_ERROR_DYNAMIC_PROPERTY_READ_FAILED => 15704

    /**
     * @type {Integer (UInt32)}
     */
    static APPMODEL_ERROR_DYNAMIC_PROPERTY_INVALID => 15705

    /**
     * @type {Integer (UInt32)}
     */
    static APPMODEL_ERROR_PACKAGE_NOT_AVAILABLE => 15706

    /**
     * @type {Integer (UInt32)}
     */
    static APPMODEL_ERROR_NO_MUTABLE_DIRECTORY => 15707

    /**
     * Native name: ERROR_STATE_LOAD_STORE_FAILED
     * @type {Integer (UInt32)}
     */
    static STATE_LOAD_STORE_FAILED => 15800

    /**
     * Native name: ERROR_STATE_GET_VERSION_FAILED
     * @type {Integer (UInt32)}
     */
    static STATE_GET_VERSION_FAILED => 15801

    /**
     * Native name: ERROR_STATE_SET_VERSION_FAILED
     * @type {Integer (UInt32)}
     */
    static STATE_SET_VERSION_FAILED => 15802

    /**
     * Native name: ERROR_STATE_STRUCTURED_RESET_FAILED
     * @type {Integer (UInt32)}
     */
    static STATE_STRUCTURED_RESET_FAILED => 15803

    /**
     * Native name: ERROR_STATE_OPEN_CONTAINER_FAILED
     * @type {Integer (UInt32)}
     */
    static STATE_OPEN_CONTAINER_FAILED => 15804

    /**
     * Native name: ERROR_STATE_CREATE_CONTAINER_FAILED
     * @type {Integer (UInt32)}
     */
    static STATE_CREATE_CONTAINER_FAILED => 15805

    /**
     * Native name: ERROR_STATE_DELETE_CONTAINER_FAILED
     * @type {Integer (UInt32)}
     */
    static STATE_DELETE_CONTAINER_FAILED => 15806

    /**
     * Native name: ERROR_STATE_READ_SETTING_FAILED
     * @type {Integer (UInt32)}
     */
    static STATE_READ_SETTING_FAILED => 15807

    /**
     * Native name: ERROR_STATE_WRITE_SETTING_FAILED
     * @type {Integer (UInt32)}
     */
    static STATE_WRITE_SETTING_FAILED => 15808

    /**
     * Native name: ERROR_STATE_DELETE_SETTING_FAILED
     * @type {Integer (UInt32)}
     */
    static STATE_DELETE_SETTING_FAILED => 15809

    /**
     * Native name: ERROR_STATE_QUERY_SETTING_FAILED
     * @type {Integer (UInt32)}
     */
    static STATE_QUERY_SETTING_FAILED => 15810

    /**
     * Native name: ERROR_STATE_READ_COMPOSITE_SETTING_FAILED
     * @type {Integer (UInt32)}
     */
    static STATE_READ_COMPOSITE_SETTING_FAILED => 15811

    /**
     * Native name: ERROR_STATE_WRITE_COMPOSITE_SETTING_FAILED
     * @type {Integer (UInt32)}
     */
    static STATE_WRITE_COMPOSITE_SETTING_FAILED => 15812

    /**
     * Native name: ERROR_STATE_ENUMERATE_CONTAINER_FAILED
     * @type {Integer (UInt32)}
     */
    static STATE_ENUMERATE_CONTAINER_FAILED => 15813

    /**
     * Native name: ERROR_STATE_ENUMERATE_SETTINGS_FAILED
     * @type {Integer (UInt32)}
     */
    static STATE_ENUMERATE_SETTINGS_FAILED => 15814

    /**
     * Native name: ERROR_STATE_COMPOSITE_SETTING_VALUE_SIZE_LIMIT_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static STATE_COMPOSITE_SETTING_VALUE_SIZE_LIMIT_EXCEEDED => 15815

    /**
     * Native name: ERROR_STATE_SETTING_VALUE_SIZE_LIMIT_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static STATE_SETTING_VALUE_SIZE_LIMIT_EXCEEDED => 15816

    /**
     * Native name: ERROR_STATE_SETTING_NAME_SIZE_LIMIT_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static STATE_SETTING_NAME_SIZE_LIMIT_EXCEEDED => 15817

    /**
     * Native name: ERROR_STATE_CONTAINER_NAME_SIZE_LIMIT_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static STATE_CONTAINER_NAME_SIZE_LIMIT_EXCEEDED => 15818

    /**
     * Native name: ERROR_API_UNAVAILABLE
     * @type {Integer (UInt32)}
     */
    static API_UNAVAILABLE => 15841

    /**
     * Native name: ERROR_NDIS_INTERFACE_CLOSING
     * @type {Integer (UInt32)}
     */
    static NDIS_INTERFACE_CLOSING => 2150891522

    /**
     * Native name: ERROR_NDIS_BAD_VERSION
     * @type {Integer (UInt32)}
     */
    static NDIS_BAD_VERSION => 2150891524

    /**
     * Native name: ERROR_NDIS_BAD_CHARACTERISTICS
     * @type {Integer (UInt32)}
     */
    static NDIS_BAD_CHARACTERISTICS => 2150891525

    /**
     * Native name: ERROR_NDIS_ADAPTER_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static NDIS_ADAPTER_NOT_FOUND => 2150891526

    /**
     * Native name: ERROR_NDIS_OPEN_FAILED
     * @type {Integer (UInt32)}
     */
    static NDIS_OPEN_FAILED => 2150891527

    /**
     * Native name: ERROR_NDIS_DEVICE_FAILED
     * @type {Integer (UInt32)}
     */
    static NDIS_DEVICE_FAILED => 2150891528

    /**
     * Native name: ERROR_NDIS_MULTICAST_FULL
     * @type {Integer (UInt32)}
     */
    static NDIS_MULTICAST_FULL => 2150891529

    /**
     * Native name: ERROR_NDIS_MULTICAST_EXISTS
     * @type {Integer (UInt32)}
     */
    static NDIS_MULTICAST_EXISTS => 2150891530

    /**
     * Native name: ERROR_NDIS_MULTICAST_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static NDIS_MULTICAST_NOT_FOUND => 2150891531

    /**
     * Native name: ERROR_NDIS_REQUEST_ABORTED
     * @type {Integer (UInt32)}
     */
    static NDIS_REQUEST_ABORTED => 2150891532

    /**
     * Native name: ERROR_NDIS_RESET_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static NDIS_RESET_IN_PROGRESS => 2150891533

    /**
     * Native name: ERROR_NDIS_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static NDIS_NOT_SUPPORTED => 2150891707

    /**
     * Native name: ERROR_NDIS_INVALID_PACKET
     * @type {Integer (UInt32)}
     */
    static NDIS_INVALID_PACKET => 2150891535

    /**
     * Native name: ERROR_NDIS_ADAPTER_NOT_READY
     * @type {Integer (UInt32)}
     */
    static NDIS_ADAPTER_NOT_READY => 2150891537

    /**
     * Native name: ERROR_NDIS_INVALID_LENGTH
     * @type {Integer (UInt32)}
     */
    static NDIS_INVALID_LENGTH => 2150891540

    /**
     * Native name: ERROR_NDIS_INVALID_DATA
     * @type {Integer (UInt32)}
     */
    static NDIS_INVALID_DATA => 2150891541

    /**
     * Native name: ERROR_NDIS_BUFFER_TOO_SHORT
     * @type {Integer (UInt32)}
     */
    static NDIS_BUFFER_TOO_SHORT => 2150891542

    /**
     * Native name: ERROR_NDIS_INVALID_OID
     * @type {Integer (UInt32)}
     */
    static NDIS_INVALID_OID => 2150891543

    /**
     * Native name: ERROR_NDIS_ADAPTER_REMOVED
     * @type {Integer (UInt32)}
     */
    static NDIS_ADAPTER_REMOVED => 2150891544

    /**
     * Native name: ERROR_NDIS_UNSUPPORTED_MEDIA
     * @type {Integer (UInt32)}
     */
    static NDIS_UNSUPPORTED_MEDIA => 2150891545

    /**
     * Native name: ERROR_NDIS_GROUP_ADDRESS_IN_USE
     * @type {Integer (UInt32)}
     */
    static NDIS_GROUP_ADDRESS_IN_USE => 2150891546

    /**
     * Native name: ERROR_NDIS_FILE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static NDIS_FILE_NOT_FOUND => 2150891547

    /**
     * Native name: ERROR_NDIS_ERROR_READING_FILE
     * @type {Integer (UInt32)}
     */
    static NDIS_ERROR_READING_FILE => 2150891548

    /**
     * Native name: ERROR_NDIS_ALREADY_MAPPED
     * @type {Integer (UInt32)}
     */
    static NDIS_ALREADY_MAPPED => 2150891549

    /**
     * Native name: ERROR_NDIS_RESOURCE_CONFLICT
     * @type {Integer (UInt32)}
     */
    static NDIS_RESOURCE_CONFLICT => 2150891550

    /**
     * Native name: ERROR_NDIS_MEDIA_DISCONNECTED
     * @type {Integer (UInt32)}
     */
    static NDIS_MEDIA_DISCONNECTED => 2150891551

    /**
     * Native name: ERROR_NDIS_INVALID_ADDRESS
     * @type {Integer (UInt32)}
     */
    static NDIS_INVALID_ADDRESS => 2150891554

    /**
     * Native name: ERROR_NDIS_INVALID_DEVICE_REQUEST
     * @type {Integer (UInt32)}
     */
    static NDIS_INVALID_DEVICE_REQUEST => 2150891536

    /**
     * Native name: ERROR_NDIS_PAUSED
     * @type {Integer (UInt32)}
     */
    static NDIS_PAUSED => 2150891562

    /**
     * Native name: ERROR_NDIS_INTERFACE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static NDIS_INTERFACE_NOT_FOUND => 2150891563

    /**
     * Native name: ERROR_NDIS_UNSUPPORTED_REVISION
     * @type {Integer (UInt32)}
     */
    static NDIS_UNSUPPORTED_REVISION => 2150891564

    /**
     * Native name: ERROR_NDIS_INVALID_PORT
     * @type {Integer (UInt32)}
     */
    static NDIS_INVALID_PORT => 2150891565

    /**
     * Native name: ERROR_NDIS_INVALID_PORT_STATE
     * @type {Integer (UInt32)}
     */
    static NDIS_INVALID_PORT_STATE => 2150891566

    /**
     * Native name: ERROR_NDIS_LOW_POWER_STATE
     * @type {Integer (UInt32)}
     */
    static NDIS_LOW_POWER_STATE => 2150891567

    /**
     * Native name: ERROR_NDIS_REINIT_REQUIRED
     * @type {Integer (UInt32)}
     */
    static NDIS_REINIT_REQUIRED => 2150891568

    /**
     * Native name: ERROR_NDIS_NO_QUEUES
     * @type {Integer (UInt32)}
     */
    static NDIS_NO_QUEUES => 2150891569

    /**
     * Native name: ERROR_NDIS_DOT11_AUTO_CONFIG_ENABLED
     * @type {Integer (UInt32)}
     */
    static NDIS_DOT11_AUTO_CONFIG_ENABLED => 2150899712

    /**
     * Native name: ERROR_NDIS_DOT11_MEDIA_IN_USE
     * @type {Integer (UInt32)}
     */
    static NDIS_DOT11_MEDIA_IN_USE => 2150899713

    /**
     * Native name: ERROR_NDIS_DOT11_POWER_STATE_INVALID
     * @type {Integer (UInt32)}
     */
    static NDIS_DOT11_POWER_STATE_INVALID => 2150899714

    /**
     * Native name: ERROR_NDIS_PM_WOL_PATTERN_LIST_FULL
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_WOL_PATTERN_LIST_FULL => 2150899715

    /**
     * Native name: ERROR_NDIS_PM_PROTOCOL_OFFLOAD_LIST_FULL
     * @type {Integer (UInt32)}
     */
    static NDIS_PM_PROTOCOL_OFFLOAD_LIST_FULL => 2150899716

    /**
     * Native name: ERROR_NDIS_DOT11_AP_CHANNEL_CURRENTLY_NOT_AVAILABLE
     * @type {Integer (UInt32)}
     */
    static NDIS_DOT11_AP_CHANNEL_CURRENTLY_NOT_AVAILABLE => 2150899717

    /**
     * Native name: ERROR_NDIS_DOT11_AP_BAND_CURRENTLY_NOT_AVAILABLE
     * @type {Integer (UInt32)}
     */
    static NDIS_DOT11_AP_BAND_CURRENTLY_NOT_AVAILABLE => 2150899718

    /**
     * Native name: ERROR_NDIS_DOT11_AP_CHANNEL_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static NDIS_DOT11_AP_CHANNEL_NOT_ALLOWED => 2150899719

    /**
     * Native name: ERROR_NDIS_DOT11_AP_BAND_NOT_ALLOWED
     * @type {Integer (UInt32)}
     */
    static NDIS_DOT11_AP_BAND_NOT_ALLOWED => 2150899720

    /**
     * Native name: ERROR_NDIS_DOT11_AP_RADIO_RESTRICTION
     * @type {Integer (UInt32)}
     */
    static NDIS_DOT11_AP_RADIO_RESTRICTION => 2150899721

    /**
     * Native name: ERROR_NDIS_INDICATION_REQUIRED
     * @type {Integer (UInt32)}
     */
    static NDIS_INDICATION_REQUIRED => 3407873

    /**
     * Native name: ERROR_NDIS_OFFLOAD_POLICY
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_POLICY => 3224637455

    /**
     * Native name: ERROR_NDIS_OFFLOAD_CONNECTION_REJECTED
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_CONNECTION_REJECTED => 3224637458

    /**
     * Native name: ERROR_NDIS_OFFLOAD_PATH_REJECTED
     * @type {Integer (UInt32)}
     */
    static NDIS_OFFLOAD_PATH_REJECTED => 3224637459

    /**
     * Native name: ERROR_HV_INVALID_HYPERCALL_CODE
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_HYPERCALL_CODE => 3224698882

    /**
     * Native name: ERROR_HV_INVALID_HYPERCALL_INPUT
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_HYPERCALL_INPUT => 3224698883

    /**
     * Native name: ERROR_HV_INVALID_ALIGNMENT
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_ALIGNMENT => 3224698884

    /**
     * Native name: ERROR_HV_INVALID_PARAMETER
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_PARAMETER => 3224698885

    /**
     * Native name: ERROR_HV_ACCESS_DENIED
     * @type {Integer (UInt32)}
     */
    static HV_ACCESS_DENIED => 3224698886

    /**
     * Native name: ERROR_HV_INVALID_PARTITION_STATE
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_PARTITION_STATE => 3224698887

    /**
     * Native name: ERROR_HV_OPERATION_DENIED
     * @type {Integer (UInt32)}
     */
    static HV_OPERATION_DENIED => 3224698888

    /**
     * Native name: ERROR_HV_UNKNOWN_PROPERTY
     * @type {Integer (UInt32)}
     */
    static HV_UNKNOWN_PROPERTY => 3224698889

    /**
     * Native name: ERROR_HV_PROPERTY_VALUE_OUT_OF_RANGE
     * @type {Integer (UInt32)}
     */
    static HV_PROPERTY_VALUE_OUT_OF_RANGE => 3224698890

    /**
     * Native name: ERROR_HV_INSUFFICIENT_MEMORY
     * @type {Integer (UInt32)}
     */
    static HV_INSUFFICIENT_MEMORY => 3224698891

    /**
     * Native name: ERROR_HV_PARTITION_TOO_DEEP
     * @type {Integer (UInt32)}
     */
    static HV_PARTITION_TOO_DEEP => 3224698892

    /**
     * Native name: ERROR_HV_INVALID_PARTITION_ID
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_PARTITION_ID => 3224698893

    /**
     * Native name: ERROR_HV_INVALID_VP_INDEX
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_VP_INDEX => 3224698894

    /**
     * Native name: ERROR_HV_INVALID_PORT_ID
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_PORT_ID => 3224698897

    /**
     * Native name: ERROR_HV_INVALID_CONNECTION_ID
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_CONNECTION_ID => 3224698898

    /**
     * Native name: ERROR_HV_INSUFFICIENT_BUFFERS
     * @type {Integer (UInt32)}
     */
    static HV_INSUFFICIENT_BUFFERS => 3224698899

    /**
     * Native name: ERROR_HV_NOT_ACKNOWLEDGED
     * @type {Integer (UInt32)}
     */
    static HV_NOT_ACKNOWLEDGED => 3224698900

    /**
     * Native name: ERROR_HV_INVALID_VP_STATE
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_VP_STATE => 3224698901

    /**
     * Native name: ERROR_HV_ACKNOWLEDGED
     * @type {Integer (UInt32)}
     */
    static HV_ACKNOWLEDGED => 3224698902

    /**
     * Native name: ERROR_HV_INVALID_SAVE_RESTORE_STATE
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_SAVE_RESTORE_STATE => 3224698903

    /**
     * Native name: ERROR_HV_INVALID_SYNIC_STATE
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_SYNIC_STATE => 3224698904

    /**
     * Native name: ERROR_HV_OBJECT_IN_USE
     * @type {Integer (UInt32)}
     */
    static HV_OBJECT_IN_USE => 3224698905

    /**
     * Native name: ERROR_HV_INVALID_PROXIMITY_DOMAIN_INFO
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_PROXIMITY_DOMAIN_INFO => 3224698906

    /**
     * Native name: ERROR_HV_NO_DATA
     * @type {Integer (UInt32)}
     */
    static HV_NO_DATA => 3224698907

    /**
     * Native name: ERROR_HV_INACTIVE
     * @type {Integer (UInt32)}
     */
    static HV_INACTIVE => 3224698908

    /**
     * Native name: ERROR_HV_NO_RESOURCES
     * @type {Integer (UInt32)}
     */
    static HV_NO_RESOURCES => 3224698909

    /**
     * Native name: ERROR_HV_FEATURE_UNAVAILABLE
     * @type {Integer (UInt32)}
     */
    static HV_FEATURE_UNAVAILABLE => 3224698910

    /**
     * Native name: ERROR_HV_INSUFFICIENT_BUFFER
     * @type {Integer (UInt32)}
     */
    static HV_INSUFFICIENT_BUFFER => 3224698931

    /**
     * Native name: ERROR_HV_INSUFFICIENT_DEVICE_DOMAINS
     * @type {Integer (UInt32)}
     */
    static HV_INSUFFICIENT_DEVICE_DOMAINS => 3224698936

    /**
     * Native name: ERROR_HV_CPUID_FEATURE_VALIDATION
     * @type {Integer (UInt32)}
     */
    static HV_CPUID_FEATURE_VALIDATION => 3224698940

    /**
     * Native name: ERROR_HV_CPUID_XSAVE_FEATURE_VALIDATION
     * @type {Integer (UInt32)}
     */
    static HV_CPUID_XSAVE_FEATURE_VALIDATION => 3224698941

    /**
     * Native name: ERROR_HV_PROCESSOR_STARTUP_TIMEOUT
     * @type {Integer (UInt32)}
     */
    static HV_PROCESSOR_STARTUP_TIMEOUT => 3224698942

    /**
     * Native name: ERROR_HV_SMX_ENABLED
     * @type {Integer (UInt32)}
     */
    static HV_SMX_ENABLED => 3224698943

    /**
     * Native name: ERROR_HV_INVALID_LP_INDEX
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_LP_INDEX => 3224698945

    /**
     * Native name: ERROR_HV_INVALID_REGISTER_VALUE
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_REGISTER_VALUE => 3224698960

    /**
     * Native name: ERROR_HV_INVALID_VTL_STATE
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_VTL_STATE => 3224698961

    /**
     * Native name: ERROR_HV_NX_NOT_DETECTED
     * @type {Integer (UInt32)}
     */
    static HV_NX_NOT_DETECTED => 3224698965

    /**
     * Native name: ERROR_HV_INVALID_DEVICE_ID
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_DEVICE_ID => 3224698967

    /**
     * Native name: ERROR_HV_INVALID_DEVICE_STATE
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_DEVICE_STATE => 3224698968

    /**
     * Native name: ERROR_HV_PENDING_PAGE_REQUESTS
     * @type {Integer (UInt32)}
     */
    static HV_PENDING_PAGE_REQUESTS => 3473497

    /**
     * Native name: ERROR_HV_PAGE_REQUEST_INVALID
     * @type {Integer (UInt32)}
     */
    static HV_PAGE_REQUEST_INVALID => 3224698976

    /**
     * Native name: ERROR_HV_INVALID_CPU_GROUP_ID
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_CPU_GROUP_ID => 3224698991

    /**
     * Native name: ERROR_HV_INVALID_CPU_GROUP_STATE
     * @type {Integer (UInt32)}
     */
    static HV_INVALID_CPU_GROUP_STATE => 3224698992

    /**
     * Native name: ERROR_HV_OPERATION_FAILED
     * @type {Integer (UInt32)}
     */
    static HV_OPERATION_FAILED => 3224698993

    /**
     * Native name: ERROR_HV_NOT_ALLOWED_WITH_NESTED_VIRT_ACTIVE
     * @type {Integer (UInt32)}
     */
    static HV_NOT_ALLOWED_WITH_NESTED_VIRT_ACTIVE => 3224698994

    /**
     * Native name: ERROR_HV_INSUFFICIENT_ROOT_MEMORY
     * @type {Integer (UInt32)}
     */
    static HV_INSUFFICIENT_ROOT_MEMORY => 3224698995

    /**
     * Native name: ERROR_HV_EVENT_BUFFER_ALREADY_FREED
     * @type {Integer (UInt32)}
     */
    static HV_EVENT_BUFFER_ALREADY_FREED => 3224698996

    /**
     * Native name: ERROR_HV_INSUFFICIENT_CONTIGUOUS_MEMORY
     * @type {Integer (UInt32)}
     */
    static HV_INSUFFICIENT_CONTIGUOUS_MEMORY => 3224698997

    /**
     * Native name: ERROR_HV_DEVICE_NOT_IN_DOMAIN
     * @type {Integer (UInt32)}
     */
    static HV_DEVICE_NOT_IN_DOMAIN => 3224698998

    /**
     * Native name: ERROR_HV_NESTED_VM_EXIT
     * @type {Integer (UInt32)}
     */
    static HV_NESTED_VM_EXIT => 3224698999

    /**
     * Native name: ERROR_HV_MSR_ACCESS_FAILED
     * @type {Integer (UInt32)}
     */
    static HV_MSR_ACCESS_FAILED => 3224699008

    /**
     * Native name: ERROR_HV_INSUFFICIENT_MEMORY_MIRRORING
     * @type {Integer (UInt32)}
     */
    static HV_INSUFFICIENT_MEMORY_MIRRORING => 3224699009

    /**
     * Native name: ERROR_HV_INSUFFICIENT_CONTIGUOUS_MEMORY_MIRRORING
     * @type {Integer (UInt32)}
     */
    static HV_INSUFFICIENT_CONTIGUOUS_MEMORY_MIRRORING => 3224699010

    /**
     * Native name: ERROR_HV_INSUFFICIENT_CONTIGUOUS_ROOT_MEMORY
     * @type {Integer (UInt32)}
     */
    static HV_INSUFFICIENT_CONTIGUOUS_ROOT_MEMORY => 3224699011

    /**
     * Native name: ERROR_HV_INSUFFICIENT_ROOT_MEMORY_MIRRORING
     * @type {Integer (UInt32)}
     */
    static HV_INSUFFICIENT_ROOT_MEMORY_MIRRORING => 3224699012

    /**
     * Native name: ERROR_HV_INSUFFICIENT_CONTIGUOUS_ROOT_MEMORY_MIRRORING
     * @type {Integer (UInt32)}
     */
    static HV_INSUFFICIENT_CONTIGUOUS_ROOT_MEMORY_MIRRORING => 3224699013

    /**
     * Native name: ERROR_HV_VTL_ALREADY_ENABLED
     * @type {Integer (UInt32)}
     */
    static HV_VTL_ALREADY_ENABLED => 3224699014

    /**
     * Native name: ERROR_HV_SPDM_REQUEST
     * @type {Integer (UInt32)}
     */
    static HV_SPDM_REQUEST => 3224699016

    /**
     * Native name: ERROR_HV_NOT_PRESENT
     * @type {Integer (UInt32)}
     */
    static HV_NOT_PRESENT => 3224702976

    /**
     * Native name: ERROR_VID_DUPLICATE_HANDLER
     * @type {Integer (UInt32)}
     */
    static VID_DUPLICATE_HANDLER => 3224829953

    /**
     * Native name: ERROR_VID_TOO_MANY_HANDLERS
     * @type {Integer (UInt32)}
     */
    static VID_TOO_MANY_HANDLERS => 3224829954

    /**
     * Native name: ERROR_VID_QUEUE_FULL
     * @type {Integer (UInt32)}
     */
    static VID_QUEUE_FULL => 3224829955

    /**
     * Native name: ERROR_VID_HANDLER_NOT_PRESENT
     * @type {Integer (UInt32)}
     */
    static VID_HANDLER_NOT_PRESENT => 3224829956

    /**
     * Native name: ERROR_VID_INVALID_OBJECT_NAME
     * @type {Integer (UInt32)}
     */
    static VID_INVALID_OBJECT_NAME => 3224829957

    /**
     * Native name: ERROR_VID_PARTITION_NAME_TOO_LONG
     * @type {Integer (UInt32)}
     */
    static VID_PARTITION_NAME_TOO_LONG => 3224829958

    /**
     * Native name: ERROR_VID_MESSAGE_QUEUE_NAME_TOO_LONG
     * @type {Integer (UInt32)}
     */
    static VID_MESSAGE_QUEUE_NAME_TOO_LONG => 3224829959

    /**
     * Native name: ERROR_VID_PARTITION_ALREADY_EXISTS
     * @type {Integer (UInt32)}
     */
    static VID_PARTITION_ALREADY_EXISTS => 3224829960

    /**
     * Native name: ERROR_VID_PARTITION_DOES_NOT_EXIST
     * @type {Integer (UInt32)}
     */
    static VID_PARTITION_DOES_NOT_EXIST => 3224829961

    /**
     * Native name: ERROR_VID_PARTITION_NAME_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static VID_PARTITION_NAME_NOT_FOUND => 3224829962

    /**
     * Native name: ERROR_VID_MESSAGE_QUEUE_ALREADY_EXISTS
     * @type {Integer (UInt32)}
     */
    static VID_MESSAGE_QUEUE_ALREADY_EXISTS => 3224829963

    /**
     * Native name: ERROR_VID_EXCEEDED_MBP_ENTRY_MAP_LIMIT
     * @type {Integer (UInt32)}
     */
    static VID_EXCEEDED_MBP_ENTRY_MAP_LIMIT => 3224829964

    /**
     * Native name: ERROR_VID_MB_STILL_REFERENCED
     * @type {Integer (UInt32)}
     */
    static VID_MB_STILL_REFERENCED => 3224829965

    /**
     * Native name: ERROR_VID_CHILD_GPA_PAGE_SET_CORRUPTED
     * @type {Integer (UInt32)}
     */
    static VID_CHILD_GPA_PAGE_SET_CORRUPTED => 3224829966

    /**
     * Native name: ERROR_VID_INVALID_NUMA_SETTINGS
     * @type {Integer (UInt32)}
     */
    static VID_INVALID_NUMA_SETTINGS => 3224829967

    /**
     * Native name: ERROR_VID_INVALID_NUMA_NODE_INDEX
     * @type {Integer (UInt32)}
     */
    static VID_INVALID_NUMA_NODE_INDEX => 3224829968

    /**
     * Native name: ERROR_VID_NOTIFICATION_QUEUE_ALREADY_ASSOCIATED
     * @type {Integer (UInt32)}
     */
    static VID_NOTIFICATION_QUEUE_ALREADY_ASSOCIATED => 3224829969

    /**
     * Native name: ERROR_VID_INVALID_MEMORY_BLOCK_HANDLE
     * @type {Integer (UInt32)}
     */
    static VID_INVALID_MEMORY_BLOCK_HANDLE => 3224829970

    /**
     * Native name: ERROR_VID_PAGE_RANGE_OVERFLOW
     * @type {Integer (UInt32)}
     */
    static VID_PAGE_RANGE_OVERFLOW => 3224829971

    /**
     * Native name: ERROR_VID_INVALID_MESSAGE_QUEUE_HANDLE
     * @type {Integer (UInt32)}
     */
    static VID_INVALID_MESSAGE_QUEUE_HANDLE => 3224829972

    /**
     * Native name: ERROR_VID_INVALID_GPA_RANGE_HANDLE
     * @type {Integer (UInt32)}
     */
    static VID_INVALID_GPA_RANGE_HANDLE => 3224829973

    /**
     * Native name: ERROR_VID_NO_MEMORY_BLOCK_NOTIFICATION_QUEUE
     * @type {Integer (UInt32)}
     */
    static VID_NO_MEMORY_BLOCK_NOTIFICATION_QUEUE => 3224829974

    /**
     * Native name: ERROR_VID_MEMORY_BLOCK_LOCK_COUNT_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static VID_MEMORY_BLOCK_LOCK_COUNT_EXCEEDED => 3224829975

    /**
     * Native name: ERROR_VID_INVALID_PPM_HANDLE
     * @type {Integer (UInt32)}
     */
    static VID_INVALID_PPM_HANDLE => 3224829976

    /**
     * Native name: ERROR_VID_MBPS_ARE_LOCKED
     * @type {Integer (UInt32)}
     */
    static VID_MBPS_ARE_LOCKED => 3224829977

    /**
     * Native name: ERROR_VID_MESSAGE_QUEUE_CLOSED
     * @type {Integer (UInt32)}
     */
    static VID_MESSAGE_QUEUE_CLOSED => 3224829978

    /**
     * Native name: ERROR_VID_VIRTUAL_PROCESSOR_LIMIT_EXCEEDED
     * @type {Integer (UInt32)}
     */
    static VID_VIRTUAL_PROCESSOR_LIMIT_EXCEEDED => 3224829979

    /**
     * Native name: ERROR_VID_STOP_PENDING
     * @type {Integer (UInt32)}
     */
    static VID_STOP_PENDING => 3224829980

    /**
     * Native name: ERROR_VID_INVALID_PROCESSOR_STATE
     * @type {Integer (UInt32)}
     */
    static VID_INVALID_PROCESSOR_STATE => 3224829981

    /**
     * Native name: ERROR_VID_EXCEEDED_KM_CONTEXT_COUNT_LIMIT
     * @type {Integer (UInt32)}
     */
    static VID_EXCEEDED_KM_CONTEXT_COUNT_LIMIT => 3224829982

    /**
     * Native name: ERROR_VID_KM_INTERFACE_ALREADY_INITIALIZED
     * @type {Integer (UInt32)}
     */
    static VID_KM_INTERFACE_ALREADY_INITIALIZED => 3224829983

    /**
     * Native name: ERROR_VID_MB_PROPERTY_ALREADY_SET_RESET
     * @type {Integer (UInt32)}
     */
    static VID_MB_PROPERTY_ALREADY_SET_RESET => 3224829984

    /**
     * Native name: ERROR_VID_MMIO_RANGE_DESTROYED
     * @type {Integer (UInt32)}
     */
    static VID_MMIO_RANGE_DESTROYED => 3224829985

    /**
     * Native name: ERROR_VID_INVALID_CHILD_GPA_PAGE_SET
     * @type {Integer (UInt32)}
     */
    static VID_INVALID_CHILD_GPA_PAGE_SET => 3224829986

    /**
     * Native name: ERROR_VID_RESERVE_PAGE_SET_IS_BEING_USED
     * @type {Integer (UInt32)}
     */
    static VID_RESERVE_PAGE_SET_IS_BEING_USED => 3224829987

    /**
     * Native name: ERROR_VID_RESERVE_PAGE_SET_TOO_SMALL
     * @type {Integer (UInt32)}
     */
    static VID_RESERVE_PAGE_SET_TOO_SMALL => 3224829988

    /**
     * Native name: ERROR_VID_MBP_ALREADY_LOCKED_USING_RESERVED_PAGE
     * @type {Integer (UInt32)}
     */
    static VID_MBP_ALREADY_LOCKED_USING_RESERVED_PAGE => 3224829989

    /**
     * Native name: ERROR_VID_MBP_COUNT_EXCEEDED_LIMIT
     * @type {Integer (UInt32)}
     */
    static VID_MBP_COUNT_EXCEEDED_LIMIT => 3224829990

    /**
     * Native name: ERROR_VID_SAVED_STATE_CORRUPT
     * @type {Integer (UInt32)}
     */
    static VID_SAVED_STATE_CORRUPT => 3224829991

    /**
     * Native name: ERROR_VID_SAVED_STATE_UNRECOGNIZED_ITEM
     * @type {Integer (UInt32)}
     */
    static VID_SAVED_STATE_UNRECOGNIZED_ITEM => 3224829992

    /**
     * Native name: ERROR_VID_SAVED_STATE_INCOMPATIBLE
     * @type {Integer (UInt32)}
     */
    static VID_SAVED_STATE_INCOMPATIBLE => 3224829993

    /**
     * Native name: ERROR_VID_VTL_ACCESS_DENIED
     * @type {Integer (UInt32)}
     */
    static VID_VTL_ACCESS_DENIED => 3224829994

    /**
     * Native name: ERROR_VID_INSUFFICIENT_RESOURCES_RESERVE
     * @type {Integer (UInt32)}
     */
    static VID_INSUFFICIENT_RESOURCES_RESERVE => 3224829995

    /**
     * Native name: ERROR_VID_INSUFFICIENT_RESOURCES_PHYSICAL_BUFFER
     * @type {Integer (UInt32)}
     */
    static VID_INSUFFICIENT_RESOURCES_PHYSICAL_BUFFER => 3224829996

    /**
     * Native name: ERROR_VID_INSUFFICIENT_RESOURCES_HV_DEPOSIT
     * @type {Integer (UInt32)}
     */
    static VID_INSUFFICIENT_RESOURCES_HV_DEPOSIT => 3224829997

    /**
     * Native name: ERROR_VID_MEMORY_TYPE_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static VID_MEMORY_TYPE_NOT_SUPPORTED => 3224829998

    /**
     * Native name: ERROR_VID_INSUFFICIENT_RESOURCES_WITHDRAW
     * @type {Integer (UInt32)}
     */
    static VID_INSUFFICIENT_RESOURCES_WITHDRAW => 3224829999

    /**
     * Native name: ERROR_VID_PROCESS_ALREADY_SET
     * @type {Integer (UInt32)}
     */
    static VID_PROCESS_ALREADY_SET => 3224830000

    /**
     * Native name: ERROR_VMCOMPUTE_TERMINATED_DURING_START
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_TERMINATED_DURING_START => 3224830208

    /**
     * Native name: ERROR_VMCOMPUTE_IMAGE_MISMATCH
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_IMAGE_MISMATCH => 3224830209

    /**
     * Native name: ERROR_VMCOMPUTE_HYPERV_NOT_INSTALLED
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_HYPERV_NOT_INSTALLED => 3224830210

    /**
     * Native name: ERROR_VMCOMPUTE_OPERATION_PENDING
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_OPERATION_PENDING => 3224830211

    /**
     * Native name: ERROR_VMCOMPUTE_TOO_MANY_NOTIFICATIONS
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_TOO_MANY_NOTIFICATIONS => 3224830212

    /**
     * Native name: ERROR_VMCOMPUTE_INVALID_STATE
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_INVALID_STATE => 3224830213

    /**
     * Native name: ERROR_VMCOMPUTE_UNEXPECTED_EXIT
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_UNEXPECTED_EXIT => 3224830214

    /**
     * Native name: ERROR_VMCOMPUTE_TERMINATED
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_TERMINATED => 3224830215

    /**
     * Native name: ERROR_VMCOMPUTE_CONNECT_FAILED
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_CONNECT_FAILED => 3224830216

    /**
     * Native name: ERROR_VMCOMPUTE_TIMEOUT
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_TIMEOUT => 3224830217

    /**
     * Native name: ERROR_VMCOMPUTE_CONNECTION_CLOSED
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_CONNECTION_CLOSED => 3224830218

    /**
     * Native name: ERROR_VMCOMPUTE_UNKNOWN_MESSAGE
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_UNKNOWN_MESSAGE => 3224830219

    /**
     * Native name: ERROR_VMCOMPUTE_UNSUPPORTED_PROTOCOL_VERSION
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_UNSUPPORTED_PROTOCOL_VERSION => 3224830220

    /**
     * Native name: ERROR_VMCOMPUTE_INVALID_JSON
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_INVALID_JSON => 3224830221

    /**
     * Native name: ERROR_VMCOMPUTE_SYSTEM_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_SYSTEM_NOT_FOUND => 3224830222

    /**
     * Native name: ERROR_VMCOMPUTE_SYSTEM_ALREADY_EXISTS
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_SYSTEM_ALREADY_EXISTS => 3224830223

    /**
     * Native name: ERROR_VMCOMPUTE_SYSTEM_ALREADY_STOPPED
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_SYSTEM_ALREADY_STOPPED => 3224830224

    /**
     * Native name: ERROR_VMCOMPUTE_PROTOCOL_ERROR
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_PROTOCOL_ERROR => 3224830225

    /**
     * Native name: ERROR_VMCOMPUTE_INVALID_LAYER
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_INVALID_LAYER => 3224830226

    /**
     * Native name: ERROR_VMCOMPUTE_WINDOWS_INSIDER_REQUIRED
     * @type {Integer (UInt32)}
     */
    static VMCOMPUTE_WINDOWS_INSIDER_REQUIRED => 3224830227

    /**
     * Native name: ERROR_VNET_VIRTUAL_SWITCH_NAME_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static VNET_VIRTUAL_SWITCH_NAME_NOT_FOUND => 3224830464

    /**
     * Native name: ERROR_VID_REMOTE_NODE_PARENT_GPA_PAGES_USED
     * @type {Integer (UInt32)}
     */
    static VID_REMOTE_NODE_PARENT_GPA_PAGES_USED => 2151088129

    /**
     * Native name: ERROR_VSMB_SAVED_STATE_FILE_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static VSMB_SAVED_STATE_FILE_NOT_FOUND => 3224830976

    /**
     * Native name: ERROR_VSMB_SAVED_STATE_CORRUPT
     * @type {Integer (UInt32)}
     */
    static VSMB_SAVED_STATE_CORRUPT => 3224830977

    /**
     * Native name: ERROR_VOLMGR_INCOMPLETE_REGENERATION
     * @type {Integer (UInt32)}
     */
    static VOLMGR_INCOMPLETE_REGENERATION => 2151153665

    /**
     * Native name: ERROR_VOLMGR_INCOMPLETE_DISK_MIGRATION
     * @type {Integer (UInt32)}
     */
    static VOLMGR_INCOMPLETE_DISK_MIGRATION => 2151153666

    /**
     * Native name: ERROR_VOLMGR_DATABASE_FULL
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DATABASE_FULL => 3224895489

    /**
     * Native name: ERROR_VOLMGR_DISK_CONFIGURATION_CORRUPTED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_CONFIGURATION_CORRUPTED => 3224895490

    /**
     * Native name: ERROR_VOLMGR_DISK_CONFIGURATION_NOT_IN_SYNC
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_CONFIGURATION_NOT_IN_SYNC => 3224895491

    /**
     * Native name: ERROR_VOLMGR_PACK_CONFIG_UPDATE_FAILED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PACK_CONFIG_UPDATE_FAILED => 3224895492

    /**
     * Native name: ERROR_VOLMGR_DISK_CONTAINS_NON_SIMPLE_VOLUME
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_CONTAINS_NON_SIMPLE_VOLUME => 3224895493

    /**
     * Native name: ERROR_VOLMGR_DISK_DUPLICATE
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_DUPLICATE => 3224895494

    /**
     * Native name: ERROR_VOLMGR_DISK_DYNAMIC
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_DYNAMIC => 3224895495

    /**
     * Native name: ERROR_VOLMGR_DISK_ID_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_ID_INVALID => 3224895496

    /**
     * Native name: ERROR_VOLMGR_DISK_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_INVALID => 3224895497

    /**
     * Native name: ERROR_VOLMGR_DISK_LAST_VOTER
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_LAST_VOTER => 3224895498

    /**
     * Native name: ERROR_VOLMGR_DISK_LAYOUT_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_LAYOUT_INVALID => 3224895499

    /**
     * Native name: ERROR_VOLMGR_DISK_LAYOUT_NON_BASIC_BETWEEN_BASIC_PARTITIONS
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_LAYOUT_NON_BASIC_BETWEEN_BASIC_PARTITIONS => 3224895500

    /**
     * Native name: ERROR_VOLMGR_DISK_LAYOUT_NOT_CYLINDER_ALIGNED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_LAYOUT_NOT_CYLINDER_ALIGNED => 3224895501

    /**
     * Native name: ERROR_VOLMGR_DISK_LAYOUT_PARTITIONS_TOO_SMALL
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_LAYOUT_PARTITIONS_TOO_SMALL => 3224895502

    /**
     * Native name: ERROR_VOLMGR_DISK_LAYOUT_PRIMARY_BETWEEN_LOGICAL_PARTITIONS
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_LAYOUT_PRIMARY_BETWEEN_LOGICAL_PARTITIONS => 3224895503

    /**
     * Native name: ERROR_VOLMGR_DISK_LAYOUT_TOO_MANY_PARTITIONS
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_LAYOUT_TOO_MANY_PARTITIONS => 3224895504

    /**
     * Native name: ERROR_VOLMGR_DISK_MISSING
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_MISSING => 3224895505

    /**
     * Native name: ERROR_VOLMGR_DISK_NOT_EMPTY
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_NOT_EMPTY => 3224895506

    /**
     * Native name: ERROR_VOLMGR_DISK_NOT_ENOUGH_SPACE
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_NOT_ENOUGH_SPACE => 3224895507

    /**
     * Native name: ERROR_VOLMGR_DISK_REVECTORING_FAILED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_REVECTORING_FAILED => 3224895508

    /**
     * Native name: ERROR_VOLMGR_DISK_SECTOR_SIZE_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_SECTOR_SIZE_INVALID => 3224895509

    /**
     * Native name: ERROR_VOLMGR_DISK_SET_NOT_CONTAINED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_SET_NOT_CONTAINED => 3224895510

    /**
     * Native name: ERROR_VOLMGR_DISK_USED_BY_MULTIPLE_MEMBERS
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_USED_BY_MULTIPLE_MEMBERS => 3224895511

    /**
     * Native name: ERROR_VOLMGR_DISK_USED_BY_MULTIPLE_PLEXES
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DISK_USED_BY_MULTIPLE_PLEXES => 3224895512

    /**
     * Native name: ERROR_VOLMGR_DYNAMIC_DISK_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DYNAMIC_DISK_NOT_SUPPORTED => 3224895513

    /**
     * Native name: ERROR_VOLMGR_EXTENT_ALREADY_USED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_EXTENT_ALREADY_USED => 3224895514

    /**
     * Native name: ERROR_VOLMGR_EXTENT_NOT_CONTIGUOUS
     * @type {Integer (UInt32)}
     */
    static VOLMGR_EXTENT_NOT_CONTIGUOUS => 3224895515

    /**
     * Native name: ERROR_VOLMGR_EXTENT_NOT_IN_PUBLIC_REGION
     * @type {Integer (UInt32)}
     */
    static VOLMGR_EXTENT_NOT_IN_PUBLIC_REGION => 3224895516

    /**
     * Native name: ERROR_VOLMGR_EXTENT_NOT_SECTOR_ALIGNED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_EXTENT_NOT_SECTOR_ALIGNED => 3224895517

    /**
     * Native name: ERROR_VOLMGR_EXTENT_OVERLAPS_EBR_PARTITION
     * @type {Integer (UInt32)}
     */
    static VOLMGR_EXTENT_OVERLAPS_EBR_PARTITION => 3224895518

    /**
     * Native name: ERROR_VOLMGR_EXTENT_VOLUME_LENGTHS_DO_NOT_MATCH
     * @type {Integer (UInt32)}
     */
    static VOLMGR_EXTENT_VOLUME_LENGTHS_DO_NOT_MATCH => 3224895519

    /**
     * Native name: ERROR_VOLMGR_FAULT_TOLERANT_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_FAULT_TOLERANT_NOT_SUPPORTED => 3224895520

    /**
     * Native name: ERROR_VOLMGR_INTERLEAVE_LENGTH_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_INTERLEAVE_LENGTH_INVALID => 3224895521

    /**
     * Native name: ERROR_VOLMGR_MAXIMUM_REGISTERED_USERS
     * @type {Integer (UInt32)}
     */
    static VOLMGR_MAXIMUM_REGISTERED_USERS => 3224895522

    /**
     * Native name: ERROR_VOLMGR_MEMBER_IN_SYNC
     * @type {Integer (UInt32)}
     */
    static VOLMGR_MEMBER_IN_SYNC => 3224895523

    /**
     * Native name: ERROR_VOLMGR_MEMBER_INDEX_DUPLICATE
     * @type {Integer (UInt32)}
     */
    static VOLMGR_MEMBER_INDEX_DUPLICATE => 3224895524

    /**
     * Native name: ERROR_VOLMGR_MEMBER_INDEX_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_MEMBER_INDEX_INVALID => 3224895525

    /**
     * Native name: ERROR_VOLMGR_MEMBER_MISSING
     * @type {Integer (UInt32)}
     */
    static VOLMGR_MEMBER_MISSING => 3224895526

    /**
     * Native name: ERROR_VOLMGR_MEMBER_NOT_DETACHED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_MEMBER_NOT_DETACHED => 3224895527

    /**
     * Native name: ERROR_VOLMGR_MEMBER_REGENERATING
     * @type {Integer (UInt32)}
     */
    static VOLMGR_MEMBER_REGENERATING => 3224895528

    /**
     * Native name: ERROR_VOLMGR_ALL_DISKS_FAILED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_ALL_DISKS_FAILED => 3224895529

    /**
     * Native name: ERROR_VOLMGR_NO_REGISTERED_USERS
     * @type {Integer (UInt32)}
     */
    static VOLMGR_NO_REGISTERED_USERS => 3224895530

    /**
     * Native name: ERROR_VOLMGR_NO_SUCH_USER
     * @type {Integer (UInt32)}
     */
    static VOLMGR_NO_SUCH_USER => 3224895531

    /**
     * Native name: ERROR_VOLMGR_NOTIFICATION_RESET
     * @type {Integer (UInt32)}
     */
    static VOLMGR_NOTIFICATION_RESET => 3224895532

    /**
     * Native name: ERROR_VOLMGR_NUMBER_OF_MEMBERS_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_NUMBER_OF_MEMBERS_INVALID => 3224895533

    /**
     * Native name: ERROR_VOLMGR_NUMBER_OF_PLEXES_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_NUMBER_OF_PLEXES_INVALID => 3224895534

    /**
     * Native name: ERROR_VOLMGR_PACK_DUPLICATE
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PACK_DUPLICATE => 3224895535

    /**
     * Native name: ERROR_VOLMGR_PACK_ID_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PACK_ID_INVALID => 3224895536

    /**
     * Native name: ERROR_VOLMGR_PACK_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PACK_INVALID => 3224895537

    /**
     * Native name: ERROR_VOLMGR_PACK_NAME_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PACK_NAME_INVALID => 3224895538

    /**
     * Native name: ERROR_VOLMGR_PACK_OFFLINE
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PACK_OFFLINE => 3224895539

    /**
     * Native name: ERROR_VOLMGR_PACK_HAS_QUORUM
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PACK_HAS_QUORUM => 3224895540

    /**
     * Native name: ERROR_VOLMGR_PACK_WITHOUT_QUORUM
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PACK_WITHOUT_QUORUM => 3224895541

    /**
     * Native name: ERROR_VOLMGR_PARTITION_STYLE_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PARTITION_STYLE_INVALID => 3224895542

    /**
     * Native name: ERROR_VOLMGR_PARTITION_UPDATE_FAILED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PARTITION_UPDATE_FAILED => 3224895543

    /**
     * Native name: ERROR_VOLMGR_PLEX_IN_SYNC
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PLEX_IN_SYNC => 3224895544

    /**
     * Native name: ERROR_VOLMGR_PLEX_INDEX_DUPLICATE
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PLEX_INDEX_DUPLICATE => 3224895545

    /**
     * Native name: ERROR_VOLMGR_PLEX_INDEX_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PLEX_INDEX_INVALID => 3224895546

    /**
     * Native name: ERROR_VOLMGR_PLEX_LAST_ACTIVE
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PLEX_LAST_ACTIVE => 3224895547

    /**
     * Native name: ERROR_VOLMGR_PLEX_MISSING
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PLEX_MISSING => 3224895548

    /**
     * Native name: ERROR_VOLMGR_PLEX_REGENERATING
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PLEX_REGENERATING => 3224895549

    /**
     * Native name: ERROR_VOLMGR_PLEX_TYPE_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PLEX_TYPE_INVALID => 3224895550

    /**
     * Native name: ERROR_VOLMGR_PLEX_NOT_RAID5
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PLEX_NOT_RAID5 => 3224895551

    /**
     * Native name: ERROR_VOLMGR_PLEX_NOT_SIMPLE
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PLEX_NOT_SIMPLE => 3224895552

    /**
     * Native name: ERROR_VOLMGR_STRUCTURE_SIZE_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_STRUCTURE_SIZE_INVALID => 3224895553

    /**
     * Native name: ERROR_VOLMGR_TOO_MANY_NOTIFICATION_REQUESTS
     * @type {Integer (UInt32)}
     */
    static VOLMGR_TOO_MANY_NOTIFICATION_REQUESTS => 3224895554

    /**
     * Native name: ERROR_VOLMGR_TRANSACTION_IN_PROGRESS
     * @type {Integer (UInt32)}
     */
    static VOLMGR_TRANSACTION_IN_PROGRESS => 3224895555

    /**
     * Native name: ERROR_VOLMGR_UNEXPECTED_DISK_LAYOUT_CHANGE
     * @type {Integer (UInt32)}
     */
    static VOLMGR_UNEXPECTED_DISK_LAYOUT_CHANGE => 3224895556

    /**
     * Native name: ERROR_VOLMGR_VOLUME_CONTAINS_MISSING_DISK
     * @type {Integer (UInt32)}
     */
    static VOLMGR_VOLUME_CONTAINS_MISSING_DISK => 3224895557

    /**
     * Native name: ERROR_VOLMGR_VOLUME_ID_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_VOLUME_ID_INVALID => 3224895558

    /**
     * Native name: ERROR_VOLMGR_VOLUME_LENGTH_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_VOLUME_LENGTH_INVALID => 3224895559

    /**
     * Native name: ERROR_VOLMGR_VOLUME_LENGTH_NOT_SECTOR_SIZE_MULTIPLE
     * @type {Integer (UInt32)}
     */
    static VOLMGR_VOLUME_LENGTH_NOT_SECTOR_SIZE_MULTIPLE => 3224895560

    /**
     * Native name: ERROR_VOLMGR_VOLUME_NOT_MIRRORED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_VOLUME_NOT_MIRRORED => 3224895561

    /**
     * Native name: ERROR_VOLMGR_VOLUME_NOT_RETAINED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_VOLUME_NOT_RETAINED => 3224895562

    /**
     * Native name: ERROR_VOLMGR_VOLUME_OFFLINE
     * @type {Integer (UInt32)}
     */
    static VOLMGR_VOLUME_OFFLINE => 3224895563

    /**
     * Native name: ERROR_VOLMGR_VOLUME_RETAINED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_VOLUME_RETAINED => 3224895564

    /**
     * Native name: ERROR_VOLMGR_NUMBER_OF_EXTENTS_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_NUMBER_OF_EXTENTS_INVALID => 3224895565

    /**
     * Native name: ERROR_VOLMGR_DIFFERENT_SECTOR_SIZE
     * @type {Integer (UInt32)}
     */
    static VOLMGR_DIFFERENT_SECTOR_SIZE => 3224895566

    /**
     * Native name: ERROR_VOLMGR_BAD_BOOT_DISK
     * @type {Integer (UInt32)}
     */
    static VOLMGR_BAD_BOOT_DISK => 3224895567

    /**
     * Native name: ERROR_VOLMGR_PACK_CONFIG_OFFLINE
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PACK_CONFIG_OFFLINE => 3224895568

    /**
     * Native name: ERROR_VOLMGR_PACK_CONFIG_ONLINE
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PACK_CONFIG_ONLINE => 3224895569

    /**
     * Native name: ERROR_VOLMGR_NOT_PRIMARY_PACK
     * @type {Integer (UInt32)}
     */
    static VOLMGR_NOT_PRIMARY_PACK => 3224895570

    /**
     * Native name: ERROR_VOLMGR_PACK_LOG_UPDATE_FAILED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PACK_LOG_UPDATE_FAILED => 3224895571

    /**
     * Native name: ERROR_VOLMGR_NUMBER_OF_DISKS_IN_PLEX_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_NUMBER_OF_DISKS_IN_PLEX_INVALID => 3224895572

    /**
     * Native name: ERROR_VOLMGR_NUMBER_OF_DISKS_IN_MEMBER_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_NUMBER_OF_DISKS_IN_MEMBER_INVALID => 3224895573

    /**
     * Native name: ERROR_VOLMGR_VOLUME_MIRRORED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_VOLUME_MIRRORED => 3224895574

    /**
     * Native name: ERROR_VOLMGR_PLEX_NOT_SIMPLE_SPANNED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PLEX_NOT_SIMPLE_SPANNED => 3224895575

    /**
     * Native name: ERROR_VOLMGR_NO_VALID_LOG_COPIES
     * @type {Integer (UInt32)}
     */
    static VOLMGR_NO_VALID_LOG_COPIES => 3224895576

    /**
     * Native name: ERROR_VOLMGR_PRIMARY_PACK_PRESENT
     * @type {Integer (UInt32)}
     */
    static VOLMGR_PRIMARY_PACK_PRESENT => 3224895577

    /**
     * Native name: ERROR_VOLMGR_NUMBER_OF_DISKS_INVALID
     * @type {Integer (UInt32)}
     */
    static VOLMGR_NUMBER_OF_DISKS_INVALID => 3224895578

    /**
     * Native name: ERROR_VOLMGR_MIRROR_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_MIRROR_NOT_SUPPORTED => 3224895579

    /**
     * Native name: ERROR_VOLMGR_RAID5_NOT_SUPPORTED
     * @type {Integer (UInt32)}
     */
    static VOLMGR_RAID5_NOT_SUPPORTED => 3224895580

    /**
     * Native name: ERROR_BCD_NOT_ALL_ENTRIES_IMPORTED
     * @type {Integer (UInt32)}
     */
    static BCD_NOT_ALL_ENTRIES_IMPORTED => 2151219201

    /**
     * Native name: ERROR_BCD_TOO_MANY_ELEMENTS
     * @type {Integer (UInt32)}
     */
    static BCD_TOO_MANY_ELEMENTS => 3224961026

    /**
     * Native name: ERROR_BCD_NOT_ALL_ENTRIES_SYNCHRONIZED
     * @type {Integer (UInt32)}
     */
    static BCD_NOT_ALL_ENTRIES_SYNCHRONIZED => 2151219203

    /**
     * Native name: ERROR_VHD_DRIVE_FOOTER_MISSING
     * @type {Integer (UInt32)}
     */
    static VHD_DRIVE_FOOTER_MISSING => 3225026561

    /**
     * Native name: ERROR_VHD_DRIVE_FOOTER_CHECKSUM_MISMATCH
     * @type {Integer (UInt32)}
     */
    static VHD_DRIVE_FOOTER_CHECKSUM_MISMATCH => 3225026562

    /**
     * Native name: ERROR_VHD_DRIVE_FOOTER_CORRUPT
     * @type {Integer (UInt32)}
     */
    static VHD_DRIVE_FOOTER_CORRUPT => 3225026563

    /**
     * Native name: ERROR_VHD_FORMAT_UNKNOWN
     * @type {Integer (UInt32)}
     */
    static VHD_FORMAT_UNKNOWN => 3225026564

    /**
     * Native name: ERROR_VHD_FORMAT_UNSUPPORTED_VERSION
     * @type {Integer (UInt32)}
     */
    static VHD_FORMAT_UNSUPPORTED_VERSION => 3225026565

    /**
     * Native name: ERROR_VHD_SPARSE_HEADER_CHECKSUM_MISMATCH
     * @type {Integer (UInt32)}
     */
    static VHD_SPARSE_HEADER_CHECKSUM_MISMATCH => 3225026566

    /**
     * Native name: ERROR_VHD_SPARSE_HEADER_UNSUPPORTED_VERSION
     * @type {Integer (UInt32)}
     */
    static VHD_SPARSE_HEADER_UNSUPPORTED_VERSION => 3225026567

    /**
     * Native name: ERROR_VHD_SPARSE_HEADER_CORRUPT
     * @type {Integer (UInt32)}
     */
    static VHD_SPARSE_HEADER_CORRUPT => 3225026568

    /**
     * Native name: ERROR_VHD_BLOCK_ALLOCATION_FAILURE
     * @type {Integer (UInt32)}
     */
    static VHD_BLOCK_ALLOCATION_FAILURE => 3225026569

    /**
     * Native name: ERROR_VHD_BLOCK_ALLOCATION_TABLE_CORRUPT
     * @type {Integer (UInt32)}
     */
    static VHD_BLOCK_ALLOCATION_TABLE_CORRUPT => 3225026570

    /**
     * Native name: ERROR_VHD_INVALID_BLOCK_SIZE
     * @type {Integer (UInt32)}
     */
    static VHD_INVALID_BLOCK_SIZE => 3225026571

    /**
     * Native name: ERROR_VHD_BITMAP_MISMATCH
     * @type {Integer (UInt32)}
     */
    static VHD_BITMAP_MISMATCH => 3225026572

    /**
     * Native name: ERROR_VHD_PARENT_VHD_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static VHD_PARENT_VHD_NOT_FOUND => 3225026573

    /**
     * Native name: ERROR_VHD_CHILD_PARENT_ID_MISMATCH
     * @type {Integer (UInt32)}
     */
    static VHD_CHILD_PARENT_ID_MISMATCH => 3225026574

    /**
     * Native name: ERROR_VHD_CHILD_PARENT_TIMESTAMP_MISMATCH
     * @type {Integer (UInt32)}
     */
    static VHD_CHILD_PARENT_TIMESTAMP_MISMATCH => 3225026575

    /**
     * Native name: ERROR_VHD_METADATA_READ_FAILURE
     * @type {Integer (UInt32)}
     */
    static VHD_METADATA_READ_FAILURE => 3225026576

    /**
     * Native name: ERROR_VHD_METADATA_WRITE_FAILURE
     * @type {Integer (UInt32)}
     */
    static VHD_METADATA_WRITE_FAILURE => 3225026577

    /**
     * Native name: ERROR_VHD_INVALID_SIZE
     * @type {Integer (UInt32)}
     */
    static VHD_INVALID_SIZE => 3225026578

    /**
     * Native name: ERROR_VHD_INVALID_FILE_SIZE
     * @type {Integer (UInt32)}
     */
    static VHD_INVALID_FILE_SIZE => 3225026579

    /**
     * Native name: ERROR_VIRTDISK_PROVIDER_NOT_FOUND
     * @type {Integer (UInt32)}
     */
    static VIRTDISK_PROVIDER_NOT_FOUND => 3225026580

    /**
     * Native name: ERROR_VIRTDISK_NOT_VIRTUAL_DISK
     * @type {Integer (UInt32)}
     */
    static VIRTDISK_NOT_VIRTUAL_DISK => 3225026581

    /**
     * Native name: ERROR_VHD_PARENT_VHD_ACCESS_DENIED
     * @type {Integer (UInt32)}
     */
    static VHD_PARENT_VHD_ACCESS_DENIED => 3225026582

    /**
     * Native name: ERROR_VHD_CHILD_PARENT_SIZE_MISMATCH
     * @type {Integer (UInt32)}
     */
    static VHD_CHILD_PARENT_SIZE_MISMATCH => 3225026583

    /**
     * Native name: ERROR_VHD_DIFFERENCING_CHAIN_CYCLE_DETECTED
     * @type {Integer (UInt32)}
     */
    static VHD_DIFFERENCING_CHAIN_CYCLE_DETECTED => 3225026584

    /**
     * Native name: ERROR_VHD_DIFFERENCING_CHAIN_ERROR_IN_PARENT
     * @type {Integer (UInt32)}
     */
    static VHD_DIFFERENCING_CHAIN_ERROR_IN_PARENT => 3225026585

    /**
     * Native name: ERROR_VIRTUAL_DISK_LIMITATION
     * @type {Integer (UInt32)}
     */
    static VIRTUAL_DISK_LIMITATION => 3225026586

    /**
     * Native name: ERROR_VHD_INVALID_TYPE
     * @type {Integer (UInt32)}
     */
    static VHD_INVALID_TYPE => 3225026587

    /**
     * Native name: ERROR_VHD_INVALID_STATE
     * @type {Integer (UInt32)}
     */
    static VHD_INVALID_STATE => 3225026588

    /**
     * Native name: ERROR_VIRTDISK_UNSUPPORTED_DISK_SECTOR_SIZE
     * @type {Integer (UInt32)}
     */
    static VIRTDISK_UNSUPPORTED_DISK_SECTOR_SIZE => 3225026589

    /**
     * Native name: ERROR_VIRTDISK_DISK_ALREADY_OWNED
     * @type {Integer (UInt32)}
     */
    static VIRTDISK_DISK_ALREADY_OWNED => 3225026590

    /**
     * Native name: ERROR_VIRTDISK_DISK_ONLINE_AND_WRITABLE
     * @type {Integer (UInt32)}
     */
    static VIRTDISK_DISK_ONLINE_AND_WRITABLE => 3225026591

    /**
     * Native name: ERROR_CTLOG_TRACKING_NOT_INITIALIZED
     * @type {Integer (UInt32)}
     */
    static CTLOG_TRACKING_NOT_INITIALIZED => 3225026592

    /**
     * Native name: ERROR_CTLOG_LOGFILE_SIZE_EXCEEDED_MAXSIZE
     * @type {Integer (UInt32)}
     */
    static CTLOG_LOGFILE_SIZE_EXCEEDED_MAXSIZE => 3225026593

    /**
     * Native name: ERROR_CTLOG_VHD_CHANGED_OFFLINE
     * @type {Integer (UInt32)}
     */
    static CTLOG_VHD_CHANGED_OFFLINE => 3225026594

    /**
     * Native name: ERROR_CTLOG_INVALID_TRACKING_STATE
     * @type {Integer (UInt32)}
     */
    static CTLOG_INVALID_TRACKING_STATE => 3225026595

    /**
     * Native name: ERROR_CTLOG_INCONSISTENT_TRACKING_FILE
     * @type {Integer (UInt32)}
     */
    static CTLOG_INCONSISTENT_TRACKING_FILE => 3225026596

    /**
     * Native name: ERROR_VHD_RESIZE_WOULD_TRUNCATE_DATA
     * @type {Integer (UInt32)}
     */
    static VHD_RESIZE_WOULD_TRUNCATE_DATA => 3225026597

    /**
     * Native name: ERROR_VHD_COULD_NOT_COMPUTE_MINIMUM_VIRTUAL_SIZE
     * @type {Integer (UInt32)}
     */
    static VHD_COULD_NOT_COMPUTE_MINIMUM_VIRTUAL_SIZE => 3225026598

    /**
     * Native name: ERROR_VHD_ALREADY_AT_OR_BELOW_MINIMUM_VIRTUAL_SIZE
     * @type {Integer (UInt32)}
     */
    static VHD_ALREADY_AT_OR_BELOW_MINIMUM_VIRTUAL_SIZE => 3225026599

    /**
     * Native name: ERROR_VHD_METADATA_FULL
     * @type {Integer (UInt32)}
     */
    static VHD_METADATA_FULL => 3225026600

    /**
     * Native name: ERROR_VHD_INVALID_CHANGE_TRACKING_ID
     * @type {Integer (UInt32)}
     */
    static VHD_INVALID_CHANGE_TRACKING_ID => 3225026601

    /**
     * Native name: ERROR_VHD_CHANGE_TRACKING_DISABLED
     * @type {Integer (UInt32)}
     */
    static VHD_CHANGE_TRACKING_DISABLED => 3225026602

    /**
     * Native name: ERROR_VHD_MISSING_CHANGE_TRACKING_INFORMATION
     * @type {Integer (UInt32)}
     */
    static VHD_MISSING_CHANGE_TRACKING_INFORMATION => 3225026608

    /**
     * Native name: ERROR_VHD_UNEXPECTED_ID
     * @type {Integer (UInt32)}
     */
    static VHD_UNEXPECTED_ID => 3225026612

    /**
     * Native name: ERROR_QUERY_STORAGE_ERROR
     * @type {Integer (UInt32)}
     */
    static QUERY_STORAGE_ERROR => 2151284737
}
