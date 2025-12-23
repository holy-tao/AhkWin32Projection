#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class CONFIGRET extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CR_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CR_DEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CR_OUT_OF_MEMORY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_POINTER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_DEVNODE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_DEVINST => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_RES_DES => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_LOG_CONF => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_ARBITRATOR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_NODELIST => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CR_DEVNODE_HAS_REQS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CR_DEVINST_HAS_REQS => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_RESOURCEID => 11

    /**
     * @type {Integer (UInt32)}
     */
    static CR_DLVXD_NOT_FOUND => 12

    /**
     * @type {Integer (UInt32)}
     */
    static CR_NO_SUCH_DEVNODE => 13

    /**
     * @type {Integer (UInt32)}
     */
    static CR_NO_SUCH_DEVINST => 13

    /**
     * @type {Integer (UInt32)}
     */
    static CR_NO_MORE_LOG_CONF => 14

    /**
     * @type {Integer (UInt32)}
     */
    static CR_NO_MORE_RES_DES => 15

    /**
     * @type {Integer (UInt32)}
     */
    static CR_ALREADY_SUCH_DEVNODE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CR_ALREADY_SUCH_DEVINST => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_RANGE_LIST => 17

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_RANGE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static CR_FAILURE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static CR_NO_SUCH_LOGICAL_DEV => 20

    /**
     * @type {Integer (UInt32)}
     */
    static CR_CREATE_BLOCKED => 21

    /**
     * @type {Integer (UInt32)}
     */
    static CR_NOT_SYSTEM_VM => 22

    /**
     * @type {Integer (UInt32)}
     */
    static CR_REMOVE_VETOED => 23

    /**
     * @type {Integer (UInt32)}
     */
    static CR_APM_VETOED => 24

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_LOAD_TYPE => 25

    /**
     * @type {Integer (UInt32)}
     */
    static CR_BUFFER_SMALL => 26

    /**
     * @type {Integer (UInt32)}
     */
    static CR_NO_ARBITRATOR => 27

    /**
     * @type {Integer (UInt32)}
     */
    static CR_NO_REGISTRY_HANDLE => 28

    /**
     * @type {Integer (UInt32)}
     */
    static CR_REGISTRY_ERROR => 29

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_DEVICE_ID => 30

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_DATA => 31

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_API => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CR_DEVLOADER_NOT_READY => 33

    /**
     * @type {Integer (UInt32)}
     */
    static CR_NEED_RESTART => 34

    /**
     * @type {Integer (UInt32)}
     */
    static CR_NO_MORE_HW_PROFILES => 35

    /**
     * @type {Integer (UInt32)}
     */
    static CR_DEVICE_NOT_THERE => 36

    /**
     * @type {Integer (UInt32)}
     */
    static CR_NO_SUCH_VALUE => 37

    /**
     * @type {Integer (UInt32)}
     */
    static CR_WRONG_TYPE => 38

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_PRIORITY => 39

    /**
     * @type {Integer (UInt32)}
     */
    static CR_NOT_DISABLEABLE => 40

    /**
     * @type {Integer (UInt32)}
     */
    static CR_FREE_RESOURCES => 41

    /**
     * @type {Integer (UInt32)}
     */
    static CR_QUERY_VETOED => 42

    /**
     * @type {Integer (UInt32)}
     */
    static CR_CANT_SHARE_IRQ => 43

    /**
     * @type {Integer (UInt32)}
     */
    static CR_NO_DEPENDENT => 44

    /**
     * @type {Integer (UInt32)}
     */
    static CR_SAME_RESOURCES => 45

    /**
     * @type {Integer (UInt32)}
     */
    static CR_NO_SUCH_REGISTRY_KEY => 46

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_MACHINENAME => 47

    /**
     * @type {Integer (UInt32)}
     */
    static CR_REMOTE_COMM_FAILURE => 48

    /**
     * @type {Integer (UInt32)}
     */
    static CR_MACHINE_UNAVAILABLE => 49

    /**
     * @type {Integer (UInt32)}
     */
    static CR_NO_CM_SERVICES => 50

    /**
     * @type {Integer (UInt32)}
     */
    static CR_ACCESS_DENIED => 51

    /**
     * @type {Integer (UInt32)}
     */
    static CR_CALL_NOT_IMPLEMENTED => 52

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_PROPERTY => 53

    /**
     * @type {Integer (UInt32)}
     */
    static CR_DEVICE_INTERFACE_ACTIVE => 54

    /**
     * @type {Integer (UInt32)}
     */
    static CR_NO_SUCH_DEVICE_INTERFACE => 55

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_REFERENCE_STRING => 56

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_CONFLICT_LIST => 57

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_INDEX => 58

    /**
     * @type {Integer (UInt32)}
     */
    static CR_INVALID_STRUCTURE_SIZE => 59

    /**
     * @type {Integer (UInt32)}
     */
    static NUM_CR_RESULTS => 60
}
