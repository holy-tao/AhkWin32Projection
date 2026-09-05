#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class REG_NOTIFY_CLASS extends Win32Enum {

    /**
     * Native name: RegNtDeleteKey
     * @type {Integer (Int32)}
     */
    static NtDeleteKey => 0

    /**
     * Native name: RegNtPreDeleteKey
     * @type {Integer (Int32)}
     */
    static NtPreDeleteKey => 0

    /**
     * Native name: RegNtSetValueKey
     * @type {Integer (Int32)}
     */
    static NtSetValueKey => 1

    /**
     * Native name: RegNtPreSetValueKey
     * @type {Integer (Int32)}
     */
    static NtPreSetValueKey => 1

    /**
     * Native name: RegNtDeleteValueKey
     * @type {Integer (Int32)}
     */
    static NtDeleteValueKey => 2

    /**
     * Native name: RegNtPreDeleteValueKey
     * @type {Integer (Int32)}
     */
    static NtPreDeleteValueKey => 2

    /**
     * Native name: RegNtSetInformationKey
     * @type {Integer (Int32)}
     */
    static NtSetInformationKey => 3

    /**
     * Native name: RegNtPreSetInformationKey
     * @type {Integer (Int32)}
     */
    static NtPreSetInformationKey => 3

    /**
     * Native name: RegNtRenameKey
     * @type {Integer (Int32)}
     */
    static NtRenameKey => 4

    /**
     * Native name: RegNtPreRenameKey
     * @type {Integer (Int32)}
     */
    static NtPreRenameKey => 4

    /**
     * Native name: RegNtEnumerateKey
     * @type {Integer (Int32)}
     */
    static NtEnumerateKey => 5

    /**
     * Native name: RegNtPreEnumerateKey
     * @type {Integer (Int32)}
     */
    static NtPreEnumerateKey => 5

    /**
     * Native name: RegNtEnumerateValueKey
     * @type {Integer (Int32)}
     */
    static NtEnumerateValueKey => 6

    /**
     * Native name: RegNtPreEnumerateValueKey
     * @type {Integer (Int32)}
     */
    static NtPreEnumerateValueKey => 6

    /**
     * Native name: RegNtQueryKey
     * @type {Integer (Int32)}
     */
    static NtQueryKey => 7

    /**
     * Native name: RegNtPreQueryKey
     * @type {Integer (Int32)}
     */
    static NtPreQueryKey => 7

    /**
     * Native name: RegNtQueryValueKey
     * @type {Integer (Int32)}
     */
    static NtQueryValueKey => 8

    /**
     * Native name: RegNtPreQueryValueKey
     * @type {Integer (Int32)}
     */
    static NtPreQueryValueKey => 8

    /**
     * Native name: RegNtQueryMultipleValueKey
     * @type {Integer (Int32)}
     */
    static NtQueryMultipleValueKey => 9

    /**
     * Native name: RegNtPreQueryMultipleValueKey
     * @type {Integer (Int32)}
     */
    static NtPreQueryMultipleValueKey => 9

    /**
     * Native name: RegNtPreCreateKey
     * @type {Integer (Int32)}
     */
    static NtPreCreateKey => 10

    /**
     * Native name: RegNtPostCreateKey
     * @type {Integer (Int32)}
     */
    static NtPostCreateKey => 11

    /**
     * Native name: RegNtPreOpenKey
     * @type {Integer (Int32)}
     */
    static NtPreOpenKey => 12

    /**
     * Native name: RegNtPostOpenKey
     * @type {Integer (Int32)}
     */
    static NtPostOpenKey => 13

    /**
     * Native name: RegNtKeyHandleClose
     * @type {Integer (Int32)}
     */
    static NtKeyHandleClose => 14

    /**
     * Native name: RegNtPreKeyHandleClose
     * @type {Integer (Int32)}
     */
    static NtPreKeyHandleClose => 14

    /**
     * Native name: RegNtPostDeleteKey
     * @type {Integer (Int32)}
     */
    static NtPostDeleteKey => 15

    /**
     * Native name: RegNtPostSetValueKey
     * @type {Integer (Int32)}
     */
    static NtPostSetValueKey => 16

    /**
     * Native name: RegNtPostDeleteValueKey
     * @type {Integer (Int32)}
     */
    static NtPostDeleteValueKey => 17

    /**
     * Native name: RegNtPostSetInformationKey
     * @type {Integer (Int32)}
     */
    static NtPostSetInformationKey => 18

    /**
     * Native name: RegNtPostRenameKey
     * @type {Integer (Int32)}
     */
    static NtPostRenameKey => 19

    /**
     * Native name: RegNtPostEnumerateKey
     * @type {Integer (Int32)}
     */
    static NtPostEnumerateKey => 20

    /**
     * Native name: RegNtPostEnumerateValueKey
     * @type {Integer (Int32)}
     */
    static NtPostEnumerateValueKey => 21

    /**
     * Native name: RegNtPostQueryKey
     * @type {Integer (Int32)}
     */
    static NtPostQueryKey => 22

    /**
     * Native name: RegNtPostQueryValueKey
     * @type {Integer (Int32)}
     */
    static NtPostQueryValueKey => 23

    /**
     * Native name: RegNtPostQueryMultipleValueKey
     * @type {Integer (Int32)}
     */
    static NtPostQueryMultipleValueKey => 24

    /**
     * Native name: RegNtPostKeyHandleClose
     * @type {Integer (Int32)}
     */
    static NtPostKeyHandleClose => 25

    /**
     * Native name: RegNtPreCreateKeyEx
     * @type {Integer (Int32)}
     */
    static NtPreCreateKeyEx => 26

    /**
     * Native name: RegNtPostCreateKeyEx
     * @type {Integer (Int32)}
     */
    static NtPostCreateKeyEx => 27

    /**
     * Native name: RegNtPreOpenKeyEx
     * @type {Integer (Int32)}
     */
    static NtPreOpenKeyEx => 28

    /**
     * Native name: RegNtPostOpenKeyEx
     * @type {Integer (Int32)}
     */
    static NtPostOpenKeyEx => 29

    /**
     * Native name: RegNtPreFlushKey
     * @type {Integer (Int32)}
     */
    static NtPreFlushKey => 30

    /**
     * Native name: RegNtPostFlushKey
     * @type {Integer (Int32)}
     */
    static NtPostFlushKey => 31

    /**
     * Native name: RegNtPreLoadKey
     * @type {Integer (Int32)}
     */
    static NtPreLoadKey => 32

    /**
     * Native name: RegNtPostLoadKey
     * @type {Integer (Int32)}
     */
    static NtPostLoadKey => 33

    /**
     * Native name: RegNtPreUnLoadKey
     * @type {Integer (Int32)}
     */
    static NtPreUnLoadKey => 34

    /**
     * Native name: RegNtPostUnLoadKey
     * @type {Integer (Int32)}
     */
    static NtPostUnLoadKey => 35

    /**
     * Native name: RegNtPreQueryKeySecurity
     * @type {Integer (Int32)}
     */
    static NtPreQueryKeySecurity => 36

    /**
     * Native name: RegNtPostQueryKeySecurity
     * @type {Integer (Int32)}
     */
    static NtPostQueryKeySecurity => 37

    /**
     * Native name: RegNtPreSetKeySecurity
     * @type {Integer (Int32)}
     */
    static NtPreSetKeySecurity => 38

    /**
     * Native name: RegNtPostSetKeySecurity
     * @type {Integer (Int32)}
     */
    static NtPostSetKeySecurity => 39

    /**
     * Native name: RegNtCallbackObjectContextCleanup
     * @type {Integer (Int32)}
     */
    static NtCallbackObjectContextCleanup => 40

    /**
     * Native name: RegNtPreRestoreKey
     * @type {Integer (Int32)}
     */
    static NtPreRestoreKey => 41

    /**
     * Native name: RegNtPostRestoreKey
     * @type {Integer (Int32)}
     */
    static NtPostRestoreKey => 42

    /**
     * Native name: RegNtPreSaveKey
     * @type {Integer (Int32)}
     */
    static NtPreSaveKey => 43

    /**
     * Native name: RegNtPostSaveKey
     * @type {Integer (Int32)}
     */
    static NtPostSaveKey => 44

    /**
     * Native name: RegNtPreReplaceKey
     * @type {Integer (Int32)}
     */
    static NtPreReplaceKey => 45

    /**
     * Native name: RegNtPostReplaceKey
     * @type {Integer (Int32)}
     */
    static NtPostReplaceKey => 46

    /**
     * Native name: RegNtPreQueryKeyName
     * @type {Integer (Int32)}
     */
    static NtPreQueryKeyName => 47

    /**
     * Native name: RegNtPostQueryKeyName
     * @type {Integer (Int32)}
     */
    static NtPostQueryKeyName => 48

    /**
     * Native name: RegNtPreSaveMergedKey
     * @type {Integer (Int32)}
     */
    static NtPreSaveMergedKey => 49

    /**
     * Native name: RegNtPostSaveMergedKey
     * @type {Integer (Int32)}
     */
    static NtPostSaveMergedKey => 50

    /**
     * @type {Integer (Int32)}
     */
    static MaxRegNtNotifyClass => 51
}
