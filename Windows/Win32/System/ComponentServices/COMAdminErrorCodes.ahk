#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ComponentServices
 */
class COMAdminErrorCodes extends Win32Enum {

    /**
     * Native name: COMAdminErrObjectErrors
     * @type {Integer (Int32)}
     */
    static ErrObjectErrors => -2146368511

    /**
     * Native name: COMAdminErrObjectInvalid
     * @type {Integer (Int32)}
     */
    static ErrObjectInvalid => -2146368510

    /**
     * Native name: COMAdminErrKeyMissing
     * @type {Integer (Int32)}
     */
    static ErrKeyMissing => -2146368509

    /**
     * Native name: COMAdminErrAlreadyInstalled
     * @type {Integer (Int32)}
     */
    static ErrAlreadyInstalled => -2146368508

    /**
     * Native name: COMAdminErrAppFileWriteFail
     * @type {Integer (Int32)}
     */
    static ErrAppFileWriteFail => -2146368505

    /**
     * Native name: COMAdminErrAppFileReadFail
     * @type {Integer (Int32)}
     */
    static ErrAppFileReadFail => -2146368504

    /**
     * Native name: COMAdminErrAppFileVersion
     * @type {Integer (Int32)}
     */
    static ErrAppFileVersion => -2146368503

    /**
     * Native name: COMAdminErrBadPath
     * @type {Integer (Int32)}
     */
    static ErrBadPath => -2146368502

    /**
     * Native name: COMAdminErrApplicationExists
     * @type {Integer (Int32)}
     */
    static ErrApplicationExists => -2146368501

    /**
     * Native name: COMAdminErrRoleExists
     * @type {Integer (Int32)}
     */
    static ErrRoleExists => -2146368500

    /**
     * Native name: COMAdminErrCantCopyFile
     * @type {Integer (Int32)}
     */
    static ErrCantCopyFile => -2146368499

    /**
     * Native name: COMAdminErrNoUser
     * @type {Integer (Int32)}
     */
    static ErrNoUser => -2146368497

    /**
     * Native name: COMAdminErrInvalidUserids
     * @type {Integer (Int32)}
     */
    static ErrInvalidUserids => -2146368496

    /**
     * Native name: COMAdminErrNoRegistryCLSID
     * @type {Integer (Int32)}
     */
    static ErrNoRegistryCLSID => -2146368495

    /**
     * Native name: COMAdminErrBadRegistryProgID
     * @type {Integer (Int32)}
     */
    static ErrBadRegistryProgID => -2146368494

    /**
     * Native name: COMAdminErrAuthenticationLevel
     * @type {Integer (Int32)}
     */
    static ErrAuthenticationLevel => -2146368493

    /**
     * Native name: COMAdminErrUserPasswdNotValid
     * @type {Integer (Int32)}
     */
    static ErrUserPasswdNotValid => -2146368492

    /**
     * Native name: COMAdminErrCLSIDOrIIDMismatch
     * @type {Integer (Int32)}
     */
    static ErrCLSIDOrIIDMismatch => -2146368488

    /**
     * Native name: COMAdminErrRemoteInterface
     * @type {Integer (Int32)}
     */
    static ErrRemoteInterface => -2146368487

    /**
     * Native name: COMAdminErrDllRegisterServer
     * @type {Integer (Int32)}
     */
    static ErrDllRegisterServer => -2146368486

    /**
     * Native name: COMAdminErrNoServerShare
     * @type {Integer (Int32)}
     */
    static ErrNoServerShare => -2146368485

    /**
     * Native name: COMAdminErrDllLoadFailed
     * @type {Integer (Int32)}
     */
    static ErrDllLoadFailed => -2146368483

    /**
     * Native name: COMAdminErrBadRegistryLibID
     * @type {Integer (Int32)}
     */
    static ErrBadRegistryLibID => -2146368482

    /**
     * Native name: COMAdminErrAppDirNotFound
     * @type {Integer (Int32)}
     */
    static ErrAppDirNotFound => -2146368481

    /**
     * Native name: COMAdminErrRegistrarFailed
     * @type {Integer (Int32)}
     */
    static ErrRegistrarFailed => -2146368477

    /**
     * Native name: COMAdminErrCompFileDoesNotExist
     * @type {Integer (Int32)}
     */
    static ErrCompFileDoesNotExist => -2146368476

    /**
     * Native name: COMAdminErrCompFileLoadDLLFail
     * @type {Integer (Int32)}
     */
    static ErrCompFileLoadDLLFail => -2146368475

    /**
     * Native name: COMAdminErrCompFileGetClassObj
     * @type {Integer (Int32)}
     */
    static ErrCompFileGetClassObj => -2146368474

    /**
     * Native name: COMAdminErrCompFileClassNotAvail
     * @type {Integer (Int32)}
     */
    static ErrCompFileClassNotAvail => -2146368473

    /**
     * Native name: COMAdminErrCompFileBadTLB
     * @type {Integer (Int32)}
     */
    static ErrCompFileBadTLB => -2146368472

    /**
     * Native name: COMAdminErrCompFileNotInstallable
     * @type {Integer (Int32)}
     */
    static ErrCompFileNotInstallable => -2146368471

    /**
     * Native name: COMAdminErrNotChangeable
     * @type {Integer (Int32)}
     */
    static ErrNotChangeable => -2146368470

    /**
     * Native name: COMAdminErrNotDeletable
     * @type {Integer (Int32)}
     */
    static ErrNotDeletable => -2146368469

    /**
     * Native name: COMAdminErrSession
     * @type {Integer (Int32)}
     */
    static ErrSession => -2146368468

    /**
     * Native name: COMAdminErrCompMoveLocked
     * @type {Integer (Int32)}
     */
    static ErrCompMoveLocked => -2146368467

    /**
     * Native name: COMAdminErrCompMoveBadDest
     * @type {Integer (Int32)}
     */
    static ErrCompMoveBadDest => -2146368466

    /**
     * Native name: COMAdminErrRegisterTLB
     * @type {Integer (Int32)}
     */
    static ErrRegisterTLB => -2146368464

    /**
     * Native name: COMAdminErrSystemApp
     * @type {Integer (Int32)}
     */
    static ErrSystemApp => -2146368461

    /**
     * Native name: COMAdminErrCompFileNoRegistrar
     * @type {Integer (Int32)}
     */
    static ErrCompFileNoRegistrar => -2146368460

    /**
     * Native name: COMAdminErrCoReqCompInstalled
     * @type {Integer (Int32)}
     */
    static ErrCoReqCompInstalled => -2146368459

    /**
     * Native name: COMAdminErrServiceNotInstalled
     * @type {Integer (Int32)}
     */
    static ErrServiceNotInstalled => -2146368458

    /**
     * Native name: COMAdminErrPropertySaveFailed
     * @type {Integer (Int32)}
     */
    static ErrPropertySaveFailed => -2146368457

    /**
     * Native name: COMAdminErrObjectExists
     * @type {Integer (Int32)}
     */
    static ErrObjectExists => -2146368456

    /**
     * Native name: COMAdminErrComponentExists
     * @type {Integer (Int32)}
     */
    static ErrComponentExists => -2146368455

    /**
     * Native name: COMAdminErrRegFileCorrupt
     * @type {Integer (Int32)}
     */
    static ErrRegFileCorrupt => -2146368453

    /**
     * Native name: COMAdminErrPropertyOverflow
     * @type {Integer (Int32)}
     */
    static ErrPropertyOverflow => -2146368452

    /**
     * Native name: COMAdminErrNotInRegistry
     * @type {Integer (Int32)}
     */
    static ErrNotInRegistry => -2146368450

    /**
     * Native name: COMAdminErrObjectNotPoolable
     * @type {Integer (Int32)}
     */
    static ErrObjectNotPoolable => -2146368449

    /**
     * Native name: COMAdminErrApplidMatchesClsid
     * @type {Integer (Int32)}
     */
    static ErrApplidMatchesClsid => -2146368442

    /**
     * Native name: COMAdminErrRoleDoesNotExist
     * @type {Integer (Int32)}
     */
    static ErrRoleDoesNotExist => -2146368441

    /**
     * Native name: COMAdminErrStartAppNeedsComponents
     * @type {Integer (Int32)}
     */
    static ErrStartAppNeedsComponents => -2146368440

    /**
     * Native name: COMAdminErrRequiresDifferentPlatform
     * @type {Integer (Int32)}
     */
    static ErrRequiresDifferentPlatform => -2146368439

    /**
     * Native name: COMAdminErrQueuingServiceNotAvailable
     * @type {Integer (Int32)}
     */
    static ErrQueuingServiceNotAvailable => -2146367998

    /**
     * Native name: COMAdminErrObjectParentMissing
     * @type {Integer (Int32)}
     */
    static ErrObjectParentMissing => -2146367480

    /**
     * Native name: COMAdminErrObjectDoesNotExist
     * @type {Integer (Int32)}
     */
    static ErrObjectDoesNotExist => -2146367479

    /**
     * Native name: COMAdminErrCanNotExportAppProxy
     * @type {Integer (Int32)}
     */
    static ErrCanNotExportAppProxy => -2146368438

    /**
     * Native name: COMAdminErrCanNotStartApp
     * @type {Integer (Int32)}
     */
    static ErrCanNotStartApp => -2146368437

    /**
     * Native name: COMAdminErrCanNotExportSystemApp
     * @type {Integer (Int32)}
     */
    static ErrCanNotExportSystemApp => -2146368436

    /**
     * Native name: COMAdminErrCanNotSubscribeToComponent
     * @type {Integer (Int32)}
     */
    static ErrCanNotSubscribeToComponent => -2146368435

    /**
     * Native name: COMAdminErrAppNotRunning
     * @type {Integer (Int32)}
     */
    static ErrAppNotRunning => -2146367478

    /**
     * Native name: COMAdminErrEventClassCannotBeSubscriber
     * @type {Integer (Int32)}
     */
    static ErrEventClassCannotBeSubscriber => -2146368434

    /**
     * Native name: COMAdminErrLibAppProxyIncompatible
     * @type {Integer (Int32)}
     */
    static ErrLibAppProxyIncompatible => -2146368433

    /**
     * Native name: COMAdminErrBasePartitionOnly
     * @type {Integer (Int32)}
     */
    static ErrBasePartitionOnly => -2146368432

    /**
     * Native name: COMAdminErrDuplicatePartitionName
     * @type {Integer (Int32)}
     */
    static ErrDuplicatePartitionName => -2146368425

    /**
     * Native name: COMAdminErrPartitionInUse
     * @type {Integer (Int32)}
     */
    static ErrPartitionInUse => -2146368423

    /**
     * Native name: COMAdminErrImportedComponentsNotAllowed
     * @type {Integer (Int32)}
     */
    static ErrImportedComponentsNotAllowed => -2146368421

    /**
     * Native name: COMAdminErrRegdbNotInitialized
     * @type {Integer (Int32)}
     */
    static ErrRegdbNotInitialized => -2146368398

    /**
     * Native name: COMAdminErrRegdbNotOpen
     * @type {Integer (Int32)}
     */
    static ErrRegdbNotOpen => -2146368397

    /**
     * Native name: COMAdminErrRegdbSystemErr
     * @type {Integer (Int32)}
     */
    static ErrRegdbSystemErr => -2146368396

    /**
     * Native name: COMAdminErrRegdbAlreadyRunning
     * @type {Integer (Int32)}
     */
    static ErrRegdbAlreadyRunning => -2146368395

    /**
     * Native name: COMAdminErrMigVersionNotSupported
     * @type {Integer (Int32)}
     */
    static ErrMigVersionNotSupported => -2146368384

    /**
     * Native name: COMAdminErrMigSchemaNotFound
     * @type {Integer (Int32)}
     */
    static ErrMigSchemaNotFound => -2146368383

    /**
     * Native name: COMAdminErrCatBitnessMismatch
     * @type {Integer (Int32)}
     */
    static ErrCatBitnessMismatch => -2146368382

    /**
     * Native name: COMAdminErrCatUnacceptableBitness
     * @type {Integer (Int32)}
     */
    static ErrCatUnacceptableBitness => -2146368381

    /**
     * Native name: COMAdminErrCatWrongAppBitnessBitness
     * @type {Integer (Int32)}
     */
    static ErrCatWrongAppBitnessBitness => -2146368380

    /**
     * Native name: COMAdminErrCatPauseResumeNotSupported
     * @type {Integer (Int32)}
     */
    static ErrCatPauseResumeNotSupported => -2146368379

    /**
     * Native name: COMAdminErrCatServerFault
     * @type {Integer (Int32)}
     */
    static ErrCatServerFault => -2146368378

    /**
     * Native name: COMAdminErrCantRecycleLibraryApps
     * @type {Integer (Int32)}
     */
    static ErrCantRecycleLibraryApps => -2146367473

    /**
     * Native name: COMAdminErrCantRecycleServiceApps
     * @type {Integer (Int32)}
     */
    static ErrCantRecycleServiceApps => -2146367471

    /**
     * Native name: COMAdminErrProcessAlreadyRecycled
     * @type {Integer (Int32)}
     */
    static ErrProcessAlreadyRecycled => -2146367470

    /**
     * Native name: COMAdminErrPausedProcessMayNotBeRecycled
     * @type {Integer (Int32)}
     */
    static ErrPausedProcessMayNotBeRecycled => -2146367469

    /**
     * Native name: COMAdminErrInvalidPartition
     * @type {Integer (Int32)}
     */
    static ErrInvalidPartition => -2146367477

    /**
     * Native name: COMAdminErrPartitionMsiOnly
     * @type {Integer (Int32)}
     */
    static ErrPartitionMsiOnly => -2146367463

    /**
     * Native name: COMAdminErrStartAppDisabled
     * @type {Integer (Int32)}
     */
    static ErrStartAppDisabled => -2146368431

    /**
     * Native name: COMAdminErrCompMoveSource
     * @type {Integer (Int32)}
     */
    static ErrCompMoveSource => -2146367460

    /**
     * Native name: COMAdminErrCompMoveDest
     * @type {Integer (Int32)}
     */
    static ErrCompMoveDest => -2146367459

    /**
     * Native name: COMAdminErrCompMovePrivate
     * @type {Integer (Int32)}
     */
    static ErrCompMovePrivate => -2146367458

    /**
     * Native name: COMAdminErrCannotCopyEventClass
     * @type {Integer (Int32)}
     */
    static ErrCannotCopyEventClass => -2146367456
}
