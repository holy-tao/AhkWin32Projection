#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class msidbCustomActionType extends Win32Enum {

    /**
     * Native name: msidbCustomActionTypeDll
     * @type {Integer (Int32)}
     */
    static Dll => 1

    /**
     * Native name: msidbCustomActionTypeExe
     * @type {Integer (Int32)}
     */
    static Exe => 2

    /**
     * Native name: msidbCustomActionTypeTextData
     * @type {Integer (Int32)}
     */
    static TextData => 3

    /**
     * Native name: msidbCustomActionTypeJScript
     * @type {Integer (Int32)}
     */
    static TypeJScript => 5

    /**
     * Native name: msidbCustomActionTypeVBScript
     * @type {Integer (Int32)}
     */
    static TypeVBScript => 6

    /**
     * Native name: msidbCustomActionTypeInstall
     * @type {Integer (Int32)}
     */
    static Install => 7

    /**
     * Native name: msidbCustomActionTypeBinaryData
     * @type {Integer (Int32)}
     */
    static BinaryData => 0

    /**
     * Native name: msidbCustomActionTypeSourceFile
     * @type {Integer (Int32)}
     */
    static SourceFile => 16

    /**
     * Native name: msidbCustomActionTypeDirectory
     * @type {Integer (Int32)}
     */
    static Directory => 32

    /**
     * Native name: msidbCustomActionTypeProperty
     * @type {Integer (Int32)}
     */
    static Property => 48

    /**
     * Native name: msidbCustomActionTypeContinue
     * @type {Integer (Int32)}
     */
    static Continue => 64

    /**
     * Native name: msidbCustomActionTypeAsync
     * @type {Integer (Int32)}
     */
    static Async => 128

    /**
     * Native name: msidbCustomActionTypeFirstSequence
     * @type {Integer (Int32)}
     */
    static FirstSequence => 256

    /**
     * Native name: msidbCustomActionTypeOncePerProcess
     * @type {Integer (Int32)}
     */
    static OncePerProcess => 512

    /**
     * Native name: msidbCustomActionTypeClientRepeat
     * @type {Integer (Int32)}
     */
    static ClientRepeat => 768

    /**
     * Native name: msidbCustomActionTypeInScript
     * @type {Integer (Int32)}
     */
    static InScript => 1024

    /**
     * Native name: msidbCustomActionTypeRollback
     * @type {Integer (Int32)}
     */
    static Rollback => 256

    /**
     * Native name: msidbCustomActionTypeCommit
     * @type {Integer (Int32)}
     */
    static Commit => 512

    /**
     * Native name: msidbCustomActionTypeNoImpersonate
     * @type {Integer (Int32)}
     */
    static NoImpersonate => 2048

    /**
     * Native name: msidbCustomActionTypeTSAware
     * @type {Integer (Int32)}
     */
    static TypeTSAware => 16384

    /**
     * Native name: msidbCustomActionType64BitScript
     * @type {Integer (Int32)}
     */
    static Type64BitScript => 4096

    /**
     * Native name: msidbCustomActionTypeHideTarget
     * @type {Integer (Int32)}
     */
    static HideTarget => 8192

    /**
     * Native name: msidbCustomActionTypePatchUninstall
     * @type {Integer (Int32)}
     */
    static PatchUninstall => 32768
}
