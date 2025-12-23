#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.TransactionServer
 * @version v4.0.30319
 */
class MTSAdminErrorCodes extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrObjectErrors => -2146368511

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrObjectInvalid => -2146368510

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrKeyMissing => -2146368509

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrAlreadyInstalled => -2146368508

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrDownloadFailed => -2146368507

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrPDFWriteFail => -2146368505

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrPDFReadFail => -2146368504

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrPDFVersion => -2146368503

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrCoReqCompInstalled => -2146368496

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrBadPath => -2146368502

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrPackageExists => -2146368501

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrRoleExists => -2146368500

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrCantCopyFile => -2146368499

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrNoTypeLib => -2146368498

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrNoUser => -2146368497

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrInvalidUserids => -2146368496

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrNoRegistryCLSID => -2146368495

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrBadRegistryProgID => -2146368494

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrAuthenticationLevel => -2146368493

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrUserPasswdNotValid => -2146368492

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrNoRegistryRead => -2146368491

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrNoRegistryWrite => -2146368490

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrNoRegistryRepair => -2146368489

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrCLSIDOrIIDMismatch => -2146368488

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrRemoteInterface => -2146368487

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrDllRegisterServer => -2146368486

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrNoServerShare => -2146368485

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrNoAccessToUNC => -2146368484

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrDllLoadFailed => -2146368483

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrBadRegistryLibID => -2146368482

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrPackDirNotFound => -2146368481

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrTreatAs => -2146368480

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrBadForward => -2146368479

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrBadIID => -2146368478

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrRegistrarFailed => -2146368477

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrCompFileDoesNotExist => -2146368476

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrCompFileLoadDLLFail => -2146368475

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrCompFileGetClassObj => -2146368474

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrCompFileClassNotAvail => -2146368473

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrCompFileBadTLB => -2146368472

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrCompFileNotInstallable => -2146368471

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrNotChangeable => -2146368470

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrNotDeletable => -2146368469

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrSession => -2146368468

    /**
     * @type {Integer (Int32)}
     */
    static mtsErrCompFileNoRegistrar => -2146368460
}
