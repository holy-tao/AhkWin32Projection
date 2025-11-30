#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class COMAdminErrorCodes extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrObjectErrors => -2146368511

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrObjectInvalid => -2146368510

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrKeyMissing => -2146368509

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrAlreadyInstalled => -2146368508

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrAppFileWriteFail => -2146368505

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrAppFileReadFail => -2146368504

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrAppFileVersion => -2146368503

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrBadPath => -2146368502

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrApplicationExists => -2146368501

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrRoleExists => -2146368500

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCantCopyFile => -2146368499

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrNoUser => -2146368497

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrInvalidUserids => -2146368496

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrNoRegistryCLSID => -2146368495

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrBadRegistryProgID => -2146368494

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrAuthenticationLevel => -2146368493

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrUserPasswdNotValid => -2146368492

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCLSIDOrIIDMismatch => -2146368488

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrRemoteInterface => -2146368487

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrDllRegisterServer => -2146368486

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrNoServerShare => -2146368485

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrDllLoadFailed => -2146368483

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrBadRegistryLibID => -2146368482

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrAppDirNotFound => -2146368481

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrRegistrarFailed => -2146368477

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCompFileDoesNotExist => -2146368476

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCompFileLoadDLLFail => -2146368475

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCompFileGetClassObj => -2146368474

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCompFileClassNotAvail => -2146368473

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCompFileBadTLB => -2146368472

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCompFileNotInstallable => -2146368471

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrNotChangeable => -2146368470

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrNotDeletable => -2146368469

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrSession => -2146368468

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCompMoveLocked => -2146368467

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCompMoveBadDest => -2146368466

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrRegisterTLB => -2146368464

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrSystemApp => -2146368461

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCompFileNoRegistrar => -2146368460

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCoReqCompInstalled => -2146368459

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrServiceNotInstalled => -2146368458

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrPropertySaveFailed => -2146368457

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrObjectExists => -2146368456

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrComponentExists => -2146368455

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrRegFileCorrupt => -2146368453

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrPropertyOverflow => -2146368452

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrNotInRegistry => -2146368450

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrObjectNotPoolable => -2146368449

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrApplidMatchesClsid => -2146368442

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrRoleDoesNotExist => -2146368441

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrStartAppNeedsComponents => -2146368440

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrRequiresDifferentPlatform => -2146368439

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrQueuingServiceNotAvailable => -2146367998

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrObjectParentMissing => -2146367480

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrObjectDoesNotExist => -2146367479

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCanNotExportAppProxy => -2146368438

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCanNotStartApp => -2146368437

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCanNotExportSystemApp => -2146368436

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCanNotSubscribeToComponent => -2146368435

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrAppNotRunning => -2146367478

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrEventClassCannotBeSubscriber => -2146368434

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrLibAppProxyIncompatible => -2146368433

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrBasePartitionOnly => -2146368432

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrDuplicatePartitionName => -2146368425

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrPartitionInUse => -2146368423

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrImportedComponentsNotAllowed => -2146368421

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrRegdbNotInitialized => -2146368398

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrRegdbNotOpen => -2146368397

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrRegdbSystemErr => -2146368396

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrRegdbAlreadyRunning => -2146368395

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrMigVersionNotSupported => -2146368384

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrMigSchemaNotFound => -2146368383

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCatBitnessMismatch => -2146368382

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCatUnacceptableBitness => -2146368381

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCatWrongAppBitnessBitness => -2146368380

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCatPauseResumeNotSupported => -2146368379

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCatServerFault => -2146368378

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCantRecycleLibraryApps => -2146367473

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCantRecycleServiceApps => -2146367471

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrProcessAlreadyRecycled => -2146367470

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrPausedProcessMayNotBeRecycled => -2146367469

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrInvalidPartition => -2146367477

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrPartitionMsiOnly => -2146367463

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrStartAppDisabled => -2146368431

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCompMoveSource => -2146367460

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCompMoveDest => -2146367459

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCompMovePrivate => -2146367458

    /**
     * @type {Integer (Int32)}
     */
    static COMAdminErrCannotCopyEventClass => -2146367456
}
