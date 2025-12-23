#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 * @version v4.0.30319
 */
class msidbCustomActionType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeDll => 1

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeExe => 2

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeTextData => 3

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeJScript => 5

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeVBScript => 6

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeInstall => 7

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeBinaryData => 0

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeSourceFile => 16

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeDirectory => 32

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeProperty => 48

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeContinue => 64

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeAsync => 128

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeFirstSequence => 256

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeOncePerProcess => 512

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeClientRepeat => 768

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeInScript => 1024

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeRollback => 256

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeCommit => 512

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeNoImpersonate => 2048

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeTSAware => 16384

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionType64BitScript => 4096

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypeHideTarget => 8192

    /**
     * @type {Integer (Int32)}
     */
    static msidbCustomActionTypePatchUninstall => 32768
}
