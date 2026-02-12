#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the statuses for cryptogram generator methods.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardcryptogramgeneratoroperationstatus
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardCryptogramGeneratorOperationStatus extends Win32Enum{

    /**
     * Operation completed successfully.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The authorization failed.
     * @type {Integer (Int32)}
     */
    static AuthorizationFailed => 1

    /**
     * The authorization was canceled.
     * @type {Integer (Int32)}
     */
    static AuthorizationCanceled => 2

    /**
     * Authorization is required.
     * @type {Integer (Int32)}
     */
    static AuthorizationRequired => 3

    /**
     * The cryptogram material package storage key already exists.
     * @type {Integer (Int32)}
     */
    static CryptogramMaterialPackageStorageKeyExists => 4

    /**
     * There is no cryptogram material package storage key.
     * @type {Integer (Int32)}
     */
    static NoCryptogramMaterialPackageStorageKey => 5

    /**
     * There is no cryptogram material package.
     * @type {Integer (Int32)}
     */
    static NoCryptogramMaterialPackage => 6

    /**
     * The cryptogram material package is unsupported.
     * @type {Integer (Int32)}
     */
    static UnsupportedCryptogramMaterialPackage => 7

    /**
     * The specified material name was not found when opening the package.
     * @type {Integer (Int32)}
     */
    static UnknownCryptogramMaterialName => 8

    /**
     * Invalid cryptogram material usage.
     * @type {Integer (Int32)}
     */
    static InvalidCryptogramMaterialUsage => 9

    /**
     * The APDU response was not sent.
     * @type {Integer (Int32)}
     */
    static ApduResponseNotSent => 10

    /**
     * An unknown error occurred.
     * @type {Integer (Int32)}
     */
    static OtherError => 11

    /**
     * The validation failed.
     * @type {Integer (Int32)}
     */
    static ValidationFailed => 12

    /**
     * The operation is not supported.
     * @type {Integer (Int32)}
     */
    static NotSupported => 13
}
