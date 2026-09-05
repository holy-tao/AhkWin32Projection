#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Define the errors that may be returned by Scripting API for WMI calls.
 * @see https://learn.microsoft.com/windows/win32/api/wbemdisp/ne-wbemdisp-wbemerrorenum
 * @namespace Windows.Win32.System.Wmi
 */
class WbemErrorEnum extends Win32Enum {

    /**
     * The call was successful.
     * Native name: wbemNoErr
     * @type {Integer (Int32)}
     */
    static NoErr => 0

    /**
     * The call failed.
     * Native name: wbemErrFailed
     * @type {Integer (Int32)}
     */
    static ErrFailed => -2147217407

    /**
     * The object could not be found.
     * Native name: wbemErrNotFound
     * @type {Integer (Int32)}
     */
    static ErrNotFound => -2147217406

    /**
     * The current user does not have permission to perform the action.
     * Native name: wbemErrAccessDenied
     * @type {Integer (Int32)}
     */
    static ErrAccessDenied => -2147217405

    /**
     * The provider has failed at some time other than during initialization.
     * Native name: wbemErrProviderFailure
     * @type {Integer (Int32)}
     */
    static ErrProviderFailure => -2147217404

    /**
     * A type mismatch occurred.
     * Native name: wbemErrTypeMismatch
     * @type {Integer (Int32)}
     */
    static ErrTypeMismatch => -2147217403

    /**
     * There was not enough memory for the operation.
     * Native name: wbemErrOutOfMemory
     * @type {Integer (Int32)}
     */
    static ErrOutOfMemory => -2147217402

    /**
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/swbemnamedvalue">SWbemNamedValue</a> object is not valid.
     * Native name: wbemErrInvalidContext
     * @type {Integer (Int32)}
     */
    static ErrInvalidContext => -2147217401

    /**
     * One of the parameters to the call is not correct.
     * Native name: wbemErrInvalidParameter
     * @type {Integer (Int32)}
     */
    static ErrInvalidParameter => -2147217400

    /**
     * The resource, typically a remote server, is not currently available.
     * Native name: wbemErrNotAvailable
     * @type {Integer (Int32)}
     */
    static ErrNotAvailable => -2147217399

    /**
     * An internal, critical, and unexpected error occurred. Report this error to Microsoft Technical 
     *      Support.
     * Native name: wbemErrCriticalError
     * @type {Integer (Int32)}
     */
    static ErrCriticalError => -2147217398

    /**
     * One or more network packets were corrupted during a remote session.
     * Native name: wbemErrInvalidStream
     * @type {Integer (Int32)}
     */
    static ErrInvalidStream => -2147217397

    /**
     * The feature or operation is not supported.
     * Native name: wbemErrNotSupported
     * @type {Integer (Int32)}
     */
    static ErrNotSupported => -2147217396

    /**
     * The parent class specified is not valid.
     * Native name: wbemErrInvalidSuperclass
     * @type {Integer (Int32)}
     */
    static ErrInvalidSuperclass => -2147217395

    /**
     * The namespace specified could not be found.
     * Native name: wbemErrInvalidNamespace
     * @type {Integer (Int32)}
     */
    static ErrInvalidNamespace => -2147217394

    /**
     * The specified instance is not valid.
     * Native name: wbemErrInvalidObject
     * @type {Integer (Int32)}
     */
    static ErrInvalidObject => -2147217393

    /**
     * The specified class is not valid.
     * Native name: wbemErrInvalidClass
     * @type {Integer (Int32)}
     */
    static ErrInvalidClass => -2147217392

    /**
     * A provider referenced in the schema does not have a corresponding registration.
     * Native name: wbemErrProviderNotFound
     * @type {Integer (Int32)}
     */
    static ErrProviderNotFound => -2147217391

    /**
     * A provider referenced in the schema has an incorrect or incomplete registration. This error may be caused by 
     *      a missing <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/pragma-namespace">pragma namespace</a> command in the MOF file used to 
     *      register the provider, resulting in the provider being registered in the wrong WMI namespace. This error may also 
     *      be caused by a corrupt repository, which may be fixed by deleting it and recompiling the MOF files.
     * Native name: wbemErrInvalidProviderRegistration
     * @type {Integer (Int32)}
     */
    static ErrInvalidProviderRegistration => -2147217390

    /**
     * COM cannot locate a provider referenced in the schema. This error may be caused by any of the following:
     * 
     * The provider is using a WMI DLL that does not match the .lib fileused when the provider was built.
     * 
     * The provider's DLL or any of the DLLs on which it depends is corrupt.
     * 
     * The provider failed to export 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/olectl/nf-olectl-dllregisterserver">DllRegisterServer</a>.
     * 
     * An in-process provider was not registered using /regsvr32.
     * 
     * An out-of-process provider was not registered 
     *       using /regserver.
     * Native name: wbemErrProviderLoadFailure
     * @type {Integer (Int32)}
     */
    static ErrProviderLoadFailure => -2147217389

    /**
     * A component, such as a provider, failed to initialize for internal reasons.
     * Native name: wbemErrInitializationFailure
     * @type {Integer (Int32)}
     */
    static ErrInitializationFailure => -2147217388

    /**
     * A networking error occurred, preventing normal operation.
     * Native name: wbemErrTransportFailure
     * @type {Integer (Int32)}
     */
    static ErrTransportFailure => -2147217387

    /**
     * The requested operation is not valid. This error usually applies to invalid attempts to delete classes or 
     *      properties.
     * Native name: wbemErrInvalidOperation
     * @type {Integer (Int32)}
     */
    static ErrInvalidOperation => -2147217386

    /**
     * The requested operation is not valid. This error usually applies to invalid attempts to delete classes or 
     *      properties.
     * Native name: wbemErrInvalidQuery
     * @type {Integer (Int32)}
     */
    static ErrInvalidQuery => -2147217385

    /**
     * The requested query language is not supported.
     * Native name: wbemErrInvalidQueryType
     * @type {Integer (Int32)}
     */
    static ErrInvalidQueryType => -2147217384

    /**
     * In a put operation, the <b>wbemChangeFlagCreateOnly</b> flag was specified, but the 
     *      instance already exists.
     * Native name: wbemErrAlreadyExists
     * @type {Integer (Int32)}
     */
    static ErrAlreadyExists => -2147217383

    /**
     * It is not possible to perform the add operation on this qualifier because the owning object does not permit 
     *      overrides.
     * Native name: wbemErrOverrideNotAllowed
     * @type {Integer (Int32)}
     */
    static ErrOverrideNotAllowed => -2147217382

    /**
     * The user attempted to delete a qualifier that was not owned. The qualifier was inherited from a parent 
     *      class.
     * Native name: wbemErrPropagatedQualifier
     * @type {Integer (Int32)}
     */
    static ErrPropagatedQualifier => -2147217381

    /**
     * The user attempted to delete a property that was not owned. The property was inherited from a parent 
     *      class.
     * Native name: wbemErrPropagatedProperty
     * @type {Integer (Int32)}
     */
    static ErrPropagatedProperty => -2147217380

    /**
     * The client made an unexpected and illegal sequence of calls, such as calling 
     *      <b>EndEnumeration</b> before calling 
     *      <b>BeginEnumeration</b>.
     * Native name: wbemErrUnexpected
     * @type {Integer (Int32)}
     */
    static ErrUnexpected => -2147217379

    /**
     * The user requested an illegal operation, such as spawning a class from an instance.
     * Native name: wbemErrIllegalOperation
     * @type {Integer (Int32)}
     */
    static ErrIllegalOperation => -2147217378

    /**
     * There was an illegal attempt to specify a key qualifier on a property that cannot be a key. The keys are 
     *      specified in the class definition for an object, and cannot be altered on a per-instance basis.
     * Native name: wbemErrCannotBeKey
     * @type {Integer (Int32)}
     */
    static ErrCannotBeKey => -2147217377

    /**
     * The current object is not a valid class definition. Either it is incomplete, or it has not been registered 
     *      with WMI using <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/swbemobject-put-">SWbemObject.Put_</a>.
     * Native name: wbemErrIncompleteClass
     * @type {Integer (Int32)}
     */
    static ErrIncompleteClass => -2147217376

    /**
     * The syntax of an input parameter is incorrect for the applicable data structure. For example, when a CIM 
     *      datetime structure does not have the correct format when passed to 
     *      <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/swbemdatetime-setfiletime">SWbemDateTime.SetFileTime</a>.
     * Native name: wbemErrInvalidSyntax
     * @type {Integer (Int32)}
     */
    static ErrInvalidSyntax => -2147217375

    /**
     * Reserved for future use.
     * Native name: wbemErrNondecoratedObject
     * @type {Integer (Int32)}
     */
    static ErrNondecoratedObject => -2147217374

    /**
     * The property that you are attempting to modify is read-only.
     * Native name: wbemErrReadOnly
     * @type {Integer (Int32)}
     */
    static ErrReadOnly => -2147217373

    /**
     * The provider cannot perform the requested operation. This would include a query that is too complex, 
     *      retrieving an instance, creating or updating a class, deleting a class, or enumerating a class.
     * Native name: wbemErrProviderNotCapable
     * @type {Integer (Int32)}
     */
    static ErrProviderNotCapable => -2147217372

    /**
     * An attempt was made to make a change that would invalidate a subclass.
     * Native name: wbemErrClassHasChildren
     * @type {Integer (Int32)}
     */
    static ErrClassHasChildren => -2147217371

    /**
     * An attempt has been made to delete or modify a class that has instances.
     * Native name: wbemErrClassHasInstances
     * @type {Integer (Int32)}
     */
    static ErrClassHasInstances => -2147217370

    /**
     * Reserved for future use.
     * Native name: wbemErrQueryNotImplemented
     * @type {Integer (Int32)}
     */
    static ErrQueryNotImplemented => -2147217369

    /**
     * A value of Nothing was specified for a property that may not be Nothing, such as one that is marked by a 
     *      <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/key-qualifier">Key</a>, <b>Indexed</b>, 
     *      or <b>Not_Null</b> qualifier.
     * Native name: wbemErrIllegalNull
     * @type {Integer (Int32)}
     */
    static ErrIllegalNull => -2147217368

    /**
     * The CIM type specified for a property is not valid.
     * Native name: wbemErrInvalidQualifierType
     * @type {Integer (Int32)}
     */
    static ErrInvalidQualifierType => -2147217367

    /**
     * The CIM type specified for a property is not valid.
     * Native name: wbemErrInvalidPropertyType
     * @type {Integer (Int32)}
     */
    static ErrInvalidPropertyType => -2147217366

    /**
     * The request was made with an out-of-range value, or is incompatible with the type.
     * Native name: wbemErrValueOutOfRange
     * @type {Integer (Int32)}
     */
    static ErrValueOutOfRange => -2147217365

    /**
     * An illegal attempt was made to make a class singleton, such as when the class is derived from a 
     *      non-singleton class.
     * Native name: wbemErrCannotBeSingleton
     * @type {Integer (Int32)}
     */
    static ErrCannotBeSingleton => -2147217364

    /**
     * The CIM type specified is not valid.
     * Native name: wbemErrInvalidCimType
     * @type {Integer (Int32)}
     */
    static ErrInvalidCimType => -2147217363

    /**
     * The requested method is not available.
     * Native name: wbemErrInvalidMethod
     * @type {Integer (Int32)}
     */
    static ErrInvalidMethod => -2147217362

    /**
     * The parameters provided for the method are not valid.
     * Native name: wbemErrInvalidMethodParameters
     * @type {Integer (Int32)}
     */
    static ErrInvalidMethodParameters => -2147217361

    /**
     * There was an attempt to get qualifiers on a system property.
     * Native name: wbemErrSystemProperty
     * @type {Integer (Int32)}
     */
    static ErrSystemProperty => -2147217360

    /**
     * The property type is not recognized.
     * Native name: wbemErrInvalidProperty
     * @type {Integer (Int32)}
     */
    static ErrInvalidProperty => -2147217359

    /**
     * An asynchronous process has been canceled internally or by the user. Note that due to the timing and nature 
     *      of the asynchronous operation the operation may not have been truly canceled.
     * Native name: wbemErrCallCancelled
     * @type {Integer (Int32)}
     */
    static ErrCallCancelled => -2147217358

    /**
     * The user has requested an operation while WMI is in the process of shutting down.
     * Native name: wbemErrShuttingDown
     * @type {Integer (Int32)}
     */
    static ErrShuttingDown => -2147217357

    /**
     * An attempt was made to reuse an existing method name from a parent class, and the signatures did not 
     *      match.
     * Native name: wbemErrPropagatedMethod
     * @type {Integer (Int32)}
     */
    static ErrPropagatedMethod => -2147217356

    /**
     * One or more parameter values, such as a query text, is too complex or unsupported. WMI is therefore 
     *      requested to retry the operation with simpler parameters.
     * Native name: wbemErrUnsupportedParameter
     * @type {Integer (Int32)}
     */
    static ErrUnsupportedParameter => -2147217355

    /**
     * A parameter was missing from the method call.
     * Native name: wbemErrMissingParameter
     * @type {Integer (Int32)}
     */
    static ErrMissingParameter => -2147217354

    /**
     * A method parameter has an <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/standard-wmi-qualifiers">ID</a> 
     *      qualifier that is not valid.
     * Native name: wbemErrInvalidParameterId
     * @type {Integer (Int32)}
     */
    static ErrInvalidParameterId => -2147217353

    /**
     * One or more of the method parameters have 
     *      <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/standard-wmi-qualifiers">ID</a> qualifiers that are out of 
     *      sequence.
     * Native name: wbemErrNonConsecutiveParameterIds
     * @type {Integer (Int32)}
     */
    static ErrNonConsecutiveParameterIds => -2147217352

    /**
     * The return value for a method has an 
     *      <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/standard-wmi-qualifiers">ID</a> qualifier.
     * Native name: wbemErrParameterIdOnRetval
     * @type {Integer (Int32)}
     */
    static ErrParameterIdOnRetval => -2147217351

    /**
     * The specified object path was not valid.
     * Native name: wbemErrInvalidObjectPath
     * @type {Integer (Int32)}
     */
    static ErrInvalidObjectPath => -2147217350

    /**
     * Disk is out of space or the 4 GB limit on WMI repository (CIM repository) size is reached.
     * Native name: wbemErrOutOfDiskSpace
     * @type {Integer (Int32)}
     */
    static ErrOutOfDiskSpace => -2147217349

    /**
     * The supplied buffer was too small to hold all the objects in the enumerator or to read a string 
     *      property.
     * Native name: wbemErrBufferTooSmall
     * @type {Integer (Int32)}
     */
    static ErrBufferTooSmall => -2147217348

    /**
     * The provider does not support the requested put operation.
     * Native name: wbemErrUnsupportedPutExtension
     * @type {Integer (Int32)}
     */
    static ErrUnsupportedPutExtension => -2147217347

    /**
     * An object with an incorrect type or version was encountered during marshaling.
     * Native name: wbemErrUnknownObjectType
     * @type {Integer (Int32)}
     */
    static ErrUnknownObjectType => -2147217346

    /**
     * A packet with an incorrect type or version was encountered during marshaling.
     * Native name: wbemErrUnknownPacketType
     * @type {Integer (Int32)}
     */
    static ErrUnknownPacketType => -2147217345

    /**
     * The packet has an unsupported version.
     * Native name: wbemErrMarshalVersionMismatch
     * @type {Integer (Int32)}
     */
    static ErrMarshalVersionMismatch => -2147217344

    /**
     * The packet appears to be corrupted.
     * Native name: wbemErrMarshalInvalidSignature
     * @type {Integer (Int32)}
     */
    static ErrMarshalInvalidSignature => -2147217343

    /**
     * An attempt has been made to mismatch qualifiers, such as putting [key] on an object instead of a 
     *      property.
     * Native name: wbemErrInvalidQualifier
     * @type {Integer (Int32)}
     */
    static ErrInvalidQualifier => -2147217342

    /**
     * A duplicate parameter has been declared in a CIM method.
     * Native name: wbemErrInvalidDuplicateParameter
     * @type {Integer (Int32)}
     */
    static ErrInvalidDuplicateParameter => -2147217341

    /**
     * Reserved for future use.
     * Native name: wbemErrTooMuchData
     * @type {Integer (Int32)}
     */
    static ErrTooMuchData => -2147217340

    /**
     * A call to <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">IWbemObjectSink::Indicate</a> has 
     *      failed. The provider may choose to refire the event.
     * Native name: wbemErrServerTooBusy
     * @type {Integer (Int32)}
     */
    static ErrServerTooBusy => -2147217339

    /**
     * The specified flavor was not valid.
     * Native name: wbemErrInvalidFlavor
     * @type {Integer (Int32)}
     */
    static ErrInvalidFlavor => -2147217338

    /**
     * An attempt has been made to create a reference that is circular (for example, deriving a class from 
     *      itself).
     * Native name: wbemErrCircularReference
     * @type {Integer (Int32)}
     */
    static ErrCircularReference => -2147217337

    /**
     * The specified class is not supported.
     * Native name: wbemErrUnsupportedClassUpdate
     * @type {Integer (Int32)}
     */
    static ErrUnsupportedClassUpdate => -2147217336

    /**
     * An attempt was made to change a key when instances or subclasses are already using the key.
     * Native name: wbemErrCannotChangeKeyInheritance
     * @type {Integer (Int32)}
     */
    static ErrCannotChangeKeyInheritance => -2147217335

    /**
     * An attempt was made to change an index when instances or subclasses are already using the index.
     * Native name: wbemErrCannotChangeIndexInheritance
     * @type {Integer (Int32)}
     */
    static ErrCannotChangeIndexInheritance => -2147217328

    /**
     * An attempt was made to create more properties than the current version of the class supports.
     * Native name: wbemErrTooManyProperties
     * @type {Integer (Int32)}
     */
    static ErrTooManyProperties => -2147217327

    /**
     * A property was redefined with a conflicting type in a derived class.
     * Native name: wbemErrUpdateTypeMismatch
     * @type {Integer (Int32)}
     */
    static ErrUpdateTypeMismatch => -2147217326

    /**
     * An attempt was made in a derived class to override a non-overridable qualifier.
     * Native name: wbemErrUpdateOverrideNotAllowed
     * @type {Integer (Int32)}
     */
    static ErrUpdateOverrideNotAllowed => -2147217325

    /**
     * A method was redeclared with a conflicting signature in a derived class.
     * Native name: wbemErrUpdatePropagatedMethod
     * @type {Integer (Int32)}
     */
    static ErrUpdatePropagatedMethod => -2147217324

    /**
     * An attempt was made to execute a method not marked with [implemented] in any relevant class.
     * Native name: wbemErrMethodNotImplemented
     * @type {Integer (Int32)}
     */
    static ErrMethodNotImplemented => -2147217323

    /**
     * An attempt was made to execute a method marked with [disabled].
     * Native name: wbemErrMethodDisabled
     * @type {Integer (Int32)}
     */
    static ErrMethodDisabled => -2147217322

    /**
     * The refresher is busy with another operation.
     * Native name: wbemErrRefresherBusy
     * @type {Integer (Int32)}
     */
    static ErrRefresherBusy => -2147217321

    /**
     * The filtering query is syntactically not valid.
     * Native name: wbemErrUnparsableQuery
     * @type {Integer (Int32)}
     */
    static ErrUnparsableQuery => -2147217320

    /**
     * The FROM clause of a filtering query references a class that is not an event class (not derived from 
     *      __Event).
     * Native name: wbemErrNotEventClass
     * @type {Integer (Int32)}
     */
    static ErrNotEventClass => -2147217319

    /**
     * A GROUP BY clause was used without the corresponding GROUP WITHIN clause.
     * Native name: wbemErrMissingGroupWithin
     * @type {Integer (Int32)}
     */
    static ErrMissingGroupWithin => -2147217318

    /**
     * A GROUP BY clause was used. Aggregation on all properties is not supported.
     * Native name: wbemErrMissingAggregationList
     * @type {Integer (Int32)}
     */
    static ErrMissingAggregationList => -2147217317

    /**
     * Dot notation was used on a property that is not an embedded object.
     * Native name: wbemErrPropertyNotAnObject
     * @type {Integer (Int32)}
     */
    static ErrPropertyNotAnObject => -2147217316

    /**
     * A GROUP BY clause references a property that is an embedded object without using dot notation.
     * Native name: wbemErrAggregatingByObject
     * @type {Integer (Int32)}
     */
    static ErrAggregatingByObject => -2147217315

    /**
     * An event provider registration query 
     *      (<a href="https://docs.microsoft.com/windows/desktop/WmiSdk/--eventproviderregistration">__EventProviderRegistration</a>) did not 
     *      specify the classes for which events were provided.
     * Native name: wbemErrUninterpretableProviderQuery
     * @type {Integer (Int32)}
     */
    static ErrUninterpretableProviderQuery => -2147217313

    /**
     * An request was made to back up or restore the repository while WMI was using it.
     * Native name: wbemErrBackupRestoreWinmgmtRunning
     * @type {Integer (Int32)}
     */
    static ErrBackupRestoreWinmgmtRunning => -2147217312

    /**
     * The asynchronous delivery queue overflowed due to the event consumer being too slow.
     * Native name: wbemErrQueueOverflow
     * @type {Integer (Int32)}
     */
    static ErrQueueOverflow => -2147217311

    /**
     * The operation failed because the client did not have the necessary security privilege.
     * Native name: wbemErrPrivilegeNotHeld
     * @type {Integer (Int32)}
     */
    static ErrPrivilegeNotHeld => -2147217310

    /**
     * The operator is not valid for this property type.
     * Native name: wbemErrInvalidOperator
     * @type {Integer (Int32)}
     */
    static ErrInvalidOperator => -2147217309

    /**
     * The user specified a username, password or authority for a local connection. The user must use a blank 
     *      username/password and rely on default security.
     * Native name: wbemErrLocalCredentials
     * @type {Integer (Int32)}
     */
    static ErrLocalCredentials => -2147217308

    /**
     * The class was made abstract when its parent class is not abstract.
     * Native name: wbemErrCannotBeAbstract
     * @type {Integer (Int32)}
     */
    static ErrCannotBeAbstract => -2147217307

    /**
     * An amended object was put without the <b>wbemFlagUseAmendedQualifiers</b> flag being 
     *      specified.
     * Native name: wbemErrAmendedObject
     * @type {Integer (Int32)}
     */
    static ErrAmendedObject => -2147217306

    /**
     * The client was not retrieving objects quickly enough from an enumeration. This constant is returned when a 
     *        client creates an enumeration object but does not retrieve objects from the enumerator in a timely fashion, 
     *        causing the enumerator's object caches to get backed up.
     * Native name: wbemErrClientTooSlow
     * @type {Integer (Int32)}
     */
    static ErrClientTooSlow => -2147217305

    /**
     * A null security descriptor was used.
     * Native name: wbemErrNullSecurityDescriptor
     * @type {Integer (Int32)}
     */
    static ErrNullSecurityDescriptor => -2147217304

    /**
     * The operation timed out.
     * Native name: wbemErrTimeout
     * @type {Integer (Int32)}
     */
    static ErrTimeout => -2147217303

    /**
     * The association being used is not valid.
     * Native name: wbemErrInvalidAssociation
     * @type {Integer (Int32)}
     */
    static ErrInvalidAssociation => -2147217302

    /**
     * The operation was ambiguous.
     * Native name: wbemErrAmbiguousOperation
     * @type {Integer (Int32)}
     */
    static ErrAmbiguousOperation => -2147217301

    /**
     * WMI is taking up too much memory. This could be caused either by low memory availability or excessive 
     *        memory consumption by WMI.
     * Native name: wbemErrQuotaViolation
     * @type {Integer (Int32)}
     */
    static ErrQuotaViolation => -2147217300

    /**
     * The operation resulted in a transaction conflict.
     * Native name: wbemErrTransactionConflict
     * @type {Integer (Int32)}
     */
    static ErrTransactionConflict => -2147217299

    /**
     * The transaction forced a rollback.
     * Native name: wbemErrForcedRollback
     * @type {Integer (Int32)}
     */
    static ErrForcedRollback => -2147217298

    /**
     * The locale used in the call is not supported.
     * Native name: wbemErrUnsupportedLocale
     * @type {Integer (Int32)}
     */
    static ErrUnsupportedLocale => -2147217297

    /**
     * The object handle is out of date.
     * Native name: wbemErrHandleOutOfDate
     * @type {Integer (Int32)}
     */
    static ErrHandleOutOfDate => -2147217296

    /**
     * Indicates that the connection to the SQL database failed.
     * Native name: wbemErrConnectionFailed
     * @type {Integer (Int32)}
     */
    static ErrConnectionFailed => -2147217295

    /**
     * The handle request was not valid.
     * Native name: wbemErrInvalidHandleRequest
     * @type {Integer (Int32)}
     */
    static ErrInvalidHandleRequest => -2147217294

    /**
     * The property name contains more than 255 characters.
     * Native name: wbemErrPropertyNameTooWide
     * @type {Integer (Int32)}
     */
    static ErrPropertyNameTooWide => -2147217293

    /**
     * The class name contains more than 255 characters.
     * Native name: wbemErrClassNameTooWide
     * @type {Integer (Int32)}
     */
    static ErrClassNameTooWide => -2147217292

    /**
     * The method name contains more than 255 characters.
     * Native name: wbemErrMethodNameTooWide
     * @type {Integer (Int32)}
     */
    static ErrMethodNameTooWide => -2147217291

    /**
     * The qualifier name contains more than 255 characters.
     * Native name: wbemErrQualifierNameTooWide
     * @type {Integer (Int32)}
     */
    static ErrQualifierNameTooWide => -2147217290

    /**
     * Indicates that an SQL command should be rerun because there is a deadlock in SQL. This can be returned 
     *        only when data is being stored in an SQL database.
     * Native name: wbemErrRerunCommand
     * @type {Integer (Int32)}
     */
    static ErrRerunCommand => -2147217289

    /**
     * The database version does not match the version that the repository driver processes.
     * Native name: wbemErrDatabaseVerMismatch
     * @type {Integer (Int32)}
     */
    static ErrDatabaseVerMismatch => -2147217288

    /**
     * WMI cannot do the put operation because the provider does not allow it.
     * Native name: wbemErrVetoPut
     * @type {Integer (Int32)}
     */
    static ErrVetoPut => -2147217287

    /**
     * WMI cannot do the delete operation because the provider does not allow it.
     * Native name: wbemErrVetoDelete
     * @type {Integer (Int32)}
     */
    static ErrVetoDelete => -2147217286

    /**
     * The specified locale identifier was not valid for the operation.
     * Native name: wbemErrInvalidLocale
     * @type {Integer (Int32)}
     */
    static ErrInvalidLocale => -2147217280

    /**
     * The provider is suspended.
     * Native name: wbemErrProviderSuspended
     * @type {Integer (Int32)}
     */
    static ErrProviderSuspended => -2147217279

    /**
     * The object must be committed and retrieved again before the requested operation can succeed. This constant 
     *        is returned when an object must be committed and re-retrieved to see the property value.
     * Native name: wbemErrSynchronizationRequired
     * @type {Integer (Int32)}
     */
    static ErrSynchronizationRequired => -2147217278

    /**
     * The operation cannot be completed because no schema is available.
     * Native name: wbemErrNoSchema
     * @type {Integer (Int32)}
     */
    static ErrNoSchema => -2147217277

    /**
     * The provider registration cannot be done because the provider is already registered.
     * Native name: wbemErrProviderAlreadyRegistered
     * @type {Integer (Int32)}
     */
    static ErrProviderAlreadyRegistered => -2147217276

    /**
     * The provider for the requested data is not registered.
     * Native name: wbemErrProviderNotRegistered
     * @type {Integer (Int32)}
     */
    static ErrProviderNotRegistered => -2147217275

    /**
     * A fatal transport error occurred and other transport will not be attempted.
     * Native name: wbemErrFatalTransportError
     * @type {Integer (Int32)}
     */
    static ErrFatalTransportError => -2147217274

    /**
     * The client connection to WINMGMT must be encrypted for this operation. The 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> proxy security settings should be adjusted 
     *        and the operation retried.
     * Native name: wbemErrEncryptedConnectionRequired
     * @type {Integer (Int32)}
     */
    static ErrEncryptedConnectionRequired => -2147217273

    /**
     * The provider registration overlaps with the system event domain.
     * Native name: wbemErrRegistrationTooBroad
     * @type {Integer (Int32)}
     */
    static ErrRegistrationTooBroad => -2147213311

    /**
     * A WITHIN clause was not used in this query.
     * Native name: wbemErrRegistrationTooPrecise
     * @type {Integer (Int32)}
     */
    static ErrRegistrationTooPrecise => -2147213310

    /**
     * Automation-specific error.
     * Native name: wbemErrTimedout
     * @type {Integer (Int32)}
     */
    static ErrTimedout => -2147209215

    /**
     * The user deleted an override default value for the current class. The default value for this property in 
     *        the parent class has been reactivated. An automation-specific error.
     * Native name: wbemErrResetToDefault
     * @type {Integer (Int32)}
     */
    static ErrResetToDefault => -2147209214
}
