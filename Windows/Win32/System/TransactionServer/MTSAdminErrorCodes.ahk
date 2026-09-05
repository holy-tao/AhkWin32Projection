#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.TransactionServer
 */
class MTSAdminErrorCodes extends Win32Enum {

    /**
     * Native name: mtsErrObjectErrors
     * @type {Integer (Int32)}
     */
    static ErrObjectErrors => -2146368511

    /**
     * Native name: mtsErrObjectInvalid
     * @type {Integer (Int32)}
     */
    static ErrObjectInvalid => -2146368510

    /**
     * Native name: mtsErrKeyMissing
     * @type {Integer (Int32)}
     */
    static ErrKeyMissing => -2146368509

    /**
     * Native name: mtsErrAlreadyInstalled
     * @type {Integer (Int32)}
     */
    static ErrAlreadyInstalled => -2146368508

    /**
     * Native name: mtsErrDownloadFailed
     * @type {Integer (Int32)}
     */
    static ErrDownloadFailed => -2146368507

    /**
     * Native name: mtsErrPDFWriteFail
     * @type {Integer (Int32)}
     */
    static ErrPDFWriteFail => -2146368505

    /**
     * Native name: mtsErrPDFReadFail
     * @type {Integer (Int32)}
     */
    static ErrPDFReadFail => -2146368504

    /**
     * Native name: mtsErrPDFVersion
     * @type {Integer (Int32)}
     */
    static ErrPDFVersion => -2146368503

    /**
     * Native name: mtsErrCoReqCompInstalled
     * @type {Integer (Int32)}
     */
    static ErrCoReqCompInstalled => -2146368496

    /**
     * Native name: mtsErrBadPath
     * @type {Integer (Int32)}
     */
    static ErrBadPath => -2146368502

    /**
     * Native name: mtsErrPackageExists
     * @type {Integer (Int32)}
     */
    static ErrPackageExists => -2146368501

    /**
     * Native name: mtsErrRoleExists
     * @type {Integer (Int32)}
     */
    static ErrRoleExists => -2146368500

    /**
     * Native name: mtsErrCantCopyFile
     * @type {Integer (Int32)}
     */
    static ErrCantCopyFile => -2146368499

    /**
     * Native name: mtsErrNoTypeLib
     * @type {Integer (Int32)}
     */
    static ErrNoTypeLib => -2146368498

    /**
     * Native name: mtsErrNoUser
     * @type {Integer (Int32)}
     */
    static ErrNoUser => -2146368497

    /**
     * Native name: mtsErrInvalidUserids
     * @type {Integer (Int32)}
     */
    static ErrInvalidUserids => -2146368496

    /**
     * Native name: mtsErrNoRegistryCLSID
     * @type {Integer (Int32)}
     */
    static ErrNoRegistryCLSID => -2146368495

    /**
     * Native name: mtsErrBadRegistryProgID
     * @type {Integer (Int32)}
     */
    static ErrBadRegistryProgID => -2146368494

    /**
     * Native name: mtsErrAuthenticationLevel
     * @type {Integer (Int32)}
     */
    static ErrAuthenticationLevel => -2146368493

    /**
     * Native name: mtsErrUserPasswdNotValid
     * @type {Integer (Int32)}
     */
    static ErrUserPasswdNotValid => -2146368492

    /**
     * Native name: mtsErrNoRegistryRead
     * @type {Integer (Int32)}
     */
    static ErrNoRegistryRead => -2146368491

    /**
     * Native name: mtsErrNoRegistryWrite
     * @type {Integer (Int32)}
     */
    static ErrNoRegistryWrite => -2146368490

    /**
     * Native name: mtsErrNoRegistryRepair
     * @type {Integer (Int32)}
     */
    static ErrNoRegistryRepair => -2146368489

    /**
     * Native name: mtsErrCLSIDOrIIDMismatch
     * @type {Integer (Int32)}
     */
    static ErrCLSIDOrIIDMismatch => -2146368488

    /**
     * Native name: mtsErrRemoteInterface
     * @type {Integer (Int32)}
     */
    static ErrRemoteInterface => -2146368487

    /**
     * Native name: mtsErrDllRegisterServer
     * @type {Integer (Int32)}
     */
    static ErrDllRegisterServer => -2146368486

    /**
     * Native name: mtsErrNoServerShare
     * @type {Integer (Int32)}
     */
    static ErrNoServerShare => -2146368485

    /**
     * Native name: mtsErrNoAccessToUNC
     * @type {Integer (Int32)}
     */
    static ErrNoAccessToUNC => -2146368484

    /**
     * Native name: mtsErrDllLoadFailed
     * @type {Integer (Int32)}
     */
    static ErrDllLoadFailed => -2146368483

    /**
     * Native name: mtsErrBadRegistryLibID
     * @type {Integer (Int32)}
     */
    static ErrBadRegistryLibID => -2146368482

    /**
     * Native name: mtsErrPackDirNotFound
     * @type {Integer (Int32)}
     */
    static ErrPackDirNotFound => -2146368481

    /**
     * Native name: mtsErrTreatAs
     * @type {Integer (Int32)}
     */
    static ErrTreatAs => -2146368480

    /**
     * Native name: mtsErrBadForward
     * @type {Integer (Int32)}
     */
    static ErrBadForward => -2146368479

    /**
     * Native name: mtsErrBadIID
     * @type {Integer (Int32)}
     */
    static ErrBadIID => -2146368478

    /**
     * Native name: mtsErrRegistrarFailed
     * @type {Integer (Int32)}
     */
    static ErrRegistrarFailed => -2146368477

    /**
     * Native name: mtsErrCompFileDoesNotExist
     * @type {Integer (Int32)}
     */
    static ErrCompFileDoesNotExist => -2146368476

    /**
     * Native name: mtsErrCompFileLoadDLLFail
     * @type {Integer (Int32)}
     */
    static ErrCompFileLoadDLLFail => -2146368475

    /**
     * Native name: mtsErrCompFileGetClassObj
     * @type {Integer (Int32)}
     */
    static ErrCompFileGetClassObj => -2146368474

    /**
     * Native name: mtsErrCompFileClassNotAvail
     * @type {Integer (Int32)}
     */
    static ErrCompFileClassNotAvail => -2146368473

    /**
     * Native name: mtsErrCompFileBadTLB
     * @type {Integer (Int32)}
     */
    static ErrCompFileBadTLB => -2146368472

    /**
     * Native name: mtsErrCompFileNotInstallable
     * @type {Integer (Int32)}
     */
    static ErrCompFileNotInstallable => -2146368471

    /**
     * Native name: mtsErrNotChangeable
     * @type {Integer (Int32)}
     */
    static ErrNotChangeable => -2146368470

    /**
     * Native name: mtsErrNotDeletable
     * @type {Integer (Int32)}
     */
    static ErrNotDeletable => -2146368469

    /**
     * Native name: mtsErrSession
     * @type {Integer (Int32)}
     */
    static ErrSession => -2146368468

    /**
     * Native name: mtsErrCompFileNoRegistrar
     * @type {Integer (Int32)}
     */
    static ErrCompFileNoRegistrar => -2146368460
}
