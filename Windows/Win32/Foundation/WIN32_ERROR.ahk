#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class WIN32_ERROR{

    /**
     * @type {Integer (UInt32)}
     */
    static NO_ERROR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EXPECTED_SECTION_NAME => 3758096384

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_SECTION_NAME_LINE => 3758096385

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECTION_NAME_TOO_LONG => 3758096386

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GENERAL_SYNTAX => 3758096387

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRONG_INF_STYLE => 3758096640

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECTION_NOT_FOUND => 3758096641

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LINE_NOT_FOUND => 3758096642

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_BACKUP => 3758096643

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_ASSOCIATED_CLASS => 3758096896

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLASS_MISMATCH => 3758096897

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DUPLICATE_FOUND => 3758096898

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_DRIVER_SELECTED => 3758096899

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_KEY_DOES_NOT_EXIST => 3758096900

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_DEVINST_NAME => 3758096901

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_CLASS => 3758096902

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVINST_ALREADY_EXISTS => 3758096903

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVINFO_NOT_REGISTERED => 3758096904

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_REG_PROPERTY => 3758096905

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_INF => 3758096906

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SUCH_DEVINST => 3758096907

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANT_LOAD_CLASS_ICON => 3758096908

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_CLASS_INSTALLER => 3758096909

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DI_DO_DEFAULT => 3758096910

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DI_NOFILECOPY => 3758096911

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_HWPROFILE => 3758096912

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_DEVICE_SELECTED => 3758096913

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVINFO_LIST_LOCKED => 3758096914

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVINFO_DATA_LOCKED => 3758096915

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DI_BAD_PATH => 3758096916

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_CLASSINSTALL_PARAMS => 3758096917

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILEQUEUE_LOCKED => 3758096918

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_SERVICE_INSTALLSECT => 3758096919

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_CLASS_DRIVER_LIST => 3758096920

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_ASSOCIATED_SERVICE => 3758096921

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_DEFAULT_DEVICE_INTERFACE => 3758096922

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_INTERFACE_ACTIVE => 3758096923

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_INTERFACE_REMOVED => 3758096924

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_INTERFACE_INSTALLSECT => 3758096925

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SUCH_INTERFACE_CLASS => 3758096926

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_REFERENCE_STRING => 3758096927

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_MACHINENAME => 3758096928

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REMOTE_COMM_FAILURE => 3758096929

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MACHINE_UNAVAILABLE => 3758096930

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_CONFIGMGR_SERVICES => 3758096931

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PROPPAGE_PROVIDER => 3758096932

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SUCH_DEVICE_INTERFACE => 3758096933

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DI_POSTPROCESSING_REQUIRED => 3758096934

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_COINSTALLER => 3758096935

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_COMPAT_DRIVERS => 3758096936

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_DEVICE_ICON => 3758096937

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_INF_LOGCONFIG => 3758096938

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DI_DONT_INSTALL => 3758096939

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_FILTER_DRIVER => 3758096940

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NON_WINDOWS_NT_DRIVER => 3758096941

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NON_WINDOWS_DRIVER => 3758096942

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_CATALOG_FOR_OEM_INF => 3758096943

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVINSTALL_QUEUE_NONNATIVE => 3758096944

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_DISABLEABLE => 3758096945

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANT_REMOVE_DEVINST => 3758096946

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_TARGET => 3758096947

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DRIVER_NONNATIVE => 3758096948

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IN_WOW64 => 3758096949

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SET_SYSTEM_RESTORE_POINT => 3758096950

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SCE_DISABLED => 3758096952

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNKNOWN_EXCEPTION => 3758096953

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PNP_REGISTRY_ERROR => 3758096954

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REMOTE_REQUEST_UNSUPPORTED => 3758096955

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_AN_INSTALLED_OEM_INF => 3758096956

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INF_IN_USE_BY_DEVICES => 3758096957

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DI_FUNCTION_OBSOLETE => 3758096958

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_AUTHENTICODE_CATALOG => 3758096959

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_AUTHENTICODE_DISALLOWED => 3758096960

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_AUTHENTICODE_TRUSTED_PUBLISHER => 3758096961

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_AUTHENTICODE_TRUST_NOT_ESTABLISHED => 3758096962

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_AUTHENTICODE_PUBLISHER_NOT_TRUSTED => 3758096963

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SIGNATURE_OSATTRIBUTE_MISMATCH => 3758096964

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ONLY_VALIDATE_VIA_AUTHENTICODE => 3758096965

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_INSTALLER_NOT_READY => 3758096966

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DRIVER_STORE_ADD_FAILED => 3758096967

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_INSTALL_BLOCKED => 3758096968

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DRIVER_INSTALL_BLOCKED => 3758096969

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRONG_INF_TYPE => 3758096970

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_HASH_NOT_IN_CATALOG => 3758096971

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DRIVER_STORE_DELETE_FAILED => 3758096972

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNRECOVERABLE_STACK_OVERFLOW => 3758097152

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_DEFAULT_INTERFACE_DEVICE => 3758096922

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERFACE_DEVICE_ACTIVE => 3758096923

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERFACE_DEVICE_REMOVED => 3758096924

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SUCH_INTERFACE_DEVICE => 3758096933

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_INSTALLED => 3758100480

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_FUNCTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_NOT_FOUND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PATH_NOT_FOUND => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_OPEN_FILES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ACCESS_DENIED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_HANDLE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ARENA_TRASHED => 7

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_ENOUGH_MEMORY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_BLOCK => 9

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_ENVIRONMENT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_FORMAT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_ACCESS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_DATA => 13

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OUTOFMEMORY => 14

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_DRIVE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CURRENT_DIRECTORY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SAME_DEVICE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_MORE_FILES => 18

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRITE_PROTECT => 19

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_UNIT => 20

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_READY => 21

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_COMMAND => 22

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CRC => 23

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_LENGTH => 24

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SEEK => 25

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_DOS_DISK => 26

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECTOR_NOT_FOUND => 27

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OUT_OF_PAPER => 28

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRITE_FAULT => 29

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_READ_FAULT => 30

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GEN_FAILURE => 31

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHARING_VIOLATION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOCK_VIOLATION => 33

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRONG_DISK => 34

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHARING_BUFFER_EXCEEDED => 36

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HANDLE_EOF => 38

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HANDLE_DISK_FULL => 39

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SUPPORTED => 50

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REM_NOT_LIST => 51

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DUP_NAME => 52

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_NETPATH => 53

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NETWORK_BUSY => 54

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEV_NOT_EXIST => 55

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_CMDS => 56

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ADAP_HDW_ERR => 57

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_NET_RESP => 58

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNEXP_NET_ERR => 59

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_REM_ADAP => 60

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRINTQ_FULL => 61

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SPOOL_SPACE => 62

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRINT_CANCELLED => 63

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NETNAME_DELETED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NETWORK_ACCESS_DENIED => 65

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_DEV_TYPE => 66

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_NET_NAME => 67

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_NAMES => 68

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_SESS => 69

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHARING_PAUSED => 70

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REQ_NOT_ACCEP => 71

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REDIR_PAUSED => 72

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_EXISTS => 80

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_MAKE => 82

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FAIL_I24 => 83

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OUT_OF_STRUCTURES => 84

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALREADY_ASSIGNED => 85

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PASSWORD => 86

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PARAMETER => 87

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NET_WRITE_FAULT => 88

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_PROC_SLOTS => 89

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_SEMAPHORES => 100

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EXCL_SEM_ALREADY_OWNED => 101

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SEM_IS_SET => 102

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_SEM_REQUESTS => 103

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_AT_INTERRUPT_TIME => 104

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SEM_OWNER_DIED => 105

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SEM_USER_LIMIT => 106

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DISK_CHANGE => 107

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DRIVE_LOCKED => 108

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BROKEN_PIPE => 109

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OPEN_FAILED => 110

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BUFFER_OVERFLOW => 111

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DISK_FULL => 112

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_MORE_SEARCH_HANDLES => 113

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_TARGET_HANDLE => 114

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_CATEGORY => 117

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_VERIFY_SWITCH => 118

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_DRIVER_LEVEL => 119

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CALL_NOT_IMPLEMENTED => 120

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SEM_TIMEOUT => 121

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSUFFICIENT_BUFFER => 122

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_NAME => 123

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_LEVEL => 124

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_VOLUME_LABEL => 125

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MOD_NOT_FOUND => 126

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROC_NOT_FOUND => 127

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WAIT_NO_CHILDREN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CHILD_NOT_COMPLETE => 129

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIRECT_ACCESS_HANDLE => 130

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NEGATIVE_SEEK => 131

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SEEK_ON_DEVICE => 132

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IS_JOIN_TARGET => 133

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IS_JOINED => 134

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IS_SUBSTED => 135

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_JOINED => 136

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SUBSTED => 137

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_JOIN_TO_JOIN => 138

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SUBST_TO_SUBST => 139

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_JOIN_TO_SUBST => 140

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SUBST_TO_JOIN => 141

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BUSY_DRIVE => 142

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SAME_DRIVE => 143

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIR_NOT_ROOT => 144

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIR_NOT_EMPTY => 145

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IS_SUBST_PATH => 146

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IS_JOIN_PATH => 147

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PATH_BUSY => 148

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IS_SUBST_TARGET => 149

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_TRACE => 150

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_EVENT_COUNT => 151

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_MUXWAITERS => 152

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_LIST_FORMAT => 153

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LABEL_TOO_LONG => 154

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_TCBS => 155

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SIGNAL_REFUSED => 156

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DISCARDED => 157

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_LOCKED => 158

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_THREADID_ADDR => 159

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_ARGUMENTS => 160

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_PATHNAME => 161

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SIGNAL_PENDING => 162

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MAX_THRDS_REACHED => 164

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOCK_FAILED => 167

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BUSY => 170

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_SUPPORT_IN_PROGRESS => 171

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANCEL_VIOLATION => 173

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ATOMIC_LOCKS_NOT_SUPPORTED => 174

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SEGMENT_NUMBER => 180

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_ORDINAL => 182

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALREADY_EXISTS => 183

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_FLAG_NUMBER => 186

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SEM_NOT_FOUND => 187

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_STARTING_CODESEG => 188

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_STACKSEG => 189

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_MODULETYPE => 190

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_EXE_SIGNATURE => 191

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EXE_MARKED_INVALID => 192

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_EXE_FORMAT => 193

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ITERATED_DATA_EXCEEDS_64k => 194

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_MINALLOCSIZE => 195

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DYNLINK_FROM_INVALID_RING => 196

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IOPL_NOT_ENABLED => 197

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SEGDPL => 198

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_AUTODATASEG_EXCEEDS_64k => 199

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RING2SEG_MUST_BE_MOVABLE => 200

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RELOC_CHAIN_XEEDS_SEGLIM => 201

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INFLOOP_IN_RELOC_CHAIN => 202

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ENVVAR_NOT_FOUND => 203

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SIGNAL_SENT => 205

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILENAME_EXCED_RANGE => 206

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RING2_STACK_IN_USE => 207

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_META_EXPANSION_TOO_LONG => 208

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SIGNAL_NUMBER => 209

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_THREAD_1_INACTIVE => 210

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOCKED => 212

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_MODULES => 214

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NESTING_NOT_ALLOWED => 215

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EXE_MACHINE_TYPE_MISMATCH => 216

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EXE_CANNOT_MODIFY_SIGNED_BINARY => 217

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EXE_CANNOT_MODIFY_STRONG_SIGNED_BINARY => 218

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_CHECKED_OUT => 220

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CHECKOUT_REQUIRED => 221

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_FILE_TYPE => 222

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_TOO_LARGE => 223

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FORMS_AUTH_REQUIRED => 224

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VIRUS_INFECTED => 225

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VIRUS_DELETED => 226

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PIPE_LOCAL => 229

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_PIPE => 230

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PIPE_BUSY => 231

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_DATA => 232

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PIPE_NOT_CONNECTED => 233

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MORE_DATA => 234

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_WORK_DONE => 235

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VC_DISCONNECTED => 240

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_EA_NAME => 254

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EA_LIST_INCONSISTENT => 255

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_MORE_ITEMS => 259

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_COPY => 266

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIRECTORY => 267

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAS_DIDNT_FIT => 275

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EA_FILE_CORRUPT => 276

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EA_TABLE_FULL => 277

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_EA_HANDLE => 278

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EAS_NOT_SUPPORTED => 282

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_OWNER => 288

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_POSTS => 298

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PARTIAL_COPY => 299

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OPLOCK_NOT_GRANTED => 300

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_OPLOCK_PROTOCOL => 301

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DISK_TOO_FRAGMENTED => 302

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DELETE_PENDING => 303

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INCOMPATIBLE_WITH_GLOBAL_SHORT_NAME_REGISTRY_SETTING => 304

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHORT_NAMES_NOT_ENABLED_ON_VOLUME => 305

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECURITY_STREAM_IS_INCONSISTENT => 306

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_LOCK_RANGE => 307

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IMAGE_SUBSYSTEM_NOT_PRESENT => 308

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOTIFICATION_GUID_ALREADY_DEFINED => 309

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_EXCEPTION_HANDLER => 310

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DUPLICATE_PRIVILEGES => 311

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_RANGES_PROCESSED => 312

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_ALLOWED_ON_SYSTEM_FILE => 313

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DISK_RESOURCES_EXHAUSTED => 314

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_TOKEN => 315

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_FEATURE_NOT_SUPPORTED => 316

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MR_MID_NOT_FOUND => 317

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SCOPE_NOT_FOUND => 318

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNDEFINED_SCOPE => 319

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_CAP => 320

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_UNREACHABLE => 321

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_NO_RESOURCES => 322

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DATA_CHECKSUM_ERROR => 323

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERMIXED_KERNEL_EA_OPERATION => 324

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_LEVEL_TRIM_NOT_SUPPORTED => 326

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OFFSET_ALIGNMENT_VIOLATION => 327

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_FIELD_IN_PARAMETER_LIST => 328

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OPERATION_IN_PROGRESS => 329

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_DEVICE_PATH => 330

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_DESCRIPTORS => 331

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SCRUB_DATA_DISABLED => 332

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_REDUNDANT_STORAGE => 333

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESIDENT_FILE_NOT_SUPPORTED => 334

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_COMPRESSED_FILE_NOT_SUPPORTED => 335

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIRECTORY_NOT_SUPPORTED => 336

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_READ_FROM_COPY => 337

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FT_WRITE_FAILURE => 338

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FT_DI_SCAN_REQUIRED => 339

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_KERNEL_INFO_VERSION => 340

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PEP_INFO_VERSION => 341

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OBJECT_NOT_EXTERNALLY_BACKED => 342

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EXTERNAL_BACKING_PROVIDER_UNKNOWN => 343

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_COMPRESSION_NOT_BENEFICIAL => 344

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STORAGE_TOPOLOGY_ID_MISMATCH => 345

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BLOCKED_BY_PARENTAL_CONTROLS => 346

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BLOCK_TOO_MANY_REFERENCES => 347

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MARKED_TO_DISALLOW_WRITES => 348

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ENCLAVE_FAILURE => 349

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FAIL_NOACTION_REBOOT => 350

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FAIL_SHUTDOWN => 351

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FAIL_RESTART => 352

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MAX_SESSIONS_REACHED => 353

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NETWORK_ACCESS_DENIED_EDP => 354

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_HINT_NAME_BUFFER_TOO_SMALL => 355

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EDP_POLICY_DENIES_OPERATION => 356

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EDP_DPL_POLICY_CANT_BE_SATISFIED => 357

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_SYNC_ROOT_METADATA_CORRUPT => 358

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_IN_MAINTENANCE => 359

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SUPPORTED_ON_DAX => 360

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DAX_MAPPING_EXISTS => 361

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_PROVIDER_NOT_RUNNING => 362

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_METADATA_CORRUPT => 363

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_METADATA_TOO_LARGE => 364

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_PROPERTY_BLOB_TOO_LARGE => 365

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_PROPERTY_BLOB_CHECKSUM_MISMATCH => 366

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CHILD_PROCESS_BLOCKED => 367

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STORAGE_LOST_DATA_PERSISTENCE => 368

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_SYSTEM_VIRTUALIZATION_UNAVAILABLE => 369

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_SYSTEM_VIRTUALIZATION_METADATA_CORRUPT => 370

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_SYSTEM_VIRTUALIZATION_BUSY => 371

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_SYSTEM_VIRTUALIZATION_PROVIDER_UNKNOWN => 372

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GDI_HANDLE_LEAK => 373

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_TOO_MANY_PROPERTY_BLOBS => 374

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_PROPERTY_VERSION_NOT_SUPPORTED => 375

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_A_CLOUD_FILE => 376

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_NOT_IN_SYNC => 377

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_ALREADY_CONNECTED => 378

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_NOT_SUPPORTED => 379

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_INVALID_REQUEST => 380

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_READ_ONLY_VOLUME => 381

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_CONNECTED_PROVIDER_ONLY => 382

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_VALIDATION_FAILED => 383

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SMB1_NOT_AVAILABLE => 384

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_SYSTEM_VIRTUALIZATION_INVALID_OPERATION => 385

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_AUTHENTICATION_FAILED => 386

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_INSUFFICIENT_RESOURCES => 387

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_NETWORK_UNAVAILABLE => 388

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_UNSUCCESSFUL => 389

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_NOT_UNDER_SYNC_ROOT => 390

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_IN_USE => 391

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_PINNED => 392

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_REQUEST_ABORTED => 393

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_PROPERTY_CORRUPT => 394

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_ACCESS_DENIED => 395

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_INCOMPATIBLE_HARDLINKS => 396

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_PROPERTY_LOCK_CONFLICT => 397

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_REQUEST_CANCELED => 398

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EXTERNAL_SYSKEY_NOT_SUPPORTED => 399

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_THREAD_MODE_ALREADY_BACKGROUND => 400

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_THREAD_MODE_NOT_BACKGROUND => 401

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROCESS_MODE_ALREADY_BACKGROUND => 402

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROCESS_MODE_NOT_BACKGROUND => 403

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_PROVIDER_TERMINATED => 404

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_A_CLOUD_SYNC_ROOT => 405

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_PROTECTED_UNDER_DPL => 406

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLUME_NOT_CLUSTER_ALIGNED => 407

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_PHYSICALLY_ALIGNED_FREE_SPACE_FOUND => 408

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPX_FILE_NOT_ENCRYPTED => 409

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RWRAW_ENCRYPTED_FILE_NOT_ENCRYPTED => 410

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RWRAW_ENCRYPTED_INVALID_EDATAINFO_FILEOFFSET => 411

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RWRAW_ENCRYPTED_INVALID_EDATAINFO_FILERANGE => 412

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RWRAW_ENCRYPTED_INVALID_EDATAINFO_PARAMETER => 413

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LINUX_SUBSYSTEM_NOT_PRESENT => 414

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FT_READ_FAILURE => 415

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STORAGE_RESERVE_ID_INVALID => 416

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STORAGE_RESERVE_DOES_NOT_EXIST => 417

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STORAGE_RESERVE_ALREADY_EXISTS => 418

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STORAGE_RESERVE_NOT_EMPTY => 419

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_A_DAX_VOLUME => 420

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_DAX_MAPPABLE => 421

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TIME_SENSITIVE_THREAD => 422

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DPL_NOT_SUPPORTED_FOR_USER => 423

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CASE_DIFFERING_NAMES_IN_DIR => 424

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_NOT_SUPPORTED => 425

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_REQUEST_TIMEOUT => 426

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_TASK_QUEUE => 427

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SRC_SRV_DLL_LOAD_FAILED => 428

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SUPPORTED_WITH_BTT => 429

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ENCRYPTION_DISABLED => 430

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ENCRYPTING_METADATA_DISALLOWED => 431

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANT_CLEAR_ENCRYPTION_FLAG => 432

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SUCH_DEVICE => 433

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_DEHYDRATION_DISALLOWED => 434

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_SNAP_IN_PROGRESS => 435

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_SNAP_USER_SECTION_NOT_SUPPORTED => 436

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_SNAP_MODIFY_NOT_SUPPORTED => 437

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_SNAP_IO_NOT_COORDINATED => 438

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_SNAP_UNEXPECTED_ERROR => 439

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_SNAP_INVALID_PARAMETER => 440

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNSATISFIED_DEPENDENCIES => 441

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CASE_SENSITIVE_PATH => 442

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNEXPECTED_NTCACHEMANAGER_ERROR => 443

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LINUX_SUBSYSTEM_UPDATE_REQUIRED => 444

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DLP_POLICY_WARNS_AGAINST_OPERATION => 445

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DLP_POLICY_DENIES_OPERATION => 446

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECURITY_DENIES_OPERATION => 447

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNTRUSTED_MOUNT_POINT => 448

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DLP_POLICY_SILENTLY_FAIL => 449

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CAPAUTHZ_NOT_DEVUNLOCKED => 450

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CAPAUTHZ_CHANGE_TYPE => 451

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CAPAUTHZ_NOT_PROVISIONED => 452

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CAPAUTHZ_NOT_AUTHORIZED => 453

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CAPAUTHZ_NO_POLICY => 454

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CAPAUTHZ_DB_CORRUPTED => 455

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CAPAUTHZ_SCCD_INVALID_CATALOG => 456

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CAPAUTHZ_SCCD_NO_AUTH_ENTITY => 457

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CAPAUTHZ_SCCD_PARSE_ERROR => 458

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CAPAUTHZ_SCCD_DEV_MODE_REQUIRED => 459

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CAPAUTHZ_SCCD_NO_CAPABILITY_MATCH => 460

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CIMFS_IMAGE_CORRUPT => 470

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CIMFS_IMAGE_VERSION_NOT_SUPPORTED => 471

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STORAGE_STACK_ACCESS_DENIED => 472

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSUFFICIENT_VIRTUAL_ADDR_RESOURCES => 473

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INDEX_OUT_OF_BOUNDS => 474

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLOUD_FILE_US_MESSAGE_TIMEOUT => 475

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_A_DEV_VOLUME => 476

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FS_GUID_MISMATCH => 477

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANT_ATTACH_TO_DEV_VOLUME => 478

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_CONFIG_VALUE => 479

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PNP_QUERY_REMOVE_DEVICE_TIMEOUT => 480

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PNP_QUERY_REMOVE_RELATED_DEVICE_TIMEOUT => 481

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PNP_QUERY_REMOVE_UNRELATED_DEVICE_TIMEOUT => 482

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_HARDWARE_ERROR => 483

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_ADDRESS => 487

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HAS_SYSTEM_CRITICAL_FILES => 488

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ENCRYPTED_FILE_NOT_SUPPORTED => 489

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SPARSE_FILE_NOT_SUPPORTED => 490

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PAGEFILE_NOT_SUPPORTED => 491

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLUME_NOT_SUPPORTED => 492

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SUPPORTED_WITH_BYPASSIO => 493

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_BYPASSIO_DRIVER_SUPPORT => 494

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SUPPORTED_WITH_ENCRYPTION => 495

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SUPPORTED_WITH_COMPRESSION => 496

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SUPPORTED_WITH_REPLICATION => 497

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SUPPORTED_WITH_DEDUPLICATION => 498

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SUPPORTED_WITH_AUDITING => 499

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_USER_PROFILE_LOAD => 500

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SESSION_KEY_TOO_SHORT => 501

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ACCESS_DENIED_APPDATA => 502

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SUPPORTED_WITH_MONITORING => 503

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SUPPORTED_WITH_SNAPSHOT => 504

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SUPPORTED_WITH_VIRTUALIZATION => 505

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BYPASSIO_FLT_NOT_SUPPORTED => 506

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_RESET_REQUIRED => 507

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLUME_WRITE_ACCESS_DENIED => 508

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SUPPORTED_WITH_CACHED_HANDLE => 509

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FS_METADATA_INCONSISTENT => 510

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BLOCK_WEAK_REFERENCE_INVALID => 511

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BLOCK_SOURCE_WEAK_REFERENCE_INVALID => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BLOCK_TARGET_WEAK_REFERENCE_INVALID => 513

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BLOCK_SHARED => 514

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLUME_UPGRADE_NOT_NEEDED => 515

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLUME_UPGRADE_PENDING => 516

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLUME_UPGRADE_DISABLED => 517

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLUME_UPGRADE_DISABLED_TILL_OS_DOWNGRADE_EXPIRED => 518

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ARITHMETIC_OVERFLOW => 534

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PIPE_CONNECTED => 535

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PIPE_LISTENING => 536

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VERIFIER_STOP => 537

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ABIOS_ERROR => 538

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WX86_WARNING => 539

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WX86_ERROR => 540

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TIMER_NOT_CANCELED => 541

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNWIND => 542

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_STACK => 543

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_UNWIND_TARGET => 544

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PORT_ATTRIBUTES => 545

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PORT_MESSAGE_TOO_LONG => 546

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_QUOTA_LOWER => 547

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_ALREADY_ATTACHED => 548

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTRUCTION_MISALIGNMENT => 549

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROFILING_NOT_STARTED => 550

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROFILING_NOT_STOPPED => 551

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_COULD_NOT_INTERPRET => 552

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROFILING_AT_LIMIT => 553

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANT_WAIT => 554

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANT_TERMINATE_SELF => 555

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNEXPECTED_MM_CREATE_ERR => 556

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNEXPECTED_MM_MAP_ERROR => 557

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNEXPECTED_MM_EXTEND_ERR => 558

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_FUNCTION_TABLE => 559

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_GUID_TRANSLATION => 560

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_LDT_SIZE => 561

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_LDT_OFFSET => 563

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_LDT_DESCRIPTOR => 564

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_THREADS => 565

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_THREAD_NOT_IN_PROCESS => 566

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PAGEFILE_QUOTA_EXCEEDED => 567

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOGON_SERVER_CONFLICT => 568

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYNCHRONIZATION_REQUIRED => 569

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NET_OPEN_FAILED => 570

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IO_PRIVILEGE_FAILED => 571

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONTROL_C_EXIT => 572

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MISSING_SYSTEMFILE => 573

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNHANDLED_EXCEPTION => 574

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APP_INIT_FAILURE => 575

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PAGEFILE_CREATE_FAILED => 576

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_IMAGE_HASH => 577

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_PAGEFILE => 578

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ILLEGAL_FLOAT_CONTEXT => 579

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_EVENT_PAIR => 580

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DOMAIN_CTRLR_CONFIG_ERROR => 581

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ILLEGAL_CHARACTER => 582

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNDEFINED_CHARACTER => 583

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FLOPPY_VOLUME => 584

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BIOS_FAILED_TO_CONNECT_INTERRUPT => 585

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BACKUP_CONTROLLER => 586

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MUTANT_LIMIT_EXCEEDED => 587

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FS_DRIVER_REQUIRED => 588

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_LOAD_REGISTRY_FILE => 589

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEBUG_ATTACH_FAILED => 590

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_PROCESS_TERMINATED => 591

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DATA_NOT_ACCEPTED => 592

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VDM_HARD_ERROR => 593

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DRIVER_CANCEL_TIMEOUT => 594

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REPLY_MESSAGE_MISMATCH => 595

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOST_WRITEBEHIND_DATA => 596

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLIENT_SERVER_PARAMETERS_INVALID => 597

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_TINY_STREAM => 598

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STACK_OVERFLOW_READ => 599

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONVERT_TO_LARGE => 600

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FOUND_OUT_OF_SCOPE => 601

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALLOCATE_BUCKET => 602

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MARSHALL_OVERFLOW => 603

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_VARIANT => 604

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_COMPRESSION_BUFFER => 605

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_AUDIT_FAILED => 606

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TIMER_RESOLUTION_NOT_SET => 607

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSUFFICIENT_LOGON_INFO => 608

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_DLL_ENTRYPOINT => 609

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_SERVICE_ENTRYPOINT => 610

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IP_ADDRESS_CONFLICT1 => 611

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IP_ADDRESS_CONFLICT2 => 612

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REGISTRY_QUOTA_LIMIT => 613

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_CALLBACK_ACTIVE => 614

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PWD_TOO_SHORT => 615

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PWD_TOO_RECENT => 616

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PWD_HISTORY_CONFLICT => 617

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNSUPPORTED_COMPRESSION => 618

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_HW_PROFILE => 619

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PLUGPLAY_DEVICE_PATH => 620

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_QUOTA_LIST_INCONSISTENT => 621

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVALUATION_EXPIRATION => 622

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ILLEGAL_DLL_RELOCATION => 623

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DLL_INIT_FAILED_LOGOFF => 624

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VALIDATE_CONTINUE => 625

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_MORE_MATCHES => 626

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RANGE_LIST_CONFLICT => 627

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVER_SID_MISMATCH => 628

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANT_ENABLE_DENY_ONLY => 629

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FLOAT_MULTIPLE_FAULTS => 630

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FLOAT_MULTIPLE_TRAPS => 631

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOINTERFACE => 632

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DRIVER_FAILED_SLEEP => 633

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CORRUPT_SYSTEM_FILE => 634

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_COMMITMENT_MINIMUM => 635

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PNP_RESTART_ENUMERATION => 636

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_IMAGE_BAD_SIGNATURE => 637

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PNP_REBOOT_REQUIRED => 638

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSUFFICIENT_POWER => 639

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MULTIPLE_FAULT_VIOLATION => 640

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_SHUTDOWN => 641

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PORT_NOT_SET => 642

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_VERSION_CHECK_FAILURE => 643

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RANGE_NOT_FOUND => 644

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SAFE_MODE_DRIVER => 646

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FAILED_DRIVER_ENTRY => 647

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_ENUMERATION_ERROR => 648

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MOUNT_POINT_NOT_RESOLVED => 649

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_DEVICE_OBJECT_PARAMETER => 650

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MCA_OCCURED => 651

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DRIVER_DATABASE_ERROR => 652

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_HIVE_TOO_LARGE => 653

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DRIVER_FAILED_PRIOR_UNLOAD => 654

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLSNAP_PREPARE_HIBERNATE => 655

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HIBERNATION_FAILURE => 656

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PWD_TOO_LONG => 657

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_SYSTEM_LIMITATION => 665

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ASSERTION_FAILURE => 668

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ACPI_ERROR => 669

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WOW_ASSERTION => 670

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PNP_BAD_MPS_TABLE => 671

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PNP_TRANSLATION_FAILED => 672

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PNP_IRQ_TRANSLATION_FAILED => 673

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PNP_INVALID_ID => 674

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WAKE_SYSTEM_DEBUGGER => 675

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HANDLES_CLOSED => 676

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EXTRANEOUS_INFORMATION => 677

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RXACT_COMMIT_NECESSARY => 678

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MEDIA_CHECK => 679

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GUID_SUBSTITUTION_MADE => 680

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STOPPED_ON_SYMLINK => 681

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LONGJUMP => 682

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PLUGPLAY_QUERY_VETOED => 683

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNWIND_CONSOLIDATE => 684

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REGISTRY_HIVE_RECOVERED => 685

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DLL_MIGHT_BE_INSECURE => 686

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DLL_MIGHT_BE_INCOMPATIBLE => 687

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DBG_EXCEPTION_NOT_HANDLED => 688

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DBG_REPLY_LATER => 689

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DBG_UNABLE_TO_PROVIDE_HANDLE => 690

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DBG_TERMINATE_THREAD => 691

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DBG_TERMINATE_PROCESS => 692

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DBG_CONTROL_C => 693

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DBG_PRINTEXCEPTION_C => 694

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DBG_RIPEXCEPTION => 695

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DBG_CONTROL_BREAK => 696

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DBG_COMMAND_EXCEPTION => 697

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OBJECT_NAME_EXISTS => 698

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_THREAD_WAS_SUSPENDED => 699

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IMAGE_NOT_AT_BASE => 700

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RXACT_STATE_CREATED => 701

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SEGMENT_NOTIFICATION => 702

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_CURRENT_DIRECTORY => 703

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FT_READ_RECOVERY_FROM_BACKUP => 704

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FT_WRITE_RECOVERY => 705

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IMAGE_MACHINE_TYPE_MISMATCH => 706

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RECEIVE_PARTIAL => 707

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RECEIVE_EXPEDITED => 708

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RECEIVE_PARTIAL_EXPEDITED => 709

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVENT_DONE => 710

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVENT_PENDING => 711

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CHECKING_FILE_SYSTEM => 712

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FATAL_APP_EXIT => 713

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PREDEFINED_HANDLE => 714

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WAS_UNLOCKED => 715

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_NOTIFICATION => 716

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WAS_LOCKED => 717

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_HARD_ERROR => 718

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALREADY_WIN32 => 719

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IMAGE_MACHINE_TYPE_MISMATCH_EXE => 720

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_YIELD_PERFORMED => 721

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TIMER_RESUME_IGNORED => 722

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ARBITRATION_UNHANDLED => 723

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CARDBUS_NOT_SUPPORTED => 724

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MP_PROCESSOR_MISMATCH => 725

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HIBERNATED => 726

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESUME_HIBERNATION => 727

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FIRMWARE_UPDATED => 728

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DRIVERS_LEAKING_LOCKED_PAGES => 729

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WAKE_SYSTEM => 730

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WAIT_1 => 731

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WAIT_2 => 732

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WAIT_3 => 733

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WAIT_63 => 734

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ABANDONED_WAIT_0 => 735

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ABANDONED_WAIT_63 => 736

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_USER_APC => 737

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_KERNEL_APC => 738

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALERTED => 739

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ELEVATION_REQUIRED => 740

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REPARSE => 741

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OPLOCK_BREAK_IN_PROGRESS => 742

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLUME_MOUNTED => 743

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RXACT_COMMITTED => 744

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOTIFY_CLEANUP => 745

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRIMARY_TRANSPORT_CONNECT_FAILED => 746

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PAGE_FAULT_TRANSITION => 747

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PAGE_FAULT_DEMAND_ZERO => 748

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PAGE_FAULT_COPY_ON_WRITE => 749

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PAGE_FAULT_GUARD_PAGE => 750

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PAGE_FAULT_PAGING_FILE => 751

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CACHE_PAGE_LOCKED => 752

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CRASH_DUMP => 753

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BUFFER_ALL_ZEROS => 754

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REPARSE_OBJECT => 755

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESOURCE_REQUIREMENTS_CHANGED => 756

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSLATION_COMPLETE => 757

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOTHING_TO_TERMINATE => 758

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROCESS_NOT_IN_JOB => 759

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROCESS_IN_JOB => 760

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLSNAP_HIBERNATE_READY => 761

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FSFILTER_OP_COMPLETED_SUCCESSFULLY => 762

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERRUPT_VECTOR_ALREADY_CONNECTED => 763

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERRUPT_STILL_CONNECTED => 764

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WAIT_FOR_OPLOCK => 765

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DBG_EXCEPTION_HANDLED => 766

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DBG_CONTINUE => 767

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CALLBACK_POP_STACK => 768

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_COMPRESSION_DISABLED => 769

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANTFETCHBACKWARDS => 770

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANTSCROLLBACKWARDS => 771

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ROWSNOTRELEASED => 772

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_ACCESSOR_FLAGS => 773

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ERRORS_ENCOUNTERED => 774

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_CAPABLE => 775

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REQUEST_OUT_OF_SEQUENCE => 776

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VERSION_PARSE_ERROR => 777

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BADSTARTPOSITION => 778

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MEMORY_HARDWARE => 779

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DISK_REPAIR_DISABLED => 780

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSUFFICIENT_RESOURCE_FOR_SPECIFIED_SHARED_SECTION_SIZE => 781

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_POWERSTATE_TRANSITION => 782

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_POWERSTATE_COMPLEX_TRANSITION => 783

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MCA_EXCEPTION => 784

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ACCESS_AUDIT_BY_POLICY => 785

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ACCESS_DISABLED_NO_SAFER_UI_BY_POLICY => 786

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ABANDON_HIBERFILE => 787

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOST_WRITEBEHIND_DATA_NETWORK_DISCONNECTED => 788

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOST_WRITEBEHIND_DATA_NETWORK_SERVER_ERROR => 789

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOST_WRITEBEHIND_DATA_LOCAL_DISK_ERROR => 790

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_MCFG_TABLE => 791

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DISK_REPAIR_REDIRECTED => 792

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DISK_REPAIR_UNSUCCESSFUL => 793

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CORRUPT_LOG_OVERFULL => 794

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CORRUPT_LOG_CORRUPTED => 795

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CORRUPT_LOG_UNAVAILABLE => 796

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CORRUPT_LOG_DELETED_FULL => 797

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CORRUPT_LOG_CLEARED => 798

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ORPHAN_NAME_EXHAUSTED => 799

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OPLOCK_SWITCHED_TO_NEW_HANDLE => 800

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_GRANT_REQUESTED_OPLOCK => 801

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_BREAK_OPLOCK => 802

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OPLOCK_HANDLE_CLOSED => 803

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_ACE_CONDITION => 804

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_ACE_CONDITION => 805

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_HANDLE_REVOKED => 806

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IMAGE_AT_DIFFERENT_BASE => 807

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ENCRYPTED_IO_NOT_POSSIBLE => 808

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_METADATA_OPTIMIZATION_IN_PROGRESS => 809

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_QUOTA_ACTIVITY => 810

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HANDLE_REVOKED => 811

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CALLBACK_INVOKE_INLINE => 812

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CPU_SET_INVALID => 813

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ENCLAVE_NOT_TERMINATED => 814

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ENCLAVE_VIOLATION => 815

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVER_TRANSPORT_CONFLICT => 816

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CERTIFICATE_VALIDATION_PREFERENCE_CONFLICT => 817

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FT_READ_FROM_COPY_FAILURE => 818

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECTION_DIRECT_MAP_ONLY => 819

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EA_ACCESS_DENIED => 994

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OPERATION_ABORTED => 995

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IO_INCOMPLETE => 996

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IO_PENDING => 997

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOACCESS => 998

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SWAPERROR => 999

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STACK_OVERFLOW => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_MESSAGE => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CAN_NOT_COMPLETE => 1003

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_FLAGS => 1004

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNRECOGNIZED_VOLUME => 1005

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_INVALID => 1006

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FULLSCREEN_MODE => 1007

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_TOKEN => 1008

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BADDB => 1009

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BADKEY => 1010

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANTOPEN => 1011

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANTREAD => 1012

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANTWRITE => 1013

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REGISTRY_RECOVERED => 1014

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REGISTRY_CORRUPT => 1015

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REGISTRY_IO_FAILED => 1016

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_REGISTRY_FILE => 1017

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_KEY_DELETED => 1018

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_LOG_SPACE => 1019

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_KEY_HAS_CHILDREN => 1020

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CHILD_MUST_BE_VOLATILE => 1021

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOTIFY_ENUM_DIR => 1022

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEPENDENT_SERVICES_RUNNING => 1051

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SERVICE_CONTROL => 1052

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_REQUEST_TIMEOUT => 1053

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_NO_THREAD => 1054

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_DATABASE_LOCKED => 1055

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_ALREADY_RUNNING => 1056

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SERVICE_ACCOUNT => 1057

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_DISABLED => 1058

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CIRCULAR_DEPENDENCY => 1059

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_DOES_NOT_EXIST => 1060

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_CANNOT_ACCEPT_CTRL => 1061

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_NOT_ACTIVE => 1062

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FAILED_SERVICE_CONTROLLER_CONNECT => 1063

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EXCEPTION_IN_SERVICE => 1064

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DATABASE_DOES_NOT_EXIST => 1065

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_SPECIFIC_ERROR => 1066

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROCESS_ABORTED => 1067

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_DEPENDENCY_FAIL => 1068

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_LOGON_FAILED => 1069

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_START_HANG => 1070

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SERVICE_LOCK => 1071

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_MARKED_FOR_DELETE => 1072

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_EXISTS => 1073

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALREADY_RUNNING_LKG => 1074

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_DEPENDENCY_DELETED => 1075

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BOOT_ALREADY_ACCEPTED => 1076

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_NEVER_STARTED => 1077

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DUPLICATE_SERVICE_NAME => 1078

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIFFERENT_SERVICE_ACCOUNT => 1079

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_DETECT_DRIVER_FAILURE => 1080

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_DETECT_PROCESS_ABORT => 1081

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_RECOVERY_PROGRAM => 1082

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_NOT_IN_EXE => 1083

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SAFEBOOT_SERVICE => 1084

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_END_OF_MEDIA => 1100

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILEMARK_DETECTED => 1101

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BEGINNING_OF_MEDIA => 1102

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SETMARK_DETECTED => 1103

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_DATA_DETECTED => 1104

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PARTITION_FAILURE => 1105

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_BLOCK_LENGTH => 1106

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_NOT_PARTITIONED => 1107

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNABLE_TO_LOCK_MEDIA => 1108

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNABLE_TO_UNLOAD_MEDIA => 1109

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MEDIA_CHANGED => 1110

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BUS_RESET => 1111

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_MEDIA_IN_DRIVE => 1112

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_UNICODE_TRANSLATION => 1113

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DLL_INIT_FAILED => 1114

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHUTDOWN_IN_PROGRESS => 1115

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SHUTDOWN_IN_PROGRESS => 1116

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IO_DEVICE => 1117

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERIAL_NO_DEVICE => 1118

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IRQ_BUSY => 1119

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MORE_WRITES => 1120

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_COUNTER_TIMEOUT => 1121

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FLOPPY_ID_MARK_NOT_FOUND => 1122

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FLOPPY_WRONG_CYLINDER => 1123

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FLOPPY_UNKNOWN_ERROR => 1124

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FLOPPY_BAD_REGISTERS => 1125

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DISK_RECALIBRATE_FAILED => 1126

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DISK_OPERATION_FAILED => 1127

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DISK_RESET_FAILED => 1128

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EOM_OVERFLOW => 1129

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_ENOUGH_SERVER_MEMORY => 1130

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_POSSIBLE_DEADLOCK => 1131

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MAPPED_ALIGNMENT => 1132

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SET_POWER_STATE_VETOED => 1140

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SET_POWER_STATE_FAILED => 1141

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_LINKS => 1142

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OLD_WIN_VERSION => 1150

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APP_WRONG_OS => 1151

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SINGLE_INSTANCE_APP => 1152

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RMODE_APP => 1153

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_DLL => 1154

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_ASSOCIATION => 1155

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DDE_FAIL => 1156

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DLL_NOT_FOUND => 1157

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_MORE_USER_HANDLES => 1158

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MESSAGE_SYNC_ONLY => 1159

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOURCE_ELEMENT_EMPTY => 1160

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DESTINATION_ELEMENT_FULL => 1161

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ILLEGAL_ELEMENT_ADDRESS => 1162

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MAGAZINE_NOT_PRESENT => 1163

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_REINITIALIZATION_NEEDED => 1164

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_REQUIRES_CLEANING => 1165

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_DOOR_OPEN => 1166

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_NOT_CONNECTED => 1167

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_FOUND => 1168

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_MATCH => 1169

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SET_NOT_FOUND => 1170

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_POINT_NOT_FOUND => 1171

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_TRACKING_SERVICE => 1172

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_VOLUME_ID => 1173

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNABLE_TO_REMOVE_REPLACED => 1175

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNABLE_TO_MOVE_REPLACEMENT => 1176

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNABLE_TO_MOVE_REPLACEMENT_2 => 1177

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_JOURNAL_DELETE_IN_PROGRESS => 1178

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_JOURNAL_NOT_ACTIVE => 1179

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_POTENTIAL_FILE_FOUND => 1180

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_JOURNAL_ENTRY_DELETED => 1181

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PARTITION_TERMINATING => 1184

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHUTDOWN_IS_SCHEDULED => 1190

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHUTDOWN_USERS_LOGGED_ON => 1191

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHUTDOWN_DISKS_NOT_IN_MAINTENANCE_MODE => 1192

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_DEVICE => 1200

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONNECTION_UNAVAIL => 1201

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_ALREADY_REMEMBERED => 1202

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_NET_OR_BAD_PATH => 1203

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_PROVIDER => 1204

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_OPEN_PROFILE => 1205

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_PROFILE => 1206

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_CONTAINER => 1207

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EXTENDED_ERROR => 1208

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_GROUPNAME => 1209

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_COMPUTERNAME => 1210

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_EVENTNAME => 1211

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_DOMAINNAME => 1212

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SERVICENAME => 1213

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_NETNAME => 1214

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SHARENAME => 1215

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PASSWORDNAME => 1216

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_MESSAGENAME => 1217

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_MESSAGEDEST => 1218

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SESSION_CREDENTIAL_CONFLICT => 1219

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REMOTE_SESSION_LIMIT_EXCEEDED => 1220

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DUP_DOMAINNAME => 1221

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_NETWORK => 1222

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANCELLED => 1223

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_USER_MAPPED_FILE => 1224

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONNECTION_REFUSED => 1225

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GRACEFUL_DISCONNECT => 1226

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ADDRESS_ALREADY_ASSOCIATED => 1227

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ADDRESS_NOT_ASSOCIATED => 1228

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONNECTION_INVALID => 1229

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONNECTION_ACTIVE => 1230

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NETWORK_UNREACHABLE => 1231

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HOST_UNREACHABLE => 1232

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROTOCOL_UNREACHABLE => 1233

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PORT_UNREACHABLE => 1234

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REQUEST_ABORTED => 1235

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONNECTION_ABORTED => 1236

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RETRY => 1237

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONNECTION_COUNT_LIMIT => 1238

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOGIN_TIME_RESTRICTION => 1239

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOGIN_WKSTA_RESTRICTION => 1240

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INCORRECT_ADDRESS => 1241

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALREADY_REGISTERED => 1242

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_NOT_FOUND => 1243

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_AUTHENTICATED => 1244

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_LOGGED_ON => 1245

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONTINUE => 1246

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALREADY_INITIALIZED => 1247

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_MORE_DEVICES => 1248

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SUCH_SITE => 1249

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DOMAIN_CONTROLLER_EXISTS => 1250

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ONLY_IF_CONNECTED => 1251

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OVERRIDE_NOCHANGES => 1252

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_USER_PROFILE => 1253

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SUPPORTED_ON_SBS => 1254

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVER_SHUTDOWN_IN_PROGRESS => 1255

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HOST_DOWN => 1256

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NON_ACCOUNT_SID => 1257

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NON_DOMAIN_SID => 1258

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPHELP_BLOCK => 1259

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ACCESS_DISABLED_BY_POLICY => 1260

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REG_NAT_CONSUMPTION => 1261

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CSCSHARE_OFFLINE => 1262

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PKINIT_FAILURE => 1263

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SMARTCARD_SUBSYSTEM_FAILURE => 1264

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DOWNGRADE_DETECTED => 1265

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MACHINE_LOCKED => 1271

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SMB_GUEST_LOGON_BLOCKED => 1272

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CALLBACK_SUPPLIED_INVALID_DATA => 1273

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYNC_FOREGROUND_REFRESH_REQUIRED => 1274

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DRIVER_BLOCKED => 1275

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_IMPORT_OF_NON_DLL => 1276

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ACCESS_DISABLED_WEBBLADE => 1277

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ACCESS_DISABLED_WEBBLADE_TAMPER => 1278

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RECOVERY_FAILURE => 1279

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALREADY_FIBER => 1280

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALREADY_THREAD => 1281

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STACK_BUFFER_OVERRUN => 1282

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PARAMETER_QUOTA_EXCEEDED => 1283

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEBUGGER_INACTIVE => 1284

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DELAY_LOAD_FAILED => 1285

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VDM_DISALLOWED => 1286

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNIDENTIFIED_ERROR => 1287

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_CRUNTIME_PARAMETER => 1288

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BEYOND_VDL => 1289

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INCOMPATIBLE_SERVICE_SID_TYPE => 1290

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DRIVER_PROCESS_TERMINATED => 1291

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IMPLEMENTATION_LIMIT => 1292

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROCESS_IS_PROTECTED => 1293

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_NOTIFY_CLIENT_LAGGING => 1294

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DISK_QUOTA_EXCEEDED => 1295

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONTENT_BLOCKED => 1296

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INCOMPATIBLE_SERVICE_PRIVILEGE => 1297

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APP_HANG => 1298

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_LABEL => 1299

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_ALL_ASSIGNED => 1300

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SOME_NOT_MAPPED => 1301

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_QUOTAS_FOR_ACCOUNT => 1302

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOCAL_USER_SESSION_KEY => 1303

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NULL_LM_PASSWORD => 1304

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNKNOWN_REVISION => 1305

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REVISION_MISMATCH => 1306

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_OWNER => 1307

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PRIMARY_GROUP => 1308

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_IMPERSONATION_TOKEN => 1309

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANT_DISABLE_MANDATORY => 1310

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_LOGON_SERVERS => 1311

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SUCH_LOGON_SESSION => 1312

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SUCH_PRIVILEGE => 1313

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRIVILEGE_NOT_HELD => 1314

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_ACCOUNT_NAME => 1315

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_USER_EXISTS => 1316

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SUCH_USER => 1317

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GROUP_EXISTS => 1318

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SUCH_GROUP => 1319

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MEMBER_IN_GROUP => 1320

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MEMBER_NOT_IN_GROUP => 1321

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LAST_ADMIN => 1322

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRONG_PASSWORD => 1323

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ILL_FORMED_PASSWORD => 1324

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PASSWORD_RESTRICTION => 1325

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOGON_FAILURE => 1326

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ACCOUNT_RESTRICTION => 1327

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_LOGON_HOURS => 1328

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_WORKSTATION => 1329

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PASSWORD_EXPIRED => 1330

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ACCOUNT_DISABLED => 1331

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NONE_MAPPED => 1332

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_LUIDS_REQUESTED => 1333

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LUIDS_EXHAUSTED => 1334

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SUB_AUTHORITY => 1335

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_ACL => 1336

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SID => 1337

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SECURITY_DESCR => 1338

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_INHERITANCE_ACL => 1340

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVER_DISABLED => 1341

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVER_NOT_DISABLED => 1342

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_ID_AUTHORITY => 1343

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALLOTTED_SPACE_EXCEEDED => 1344

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_GROUP_ATTRIBUTES => 1345

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_IMPERSONATION_LEVEL => 1346

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANT_OPEN_ANONYMOUS => 1347

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_VALIDATION_CLASS => 1348

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_TOKEN_TYPE => 1349

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SECURITY_ON_OBJECT => 1350

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANT_ACCESS_DOMAIN_INFO => 1351

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SERVER_STATE => 1352

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_DOMAIN_STATE => 1353

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_DOMAIN_ROLE => 1354

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SUCH_DOMAIN => 1355

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DOMAIN_EXISTS => 1356

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DOMAIN_LIMIT_EXCEEDED => 1357

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNAL_DB_CORRUPTION => 1358

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNAL_ERROR => 1359

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GENERIC_NOT_MAPPED => 1360

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_DESCRIPTOR_FORMAT => 1361

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_LOGON_PROCESS => 1362

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOGON_SESSION_EXISTS => 1363

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SUCH_PACKAGE => 1364

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_LOGON_SESSION_STATE => 1365

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOGON_SESSION_COLLISION => 1366

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_LOGON_TYPE => 1367

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_IMPERSONATE => 1368

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RXACT_INVALID_STATE => 1369

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RXACT_COMMIT_FAILURE => 1370

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SPECIAL_ACCOUNT => 1371

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SPECIAL_GROUP => 1372

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SPECIAL_USER => 1373

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MEMBERS_PRIMARY_GROUP => 1374

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOKEN_ALREADY_IN_USE => 1375

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SUCH_ALIAS => 1376

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MEMBER_NOT_IN_ALIAS => 1377

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MEMBER_IN_ALIAS => 1378

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALIAS_EXISTS => 1379

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOGON_NOT_GRANTED => 1380

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_SECRETS => 1381

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECRET_TOO_LONG => 1382

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INTERNAL_DB_ERROR => 1383

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_CONTEXT_IDS => 1384

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOGON_TYPE_NOT_GRANTED => 1385

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NT_CROSS_ENCRYPTION_REQUIRED => 1386

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SUCH_MEMBER => 1387

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_MEMBER => 1388

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TOO_MANY_SIDS => 1389

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LM_CROSS_ENCRYPTION_REQUIRED => 1390

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_INHERITANCE => 1391

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_CORRUPT => 1392

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DISK_CORRUPT => 1393

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_USER_SESSION_KEY => 1394

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LICENSE_QUOTA_EXCEEDED => 1395

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRONG_TARGET_NAME => 1396

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MUTUAL_AUTH_FAILED => 1397

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TIME_SKEW => 1398

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CURRENT_DOMAIN_NOT_ALLOWED => 1399

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_WINDOW_HANDLE => 1400

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_MENU_HANDLE => 1401

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_CURSOR_HANDLE => 1402

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_ACCEL_HANDLE => 1403

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_HOOK_HANDLE => 1404

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_DWP_HANDLE => 1405

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TLW_WITH_WSCHILD => 1406

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_FIND_WND_CLASS => 1407

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINDOW_OF_OTHER_THREAD => 1408

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HOTKEY_ALREADY_REGISTERED => 1409

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLASS_ALREADY_EXISTS => 1410

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLASS_DOES_NOT_EXIST => 1411

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLASS_HAS_WINDOWS => 1412

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_INDEX => 1413

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_ICON_HANDLE => 1414

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRIVATE_DIALOG_INDEX => 1415

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LISTBOX_ID_NOT_FOUND => 1416

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_WILDCARD_CHARACTERS => 1417

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLIPBOARD_NOT_OPEN => 1418

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HOTKEY_NOT_REGISTERED => 1419

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINDOW_NOT_DIALOG => 1420

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONTROL_ID_NOT_FOUND => 1421

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_COMBOBOX_MESSAGE => 1422

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINDOW_NOT_COMBOBOX => 1423

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_EDIT_HEIGHT => 1424

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DC_NOT_FOUND => 1425

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_HOOK_FILTER => 1426

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_FILTER_PROC => 1427

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HOOK_NEEDS_HMOD => 1428

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GLOBAL_ONLY_HOOK => 1429

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_JOURNAL_HOOK_SET => 1430

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HOOK_NOT_INSTALLED => 1431

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_LB_MESSAGE => 1432

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SETCOUNT_ON_BAD_LB => 1433

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LB_WITHOUT_TABSTOPS => 1434

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DESTROY_OBJECT_OF_OTHER_THREAD => 1435

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CHILD_WINDOW_MENU => 1436

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SYSTEM_MENU => 1437

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_MSGBOX_STYLE => 1438

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SPI_VALUE => 1439

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SCREEN_ALREADY_LOCKED => 1440

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HWNDS_HAVE_DIFF_PARENT => 1441

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_CHILD_WINDOW => 1442

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_GW_COMMAND => 1443

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_THREAD_ID => 1444

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NON_MDICHILD_WINDOW => 1445

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_POPUP_ALREADY_ACTIVE => 1446

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SCROLLBARS => 1447

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SCROLLBAR_RANGE => 1448

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SHOWWIN_COMMAND => 1449

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SYSTEM_RESOURCES => 1450

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NONPAGED_SYSTEM_RESOURCES => 1451

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PAGED_SYSTEM_RESOURCES => 1452

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WORKING_SET_QUOTA => 1453

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PAGEFILE_QUOTA => 1454

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_COMMITMENT_LIMIT => 1455

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MENU_ITEM_NOT_FOUND => 1456

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_KEYBOARD_HANDLE => 1457

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HOOK_TYPE_NOT_ALLOWED => 1458

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REQUIRES_INTERACTIVE_WINDOWSTATION => 1459

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TIMEOUT => 1460

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_MONITOR_HANDLE => 1461

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INCORRECT_SIZE => 1462

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYMLINK_CLASS_DISABLED => 1463

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYMLINK_NOT_SUPPORTED => 1464

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_XML_PARSE_ERROR => 1465

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_XMLDSIG_ERROR => 1466

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESTART_APPLICATION => 1467

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRONG_COMPARTMENT => 1468

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_AUTHIP_FAILURE => 1469

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_NVRAM_RESOURCES => 1470

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_GUI_PROCESS => 1471

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVENTLOG_FILE_CORRUPT => 1500

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVENTLOG_CANT_START => 1501

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_FILE_FULL => 1502

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVENTLOG_FILE_CHANGED => 1503

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONTAINER_ASSIGNED => 1504

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_JOB_NO_CONTAINER => 1505

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_TASK_NAME => 1550

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_TASK_INDEX => 1551

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_THREAD_ALREADY_IN_TASK => 1552

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_SERVICE_FAILURE => 1601

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_USEREXIT => 1602

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_FAILURE => 1603

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_SUSPEND => 1604

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNKNOWN_PRODUCT => 1605

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNKNOWN_FEATURE => 1606

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNKNOWN_COMPONENT => 1607

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNKNOWN_PROPERTY => 1608

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_HANDLE_STATE => 1609

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_CONFIGURATION => 1610

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INDEX_ABSENT => 1611

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_SOURCE_ABSENT => 1612

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_PACKAGE_VERSION => 1613

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRODUCT_UNINSTALLED => 1614

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_QUERY_SYNTAX => 1615

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_FIELD => 1616

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_REMOVED => 1617

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_ALREADY_RUNNING => 1618

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_PACKAGE_OPEN_FAILED => 1619

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_PACKAGE_INVALID => 1620

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_UI_FAILURE => 1621

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_LOG_FAILURE => 1622

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_LANGUAGE_UNSUPPORTED => 1623

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_TRANSFORM_FAILURE => 1624

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_PACKAGE_REJECTED => 1625

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FUNCTION_NOT_CALLED => 1626

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FUNCTION_FAILED => 1627

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_TABLE => 1628

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DATATYPE_MISMATCH => 1629

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNSUPPORTED_TYPE => 1630

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CREATE_FAILED => 1631

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_TEMP_UNWRITABLE => 1632

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_PLATFORM_UNSUPPORTED => 1633

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_NOTUSED => 1634

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PATCH_PACKAGE_OPEN_FAILED => 1635

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PATCH_PACKAGE_INVALID => 1636

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PATCH_PACKAGE_UNSUPPORTED => 1637

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRODUCT_VERSION => 1638

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_COMMAND_LINE => 1639

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_REMOTE_DISALLOWED => 1640

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SUCCESS_REBOOT_INITIATED => 1641

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PATCH_TARGET_NOT_FOUND => 1642

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PATCH_PACKAGE_REJECTED => 1643

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_TRANSFORM_REJECTED => 1644

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_REMOTE_PROHIBITED => 1645

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PATCH_REMOVAL_UNSUPPORTED => 1646

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNKNOWN_PATCH => 1647

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PATCH_NO_SEQUENCE => 1648

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PATCH_REMOVAL_DISALLOWED => 1649

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PATCH_XML => 1650

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PATCH_MANAGED_ADVERTISED_PRODUCT => 1651

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_SERVICE_SAFEBOOT => 1652

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FAIL_FAST_EXCEPTION => 1653

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_REJECTED => 1654

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DYNAMIC_CODE_BLOCKED => 1655

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SAME_OBJECT => 1656

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STRICT_CFG_VIOLATION => 1657

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SET_CONTEXT_DENIED => 1660

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CROSS_PARTITION_VIOLATION => 1661

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RETURN_ADDRESS_HIJACK_ATTEMPT => 1662

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_USER_BUFFER => 1784

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNRECOGNIZED_MEDIA => 1785

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_TRUST_LSA_SECRET => 1786

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_TRUST_SAM_ACCOUNT => 1787

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRUSTED_DOMAIN_FAILURE => 1788

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRUSTED_RELATIONSHIP_FAILURE => 1789

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRUST_FAILURE => 1790

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NETLOGON_NOT_STARTED => 1792

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ACCOUNT_EXPIRED => 1793

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REDIRECTOR_HAS_OPEN_HANDLES => 1794

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRINTER_DRIVER_ALREADY_INSTALLED => 1795

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNKNOWN_PORT => 1796

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNKNOWN_PRINTER_DRIVER => 1797

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNKNOWN_PRINTPROCESSOR => 1798

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_SEPARATOR_FILE => 1799

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PRIORITY => 1800

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PRINTER_NAME => 1801

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRINTER_ALREADY_EXISTS => 1802

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PRINTER_COMMAND => 1803

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_DATATYPE => 1804

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_ENVIRONMENT => 1805

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT => 1807

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOLOGON_WORKSTATION_TRUST_ACCOUNT => 1808

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOLOGON_SERVER_TRUST_ACCOUNT => 1809

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DOMAIN_TRUST_INCONSISTENT => 1810

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVER_HAS_OPEN_HANDLES => 1811

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESOURCE_DATA_NOT_FOUND => 1812

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESOURCE_TYPE_NOT_FOUND => 1813

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESOURCE_NAME_NOT_FOUND => 1814

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESOURCE_LANG_NOT_FOUND => 1815

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_ENOUGH_QUOTA => 1816

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_TIME => 1901

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_FORM_NAME => 1902

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_FORM_SIZE => 1903

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALREADY_WAITING => 1904

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRINTER_DELETED => 1905

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PRINTER_STATE => 1906

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PASSWORD_MUST_CHANGE => 1907

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DOMAIN_CONTROLLER_NOT_FOUND => 1908

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ACCOUNT_LOCKED_OUT => 1909

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SITENAME => 1919

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANT_ACCESS_FILE => 1920

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANT_RESOLVE_FILENAME => 1921

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_KM_DRIVER_BLOCKED => 1930

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONTEXT_EXPIRED => 1931

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PER_USER_TRUST_QUOTA_EXCEEDED => 1932

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALL_USER_TRUST_QUOTA_EXCEEDED => 1933

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_USER_DELETE_TRUST_QUOTA_EXCEEDED => 1934

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_AUTHENTICATION_FIREWALL_FAILED => 1935

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REMOTE_PRINT_CONNECTIONS_BLOCKED => 1936

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NTLM_BLOCKED => 1937

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PASSWORD_CHANGE_REQUIRED => 1938

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOST_MODE_LOGON_RESTRICTION => 1939

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PIXEL_FORMAT => 2000

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_DRIVER => 2001

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_WINDOW_STYLE => 2002

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_METAFILE_NOT_SUPPORTED => 2003

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSFORM_NOT_SUPPORTED => 2004

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLIPPING_NOT_SUPPORTED => 2005

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_CMM => 2010

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PROFILE => 2011

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TAG_NOT_FOUND => 2012

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TAG_NOT_PRESENT => 2013

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DUPLICATE_TAG => 2014

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROFILE_NOT_ASSOCIATED_WITH_DEVICE => 2015

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROFILE_NOT_FOUND => 2016

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_COLORSPACE => 2017

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ICM_NOT_ENABLED => 2018

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DELETING_ICM_XFORM => 2019

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_TRANSFORM => 2020

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_COLORSPACE_MISMATCH => 2021

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_COLORINDEX => 2022

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROFILE_DOES_NOT_MATCH_DEVICE => 2023

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONNECTED_OTHER_PASSWORD => 2108

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONNECTED_OTHER_PASSWORD_DEFAULT => 2109

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_USERNAME => 2202

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_CONNECTED => 2250

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OPEN_FILES => 2401

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ACTIVE_CONNECTIONS => 2402

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_IN_USE => 2404

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNKNOWN_PRINT_MONITOR => 3000

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRINTER_DRIVER_IN_USE => 3001

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SPOOL_FILE_NOT_FOUND => 3002

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SPL_NO_STARTDOC => 3003

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SPL_NO_ADDJOB => 3004

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRINT_PROCESSOR_ALREADY_INSTALLED => 3005

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRINT_MONITOR_ALREADY_INSTALLED => 3006

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PRINT_MONITOR => 3007

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRINT_MONITOR_IN_USE => 3008

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRINTER_HAS_JOBS_QUEUED => 3009

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SUCCESS_REBOOT_REQUIRED => 3010

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SUCCESS_RESTART_REQUIRED => 3011

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRINTER_NOT_FOUND => 3012

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRINTER_DRIVER_WARNED => 3013

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRINTER_DRIVER_BLOCKED => 3014

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRINTER_DRIVER_PACKAGE_IN_USE => 3015

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CORE_DRIVER_PACKAGE_NOT_FOUND => 3016

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FAIL_REBOOT_REQUIRED => 3017

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FAIL_REBOOT_INITIATED => 3018

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRINTER_DRIVER_DOWNLOAD_NEEDED => 3019

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRINT_JOB_RESTART_REQUIRED => 3020

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PRINTER_DRIVER_MANIFEST => 3021

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRINTER_NOT_SHAREABLE => 3022

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVER_SERVICE_CALL_REQUIRES_SMB1 => 3023

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NETWORK_AUTHENTICATION_PROMPT_CANCELED => 3024

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REQUEST_PAUSED => 3050

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPEXEC_CONDITION_NOT_SATISFIED => 3060

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPEXEC_HANDLE_INVALIDATED => 3061

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPEXEC_INVALID_HOST_GENERATION => 3062

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPEXEC_UNEXPECTED_PROCESS_REGISTRATION => 3063

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPEXEC_INVALID_HOST_STATE => 3064

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPEXEC_NO_DONOR => 3065

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPEXEC_HOST_ID_MISMATCH => 3066

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPEXEC_UNKNOWN_USER => 3067

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPEXEC_APP_COMPAT_BLOCK => 3068

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPEXEC_CALLER_WAIT_TIMEOUT => 3069

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPEXEC_CALLER_WAIT_TIMEOUT_TERMINATION => 3070

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPEXEC_CALLER_WAIT_TIMEOUT_LICENSING => 3071

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPEXEC_CALLER_WAIT_TIMEOUT_RESOURCES => 3072

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VRF_VOLATILE_CFG_AND_IO_ENABLED => 3080

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VRF_VOLATILE_NOT_STOPPABLE => 3081

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VRF_VOLATILE_SAFE_MODE => 3082

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VRF_VOLATILE_NOT_RUNNABLE_SYSTEM => 3083

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VRF_VOLATILE_NOT_SUPPORTED_RULECLASS => 3084

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VRF_VOLATILE_PROTECTED_DRIVER => 3085

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VRF_VOLATILE_NMI_REGISTERED => 3086

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VRF_VOLATILE_SETTINGS_CONFLICT => 3087

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIF_IOCALLBACK_NOT_REPLACED => 3190

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIF_LIVEDUMP_LIMIT_EXCEEDED => 3191

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIF_VOLATILE_SECTION_NOT_LOCKED => 3192

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIF_VOLATILE_DRIVER_HOTPATCHED => 3193

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIF_VOLATILE_INVALID_INFO => 3194

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIF_VOLATILE_DRIVER_IS_NOT_RUNNING => 3195

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIF_VOLATILE_PLUGIN_IS_NOT_RUNNING => 3196

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIF_VOLATILE_PLUGIN_CHANGE_NOT_ALLOWED => 3197

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIF_VOLATILE_NOT_ALLOWED => 3198

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIF_BINDING_API_NOT_FOUND => 3199

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IO_REISSUE_AS_CACHED => 3950

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WINS_INTERNAL => 4000

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CAN_NOT_DEL_LOCAL_WINS => 4001

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATIC_INIT => 4002

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INC_BACKUP => 4003

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FULL_BACKUP => 4004

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REC_NON_EXISTENT => 4005

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RPL_NOT_ALLOWED => 4006

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DHCP_ADDRESS_CONFLICT => 4100

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WMI_GUID_NOT_FOUND => 4200

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WMI_INSTANCE_NOT_FOUND => 4201

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WMI_ITEMID_NOT_FOUND => 4202

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WMI_TRY_AGAIN => 4203

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WMI_DP_NOT_FOUND => 4204

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WMI_UNRESOLVED_INSTANCE_REF => 4205

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WMI_ALREADY_ENABLED => 4206

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WMI_GUID_DISCONNECTED => 4207

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WMI_SERVER_UNAVAILABLE => 4208

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WMI_DP_FAILED => 4209

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WMI_INVALID_MOF => 4210

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WMI_INVALID_REGINFO => 4211

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WMI_ALREADY_DISABLED => 4212

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WMI_READ_ONLY => 4213

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WMI_SET_FAILURE => 4214

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_APPCONTAINER => 4250

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPCONTAINER_REQUIRED => 4251

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SUPPORTED_IN_APPCONTAINER => 4252

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_PACKAGE_SID_LENGTH => 4253

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_MEDIA => 4300

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_LIBRARY => 4301

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_MEDIA_POOL => 4302

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DRIVE_MEDIA_MISMATCH => 4303

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MEDIA_OFFLINE => 4304

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LIBRARY_OFFLINE => 4305

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EMPTY => 4306

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_EMPTY => 4307

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MEDIA_UNAVAILABLE => 4308

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESOURCE_DISABLED => 4309

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_CLEANER => 4310

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNABLE_TO_CLEAN => 4311

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OBJECT_NOT_FOUND => 4312

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DATABASE_FAILURE => 4313

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DATABASE_FULL => 4314

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MEDIA_INCOMPATIBLE => 4315

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESOURCE_NOT_PRESENT => 4316

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_OPERATION => 4317

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MEDIA_NOT_AVAILABLE => 4318

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEVICE_NOT_AVAILABLE => 4319

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REQUEST_REFUSED => 4320

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_DRIVE_OBJECT => 4321

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LIBRARY_FULL => 4322

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MEDIUM_NOT_ACCESSIBLE => 4323

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNABLE_TO_LOAD_MEDIUM => 4324

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNABLE_TO_INVENTORY_DRIVE => 4325

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNABLE_TO_INVENTORY_SLOT => 4326

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNABLE_TO_INVENTORY_TRANSPORT => 4327

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSPORT_FULL => 4328

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CONTROLLING_IEPORT => 4329

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNABLE_TO_EJECT_MOUNTED_MEDIA => 4330

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLEANER_SLOT_SET => 4331

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLEANER_SLOT_NOT_SET => 4332

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLEANER_CARTRIDGE_SPENT => 4333

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNEXPECTED_OMID => 4334

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANT_DELETE_LAST_ITEM => 4335

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MESSAGE_EXCEEDS_MAX_SIZE => 4336

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLUME_CONTAINS_SYS_FILES => 4337

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INDIGENOUS_TYPE => 4338

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SUPPORTING_DRIVES => 4339

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLEANER_CARTRIDGE_INSTALLED => 4340

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IEPORT_FULL => 4341

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_OFFLINE => 4350

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REMOTE_STORAGE_NOT_ACTIVE => 4351

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REMOTE_STORAGE_MEDIA_ERROR => 4352

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_A_REPARSE_POINT => 4390

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REPARSE_ATTRIBUTE_CONFLICT => 4391

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_REPARSE_DATA => 4392

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REPARSE_TAG_INVALID => 4393

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REPARSE_TAG_MISMATCH => 4394

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REPARSE_POINT_ENCOUNTERED => 4395

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APP_DATA_NOT_FOUND => 4400

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APP_DATA_EXPIRED => 4401

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APP_DATA_CORRUPT => 4402

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APP_DATA_LIMIT_EXCEEDED => 4403

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APP_DATA_REBOOT_REQUIRED => 4404

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECUREBOOT_ROLLBACK_DETECTED => 4420

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECUREBOOT_POLICY_VIOLATION => 4421

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECUREBOOT_INVALID_POLICY => 4422

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECUREBOOT_POLICY_PUBLISHER_NOT_FOUND => 4423

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECUREBOOT_POLICY_NOT_SIGNED => 4424

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECUREBOOT_NOT_ENABLED => 4425

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECUREBOOT_FILE_REPLACED => 4426

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECUREBOOT_POLICY_NOT_AUTHORIZED => 4427

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECUREBOOT_POLICY_UNKNOWN => 4428

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECUREBOOT_POLICY_MISSING_ANTIROLLBACKVERSION => 4429

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECUREBOOT_PLATFORM_ID_MISMATCH => 4430

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECUREBOOT_POLICY_ROLLBACK_DETECTED => 4431

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECUREBOOT_POLICY_UPGRADE_MISMATCH => 4432

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECUREBOOT_REQUIRED_POLICY_FILE_MISSING => 4433

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECUREBOOT_NOT_BASE_POLICY => 4434

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECUREBOOT_NOT_SUPPLEMENTAL_POLICY => 4435

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OFFLOAD_READ_FLT_NOT_SUPPORTED => 4440

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OFFLOAD_WRITE_FLT_NOT_SUPPORTED => 4441

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OFFLOAD_READ_FILE_NOT_SUPPORTED => 4442

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OFFLOAD_WRITE_FILE_NOT_SUPPORTED => 4443

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALREADY_HAS_STREAM_ID => 4444

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SMR_GARBAGE_COLLECTION_REQUIRED => 4445

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WOF_WIM_HEADER_CORRUPT => 4446

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WOF_WIM_RESOURCE_TABLE_CORRUPT => 4447

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WOF_FILE_RESOURCE_TABLE_CORRUPT => 4448

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OBJECT_IS_IMMUTABLE => 4449

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLUME_NOT_SIS_ENABLED => 4500

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_INTEGRITY_ROLLBACK_DETECTED => 4550

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_INTEGRITY_POLICY_VIOLATION => 4551

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_INTEGRITY_INVALID_POLICY => 4552

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_INTEGRITY_POLICY_NOT_SIGNED => 4553

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_INTEGRITY_TOO_MANY_POLICIES => 4554

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_INTEGRITY_SUPPLEMENTAL_POLICY_NOT_AUTHORIZED => 4555

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_INTEGRITY_REPUTATION_MALICIOUS => 4556

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_INTEGRITY_REPUTATION_PUA => 4557

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_INTEGRITY_REPUTATION_DANGEROUS_EXT => 4558

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_INTEGRITY_REPUTATION_OFFLINE => 4559

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VSM_NOT_INITIALIZED => 4560

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VSM_DMA_PROTECTION_NOT_IN_USE => 4561

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PLATFORM_MANIFEST_NOT_AUTHORIZED => 4570

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PLATFORM_MANIFEST_INVALID => 4571

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PLATFORM_MANIFEST_FILE_NOT_AUTHORIZED => 4572

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PLATFORM_MANIFEST_CATALOG_NOT_AUTHORIZED => 4573

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PLATFORM_MANIFEST_BINARY_ID_NOT_FOUND => 4574

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PLATFORM_MANIFEST_NOT_ACTIVE => 4575

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PLATFORM_MANIFEST_NOT_SIGNED => 4576

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_INTEGRITY_REPUTATION_UNFRIENDLY_FILE => 4580

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_INTEGRITY_REPUTATION_UNATTAINABLE => 4581

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_INTEGRITY_REPUTATION_EXPLICIT_DENY_FILE => 4582

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEPENDENT_RESOURCE_EXISTS => 5001

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEPENDENCY_NOT_FOUND => 5002

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEPENDENCY_ALREADY_EXISTS => 5003

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESOURCE_NOT_ONLINE => 5004

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HOST_NODE_NOT_AVAILABLE => 5005

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESOURCE_NOT_AVAILABLE => 5006

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESOURCE_NOT_FOUND => 5007

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHUTDOWN_CLUSTER => 5008

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANT_EVICT_ACTIVE_NODE => 5009

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OBJECT_ALREADY_EXISTS => 5010

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OBJECT_IN_LIST => 5011

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GROUP_NOT_AVAILABLE => 5012

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GROUP_NOT_FOUND => 5013

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GROUP_NOT_ONLINE => 5014

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HOST_NODE_NOT_RESOURCE_OWNER => 5015

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HOST_NODE_NOT_GROUP_OWNER => 5016

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESMON_CREATE_FAILED => 5017

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESMON_ONLINE_FAILED => 5018

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESOURCE_ONLINE => 5019

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_QUORUM_RESOURCE => 5020

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_QUORUM_CAPABLE => 5021

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_SHUTTING_DOWN => 5022

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_STATE => 5023

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESOURCE_PROPERTIES_STORED => 5024

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_QUORUM_CLASS => 5025

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CORE_RESOURCE => 5026

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_QUORUM_RESOURCE_ONLINE_FAILED => 5027

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_QUORUMLOG_OPEN_FAILED => 5028

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTERLOG_CORRUPT => 5029

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTERLOG_RECORD_EXCEEDS_MAXSIZE => 5030

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTERLOG_EXCEEDS_MAXSIZE => 5031

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTERLOG_CHKPOINT_NOT_FOUND => 5032

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTERLOG_NOT_ENOUGH_SPACE => 5033

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_QUORUM_OWNER_ALIVE => 5034

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NETWORK_NOT_AVAILABLE => 5035

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NODE_NOT_AVAILABLE => 5036

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ALL_NODES_NOT_AVAILABLE => 5037

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESOURCE_FAILED => 5038

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_INVALID_NODE => 5039

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NODE_EXISTS => 5040

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_JOIN_IN_PROGRESS => 5041

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NODE_NOT_FOUND => 5042

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_LOCAL_NODE_NOT_FOUND => 5043

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NETWORK_EXISTS => 5044

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NETWORK_NOT_FOUND => 5045

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NETINTERFACE_EXISTS => 5046

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NETINTERFACE_NOT_FOUND => 5047

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_INVALID_REQUEST => 5048

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_INVALID_NETWORK_PROVIDER => 5049

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NODE_DOWN => 5050

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NODE_UNREACHABLE => 5051

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NODE_NOT_MEMBER => 5052

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_JOIN_NOT_IN_PROGRESS => 5053

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_INVALID_NETWORK => 5054

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NODE_UP => 5056

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_IPADDR_IN_USE => 5057

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NODE_NOT_PAUSED => 5058

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NO_SECURITY_CONTEXT => 5059

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NETWORK_NOT_INTERNAL => 5060

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NODE_ALREADY_UP => 5061

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NODE_ALREADY_DOWN => 5062

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NETWORK_ALREADY_ONLINE => 5063

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NETWORK_ALREADY_OFFLINE => 5064

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NODE_ALREADY_MEMBER => 5065

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_LAST_INTERNAL_NETWORK => 5066

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NETWORK_HAS_DEPENDENTS => 5067

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_OPERATION_ON_QUORUM => 5068

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEPENDENCY_NOT_ALLOWED => 5069

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NODE_PAUSED => 5070

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NODE_CANT_HOST_RESOURCE => 5071

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NODE_NOT_READY => 5072

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NODE_SHUTTING_DOWN => 5073

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_JOIN_ABORTED => 5074

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_INCOMPATIBLE_VERSIONS => 5075

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_MAXNUM_OF_RESOURCES_EXCEEDED => 5076

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_SYSTEM_CONFIG_CHANGED => 5077

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_RESOURCE_TYPE_NOT_FOUND => 5078

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_RESTYPE_NOT_SUPPORTED => 5079

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_RESNAME_NOT_FOUND => 5080

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NO_RPC_PACKAGES_REGISTERED => 5081

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_OWNER_NOT_IN_PREFLIST => 5082

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_DATABASE_SEQMISMATCH => 5083

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESMON_INVALID_STATE => 5084

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_GUM_NOT_LOCKER => 5085

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_QUORUM_DISK_NOT_FOUND => 5086

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DATABASE_BACKUP_CORRUPT => 5087

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NODE_ALREADY_HAS_DFS_ROOT => 5088

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESOURCE_PROPERTY_UNCHANGEABLE => 5089

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_ADMIN_ACCESS_POINT => 5090

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_MEMBERSHIP_INVALID_STATE => 5890

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_QUORUMLOG_NOT_FOUND => 5891

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_MEMBERSHIP_HALT => 5892

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_INSTANCE_ID_MISMATCH => 5893

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NETWORK_NOT_FOUND_FOR_IP => 5894

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_PROPERTY_DATA_TYPE_MISMATCH => 5895

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_EVICT_WITHOUT_CLEANUP => 5896

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_PARAMETER_MISMATCH => 5897

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NODE_CANNOT_BE_CLUSTERED => 5898

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_WRONG_OS_VERSION => 5899

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_CANT_CREATE_DUP_CLUSTER_NAME => 5900

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSCFG_ALREADY_COMMITTED => 5901

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSCFG_ROLLBACK_FAILED => 5902

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSCFG_SYSTEM_DISK_DRIVE_LETTER_CONFLICT => 5903

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_OLD_VERSION => 5904

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_MISMATCHED_COMPUTER_ACCT_NAME => 5905

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NO_NET_ADAPTERS => 5906

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_POISONED => 5907

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_GROUP_MOVING => 5908

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_RESOURCE_TYPE_BUSY => 5909

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESOURCE_CALL_TIMED_OUT => 5910

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_CLUSTER_IPV6_ADDRESS => 5911

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_INTERNAL_INVALID_FUNCTION => 5912

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_PARAMETER_OUT_OF_BOUNDS => 5913

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_PARTIAL_SEND => 5914

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_REGISTRY_INVALID_FUNCTION => 5915

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_INVALID_STRING_TERMINATION => 5916

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_INVALID_STRING_FORMAT => 5917

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_DATABASE_TRANSACTION_IN_PROGRESS => 5918

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_DATABASE_TRANSACTION_NOT_IN_PROGRESS => 5919

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NULL_DATA => 5920

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_PARTIAL_READ => 5921

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_PARTIAL_WRITE => 5922

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_CANT_DESERIALIZE_DATA => 5923

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEPENDENT_RESOURCE_PROPERTY_CONFLICT => 5924

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NO_QUORUM => 5925

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_INVALID_IPV6_NETWORK => 5926

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_INVALID_IPV6_TUNNEL_NETWORK => 5927

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_QUORUM_NOT_ALLOWED_IN_THIS_GROUP => 5928

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEPENDENCY_TREE_TOO_COMPLEX => 5929

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EXCEPTION_IN_RESOURCE_CALL => 5930

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_RHS_FAILED_INITIALIZATION => 5931

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NOT_INSTALLED => 5932

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_RESOURCES_MUST_BE_ONLINE_ON_THE_SAME_NODE => 5933

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_MAX_NODES_IN_CLUSTER => 5934

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_TOO_MANY_NODES => 5935

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_OBJECT_ALREADY_USED => 5936

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NONCORE_GROUPS_FOUND => 5937

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_SHARE_RESOURCE_CONFLICT => 5938

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_EVICT_INVALID_REQUEST => 5939

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_SINGLETON_RESOURCE => 5940

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_GROUP_SINGLETON_RESOURCE => 5941

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_RESOURCE_PROVIDER_FAILED => 5942

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_RESOURCE_CONFIGURATION_ERROR => 5943

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_GROUP_BUSY => 5944

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NOT_SHARED_VOLUME => 5945

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_INVALID_SECURITY_DESCRIPTOR => 5946

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_SHARED_VOLUMES_IN_USE => 5947

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_USE_SHARED_VOLUMES_API => 5948

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_BACKUP_IN_PROGRESS => 5949

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NON_CSV_PATH => 5950

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CSV_VOLUME_NOT_LOCAL => 5951

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_WATCHDOG_TERMINATING => 5952

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_RESOURCE_VETOED_MOVE_INCOMPATIBLE_NODES => 5953

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_INVALID_NODE_WEIGHT => 5954

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_RESOURCE_VETOED_CALL => 5955

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESMON_SYSTEM_RESOURCES_LACKING => 5956

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_RESOURCE_VETOED_MOVE_NOT_ENOUGH_RESOURCES_ON_DESTINATION => 5957

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_RESOURCE_VETOED_MOVE_NOT_ENOUGH_RESOURCES_ON_SOURCE => 5958

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_GROUP_QUEUED => 5959

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_RESOURCE_LOCKED_STATUS => 5960

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_SHARED_VOLUME_FAILOVER_NOT_ALLOWED => 5961

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NODE_DRAIN_IN_PROGRESS => 5962

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_DISK_NOT_CONNECTED => 5963

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DISK_NOT_CSV_CAPABLE => 5964

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESOURCE_NOT_IN_AVAILABLE_STORAGE => 5965

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_SHARED_VOLUME_REDIRECTED => 5966

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_SHARED_VOLUME_NOT_REDIRECTED => 5967

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_CANNOT_RETURN_PROPERTIES => 5968

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_RESOURCE_CONTAINS_UNSUPPORTED_DIFF_AREA_FOR_SHARED_VOLUMES => 5969

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_RESOURCE_IS_IN_MAINTENANCE_MODE => 5970

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_AFFINITY_CONFLICT => 5971

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_RESOURCE_IS_REPLICA_VIRTUAL_MACHINE => 5972

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_UPGRADE_INCOMPATIBLE_VERSIONS => 5973

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_UPGRADE_FIX_QUORUM_NOT_SUPPORTED => 5974

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_UPGRADE_RESTART_REQUIRED => 5975

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_UPGRADE_IN_PROGRESS => 5976

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_UPGRADE_INCOMPLETE => 5977

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NODE_IN_GRACE_PERIOD => 5978

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_CSV_IO_PAUSE_TIMEOUT => 5979

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NODE_NOT_ACTIVE_CLUSTER_MEMBER => 5980

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_RESOURCE_NOT_MONITORED => 5981

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_RESOURCE_DOES_NOT_SUPPORT_UNMONITORED => 5982

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_RESOURCE_IS_REPLICATED => 5983

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NODE_ISOLATED => 5984

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_NODE_QUARANTINED => 5985

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_DATABASE_UPDATE_CONDITION_FAILED => 5986

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_SPACE_DEGRADED => 5987

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_TOKEN_DELEGATION_NOT_SUPPORTED => 5988

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_CSV_INVALID_HANDLE => 5989

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_CSV_SUPPORTED_ONLY_ON_COORDINATOR => 5990

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GROUPSET_NOT_AVAILABLE => 5991

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GROUPSET_NOT_FOUND => 5992

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GROUPSET_CANT_PROVIDE => 5993

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_FAULT_DOMAIN_PARENT_NOT_FOUND => 5994

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_FAULT_DOMAIN_INVALID_HIERARCHY => 5995

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_FAULT_DOMAIN_FAILED_S2D_VALIDATION => 5996

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_FAULT_DOMAIN_S2D_CONNECTIVITY_LOSS => 5997

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_INVALID_INFRASTRUCTURE_FILESERVER_NAME => 5998

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTERSET_MANAGEMENT_CLUSTER_UNREACHABLE => 5999

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ENCRYPTION_FAILED => 6000

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DECRYPTION_FAILED => 6001

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_ENCRYPTED => 6002

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_RECOVERY_POLICY => 6003

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_EFS => 6004

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WRONG_EFS => 6005

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_USER_KEYS => 6006

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_NOT_ENCRYPTED => 6007

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_EXPORT_FORMAT => 6008

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_READ_ONLY => 6009

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIR_EFS_DISALLOWED => 6010

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EFS_SERVER_NOT_TRUSTED => 6011

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_RECOVERY_POLICY => 6012

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EFS_ALG_BLOB_TOO_BIG => 6013

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLUME_NOT_SUPPORT_EFS => 6014

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EFS_DISABLED => 6015

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EFS_VERSION_NOT_SUPPORT => 6016

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CS_ENCRYPTION_INVALID_SERVER_RESPONSE => 6017

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CS_ENCRYPTION_UNSUPPORTED_SERVER => 6018

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CS_ENCRYPTION_EXISTING_ENCRYPTED_FILE => 6019

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CS_ENCRYPTION_NEW_ENCRYPTED_FILE => 6020

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CS_ENCRYPTION_FILE_NOT_CSE => 6021

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ENCRYPTION_POLICY_DENIES_OPERATION => 6022

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WIP_ENCRYPTION_FAILED => 6023

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_BROWSER_SERVERS_FOUND => 6118

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLUSTER_OBJECT_IS_CLUSTER_SET_VM => 6250

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_SECTOR_INVALID => 6600

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_SECTOR_PARITY_INVALID => 6601

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_SECTOR_REMAPPED => 6602

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_BLOCK_INCOMPLETE => 6603

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_INVALID_RANGE => 6604

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_BLOCKS_EXHAUSTED => 6605

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_READ_CONTEXT_INVALID => 6606

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_RESTART_INVALID => 6607

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_BLOCK_VERSION => 6608

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_BLOCK_INVALID => 6609

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_READ_MODE_INVALID => 6610

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_NO_RESTART => 6611

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_METADATA_CORRUPT => 6612

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_METADATA_INVALID => 6613

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_METADATA_INCONSISTENT => 6614

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_RESERVATION_INVALID => 6615

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_CANT_DELETE => 6616

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_CONTAINER_LIMIT_EXCEEDED => 6617

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_START_OF_LOG => 6618

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_POLICY_ALREADY_INSTALLED => 6619

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_POLICY_NOT_INSTALLED => 6620

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_POLICY_INVALID => 6621

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_POLICY_CONFLICT => 6622

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_PINNED_ARCHIVE_TAIL => 6623

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_RECORD_NONEXISTENT => 6624

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_RECORDS_RESERVED_INVALID => 6625

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_SPACE_RESERVED_INVALID => 6626

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_TAIL_INVALID => 6627

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_FULL => 6628

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_COULD_NOT_RESIZE_LOG => 6629

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_MULTIPLEXED => 6630

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_DEDICATED => 6631

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_ARCHIVE_NOT_IN_PROGRESS => 6632

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_ARCHIVE_IN_PROGRESS => 6633

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_EPHEMERAL => 6634

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_NOT_ENOUGH_CONTAINERS => 6635

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_CLIENT_ALREADY_REGISTERED => 6636

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_CLIENT_NOT_REGISTERED => 6637

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_FULL_HANDLER_IN_PROGRESS => 6638

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_CONTAINER_READ_FAILED => 6639

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_CONTAINER_WRITE_FAILED => 6640

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_CONTAINER_OPEN_FAILED => 6641

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_CONTAINER_STATE_INVALID => 6642

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_STATE_INVALID => 6643

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_PINNED => 6644

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_METADATA_FLUSH_FAILED => 6645

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_INCONSISTENT_SECURITY => 6646

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_APPENDED_FLUSH_FAILED => 6647

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_PINNED_RESERVATION => 6648

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_TRANSACTION => 6700

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_NOT_ACTIVE => 6701

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_REQUEST_NOT_VALID => 6702

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_NOT_REQUESTED => 6703

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_ALREADY_ABORTED => 6704

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_ALREADY_COMMITTED => 6705

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TM_INITIALIZATION_FAILED => 6706

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESOURCEMANAGER_READ_ONLY => 6707

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_NOT_JOINED => 6708

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_SUPERIOR_EXISTS => 6709

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CRM_PROTOCOL_ALREADY_EXISTS => 6710

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_PROPAGATION_FAILED => 6711

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CRM_PROTOCOL_NOT_FOUND => 6712

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_INVALID_MARSHALL_BUFFER => 6713

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CURRENT_TRANSACTION_NOT_VALID => 6714

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_NOT_FOUND => 6715

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESOURCEMANAGER_NOT_FOUND => 6716

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ENLISTMENT_NOT_FOUND => 6717

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTIONMANAGER_NOT_FOUND => 6718

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTIONMANAGER_NOT_ONLINE => 6719

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTIONMANAGER_RECOVERY_NAME_COLLISION => 6720

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_NOT_ROOT => 6721

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_OBJECT_EXPIRED => 6722

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_RESPONSE_NOT_ENLISTED => 6723

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_RECORD_TOO_LONG => 6724

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IMPLICIT_TRANSACTION_NOT_SUPPORTED => 6725

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_INTEGRITY_VIOLATED => 6726

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTIONMANAGER_IDENTITY_MISMATCH => 6727

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RM_CANNOT_BE_FROZEN_FOR_SNAPSHOT => 6728

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_MUST_WRITETHROUGH => 6729

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_NO_SUPERIOR => 6730

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HEURISTIC_DAMAGE_POSSIBLE => 6731

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTIONAL_CONFLICT => 6800

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RM_NOT_ACTIVE => 6801

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RM_METADATA_CORRUPT => 6802

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIRECTORY_NOT_RM => 6803

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTIONS_UNSUPPORTED_REMOTE => 6805

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_RESIZE_INVALID_SIZE => 6806

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OBJECT_NO_LONGER_EXISTS => 6807

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STREAM_MINIVERSION_NOT_FOUND => 6808

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STREAM_MINIVERSION_NOT_VALID => 6809

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MINIVERSION_INACCESSIBLE_FROM_SPECIFIED_TRANSACTION => 6810

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANT_OPEN_MINIVERSION_WITH_MODIFY_INTENT => 6811

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANT_CREATE_MORE_STREAM_MINIVERSIONS => 6812

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REMOTE_FILE_VERSION_MISMATCH => 6814

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HANDLE_NO_LONGER_VALID => 6815

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_TXF_METADATA => 6816

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_CORRUPTION_DETECTED => 6817

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANT_RECOVER_WITH_HANDLE_OPEN => 6818

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RM_DISCONNECTED => 6819

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ENLISTMENT_NOT_SUPERIOR => 6820

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RECOVERY_NOT_NEEDED => 6821

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RM_ALREADY_STARTED => 6822

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FILE_IDENTITY_NOT_PERSISTENT => 6823

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANT_BREAK_TRANSACTIONAL_DEPENDENCY => 6824

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANT_CROSS_RM_BOUNDARY => 6825

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TXF_DIR_NOT_EMPTY => 6826

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INDOUBT_TRANSACTIONS_EXIST => 6827

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TM_VOLATILE => 6828

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ROLLBACK_TIMER_EXPIRED => 6829

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TXF_ATTRIBUTE_CORRUPT => 6830

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EFS_NOT_ALLOWED_IN_TRANSACTION => 6831

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTIONAL_OPEN_NOT_ALLOWED => 6832

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOG_GROWTH_FAILED => 6833

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTED_MAPPING_UNSUPPORTED_REMOTE => 6834

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TXF_METADATA_ALREADY_PRESENT => 6835

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_SCOPE_CALLBACKS_NOT_SET => 6836

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_REQUIRED_PROMOTION => 6837

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_EXECUTE_FILE_IN_TRANSACTION => 6838

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTIONS_NOT_FROZEN => 6839

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_FREEZE_IN_PROGRESS => 6840

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SNAPSHOT_VOLUME => 6841

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SAVEPOINT_WITH_OPEN_FILES => 6842

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DATA_LOST_REPAIR => 6843

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SPARSE_NOT_ALLOWED_IN_TRANSACTION => 6844

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TM_IDENTITY_MISMATCH => 6845

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_FLOATED_SECTION => 6846

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_ACCEPT_TRANSACTED_WORK => 6847

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_ABORT_TRANSACTIONS => 6848

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BAD_CLUSTERS => 6849

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_COMPRESSION_NOT_ALLOWED_IN_TRANSACTION => 6850

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLUME_DIRTY => 6851

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_LINK_TRACKING_IN_TRANSACTION => 6852

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OPERATION_NOT_SUPPORTED_IN_TRANSACTION => 6853

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EXPIRED_HANDLE => 6854

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TRANSACTION_NOT_ENLISTED => 6855

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_WINSTATION_NAME_INVALID => 7001

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_INVALID_PD => 7002

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_PD_NOT_FOUND => 7003

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_WD_NOT_FOUND => 7004

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_CANNOT_MAKE_EVENTLOG_ENTRY => 7005

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_SERVICE_NAME_COLLISION => 7006

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_CLOSE_PENDING => 7007

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_NO_OUTBUF => 7008

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_MODEM_INF_NOT_FOUND => 7009

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_INVALID_MODEMNAME => 7010

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_MODEM_RESPONSE_ERROR => 7011

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_MODEM_RESPONSE_TIMEOUT => 7012

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_MODEM_RESPONSE_NO_CARRIER => 7013

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_MODEM_RESPONSE_NO_DIALTONE => 7014

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_MODEM_RESPONSE_BUSY => 7015

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_MODEM_RESPONSE_VOICE => 7016

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_TD_ERROR => 7017

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_WINSTATION_NOT_FOUND => 7022

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_WINSTATION_ALREADY_EXISTS => 7023

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_WINSTATION_BUSY => 7024

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_BAD_VIDEO_MODE => 7025

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_GRAPHICS_INVALID => 7035

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_LOGON_DISABLED => 7037

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_NOT_CONSOLE => 7038

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_CLIENT_QUERY_TIMEOUT => 7040

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_CONSOLE_DISCONNECT => 7041

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_CONSOLE_CONNECT => 7042

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_SHADOW_DENIED => 7044

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_WINSTATION_ACCESS_DENIED => 7045

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_INVALID_WD => 7049

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_SHADOW_INVALID => 7050

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_SHADOW_DISABLED => 7051

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_CLIENT_LICENSE_IN_USE => 7052

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_CLIENT_LICENSE_NOT_SET => 7053

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_LICENSE_NOT_AVAILABLE => 7054

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_LICENSE_CLIENT_INVALID => 7055

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_LICENSE_EXPIRED => 7056

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_SHADOW_NOT_RUNNING => 7057

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_SHADOW_ENDED_BY_MODE_CHANGE => 7058

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ACTIVATION_COUNT_EXCEEDED => 7059

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_WINSTATIONS_DISABLED => 7060

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_ENCRYPTION_LEVEL_REQUIRED => 7061

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_SESSION_IN_USE => 7062

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_NO_FORCE_LOGOFF => 7063

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_ACCOUNT_RESTRICTION => 7064

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RDP_PROTOCOL_ERROR => 7065

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_CDM_CONNECT => 7066

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_CDM_DISCONNECT => 7067

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTX_SECURITY_LAYER_ERROR => 7068

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TS_INCOMPATIBLE_SESSIONS => 7069

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_TS_VIDEO_SUBSYSTEM_ERROR => 7070

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NOT_INSTALLED => 8200

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_MEMBERSHIP_EVALUATED_LOCALLY => 8201

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_ATTRIBUTE_OR_VALUE => 8202

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INVALID_ATTRIBUTE_SYNTAX => 8203

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ATTRIBUTE_TYPE_UNDEFINED => 8204

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ATTRIBUTE_OR_VALUE_EXISTS => 8205

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_BUSY => 8206

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_UNAVAILABLE => 8207

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_RIDS_ALLOCATED => 8208

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_MORE_RIDS => 8209

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INCORRECT_ROLE_OWNER => 8210

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_RIDMGR_INIT_ERROR => 8211

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_OBJ_CLASS_VIOLATION => 8212

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_ON_NON_LEAF => 8213

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_ON_RDN => 8214

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_MOD_OBJ_CLASS => 8215

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CROSS_DOM_MOVE_ERROR => 8216

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_GC_NOT_AVAILABLE => 8217

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SHARED_POLICY => 8218

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_POLICY_OBJECT_NOT_FOUND => 8219

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_POLICY_ONLY_IN_DS => 8220

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROMOTION_ACTIVE => 8221

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_PROMOTION_ACTIVE => 8222

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_OPERATIONS_ERROR => 8224

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_PROTOCOL_ERROR => 8225

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_TIMELIMIT_EXCEEDED => 8226

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SIZELIMIT_EXCEEDED => 8227

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ADMIN_LIMIT_EXCEEDED => 8228

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_COMPARE_FALSE => 8229

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_COMPARE_TRUE => 8230

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_AUTH_METHOD_NOT_SUPPORTED => 8231

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_STRONG_AUTH_REQUIRED => 8232

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INAPPROPRIATE_AUTH => 8233

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_AUTH_UNKNOWN => 8234

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_REFERRAL => 8235

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_UNAVAILABLE_CRIT_EXTENSION => 8236

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CONFIDENTIALITY_REQUIRED => 8237

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INAPPROPRIATE_MATCHING => 8238

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CONSTRAINT_VIOLATION => 8239

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_SUCH_OBJECT => 8240

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ALIAS_PROBLEM => 8241

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INVALID_DN_SYNTAX => 8242

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_IS_LEAF => 8243

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ALIAS_DEREF_PROBLEM => 8244

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_UNWILLING_TO_PERFORM => 8245

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_LOOP_DETECT => 8246

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NAMING_VIOLATION => 8247

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_OBJECT_RESULTS_TOO_LARGE => 8248

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_AFFECTS_MULTIPLE_DSAS => 8249

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SERVER_DOWN => 8250

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_LOCAL_ERROR => 8251

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ENCODING_ERROR => 8252

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DECODING_ERROR => 8253

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_FILTER_UNKNOWN => 8254

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_PARAM_ERROR => 8255

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NOT_SUPPORTED => 8256

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_RESULTS_RETURNED => 8257

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CONTROL_NOT_FOUND => 8258

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CLIENT_LOOP => 8259

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_REFERRAL_LIMIT_EXCEEDED => 8260

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SORT_CONTROL_MISSING => 8261

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_OFFSET_RANGE_ERROR => 8262

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_RIDMGR_DISABLED => 8263

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ROOT_MUST_BE_NC => 8301

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ADD_REPLICA_INHIBITED => 8302

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ATT_NOT_DEF_IN_SCHEMA => 8303

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_MAX_OBJ_SIZE_EXCEEDED => 8304

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_OBJ_STRING_NAME_EXISTS => 8305

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_RDN_DEFINED_IN_SCHEMA => 8306

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_RDN_DOESNT_MATCH_SCHEMA => 8307

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_REQUESTED_ATTS_FOUND => 8308

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_USER_BUFFER_TO_SMALL => 8309

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ATT_IS_NOT_ON_OBJ => 8310

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ILLEGAL_MOD_OPERATION => 8311

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_OBJ_TOO_LARGE => 8312

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_BAD_INSTANCE_TYPE => 8313

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_MASTERDSA_REQUIRED => 8314

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_OBJECT_CLASS_REQUIRED => 8315

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_MISSING_REQUIRED_ATT => 8316

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ATT_NOT_DEF_FOR_CLASS => 8317

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ATT_ALREADY_EXISTS => 8318

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_ADD_ATT_VALUES => 8320

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SINGLE_VALUE_CONSTRAINT => 8321

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_RANGE_CONSTRAINT => 8322

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ATT_VAL_ALREADY_EXISTS => 8323

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_REM_MISSING_ATT => 8324

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_REM_MISSING_ATT_VAL => 8325

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ROOT_CANT_BE_SUBREF => 8326

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_CHAINING => 8327

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_CHAINED_EVAL => 8328

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_PARENT_OBJECT => 8329

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_PARENT_IS_AN_ALIAS => 8330

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_MIX_MASTER_AND_REPS => 8331

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CHILDREN_EXIST => 8332

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_OBJ_NOT_FOUND => 8333

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ALIASED_OBJ_MISSING => 8334

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_BAD_NAME_SYNTAX => 8335

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ALIAS_POINTS_TO_ALIAS => 8336

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_DEREF_ALIAS => 8337

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_OUT_OF_SCOPE => 8338

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_OBJECT_BEING_REMOVED => 8339

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_DELETE_DSA_OBJ => 8340

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_GENERIC_ERROR => 8341

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DSA_MUST_BE_INT_MASTER => 8342

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CLASS_NOT_DSA => 8343

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INSUFF_ACCESS_RIGHTS => 8344

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ILLEGAL_SUPERIOR => 8345

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ATTRIBUTE_OWNED_BY_SAM => 8346

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NAME_TOO_MANY_PARTS => 8347

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NAME_TOO_LONG => 8348

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NAME_VALUE_TOO_LONG => 8349

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NAME_UNPARSEABLE => 8350

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NAME_TYPE_UNKNOWN => 8351

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NOT_AN_OBJECT => 8352

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SEC_DESC_TOO_SHORT => 8353

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SEC_DESC_INVALID => 8354

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_DELETED_NAME => 8355

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SUBREF_MUST_HAVE_PARENT => 8356

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NCNAME_MUST_BE_NC => 8357

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_ADD_SYSTEM_ONLY => 8358

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CLASS_MUST_BE_CONCRETE => 8359

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INVALID_DMD => 8360

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_OBJ_GUID_EXISTS => 8361

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NOT_ON_BACKLINK => 8362

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_CROSSREF_FOR_NC => 8363

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SHUTTING_DOWN => 8364

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_UNKNOWN_OPERATION => 8365

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INVALID_ROLE_OWNER => 8366

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_COULDNT_CONTACT_FSMO => 8367

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CROSS_NC_DN_RENAME => 8368

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_MOD_SYSTEM_ONLY => 8369

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_REPLICATOR_ONLY => 8370

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_OBJ_CLASS_NOT_DEFINED => 8371

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_OBJ_CLASS_NOT_SUBCLASS => 8372

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NAME_REFERENCE_INVALID => 8373

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CROSS_REF_EXISTS => 8374

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_DEL_MASTER_CROSSREF => 8375

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SUBTREE_NOTIFY_NOT_NC_HEAD => 8376

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NOTIFY_FILTER_TOO_COMPLEX => 8377

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DUP_RDN => 8378

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DUP_OID => 8379

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DUP_MAPI_ID => 8380

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DUP_SCHEMA_ID_GUID => 8381

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DUP_LDAP_DISPLAY_NAME => 8382

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SEMANTIC_ATT_TEST => 8383

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SYNTAX_MISMATCH => 8384

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_EXISTS_IN_MUST_HAVE => 8385

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_EXISTS_IN_MAY_HAVE => 8386

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NONEXISTENT_MAY_HAVE => 8387

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NONEXISTENT_MUST_HAVE => 8388

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_AUX_CLS_TEST_FAIL => 8389

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NONEXISTENT_POSS_SUP => 8390

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SUB_CLS_TEST_FAIL => 8391

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_BAD_RDN_ATT_ID_SYNTAX => 8392

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_EXISTS_IN_AUX_CLS => 8393

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_EXISTS_IN_SUB_CLS => 8394

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_EXISTS_IN_POSS_SUP => 8395

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_RECALCSCHEMA_FAILED => 8396

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_TREE_DELETE_NOT_FINISHED => 8397

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_DELETE => 8398

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ATT_SCHEMA_REQ_ID => 8399

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_BAD_ATT_SCHEMA_SYNTAX => 8400

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_CACHE_ATT => 8401

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_CACHE_CLASS => 8402

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_REMOVE_ATT_CACHE => 8403

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_REMOVE_CLASS_CACHE => 8404

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_RETRIEVE_DN => 8405

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_MISSING_SUPREF => 8406

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_RETRIEVE_INSTANCE => 8407

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CODE_INCONSISTENCY => 8408

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DATABASE_ERROR => 8409

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_GOVERNSID_MISSING => 8410

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_MISSING_EXPECTED_ATT => 8411

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NCNAME_MISSING_CR_REF => 8412

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SECURITY_CHECKING_ERROR => 8413

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SCHEMA_NOT_LOADED => 8414

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SCHEMA_ALLOC_FAILED => 8415

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ATT_SCHEMA_REQ_SYNTAX => 8416

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_GCVERIFY_ERROR => 8417

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_SCHEMA_MISMATCH => 8418

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_FIND_DSA_OBJ => 8419

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_FIND_EXPECTED_NC => 8420

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_FIND_NC_IN_CACHE => 8421

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_RETRIEVE_CHILD => 8422

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SECURITY_ILLEGAL_MODIFY => 8423

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_REPLACE_HIDDEN_REC => 8424

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_BAD_HIERARCHY_FILE => 8425

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_BUILD_HIERARCHY_TABLE_FAILED => 8426

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CONFIG_PARAM_MISSING => 8427

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_COUNTING_AB_INDICES_FAILED => 8428

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_HIERARCHY_TABLE_MALLOC_FAILED => 8429

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INTERNAL_FAILURE => 8430

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_UNKNOWN_ERROR => 8431

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ROOT_REQUIRES_CLASS_TOP => 8432

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_REFUSING_FSMO_ROLES => 8433

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_MISSING_FSMO_SETTINGS => 8434

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_UNABLE_TO_SURRENDER_ROLES => 8435

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_GENERIC => 8436

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_INVALID_PARAMETER => 8437

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_BUSY => 8438

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_BAD_DN => 8439

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_BAD_NC => 8440

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_DN_EXISTS => 8441

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_INTERNAL_ERROR => 8442

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_INCONSISTENT_DIT => 8443

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_CONNECTION_FAILED => 8444

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_BAD_INSTANCE_TYPE => 8445

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_OUT_OF_MEM => 8446

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_MAIL_PROBLEM => 8447

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_REF_ALREADY_EXISTS => 8448

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_REF_NOT_FOUND => 8449

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_OBJ_IS_REP_SOURCE => 8450

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_DB_ERROR => 8451

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_NO_REPLICA => 8452

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_ACCESS_DENIED => 8453

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_NOT_SUPPORTED => 8454

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_RPC_CANCELLED => 8455

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_SOURCE_DISABLED => 8456

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_SINK_DISABLED => 8457

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_NAME_COLLISION => 8458

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_SOURCE_REINSTALLED => 8459

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_MISSING_PARENT => 8460

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_PREEMPTED => 8461

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_ABANDON_SYNC => 8462

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_SHUTDOWN => 8463

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_INCOMPATIBLE_PARTIAL_SET => 8464

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_SOURCE_IS_PARTIAL_REPLICA => 8465

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_EXTN_CONNECTION_FAILED => 8466

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INSTALL_SCHEMA_MISMATCH => 8467

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DUP_LINK_ID => 8468

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NAME_ERROR_RESOLVING => 8469

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NAME_ERROR_NOT_FOUND => 8470

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NAME_ERROR_NOT_UNIQUE => 8471

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NAME_ERROR_NO_MAPPING => 8472

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NAME_ERROR_DOMAIN_ONLY => 8473

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NAME_ERROR_NO_SYNTACTICAL_MAPPING => 8474

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CONSTRUCTED_ATT_MOD => 8475

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_WRONG_OM_OBJ_CLASS => 8476

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_REPL_PENDING => 8477

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DS_REQUIRED => 8478

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INVALID_LDAP_DISPLAY_NAME => 8479

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NON_BASE_SEARCH => 8480

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_RETRIEVE_ATTS => 8481

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_BACKLINK_WITHOUT_LINK => 8482

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_EPOCH_MISMATCH => 8483

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SRC_NAME_MISMATCH => 8484

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SRC_AND_DST_NC_IDENTICAL => 8485

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DST_NC_MISMATCH => 8486

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NOT_AUTHORITIVE_FOR_DST_NC => 8487

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SRC_GUID_MISMATCH => 8488

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_MOVE_DELETED_OBJECT => 8489

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_PDC_OPERATION_IN_PROGRESS => 8490

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CROSS_DOMAIN_CLEANUP_REQD => 8491

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ILLEGAL_XDOM_MOVE_OPERATION => 8492

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_WITH_ACCT_GROUP_MEMBERSHPS => 8493

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NC_MUST_HAVE_NC_PARENT => 8494

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CR_IMPOSSIBLE_TO_VALIDATE => 8495

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DST_DOMAIN_NOT_NATIVE => 8496

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_MISSING_INFRASTRUCTURE_CONTAINER => 8497

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_MOVE_ACCOUNT_GROUP => 8498

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_MOVE_RESOURCE_GROUP => 8499

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INVALID_SEARCH_FLAG => 8500

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_TREE_DELETE_ABOVE_NC => 8501

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_COULDNT_LOCK_TREE_FOR_DELETE => 8502

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_COULDNT_IDENTIFY_OBJECTS_FOR_TREE_DELETE => 8503

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SAM_INIT_FAILURE => 8504

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SENSITIVE_GROUP_VIOLATION => 8505

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_MOD_PRIMARYGROUPID => 8506

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ILLEGAL_BASE_SCHEMA_MOD => 8507

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NONSAFE_SCHEMA_CHANGE => 8508

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SCHEMA_UPDATE_DISALLOWED => 8509

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_CREATE_UNDER_SCHEMA => 8510

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INSTALL_NO_SRC_SCH_VERSION => 8511

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INSTALL_NO_SCH_VERSION_IN_INIFILE => 8512

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INVALID_GROUP_TYPE => 8513

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_NEST_GLOBALGROUP_IN_MIXEDDOMAIN => 8514

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_NEST_LOCALGROUP_IN_MIXEDDOMAIN => 8515

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_GLOBAL_CANT_HAVE_LOCAL_MEMBER => 8516

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_GLOBAL_CANT_HAVE_UNIVERSAL_MEMBER => 8517

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_UNIVERSAL_CANT_HAVE_LOCAL_MEMBER => 8518

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_GLOBAL_CANT_HAVE_CROSSDOMAIN_MEMBER => 8519

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_LOCAL_CANT_HAVE_CROSSDOMAIN_LOCAL_MEMBER => 8520

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_HAVE_PRIMARY_MEMBERS => 8521

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_STRING_SD_CONVERSION_FAILED => 8522

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NAMING_MASTER_GC => 8523

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DNS_LOOKUP_FAILURE => 8524

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_COULDNT_UPDATE_SPNS => 8525

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_RETRIEVE_SD => 8526

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_KEY_NOT_UNIQUE => 8527

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_WRONG_LINKED_ATT_SYNTAX => 8528

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SAM_NEED_BOOTKEY_PASSWORD => 8529

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SAM_NEED_BOOTKEY_FLOPPY => 8530

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_START => 8531

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INIT_FAILURE => 8532

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_PKT_PRIVACY_ON_CONNECTION => 8533

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SOURCE_DOMAIN_IN_FOREST => 8534

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DESTINATION_DOMAIN_NOT_IN_FOREST => 8535

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DESTINATION_AUDITING_NOT_ENABLED => 8536

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_FIND_DC_FOR_SRC_DOMAIN => 8537

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SRC_OBJ_NOT_GROUP_OR_USER => 8538

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SRC_SID_EXISTS_IN_FOREST => 8539

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SRC_AND_DST_OBJECT_CLASS_MISMATCH => 8540

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SAM_INIT_FAILURE => 8541

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_SCHEMA_INFO_SHIP => 8542

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_SCHEMA_CONFLICT => 8543

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_EARLIER_SCHEMA_CONFLICT => 8544

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_OBJ_NC_MISMATCH => 8545

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NC_STILL_HAS_DSAS => 8546

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_GC_REQUIRED => 8547

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_LOCAL_MEMBER_OF_LOCAL_ONLY => 8548

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_FPO_IN_UNIVERSAL_GROUPS => 8549

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_ADD_TO_GC => 8550

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_CHECKPOINT_WITH_PDC => 8551

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SOURCE_AUDITING_NOT_ENABLED => 8552

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_CREATE_IN_NONDOMAIN_NC => 8553

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INVALID_NAME_FOR_SPN => 8554

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_FILTER_USES_CONTRUCTED_ATTRS => 8555

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_UNICODEPWD_NOT_IN_QUOTES => 8556

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED => 8557

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_MUST_BE_RUN_ON_DST_DC => 8558

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SRC_DC_MUST_BE_SP4_OR_GREATER => 8559

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_TREE_DELETE_CRITICAL_OBJ => 8560

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INIT_FAILURE_CONSOLE => 8561

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SAM_INIT_FAILURE_CONSOLE => 8562

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_FOREST_VERSION_TOO_HIGH => 8563

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DOMAIN_VERSION_TOO_HIGH => 8564

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_FOREST_VERSION_TOO_LOW => 8565

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DOMAIN_VERSION_TOO_LOW => 8566

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INCOMPATIBLE_VERSION => 8567

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_LOW_DSA_VERSION => 8568

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_BEHAVIOR_VERSION_IN_MIXEDDOMAIN => 8569

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NOT_SUPPORTED_SORT_ORDER => 8570

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NAME_NOT_UNIQUE => 8571

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_MACHINE_ACCOUNT_CREATED_PRENT4 => 8572

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_OUT_OF_VERSION_STORE => 8573

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INCOMPATIBLE_CONTROLS_USED => 8574

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_REF_DOMAIN => 8575

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_RESERVED_LINK_ID => 8576

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_LINK_ID_NOT_AVAILABLE => 8577

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_AG_CANT_HAVE_UNIVERSAL_MEMBER => 8578

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_MODIFYDN_DISALLOWED_BY_INSTANCE_TYPE => 8579

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_OBJECT_MOVE_IN_SCHEMA_NC => 8580

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_MODIFYDN_DISALLOWED_BY_FLAG => 8581

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_MODIFYDN_WRONG_GRANDPARENT => 8582

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NAME_ERROR_TRUST_REFERRAL => 8583

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NOT_SUPPORTED_ON_STANDARD_SERVER => 8584

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_ACCESS_REMOTE_PART_OF_AD => 8585

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CR_IMPOSSIBLE_TO_VALIDATE_V2 => 8586

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_THREAD_LIMIT_EXCEEDED => 8587

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NOT_CLOSEST => 8588

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_DERIVE_SPN_WITHOUT_SERVER_REF => 8589

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SINGLE_USER_MODE_FAILED => 8590

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NTDSCRIPT_SYNTAX_ERROR => 8591

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NTDSCRIPT_PROCESS_ERROR => 8592

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DIFFERENT_REPL_EPOCHS => 8593

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRS_EXTENSIONS_CHANGED => 8594

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_REPLICA_SET_CHANGE_NOT_ALLOWED_ON_DISABLED_CR => 8595

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_MSDS_INTID => 8596

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DUP_MSDS_INTID => 8597

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_EXISTS_IN_RDNATTID => 8598

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_AUTHORIZATION_FAILED => 8599

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INVALID_SCRIPT => 8600

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_REMOTE_CROSSREF_OP_FAILED => 8601

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CROSS_REF_BUSY => 8602

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_DERIVE_SPN_FOR_DELETED_DOMAIN => 8603

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_DEMOTE_WITH_WRITEABLE_NC => 8604

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DUPLICATE_ID_FOUND => 8605

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INSUFFICIENT_ATTR_TO_CREATE_OBJECT => 8606

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_GROUP_CONVERSION_ERROR => 8607

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_MOVE_APP_BASIC_GROUP => 8608

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_CANT_MOVE_APP_QUERY_GROUP => 8609

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_ROLE_NOT_VERIFIED => 8610

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_WKO_CONTAINER_CANNOT_BE_SPECIAL => 8611

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DOMAIN_RENAME_IN_PROGRESS => 8612

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_EXISTING_AD_CHILD_NC => 8613

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_REPL_LIFETIME_EXCEEDED => 8614

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DISALLOWED_IN_SYSTEM_CONTAINER => 8615

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_LDAP_SEND_QUEUE_FULL => 8616

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_OUT_SCHEDULE_WINDOW => 8617

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_POLICY_NOT_KNOWN => 8618

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SITE_SETTINGS_OBJECT => 8619

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_SECRETS => 8620

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NO_WRITABLE_DC_FOUND => 8621

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_SERVER_OBJECT => 8622

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NO_NTDSA_OBJECT => 8623

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_NON_ASQ_SEARCH => 8624

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_AUDIT_FAILURE => 8625

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INVALID_SEARCH_FLAG_SUBTREE => 8626

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_INVALID_SEARCH_FLAG_TUPLE => 8627

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_HIERARCHY_TABLE_TOO_DEEP => 8628

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_CORRUPT_UTD_VECTOR => 8629

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_SECRETS_DENIED => 8630

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_RESERVED_MAPI_ID => 8631

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_MAPI_ID_NOT_AVAILABLE => 8632

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_MISSING_KRBTGT_SECRET => 8633

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DOMAIN_NAME_EXISTS_IN_FOREST => 8634

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_FLAT_NAME_EXISTS_IN_FOREST => 8635

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_USER_PRINCIPAL_NAME => 8636

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_OID_MAPPED_GROUP_CANT_HAVE_MEMBERS => 8637

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_OID_NOT_FOUND => 8638

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DRA_RECYCLED_TARGET => 8639

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_DISALLOWED_NC_REDIRECT => 8640

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_HIGH_ADLDS_FFL => 8641

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_HIGH_DSA_VERSION => 8642

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_LOW_ADLDS_FFL => 8643

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DOMAIN_SID_SAME_AS_LOCAL_WORKSTATION => 8644

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_UNDELETE_SAM_VALIDATION_FAILED => 8645

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INCORRECT_ACCOUNT_TYPE => 8646

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_SPN_VALUE_NOT_UNIQUE_IN_FOREST => 8647

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_UPN_VALUE_NOT_UNIQUE_IN_FOREST => 8648

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_MISSING_FOREST_TRUST => 8649

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_VALUE_KEY_NOT_UNIQUE => 8650

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_WEAK_WHFBKEY_BLOCKED => 8651

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DS_PER_ATTRIBUTE_AUTHZ_FAILED_DURING_ADD => 8652

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LOCAL_POLICY_MODIFICATION_NOT_SUPPORTED => 8653

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_POLICY_CONTROLLED_ACCOUNT => 8654

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LAPS_LEGACY_SCHEMA_MISSING => 8655

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LAPS_SCHEMA_MISSING => 8656

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_LAPS_ENCRYPTION_REQUIRES_2016_DFL => 8657

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
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_QM_POLICY_EXISTS => 13000

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_QM_POLICY_NOT_FOUND => 13001

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_QM_POLICY_IN_USE => 13002

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_MM_POLICY_EXISTS => 13003

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_MM_POLICY_NOT_FOUND => 13004

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_MM_POLICY_IN_USE => 13005

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_MM_FILTER_EXISTS => 13006

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_MM_FILTER_NOT_FOUND => 13007

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_TRANSPORT_FILTER_EXISTS => 13008

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_TRANSPORT_FILTER_NOT_FOUND => 13009

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_MM_AUTH_EXISTS => 13010

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_MM_AUTH_NOT_FOUND => 13011

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_MM_AUTH_IN_USE => 13012

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_DEFAULT_MM_POLICY_NOT_FOUND => 13013

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_DEFAULT_MM_AUTH_NOT_FOUND => 13014

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_DEFAULT_QM_POLICY_NOT_FOUND => 13015

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_TUNNEL_FILTER_EXISTS => 13016

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_TUNNEL_FILTER_NOT_FOUND => 13017

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_MM_FILTER_PENDING_DELETION => 13018

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_TRANSPORT_FILTER_PENDING_DELETION => 13019

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_TUNNEL_FILTER_PENDING_DELETION => 13020

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_MM_POLICY_PENDING_DELETION => 13021

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_MM_AUTH_PENDING_DELETION => 13022

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_QM_POLICY_PENDING_DELETION => 13023

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_NEG_STATUS_BEGIN => 13800

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_AUTH_FAIL => 13801

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_ATTRIB_FAIL => 13802

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_NEGOTIATION_PENDING => 13803

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_GENERAL_PROCESSING_ERROR => 13804

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_TIMED_OUT => 13805

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_NO_CERT => 13806

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_SA_DELETED => 13807

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_SA_REAPED => 13808

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_MM_ACQUIRE_DROP => 13809

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_QM_ACQUIRE_DROP => 13810

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_QUEUE_DROP_MM => 13811

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_QUEUE_DROP_NO_MM => 13812

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_DROP_NO_RESPONSE => 13813

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_MM_DELAY_DROP => 13814

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_QM_DELAY_DROP => 13815

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_ERROR => 13816

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_CRL_FAILED => 13817

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_KEY_USAGE => 13818

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_CERT_TYPE => 13819

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_NO_PRIVATE_KEY => 13820

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_SIMULTANEOUS_REKEY => 13821

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_DH_FAIL => 13822

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_CRITICAL_PAYLOAD_NOT_RECOGNIZED => 13823

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_HEADER => 13824

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_NO_POLICY => 13825

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_SIGNATURE => 13826

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_KERBEROS_ERROR => 13827

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_NO_PUBLIC_KEY => 13828

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_PROCESS_ERR => 13829

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_PROCESS_ERR_SA => 13830

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_PROCESS_ERR_PROP => 13831

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_PROCESS_ERR_TRANS => 13832

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_PROCESS_ERR_KE => 13833

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_PROCESS_ERR_ID => 13834

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_PROCESS_ERR_CERT => 13835

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_PROCESS_ERR_CERT_REQ => 13836

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_PROCESS_ERR_HASH => 13837

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_PROCESS_ERR_SIG => 13838

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_PROCESS_ERR_NONCE => 13839

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_PROCESS_ERR_NOTIFY => 13840

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_PROCESS_ERR_DELETE => 13841

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_PROCESS_ERR_VENDOR => 13842

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_PAYLOAD => 13843

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_LOAD_SOFT_SA => 13844

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_SOFT_SA_TORN_DOWN => 13845

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_COOKIE => 13846

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_NO_PEER_CERT => 13847

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_PEER_CRL_FAILED => 13848

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_POLICY_CHANGE => 13849

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_NO_MM_POLICY => 13850

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_NOTCBPRIV => 13851

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_SECLOADFAIL => 13852

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_FAILSSPINIT => 13853

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_FAILQUERYSSP => 13854

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_SRVACQFAIL => 13855

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_SRVQUERYCRED => 13856

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_GETSPIFAIL => 13857

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_FILTER => 13858

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_OUT_OF_MEMORY => 13859

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_ADD_UPDATE_KEY_FAILED => 13860

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_POLICY => 13861

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_UNKNOWN_DOI => 13862

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_SITUATION => 13863

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_DH_FAILURE => 13864

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_GROUP => 13865

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_ENCRYPT => 13866

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_DECRYPT => 13867

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_POLICY_MATCH => 13868

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_UNSUPPORTED_ID => 13869

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_HASH => 13870

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_HASH_ALG => 13871

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_HASH_SIZE => 13872

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_ENCRYPT_ALG => 13873

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_AUTH_ALG => 13874

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_SIG => 13875

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_LOAD_FAILED => 13876

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_RPC_DELETE => 13877

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_BENIGN_REINIT => 13878

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_RESPONDER_LIFETIME_NOTIFY => 13879

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_MAJOR_VERSION => 13880

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_CERT_KEYLEN => 13881

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_MM_LIMIT => 13882

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_NEGOTIATION_DISABLED => 13883

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_QM_LIMIT => 13884

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_MM_EXPIRED => 13885

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_PEER_MM_ASSUMED_INVALID => 13886

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_CERT_CHAIN_POLICY_MISMATCH => 13887

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_UNEXPECTED_MESSAGE_ID => 13888

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_AUTH_PAYLOAD => 13889

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_DOS_COOKIE_SENT => 13890

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_SHUTTING_DOWN => 13891

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_CGA_AUTH_FAILED => 13892

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_PROCESS_ERR_NATOA => 13893

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INVALID_MM_FOR_QM => 13894

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_QM_EXPIRED => 13895

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_TOO_MANY_FILTERS => 13896

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_NEG_STATUS_END => 13897

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_KILL_DUMMY_NAP_TUNNEL => 13898

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_INNER_IP_ASSIGNMENT_FAILURE => 13899

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_REQUIRE_CP_PAYLOAD_MISSING => 13900

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_KEY_MODULE_IMPERSONATION_NEGOTIATION_PENDING => 13901

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_COEXISTENCE_SUPPRESS => 13902

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_RATELIMIT_DROP => 13903

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_PEER_DOESNT_SUPPORT_MOBIKE => 13904

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_AUTHORIZATION_FAILURE => 13905

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_STRONG_CRED_AUTHORIZATION_FAILURE => 13906

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_AUTHORIZATION_FAILURE_WITH_OPTIONAL_RETRY => 13907

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_STRONG_CRED_AUTHORIZATION_AND_CERTMAP_FAILURE => 13908

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_IKE_NEG_STATUS_EXTENDED_END => 13909

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_BAD_SPI => 13910

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_SA_LIFETIME_EXPIRED => 13911

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_WRONG_SA => 13912

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_REPLAY_CHECK_FAILED => 13913

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_INVALID_PACKET => 13914

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_INTEGRITY_CHECK_FAILED => 13915

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_CLEAR_TEXT_DROP => 13916

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_AUTH_FIREWALL_DROP => 13917

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_THROTTLE_DROP => 13918

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_DOSP_BLOCK => 13925

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_DOSP_RECEIVED_MULTICAST => 13926

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_DOSP_INVALID_PACKET => 13927

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_DOSP_STATE_LOOKUP_FAILED => 13928

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_DOSP_MAX_ENTRIES => 13929

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_DOSP_KEYMOD_NOT_ALLOWED => 13930

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_DOSP_NOT_INSTALLED => 13931

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_IPSEC_DOSP_MAX_PER_IP_RATELIMIT_QUEUES => 13932

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_SECTION_NOT_FOUND => 14000

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_CANT_GEN_ACTCTX => 14001

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_INVALID_ACTCTXDATA_FORMAT => 14002

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_ASSEMBLY_NOT_FOUND => 14003

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_MANIFEST_FORMAT_ERROR => 14004

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_MANIFEST_PARSE_ERROR => 14005

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_ACTIVATION_CONTEXT_DISABLED => 14006

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_KEY_NOT_FOUND => 14007

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_VERSION_CONFLICT => 14008

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_WRONG_SECTION_TYPE => 14009

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_THREAD_QUERIES_DISABLED => 14010

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_PROCESS_DEFAULT_ALREADY_SET => 14011

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_UNKNOWN_ENCODING_GROUP => 14012

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_UNKNOWN_ENCODING => 14013

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_INVALID_XML_NAMESPACE_URI => 14014

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_ROOT_MANIFEST_DEPENDENCY_NOT_INSTALLED => 14015

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_LEAF_MANIFEST_DEPENDENCY_NOT_INSTALLED => 14016

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE => 14017

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_MANIFEST_MISSING_REQUIRED_DEFAULT_NAMESPACE => 14018

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_MANIFEST_INVALID_REQUIRED_DEFAULT_NAMESPACE => 14019

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_PRIVATE_MANIFEST_CROSS_PATH_WITH_REPARSE_POINT => 14020

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_DUPLICATE_DLL_NAME => 14021

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_DUPLICATE_WINDOWCLASS_NAME => 14022

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_DUPLICATE_CLSID => 14023

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_DUPLICATE_IID => 14024

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_DUPLICATE_TLBID => 14025

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_DUPLICATE_PROGID => 14026

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_DUPLICATE_ASSEMBLY_NAME => 14027

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_FILE_HASH_MISMATCH => 14028

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_POLICY_PARSE_ERROR => 14029

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_MISSINGQUOTE => 14030

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_COMMENTSYNTAX => 14031

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_BADSTARTNAMECHAR => 14032

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_BADNAMECHAR => 14033

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_BADCHARINSTRING => 14034

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_XMLDECLSYNTAX => 14035

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_BADCHARDATA => 14036

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_MISSINGWHITESPACE => 14037

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_EXPECTINGTAGEND => 14038

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_MISSINGSEMICOLON => 14039

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_UNBALANCEDPAREN => 14040

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_INTERNALERROR => 14041

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_UNEXPECTED_WHITESPACE => 14042

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_INCOMPLETE_ENCODING => 14043

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_MISSING_PAREN => 14044

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_EXPECTINGCLOSEQUOTE => 14045

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_MULTIPLE_COLONS => 14046

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_INVALID_DECIMAL => 14047

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_INVALID_HEXIDECIMAL => 14048

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_INVALID_UNICODE => 14049

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_WHITESPACEORQUESTIONMARK => 14050

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_UNEXPECTEDENDTAG => 14051

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_UNCLOSEDTAG => 14052

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_DUPLICATEATTRIBUTE => 14053

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_MULTIPLEROOTS => 14054

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_INVALIDATROOTLEVEL => 14055

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_BADXMLDECL => 14056

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_MISSINGROOT => 14057

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_UNEXPECTEDEOF => 14058

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_BADPEREFINSUBSET => 14059

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_UNCLOSEDSTARTTAG => 14060

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_UNCLOSEDENDTAG => 14061

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_UNCLOSEDSTRING => 14062

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_UNCLOSEDCOMMENT => 14063

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_UNCLOSEDDECL => 14064

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_UNCLOSEDCDATA => 14065

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_RESERVEDNAMESPACE => 14066

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_INVALIDENCODING => 14067

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_INVALIDSWITCH => 14068

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_BADXMLCASE => 14069

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_INVALID_STANDALONE => 14070

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_UNEXPECTED_STANDALONE => 14071

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_INVALID_VERSION => 14072

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_XML_E_MISSINGEQUALS => 14073

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_PROTECTION_RECOVERY_FAILED => 14074

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_PROTECTION_PUBLIC_KEY_TOO_SHORT => 14075

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_PROTECTION_CATALOG_NOT_VALID => 14076

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_UNTRANSLATABLE_HRESULT => 14077

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_PROTECTION_CATALOG_FILE_MISSING => 14078

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_MISSING_ASSEMBLY_IDENTITY_ATTRIBUTE => 14079

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_INVALID_ASSEMBLY_IDENTITY_ATTRIBUTE_NAME => 14080

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_ASSEMBLY_MISSING => 14081

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_CORRUPT_ACTIVATION_STACK => 14082

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_CORRUPTION => 14083

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_EARLY_DEACTIVATION => 14084

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_INVALID_DEACTIVATION => 14085

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_MULTIPLE_DEACTIVATION => 14086

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_PROCESS_TERMINATION_REQUESTED => 14087

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_RELEASE_ACTIVATION_CONTEXT => 14088

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_SYSTEM_DEFAULT_ACTIVATION_CONTEXT_EMPTY => 14089

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_INVALID_IDENTITY_ATTRIBUTE_VALUE => 14090

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_INVALID_IDENTITY_ATTRIBUTE_NAME => 14091

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_IDENTITY_DUPLICATE_ATTRIBUTE => 14092

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_IDENTITY_PARSE_ERROR => 14093

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MALFORMED_SUBSTITUTION_STRING => 14094

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_INCORRECT_PUBLIC_KEY_TOKEN => 14095

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNMAPPED_SUBSTITUTION_STRING => 14096

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_ASSEMBLY_NOT_LOCKED => 14097

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_COMPONENT_STORE_CORRUPT => 14098

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_ADVANCED_INSTALLER_FAILED => 14099

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_XML_ENCODING_MISMATCH => 14100

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_MANIFEST_IDENTITY_SAME_BUT_CONTENTS_DIFFERENT => 14101

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_IDENTITIES_DIFFERENT => 14102

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_ASSEMBLY_IS_NOT_A_DEPLOYMENT => 14103

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_FILE_NOT_PART_OF_ASSEMBLY => 14104

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_MANIFEST_TOO_BIG => 14105

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_SETTING_NOT_REGISTERED => 14106

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_TRANSACTION_CLOSURE_INCOMPLETE => 14107

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SMI_PRIMITIVE_INSTALLER_FAILED => 14108

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GENERIC_COMMAND_FAILED => 14109

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_FILE_HASH_MISSING => 14110

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SXS_DUPLICATE_ACTIVATABLE_CLASS => 14111

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_INVALID_CHANNEL_PATH => 15000

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_INVALID_QUERY => 15001

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_PUBLISHER_METADATA_NOT_FOUND => 15002

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_EVENT_TEMPLATE_NOT_FOUND => 15003

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_INVALID_PUBLISHER_NAME => 15004

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_INVALID_EVENT_DATA => 15005

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_CHANNEL_NOT_FOUND => 15007

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_MALFORMED_XML_TEXT => 15008

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_SUBSCRIPTION_TO_DIRECT_CHANNEL => 15009

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_CONFIGURATION_ERROR => 15010

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_QUERY_RESULT_STALE => 15011

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_QUERY_RESULT_INVALID_POSITION => 15012

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_NON_VALIDATING_MSXML => 15013

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_FILTER_ALREADYSCOPED => 15014

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_FILTER_NOTELTSET => 15015

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_FILTER_INVARG => 15016

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_FILTER_INVTEST => 15017

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_FILTER_INVTYPE => 15018

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_FILTER_PARSEERR => 15019

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_FILTER_UNSUPPORTEDOP => 15020

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_FILTER_UNEXPECTEDTOKEN => 15021

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_INVALID_OPERATION_OVER_ENABLED_DIRECT_CHANNEL => 15022

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_INVALID_CHANNEL_PROPERTY_VALUE => 15023

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_INVALID_PUBLISHER_PROPERTY_VALUE => 15024

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_CHANNEL_CANNOT_ACTIVATE => 15025

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_FILTER_TOO_COMPLEX => 15026

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_MESSAGE_NOT_FOUND => 15027

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_MESSAGE_ID_NOT_FOUND => 15028

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_UNRESOLVED_VALUE_INSERT => 15029

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_UNRESOLVED_PARAMETER_INSERT => 15030

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_MAX_INSERTS_REACHED => 15031

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_EVENT_DEFINITION_NOT_FOUND => 15032

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_MESSAGE_LOCALE_NOT_FOUND => 15033

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_VERSION_TOO_OLD => 15034

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_VERSION_TOO_NEW => 15035

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_CANNOT_OPEN_CHANNEL_OF_QUERY => 15036

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_PUBLISHER_DISABLED => 15037

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EVT_FILTER_OUT_OF_RANGE => 15038

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EC_SUBSCRIPTION_CANNOT_ACTIVATE => 15080

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EC_LOG_DISABLED => 15081

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EC_CIRCULAR_FORWARDING => 15082

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EC_CREDSTORE_FULL => 15083

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EC_CRED_NOT_FOUND => 15084

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_EC_NO_ACTIVE_CHANNEL => 15085

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MUI_FILE_NOT_FOUND => 15100

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MUI_INVALID_FILE => 15101

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MUI_INVALID_RC_CONFIG => 15102

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MUI_INVALID_LOCALE_NAME => 15103

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MUI_INVALID_ULTIMATEFALLBACK_NAME => 15104

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MUI_FILE_NOT_LOADED => 15105

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESOURCE_ENUM_USER_STOP => 15106

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MUI_INTLSETTINGS_UILANG_NOT_INSTALLED => 15107

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MUI_INTLSETTINGS_INVALID_LOCALE_NAME => 15108

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_RUNTIME_NO_DEFAULT_OR_NEUTRAL_RESOURCE => 15110

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_INVALID_PRICONFIG => 15111

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_INVALID_FILE_TYPE => 15112

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_UNKNOWN_QUALIFIER => 15113

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_INVALID_QUALIFIER_VALUE => 15114

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_NO_CANDIDATE => 15115

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_NO_MATCH_OR_DEFAULT_CANDIDATE => 15116

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_RESOURCE_TYPE_MISMATCH => 15117

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_DUPLICATE_MAP_NAME => 15118

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_DUPLICATE_ENTRY => 15119

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_INVALID_RESOURCE_IDENTIFIER => 15120

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_FILEPATH_TOO_LONG => 15121

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_UNSUPPORTED_DIRECTORY_TYPE => 15122

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_INVALID_PRI_FILE => 15126

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_NAMED_RESOURCE_NOT_FOUND => 15127

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_MAP_NOT_FOUND => 15135

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_UNSUPPORTED_PROFILE_TYPE => 15136

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_INVALID_QUALIFIER_OPERATOR => 15137

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_INDETERMINATE_QUALIFIER_VALUE => 15138

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_AUTOMERGE_ENABLED => 15139

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_TOO_MANY_RESOURCES => 15140

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_UNSUPPORTED_FILE_TYPE_FOR_MERGE => 15141

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_UNSUPPORTED_FILE_TYPE_FOR_LOAD_UNLOAD_PRI_FILE => 15142

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_NO_CURRENT_VIEW_ON_THREAD => 15143

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIFFERENT_PROFILE_RESOURCE_MANAGER_EXIST => 15144

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_OPERATION_NOT_ALLOWED_FROM_SYSTEM_COMPONENT => 15145

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_DIRECT_REF_TO_NON_DEFAULT_RESOURCE => 15146

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_GENERATION_COUNT_MISMATCH => 15147

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRI_MERGE_VERSION_MISMATCH => 15148

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRI_MERGE_MISSING_SCHEMA => 15149

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRI_MERGE_LOAD_FILE_FAILED => 15150

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRI_MERGE_ADD_FILE_FAILED => 15151

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRI_MERGE_WRITE_FILE_FAILED => 15152

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRI_MERGE_MULTIPLE_PACKAGE_FAMILIES_NOT_ALLOWED => 15153

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRI_MERGE_MULTIPLE_MAIN_PACKAGES_NOT_ALLOWED => 15154

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRI_MERGE_BUNDLE_PACKAGES_NOT_ALLOWED => 15155

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRI_MERGE_MAIN_PACKAGE_REQUIRED => 15156

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRI_MERGE_RESOURCE_PACKAGE_REQUIRED => 15157

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PRI_MERGE_INVALID_FILE_NAME => 15158

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_PACKAGE_NOT_FOUND => 15159

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_MISSING_DEFAULT_LANGUAGE => 15160

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MRM_SCOPE_ITEM_CONFLICT => 15161

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MCA_INVALID_CAPABILITIES_STRING => 15200

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MCA_INVALID_VCP_VERSION => 15201

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MCA_MONITOR_VIOLATES_MCCS_SPECIFICATION => 15202

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MCA_MCCS_VERSION_MISMATCH => 15203

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MCA_UNSUPPORTED_MCCS_VERSION => 15204

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MCA_INTERNAL_ERROR => 15205

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MCA_INVALID_TECHNOLOGY_TYPE_RETURNED => 15206

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MCA_UNSUPPORTED_COLOR_TEMPERATURE => 15207

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_AMBIGUOUS_SYSTEM_DEVICE => 15250

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_DEVICE_NOT_FOUND => 15299

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HASH_NOT_SUPPORTED => 15300

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HASH_NOT_PRESENT => 15301

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SECONDARY_IC_PROVIDER_NOT_REGISTERED => 15321

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GPIO_CLIENT_INFORMATION_INVALID => 15322

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GPIO_VERSION_NOT_SUPPORTED => 15323

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GPIO_INVALID_REGISTRATION_PACKET => 15324

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GPIO_OPERATION_DENIED => 15325

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GPIO_INCOMPATIBLE_CONNECT_MODE => 15326

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_GPIO_INTERRUPT_ALREADY_UNMASKED => 15327

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CANNOT_SWITCH_RUNLEVEL => 15400

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_RUNLEVEL_SETTING => 15401

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RUNLEVEL_SWITCH_TIMEOUT => 15402

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RUNLEVEL_SWITCH_AGENT_TIMEOUT => 15403

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RUNLEVEL_SWITCH_IN_PROGRESS => 15404

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICES_FAILED_AUTOSTART => 15405

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_COM_TASK_STOP_PENDING => 15501

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_OPEN_PACKAGE_FAILED => 15600

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_PACKAGE_NOT_FOUND => 15601

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_INVALID_PACKAGE => 15602

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_RESOLVE_DEPENDENCY_FAILED => 15603

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_OUT_OF_DISK_SPACE => 15604

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_NETWORK_FAILURE => 15605

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_REGISTRATION_FAILURE => 15606

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_DEREGISTRATION_FAILURE => 15607

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_CANCEL => 15608

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_FAILED => 15609

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REMOVE_FAILED => 15610

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PACKAGE_ALREADY_EXISTS => 15611

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NEEDS_REMEDIATION => 15612

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_PREREQUISITE_FAILED => 15613

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PACKAGE_REPOSITORY_CORRUPTED => 15614

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_POLICY_FAILURE => 15615

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PACKAGE_UPDATING => 15616

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEPLOYMENT_BLOCKED_BY_POLICY => 15617

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PACKAGES_IN_USE => 15618

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RECOVERY_FILE_CORRUPT => 15619

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INVALID_STAGED_SIGNATURE => 15620

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DELETING_EXISTING_APPLICATIONDATA_STORE_FAILED => 15621

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_PACKAGE_DOWNGRADE => 15622

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SYSTEM_NEEDS_REMEDIATION => 15623

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPX_INTEGRITY_FAILURE_CLR_NGEN => 15624

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_RESILIENCY_FILE_CORRUPT => 15625

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_FIREWALL_SERVICE_NOT_RUNNING => 15626

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PACKAGE_MOVE_FAILED => 15627

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_VOLUME_NOT_EMPTY => 15628

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_VOLUME_OFFLINE => 15629

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_VOLUME_CORRUPT => 15630

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NEEDS_REGISTRATION => 15631

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_WRONG_PROCESSOR_ARCHITECTURE => 15632

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEV_SIDELOAD_LIMIT_EXCEEDED => 15633

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE => 15634

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PACKAGE_NOT_SUPPORTED_ON_FILESYSTEM => 15635

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PACKAGE_MOVE_BLOCKED_BY_STREAMING => 15636

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_OPTIONAL_PACKAGE_APPLICATIONID_NOT_UNIQUE => 15637

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PACKAGE_STAGING_ONHOLD => 15638

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_INVALID_RELATED_SET_UPDATE => 15639

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE_FULLTRUST_CAPABILITY => 15640

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEPLOYMENT_BLOCKED_BY_USER_LOG_OFF => 15641

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PROVISION_OPTIONAL_PACKAGE_REQUIRES_MAIN_PACKAGE_PROVISIONED => 15642

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PACKAGES_REPUTATION_CHECK_FAILED => 15643

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PACKAGES_REPUTATION_CHECK_TIMEDOUT => 15644

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEPLOYMENT_OPTION_NOT_SUPPORTED => 15645

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPINSTALLER_ACTIVATION_BLOCKED => 15646

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REGISTRATION_FROM_REMOTE_DRIVE_NOT_SUPPORTED => 15647

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPX_RAW_DATA_WRITE_FAILED => 15648

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEPLOYMENT_BLOCKED_BY_VOLUME_POLICY_PACKAGE => 15649

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEPLOYMENT_BLOCKED_BY_VOLUME_POLICY_MACHINE => 15650

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEPLOYMENT_BLOCKED_BY_PROFILE_POLICY => 15651

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DEPLOYMENT_FAILED_CONFLICTING_MUTABLE_PACKAGE_DIRECTORY => 15652

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SINGLETON_RESOURCE_INSTALLED_IN_ACTIVE_USER => 15653

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_DIFFERENT_VERSION_OF_PACKAGED_SERVICE_INSTALLED => 15654

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SERVICE_EXISTS_AS_NON_PACKAGED_SERVICE => 15655

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PACKAGED_SERVICE_REQUIRES_ADMIN_PRIVILEGES => 15656

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_REDIRECTION_TO_DEFAULT_ACCOUNT_NOT_ALLOWED => 15657

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PACKAGE_LACKS_CAPABILITY_TO_DEPLOY_ON_HOST => 15658

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNSIGNED_PACKAGE_INVALID_CONTENT => 15659

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_UNSIGNED_PACKAGE_INVALID_PUBLISHER_NAMESPACE => 15660

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_SIGNED_PACKAGE_INVALID_PUBLISHER_NAMESPACE => 15661

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PACKAGE_EXTERNAL_LOCATION_NOT_ALLOWED => 15662

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_FULLTRUST_HOSTRUNTIME_REQUIRES_MAIN_PACKAGE_FULLTRUST_CAPABILITY => 15663

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PACKAGE_LACKS_CAPABILITY_FOR_MANDATORY_STARTUPTASKS => 15664

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_INSTALL_RESOLVE_HOSTRUNTIME_DEPENDENCY_FAILED => 15665

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_MACHINE_SCOPE_NOT_ALLOWED => 15666

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CLASSIC_COMPAT_MODE_NOT_ALLOWED => 15667

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STAGEFROMUPDATEAGENT_PACKAGE_NOT_APPLICABLE => 15668

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PACKAGE_NOT_REGISTERED_FOR_USER => 15669

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_PACKAGE_NAME_MISMATCH => 15670

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPINSTALLER_URI_IN_USE => 15671

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_APPINSTALLER_IS_MANAGED_BY_SYSTEM => 15672

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
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_LOAD_STORE_FAILED => 15800

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_GET_VERSION_FAILED => 15801

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_SET_VERSION_FAILED => 15802

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_STRUCTURED_RESET_FAILED => 15803

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_OPEN_CONTAINER_FAILED => 15804

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_CREATE_CONTAINER_FAILED => 15805

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_DELETE_CONTAINER_FAILED => 15806

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_READ_SETTING_FAILED => 15807

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_WRITE_SETTING_FAILED => 15808

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_DELETE_SETTING_FAILED => 15809

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_QUERY_SETTING_FAILED => 15810

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_READ_COMPOSITE_SETTING_FAILED => 15811

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_WRITE_COMPOSITE_SETTING_FAILED => 15812

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_ENUMERATE_CONTAINER_FAILED => 15813

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_ENUMERATE_SETTINGS_FAILED => 15814

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_COMPOSITE_SETTING_VALUE_SIZE_LIMIT_EXCEEDED => 15815

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_SETTING_VALUE_SIZE_LIMIT_EXCEEDED => 15816

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_SETTING_NAME_SIZE_LIMIT_EXCEEDED => 15817

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_STATE_CONTAINER_NAME_SIZE_LIMIT_EXCEEDED => 15818

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_API_UNAVAILABLE => 15841

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_INTERFACE_CLOSING => 2150891522

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_BAD_VERSION => 2150891524

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_BAD_CHARACTERISTICS => 2150891525

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_ADAPTER_NOT_FOUND => 2150891526

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_OPEN_FAILED => 2150891527

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_DEVICE_FAILED => 2150891528

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_MULTICAST_FULL => 2150891529

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_MULTICAST_EXISTS => 2150891530

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_MULTICAST_NOT_FOUND => 2150891531

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_REQUEST_ABORTED => 2150891532

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_RESET_IN_PROGRESS => 2150891533

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_NOT_SUPPORTED => 2150891707

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_INVALID_PACKET => 2150891535

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_ADAPTER_NOT_READY => 2150891537

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_INVALID_LENGTH => 2150891540

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_INVALID_DATA => 2150891541

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_BUFFER_TOO_SHORT => 2150891542

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_INVALID_OID => 2150891543

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_ADAPTER_REMOVED => 2150891544

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_UNSUPPORTED_MEDIA => 2150891545

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_GROUP_ADDRESS_IN_USE => 2150891546

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_FILE_NOT_FOUND => 2150891547

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_ERROR_READING_FILE => 2150891548

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_ALREADY_MAPPED => 2150891549

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_RESOURCE_CONFLICT => 2150891550

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_MEDIA_DISCONNECTED => 2150891551

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_INVALID_ADDRESS => 2150891554

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_INVALID_DEVICE_REQUEST => 2150891536

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_PAUSED => 2150891562

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_INTERFACE_NOT_FOUND => 2150891563

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_UNSUPPORTED_REVISION => 2150891564

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_INVALID_PORT => 2150891565

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_INVALID_PORT_STATE => 2150891566

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_LOW_POWER_STATE => 2150891567

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_REINIT_REQUIRED => 2150891568

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_NO_QUEUES => 2150891569

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_DOT11_AUTO_CONFIG_ENABLED => 2150899712

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_DOT11_MEDIA_IN_USE => 2150899713

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_DOT11_POWER_STATE_INVALID => 2150899714

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_PM_WOL_PATTERN_LIST_FULL => 2150899715

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_PM_PROTOCOL_OFFLOAD_LIST_FULL => 2150899716

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_DOT11_AP_CHANNEL_CURRENTLY_NOT_AVAILABLE => 2150899717

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_DOT11_AP_BAND_CURRENTLY_NOT_AVAILABLE => 2150899718

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_DOT11_AP_CHANNEL_NOT_ALLOWED => 2150899719

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_DOT11_AP_BAND_NOT_ALLOWED => 2150899720

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_INDICATION_REQUIRED => 3407873

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_OFFLOAD_POLICY => 3224637455

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_OFFLOAD_CONNECTION_REJECTED => 3224637458

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_NDIS_OFFLOAD_PATH_REJECTED => 3224637459

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_HYPERCALL_CODE => 3224698882

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_HYPERCALL_INPUT => 3224698883

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_ALIGNMENT => 3224698884

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_PARAMETER => 3224698885

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_ACCESS_DENIED => 3224698886

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_PARTITION_STATE => 3224698887

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_OPERATION_DENIED => 3224698888

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_UNKNOWN_PROPERTY => 3224698889

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_PROPERTY_VALUE_OUT_OF_RANGE => 3224698890

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INSUFFICIENT_MEMORY => 3224698891

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_PARTITION_TOO_DEEP => 3224698892

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_PARTITION_ID => 3224698893

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_VP_INDEX => 3224698894

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_PORT_ID => 3224698897

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_CONNECTION_ID => 3224698898

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INSUFFICIENT_BUFFERS => 3224698899

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_NOT_ACKNOWLEDGED => 3224698900

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_VP_STATE => 3224698901

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_ACKNOWLEDGED => 3224698902

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_SAVE_RESTORE_STATE => 3224698903

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_SYNIC_STATE => 3224698904

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_OBJECT_IN_USE => 3224698905

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_PROXIMITY_DOMAIN_INFO => 3224698906

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_NO_DATA => 3224698907

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INACTIVE => 3224698908

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_NO_RESOURCES => 3224698909

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_FEATURE_UNAVAILABLE => 3224698910

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INSUFFICIENT_BUFFER => 3224698931

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INSUFFICIENT_DEVICE_DOMAINS => 3224698936

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_CPUID_FEATURE_VALIDATION => 3224698940

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_CPUID_XSAVE_FEATURE_VALIDATION => 3224698941

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_PROCESSOR_STARTUP_TIMEOUT => 3224698942

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_SMX_ENABLED => 3224698943

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_LP_INDEX => 3224698945

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_REGISTER_VALUE => 3224698960

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_VTL_STATE => 3224698961

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_NX_NOT_DETECTED => 3224698965

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_DEVICE_ID => 3224698967

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_DEVICE_STATE => 3224698968

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_PENDING_PAGE_REQUESTS => 3473497

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_PAGE_REQUEST_INVALID => 3224698976

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_CPU_GROUP_ID => 3224698991

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INVALID_CPU_GROUP_STATE => 3224698992

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_OPERATION_FAILED => 3224698993

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_NOT_ALLOWED_WITH_NESTED_VIRT_ACTIVE => 3224698994

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INSUFFICIENT_ROOT_MEMORY => 3224698995

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_EVENT_BUFFER_ALREADY_FREED => 3224698996

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INSUFFICIENT_CONTIGUOUS_MEMORY => 3224698997

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_DEVICE_NOT_IN_DOMAIN => 3224698998

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_NESTED_VM_EXIT => 3224698999

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_MSR_ACCESS_FAILED => 3224699008

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INSUFFICIENT_MEMORY_MIRRORING => 3224699009

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INSUFFICIENT_CONTIGUOUS_MEMORY_MIRRORING => 3224699010

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INSUFFICIENT_CONTIGUOUS_ROOT_MEMORY => 3224699011

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INSUFFICIENT_ROOT_MEMORY_MIRRORING => 3224699012

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_INSUFFICIENT_CONTIGUOUS_ROOT_MEMORY_MIRRORING => 3224699013

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_HV_NOT_PRESENT => 3224702976

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_DUPLICATE_HANDLER => 3224829953

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_TOO_MANY_HANDLERS => 3224829954

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_QUEUE_FULL => 3224829955

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_HANDLER_NOT_PRESENT => 3224829956

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_INVALID_OBJECT_NAME => 3224829957

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_PARTITION_NAME_TOO_LONG => 3224829958

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_MESSAGE_QUEUE_NAME_TOO_LONG => 3224829959

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_PARTITION_ALREADY_EXISTS => 3224829960

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_PARTITION_DOES_NOT_EXIST => 3224829961

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_PARTITION_NAME_NOT_FOUND => 3224829962

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_MESSAGE_QUEUE_ALREADY_EXISTS => 3224829963

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_EXCEEDED_MBP_ENTRY_MAP_LIMIT => 3224829964

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_MB_STILL_REFERENCED => 3224829965

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_CHILD_GPA_PAGE_SET_CORRUPTED => 3224829966

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_INVALID_NUMA_SETTINGS => 3224829967

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_INVALID_NUMA_NODE_INDEX => 3224829968

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_NOTIFICATION_QUEUE_ALREADY_ASSOCIATED => 3224829969

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_INVALID_MEMORY_BLOCK_HANDLE => 3224829970

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_PAGE_RANGE_OVERFLOW => 3224829971

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_INVALID_MESSAGE_QUEUE_HANDLE => 3224829972

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_INVALID_GPA_RANGE_HANDLE => 3224829973

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_NO_MEMORY_BLOCK_NOTIFICATION_QUEUE => 3224829974

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_MEMORY_BLOCK_LOCK_COUNT_EXCEEDED => 3224829975

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_INVALID_PPM_HANDLE => 3224829976

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_MBPS_ARE_LOCKED => 3224829977

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_MESSAGE_QUEUE_CLOSED => 3224829978

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_VIRTUAL_PROCESSOR_LIMIT_EXCEEDED => 3224829979

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_STOP_PENDING => 3224829980

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_INVALID_PROCESSOR_STATE => 3224829981

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_EXCEEDED_KM_CONTEXT_COUNT_LIMIT => 3224829982

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_KM_INTERFACE_ALREADY_INITIALIZED => 3224829983

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_MB_PROPERTY_ALREADY_SET_RESET => 3224829984

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_MMIO_RANGE_DESTROYED => 3224829985

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_INVALID_CHILD_GPA_PAGE_SET => 3224829986

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_RESERVE_PAGE_SET_IS_BEING_USED => 3224829987

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_RESERVE_PAGE_SET_TOO_SMALL => 3224829988

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_MBP_ALREADY_LOCKED_USING_RESERVED_PAGE => 3224829989

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_MBP_COUNT_EXCEEDED_LIMIT => 3224829990

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_SAVED_STATE_CORRUPT => 3224829991

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_SAVED_STATE_UNRECOGNIZED_ITEM => 3224829992

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_SAVED_STATE_INCOMPATIBLE => 3224829993

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_VTL_ACCESS_DENIED => 3224829994

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_INSUFFICIENT_RESOURCES_RESERVE => 3224829995

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_INSUFFICIENT_RESOURCES_PHYSICAL_BUFFER => 3224829996

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_INSUFFICIENT_RESOURCES_HV_DEPOSIT => 3224829997

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_MEMORY_TYPE_NOT_SUPPORTED => 3224829998

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_INSUFFICIENT_RESOURCES_WITHDRAW => 3224829999

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_PROCESS_ALREADY_SET => 3224830000

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_TERMINATED_DURING_START => 3224830208

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_IMAGE_MISMATCH => 3224830209

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_HYPERV_NOT_INSTALLED => 3224830210

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_OPERATION_PENDING => 3224830211

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_TOO_MANY_NOTIFICATIONS => 3224830212

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_INVALID_STATE => 3224830213

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_UNEXPECTED_EXIT => 3224830214

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_TERMINATED => 3224830215

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_CONNECT_FAILED => 3224830216

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_TIMEOUT => 3224830217

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_CONNECTION_CLOSED => 3224830218

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_UNKNOWN_MESSAGE => 3224830219

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_UNSUPPORTED_PROTOCOL_VERSION => 3224830220

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_INVALID_JSON => 3224830221

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_SYSTEM_NOT_FOUND => 3224830222

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_SYSTEM_ALREADY_EXISTS => 3224830223

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_SYSTEM_ALREADY_STOPPED => 3224830224

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_PROTOCOL_ERROR => 3224830225

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_INVALID_LAYER => 3224830226

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VMCOMPUTE_WINDOWS_INSIDER_REQUIRED => 3224830227

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VNET_VIRTUAL_SWITCH_NAME_NOT_FOUND => 3224830464

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VID_REMOTE_NODE_PARENT_GPA_PAGES_USED => 2151088129

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VSMB_SAVED_STATE_FILE_NOT_FOUND => 3224830976

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VSMB_SAVED_STATE_CORRUPT => 3224830977

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_INCOMPLETE_REGENERATION => 2151153665

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_INCOMPLETE_DISK_MIGRATION => 2151153666

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DATABASE_FULL => 3224895489

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_CONFIGURATION_CORRUPTED => 3224895490

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_CONFIGURATION_NOT_IN_SYNC => 3224895491

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PACK_CONFIG_UPDATE_FAILED => 3224895492

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_CONTAINS_NON_SIMPLE_VOLUME => 3224895493

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_DUPLICATE => 3224895494

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_DYNAMIC => 3224895495

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_ID_INVALID => 3224895496

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_INVALID => 3224895497

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_LAST_VOTER => 3224895498

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_LAYOUT_INVALID => 3224895499

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_LAYOUT_NON_BASIC_BETWEEN_BASIC_PARTITIONS => 3224895500

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_LAYOUT_NOT_CYLINDER_ALIGNED => 3224895501

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_LAYOUT_PARTITIONS_TOO_SMALL => 3224895502

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_LAYOUT_PRIMARY_BETWEEN_LOGICAL_PARTITIONS => 3224895503

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_LAYOUT_TOO_MANY_PARTITIONS => 3224895504

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_MISSING => 3224895505

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_NOT_EMPTY => 3224895506

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_NOT_ENOUGH_SPACE => 3224895507

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_REVECTORING_FAILED => 3224895508

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_SECTOR_SIZE_INVALID => 3224895509

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_SET_NOT_CONTAINED => 3224895510

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_USED_BY_MULTIPLE_MEMBERS => 3224895511

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DISK_USED_BY_MULTIPLE_PLEXES => 3224895512

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DYNAMIC_DISK_NOT_SUPPORTED => 3224895513

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_EXTENT_ALREADY_USED => 3224895514

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_EXTENT_NOT_CONTIGUOUS => 3224895515

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_EXTENT_NOT_IN_PUBLIC_REGION => 3224895516

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_EXTENT_NOT_SECTOR_ALIGNED => 3224895517

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_EXTENT_OVERLAPS_EBR_PARTITION => 3224895518

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_EXTENT_VOLUME_LENGTHS_DO_NOT_MATCH => 3224895519

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_FAULT_TOLERANT_NOT_SUPPORTED => 3224895520

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_INTERLEAVE_LENGTH_INVALID => 3224895521

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_MAXIMUM_REGISTERED_USERS => 3224895522

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_MEMBER_IN_SYNC => 3224895523

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_MEMBER_INDEX_DUPLICATE => 3224895524

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_MEMBER_INDEX_INVALID => 3224895525

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_MEMBER_MISSING => 3224895526

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_MEMBER_NOT_DETACHED => 3224895527

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_MEMBER_REGENERATING => 3224895528

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_ALL_DISKS_FAILED => 3224895529

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_NO_REGISTERED_USERS => 3224895530

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_NO_SUCH_USER => 3224895531

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_NOTIFICATION_RESET => 3224895532

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_NUMBER_OF_MEMBERS_INVALID => 3224895533

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_NUMBER_OF_PLEXES_INVALID => 3224895534

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PACK_DUPLICATE => 3224895535

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PACK_ID_INVALID => 3224895536

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PACK_INVALID => 3224895537

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PACK_NAME_INVALID => 3224895538

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PACK_OFFLINE => 3224895539

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PACK_HAS_QUORUM => 3224895540

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PACK_WITHOUT_QUORUM => 3224895541

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PARTITION_STYLE_INVALID => 3224895542

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PARTITION_UPDATE_FAILED => 3224895543

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PLEX_IN_SYNC => 3224895544

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PLEX_INDEX_DUPLICATE => 3224895545

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PLEX_INDEX_INVALID => 3224895546

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PLEX_LAST_ACTIVE => 3224895547

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PLEX_MISSING => 3224895548

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PLEX_REGENERATING => 3224895549

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PLEX_TYPE_INVALID => 3224895550

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PLEX_NOT_RAID5 => 3224895551

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PLEX_NOT_SIMPLE => 3224895552

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_STRUCTURE_SIZE_INVALID => 3224895553

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_TOO_MANY_NOTIFICATION_REQUESTS => 3224895554

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_TRANSACTION_IN_PROGRESS => 3224895555

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_UNEXPECTED_DISK_LAYOUT_CHANGE => 3224895556

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_VOLUME_CONTAINS_MISSING_DISK => 3224895557

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_VOLUME_ID_INVALID => 3224895558

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_VOLUME_LENGTH_INVALID => 3224895559

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_VOLUME_LENGTH_NOT_SECTOR_SIZE_MULTIPLE => 3224895560

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_VOLUME_NOT_MIRRORED => 3224895561

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_VOLUME_NOT_RETAINED => 3224895562

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_VOLUME_OFFLINE => 3224895563

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_VOLUME_RETAINED => 3224895564

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_NUMBER_OF_EXTENTS_INVALID => 3224895565

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_DIFFERENT_SECTOR_SIZE => 3224895566

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_BAD_BOOT_DISK => 3224895567

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PACK_CONFIG_OFFLINE => 3224895568

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PACK_CONFIG_ONLINE => 3224895569

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_NOT_PRIMARY_PACK => 3224895570

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PACK_LOG_UPDATE_FAILED => 3224895571

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_NUMBER_OF_DISKS_IN_PLEX_INVALID => 3224895572

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_NUMBER_OF_DISKS_IN_MEMBER_INVALID => 3224895573

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_VOLUME_MIRRORED => 3224895574

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PLEX_NOT_SIMPLE_SPANNED => 3224895575

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_NO_VALID_LOG_COPIES => 3224895576

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_PRIMARY_PACK_PRESENT => 3224895577

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_NUMBER_OF_DISKS_INVALID => 3224895578

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_MIRROR_NOT_SUPPORTED => 3224895579

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VOLMGR_RAID5_NOT_SUPPORTED => 3224895580

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BCD_NOT_ALL_ENTRIES_IMPORTED => 2151219201

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BCD_TOO_MANY_ELEMENTS => 3224961026

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_BCD_NOT_ALL_ENTRIES_SYNCHRONIZED => 2151219203

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_DRIVE_FOOTER_MISSING => 3225026561

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_DRIVE_FOOTER_CHECKSUM_MISMATCH => 3225026562

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_DRIVE_FOOTER_CORRUPT => 3225026563

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_FORMAT_UNKNOWN => 3225026564

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_FORMAT_UNSUPPORTED_VERSION => 3225026565

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_SPARSE_HEADER_CHECKSUM_MISMATCH => 3225026566

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_SPARSE_HEADER_UNSUPPORTED_VERSION => 3225026567

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_SPARSE_HEADER_CORRUPT => 3225026568

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_BLOCK_ALLOCATION_FAILURE => 3225026569

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_BLOCK_ALLOCATION_TABLE_CORRUPT => 3225026570

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_INVALID_BLOCK_SIZE => 3225026571

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_BITMAP_MISMATCH => 3225026572

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_PARENT_VHD_NOT_FOUND => 3225026573

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_CHILD_PARENT_ID_MISMATCH => 3225026574

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_CHILD_PARENT_TIMESTAMP_MISMATCH => 3225026575

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_METADATA_READ_FAILURE => 3225026576

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_METADATA_WRITE_FAILURE => 3225026577

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_INVALID_SIZE => 3225026578

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_INVALID_FILE_SIZE => 3225026579

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VIRTDISK_PROVIDER_NOT_FOUND => 3225026580

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VIRTDISK_NOT_VIRTUAL_DISK => 3225026581

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_PARENT_VHD_ACCESS_DENIED => 3225026582

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_CHILD_PARENT_SIZE_MISMATCH => 3225026583

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_DIFFERENCING_CHAIN_CYCLE_DETECTED => 3225026584

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_DIFFERENCING_CHAIN_ERROR_IN_PARENT => 3225026585

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VIRTUAL_DISK_LIMITATION => 3225026586

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_INVALID_TYPE => 3225026587

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_INVALID_STATE => 3225026588

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VIRTDISK_UNSUPPORTED_DISK_SECTOR_SIZE => 3225026589

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VIRTDISK_DISK_ALREADY_OWNED => 3225026590

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VIRTDISK_DISK_ONLINE_AND_WRITABLE => 3225026591

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTLOG_TRACKING_NOT_INITIALIZED => 3225026592

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTLOG_LOGFILE_SIZE_EXCEEDED_MAXSIZE => 3225026593

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTLOG_VHD_CHANGED_OFFLINE => 3225026594

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTLOG_INVALID_TRACKING_STATE => 3225026595

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_CTLOG_INCONSISTENT_TRACKING_FILE => 3225026596

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_RESIZE_WOULD_TRUNCATE_DATA => 3225026597

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_COULD_NOT_COMPUTE_MINIMUM_VIRTUAL_SIZE => 3225026598

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_ALREADY_AT_OR_BELOW_MINIMUM_VIRTUAL_SIZE => 3225026599

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_METADATA_FULL => 3225026600

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_INVALID_CHANGE_TRACKING_ID => 3225026601

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_CHANGE_TRACKING_DISABLED => 3225026602

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_MISSING_CHANGE_TRACKING_INFORMATION => 3225026608

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_VHD_UNEXPECTED_ID => 3225026612

    /**
     * @type {Integer (UInt32)}
     */
    static ERROR_QUERY_STORAGE_ERROR => 2151284737
}
