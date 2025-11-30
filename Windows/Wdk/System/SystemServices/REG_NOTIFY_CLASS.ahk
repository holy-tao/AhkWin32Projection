#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class REG_NOTIFY_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static RegNtDeleteKey => 0

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreDeleteKey => 0

    /**
     * @type {Integer (Int32)}
     */
    static RegNtSetValueKey => 1

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreSetValueKey => 1

    /**
     * @type {Integer (Int32)}
     */
    static RegNtDeleteValueKey => 2

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreDeleteValueKey => 2

    /**
     * @type {Integer (Int32)}
     */
    static RegNtSetInformationKey => 3

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreSetInformationKey => 3

    /**
     * @type {Integer (Int32)}
     */
    static RegNtRenameKey => 4

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreRenameKey => 4

    /**
     * @type {Integer (Int32)}
     */
    static RegNtEnumerateKey => 5

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreEnumerateKey => 5

    /**
     * @type {Integer (Int32)}
     */
    static RegNtEnumerateValueKey => 6

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreEnumerateValueKey => 6

    /**
     * @type {Integer (Int32)}
     */
    static RegNtQueryKey => 7

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreQueryKey => 7

    /**
     * @type {Integer (Int32)}
     */
    static RegNtQueryValueKey => 8

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreQueryValueKey => 8

    /**
     * @type {Integer (Int32)}
     */
    static RegNtQueryMultipleValueKey => 9

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreQueryMultipleValueKey => 9

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreCreateKey => 10

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostCreateKey => 11

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreOpenKey => 12

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostOpenKey => 13

    /**
     * @type {Integer (Int32)}
     */
    static RegNtKeyHandleClose => 14

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreKeyHandleClose => 14

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostDeleteKey => 15

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostSetValueKey => 16

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostDeleteValueKey => 17

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostSetInformationKey => 18

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostRenameKey => 19

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostEnumerateKey => 20

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostEnumerateValueKey => 21

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostQueryKey => 22

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostQueryValueKey => 23

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostQueryMultipleValueKey => 24

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostKeyHandleClose => 25

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreCreateKeyEx => 26

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostCreateKeyEx => 27

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreOpenKeyEx => 28

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostOpenKeyEx => 29

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreFlushKey => 30

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostFlushKey => 31

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreLoadKey => 32

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostLoadKey => 33

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreUnLoadKey => 34

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostUnLoadKey => 35

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreQueryKeySecurity => 36

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostQueryKeySecurity => 37

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreSetKeySecurity => 38

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostSetKeySecurity => 39

    /**
     * @type {Integer (Int32)}
     */
    static RegNtCallbackObjectContextCleanup => 40

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreRestoreKey => 41

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostRestoreKey => 42

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreSaveKey => 43

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostSaveKey => 44

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreReplaceKey => 45

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostReplaceKey => 46

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreQueryKeyName => 47

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostQueryKeyName => 48

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPreSaveMergedKey => 49

    /**
     * @type {Integer (Int32)}
     */
    static RegNtPostSaveMergedKey => 50

    /**
     * @type {Integer (Int32)}
     */
    static MaxRegNtNotifyClass => 51
}
