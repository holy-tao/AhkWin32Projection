#Requires AutoHotkey v2.0.0 64-bit

/**
 * Define the errors that may be returned by Scripting API for WMI calls.
 * @see https://docs.microsoft.com/windows/win32/api//wbemdisp/ne-wbemdisp-wbemerrorenum
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WbemErrorEnum{

    /**
     * The call was successful.
     * @type {Integer (Int32)}
     */
    static wbemNoErr => 0

    /**
     * The call failed.
     * @type {Integer (Int32)}
     */
    static wbemErrFailed => -2147217407

    /**
     * The object could not be found.
     * @type {Integer (Int32)}
     */
    static wbemErrNotFound => -2147217406

    /**
     * The current user does not have permission to perform the action.
     * @type {Integer (Int32)}
     */
    static wbemErrAccessDenied => -2147217405

    /**
     * The provider has failed at some time other than during initialization.
     * @type {Integer (Int32)}
     */
    static wbemErrProviderFailure => -2147217404

    /**
     * A type mismatch occurred.
     * @type {Integer (Int32)}
     */
    static wbemErrTypeMismatch => -2147217403

    /**
     * There was not enough memory for the operation.
     * @type {Integer (Int32)}
     */
    static wbemErrOutOfMemory => -2147217402

    /**
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/swbemnamedvalue">SWbemNamedValue</a> object is not valid.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidContext => -2147217401

    /**
     * One of the parameters to the call is not correct.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidParameter => -2147217400

    /**
     * The resource, typically a remote server, is not currently available.
     * @type {Integer (Int32)}
     */
    static wbemErrNotAvailable => -2147217399

    /**
     * An internal, critical, and unexpected error occurred. Report this error to Microsoft Technical 
     *      Support.
     * @type {Integer (Int32)}
     */
    static wbemErrCriticalError => -2147217398

    /**
     * One or more network packets were corrupted during a remote session.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidStream => -2147217397

    /**
     * The feature or operation is not supported.
     * @type {Integer (Int32)}
     */
    static wbemErrNotSupported => -2147217396

    /**
     * The parent class specified is not valid.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidSuperclass => -2147217395

    /**
     * The namespace specified could not be found.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidNamespace => -2147217394

    /**
     * The specified instance is not valid.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidObject => -2147217393

    /**
     * The specified class is not valid.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidClass => -2147217392

    /**
     * A provider referenced in the schema does not have a corresponding registration.
     * @type {Integer (Int32)}
     */
    static wbemErrProviderNotFound => -2147217391

    /**
     * A provider referenced in the schema has an incorrect or incomplete registration. This error may be caused by 
     *      a missing <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/pragma-namespace">pragma namespace</a> command in the MOF file used to 
     *      register the provider, resulting in the provider being registered in the wrong WMI namespace. This error may also 
     *      be caused by a corrupt repository, which may be fixed by deleting it and recompiling the MOF files.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidProviderRegistration => -2147217390

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
     * @type {Integer (Int32)}
     */
    static wbemErrProviderLoadFailure => -2147217389

    /**
     * A component, such as a provider, failed to initialize for internal reasons.
     * @type {Integer (Int32)}
     */
    static wbemErrInitializationFailure => -2147217388

    /**
     * A networking error occurred, preventing normal operation.
     * @type {Integer (Int32)}
     */
    static wbemErrTransportFailure => -2147217387

    /**
     * The requested operation is not valid. This error usually applies to invalid attempts to delete classes or 
     *      properties.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidOperation => -2147217386

    /**
     * The requested operation is not valid. This error usually applies to invalid attempts to delete classes or 
     *      properties.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidQuery => -2147217385

    /**
     * The requested query language is not supported.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidQueryType => -2147217384

    /**
     * In a put operation, the <b>wbemChangeFlagCreateOnly</b> flag was specified, but the 
     *      instance already exists.
     * @type {Integer (Int32)}
     */
    static wbemErrAlreadyExists => -2147217383

    /**
     * It is not possible to perform the add operation on this qualifier because the owning object does not permit 
     *      overrides.
     * @type {Integer (Int32)}
     */
    static wbemErrOverrideNotAllowed => -2147217382

    /**
     * The user attempted to delete a qualifier that was not owned. The qualifier was inherited from a parent 
     *      class.
     * @type {Integer (Int32)}
     */
    static wbemErrPropagatedQualifier => -2147217381

    /**
     * The user attempted to delete a property that was not owned. The property was inherited from a parent 
     *      class.
     * @type {Integer (Int32)}
     */
    static wbemErrPropagatedProperty => -2147217380

    /**
     * The client made an unexpected and illegal sequence of calls, such as calling 
     *      <b>EndEnumeration</b> before calling 
     *      <b>BeginEnumeration</b>.
     * @type {Integer (Int32)}
     */
    static wbemErrUnexpected => -2147217379

    /**
     * The user requested an illegal operation, such as spawning a class from an instance.
     * @type {Integer (Int32)}
     */
    static wbemErrIllegalOperation => -2147217378

    /**
     * There was an illegal attempt to specify a key qualifier on a property that cannot be a key. The keys are 
     *      specified in the class definition for an object, and cannot be altered on a per-instance basis.
     * @type {Integer (Int32)}
     */
    static wbemErrCannotBeKey => -2147217377

    /**
     * The current object is not a valid class definition. Either it is incomplete, or it has not been registered 
     *      with WMI using <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/swbemobject-put-">SWbemObject.Put_</a>.
     * @type {Integer (Int32)}
     */
    static wbemErrIncompleteClass => -2147217376

    /**
     * The syntax of an input parameter is incorrect for the applicable data structure. For example, when a CIM 
     *      datetime structure does not have the correct format when passed to 
     *      <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/swbemdatetime-setfiletime">SWbemDateTime.SetFileTime</a>.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidSyntax => -2147217375

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static wbemErrNondecoratedObject => -2147217374

    /**
     * The property that you are attempting to modify is read-only.
     * @type {Integer (Int32)}
     */
    static wbemErrReadOnly => -2147217373

    /**
     * The provider cannot perform the requested operation. This would include a query that is too complex, 
     *      retrieving an instance, creating or updating a class, deleting a class, or enumerating a class.
     * @type {Integer (Int32)}
     */
    static wbemErrProviderNotCapable => -2147217372

    /**
     * An attempt was made to make a change that would invalidate a subclass.
     * @type {Integer (Int32)}
     */
    static wbemErrClassHasChildren => -2147217371

    /**
     * An attempt has been made to delete or modify a class that has instances.
     * @type {Integer (Int32)}
     */
    static wbemErrClassHasInstances => -2147217370

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static wbemErrQueryNotImplemented => -2147217369

    /**
     * A value of Nothing was specified for a property that may not be Nothing, such as one that is marked by a 
     *      <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/key-qualifier">Key</a>, <b>Indexed</b>, 
     *      or <b>Not_Null</b> qualifier.
     * @type {Integer (Int32)}
     */
    static wbemErrIllegalNull => -2147217368

    /**
     * The CIM type specified for a property is not valid.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidQualifierType => -2147217367

    /**
     * The CIM type specified for a property is not valid.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidPropertyType => -2147217366

    /**
     * The request was made with an out-of-range value, or is incompatible with the type.
     * @type {Integer (Int32)}
     */
    static wbemErrValueOutOfRange => -2147217365

    /**
     * An illegal attempt was made to make a class singleton, such as when the class is derived from a 
     *      non-singleton class.
     * @type {Integer (Int32)}
     */
    static wbemErrCannotBeSingleton => -2147217364

    /**
     * The CIM type specified is not valid.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidCimType => -2147217363

    /**
     * The requested method is not available.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidMethod => -2147217362

    /**
     * The parameters provided for the method are not valid.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidMethodParameters => -2147217361

    /**
     * There was an attempt to get qualifiers on a system property.
     * @type {Integer (Int32)}
     */
    static wbemErrSystemProperty => -2147217360

    /**
     * The property type is not recognized.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidProperty => -2147217359

    /**
     * An asynchronous process has been canceled internally or by the user. Note that due to the timing and nature 
     *      of the asynchronous operation the operation may not have been truly canceled.
     * @type {Integer (Int32)}
     */
    static wbemErrCallCancelled => -2147217358

    /**
     * The user has requested an operation while WMI is in the process of shutting down.
     * @type {Integer (Int32)}
     */
    static wbemErrShuttingDown => -2147217357

    /**
     * An attempt was made to reuse an existing method name from a parent class, and the signatures did not 
     *      match.
     * @type {Integer (Int32)}
     */
    static wbemErrPropagatedMethod => -2147217356

    /**
     * One or more parameter values, such as a query text, is too complex or unsupported. WMI is therefore 
     *      requested to retry the operation with simpler parameters.
     * @type {Integer (Int32)}
     */
    static wbemErrUnsupportedParameter => -2147217355

    /**
     * A parameter was missing from the method call.
     * @type {Integer (Int32)}
     */
    static wbemErrMissingParameter => -2147217354

    /**
     * A method parameter has an <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/standard-wmi-qualifiers">ID</a> 
     *      qualifier that is not valid.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidParameterId => -2147217353

    /**
     * One or more of the method parameters have 
     *      <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/standard-wmi-qualifiers">ID</a> qualifiers that are out of 
     *      sequence.
     * @type {Integer (Int32)}
     */
    static wbemErrNonConsecutiveParameterIds => -2147217352

    /**
     * The return value for a method has an 
     *      <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/standard-wmi-qualifiers">ID</a> qualifier.
     * @type {Integer (Int32)}
     */
    static wbemErrParameterIdOnRetval => -2147217351

    /**
     * The specified object path was not valid.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidObjectPath => -2147217350

    /**
     * Disk is out of space or the 4 GB limit on WMI repository (CIM repository) size is reached.
     * @type {Integer (Int32)}
     */
    static wbemErrOutOfDiskSpace => -2147217349

    /**
     * The supplied buffer was too small to hold all the objects in the enumerator or to read a string 
     *      property.
     * @type {Integer (Int32)}
     */
    static wbemErrBufferTooSmall => -2147217348

    /**
     * The provider does not support the requested put operation.
     * @type {Integer (Int32)}
     */
    static wbemErrUnsupportedPutExtension => -2147217347

    /**
     * An object with an incorrect type or version was encountered during marshaling.
     * @type {Integer (Int32)}
     */
    static wbemErrUnknownObjectType => -2147217346

    /**
     * A packet with an incorrect type or version was encountered during marshaling.
     * @type {Integer (Int32)}
     */
    static wbemErrUnknownPacketType => -2147217345

    /**
     * The packet has an unsupported version.
     * @type {Integer (Int32)}
     */
    static wbemErrMarshalVersionMismatch => -2147217344

    /**
     * The packet appears to be corrupted.
     * @type {Integer (Int32)}
     */
    static wbemErrMarshalInvalidSignature => -2147217343

    /**
     * An attempt has been made to mismatch qualifiers, such as putting [key] on an object instead of a 
     *      property.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidQualifier => -2147217342

    /**
     * A duplicate parameter has been declared in a CIM method.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidDuplicateParameter => -2147217341

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static wbemErrTooMuchData => -2147217340

    /**
     * A call to <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemobjectsink-indicate">IWbemObjectSink::Indicate</a> has 
     *      failed. The provider may choose to refire the event.
     * @type {Integer (Int32)}
     */
    static wbemErrServerTooBusy => -2147217339

    /**
     * The specified flavor was not valid.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidFlavor => -2147217338

    /**
     * An attempt has been made to create a reference that is circular (for example, deriving a class from 
     *      itself).
     * @type {Integer (Int32)}
     */
    static wbemErrCircularReference => -2147217337

    /**
     * The specified class is not supported.
     * @type {Integer (Int32)}
     */
    static wbemErrUnsupportedClassUpdate => -2147217336

    /**
     * An attempt was made to change a key when instances or subclasses are already using the key.
     * @type {Integer (Int32)}
     */
    static wbemErrCannotChangeKeyInheritance => -2147217335

    /**
     * An attempt was made to change an index when instances or subclasses are already using the index.
     * @type {Integer (Int32)}
     */
    static wbemErrCannotChangeIndexInheritance => -2147217328

    /**
     * An attempt was made to create more properties than the current version of the class supports.
     * @type {Integer (Int32)}
     */
    static wbemErrTooManyProperties => -2147217327

    /**
     * A property was redefined with a conflicting type in a derived class.
     * @type {Integer (Int32)}
     */
    static wbemErrUpdateTypeMismatch => -2147217326

    /**
     * An attempt was made in a derived class to override a non-overrideable qualifier.
     * @type {Integer (Int32)}
     */
    static wbemErrUpdateOverrideNotAllowed => -2147217325

    /**
     * A method was redeclared with a conflicting signature in a derived class.
     * @type {Integer (Int32)}
     */
    static wbemErrUpdatePropagatedMethod => -2147217324

    /**
     * An attempt was made to execute a method not marked with [implemented] in any relevant class.
     * @type {Integer (Int32)}
     */
    static wbemErrMethodNotImplemented => -2147217323

    /**
     * An attempt was made to execute a method marked with [disabled].
     * @type {Integer (Int32)}
     */
    static wbemErrMethodDisabled => -2147217322

    /**
     * The refresher is busy with another operation.
     * @type {Integer (Int32)}
     */
    static wbemErrRefresherBusy => -2147217321

    /**
     * The filtering query is syntactically not valid.
     * @type {Integer (Int32)}
     */
    static wbemErrUnparsableQuery => -2147217320

    /**
     * The FROM clause of a filtering query references a class that is not an event class (not derived from 
     *      __Event).
     * @type {Integer (Int32)}
     */
    static wbemErrNotEventClass => -2147217319

    /**
     * A GROUP BY clause was used without the corresponding GROUP WITHIN clause.
     * @type {Integer (Int32)}
     */
    static wbemErrMissingGroupWithin => -2147217318

    /**
     * A GROUP BY clause was used. Aggregation on all properties is not supported.
     * @type {Integer (Int32)}
     */
    static wbemErrMissingAggregationList => -2147217317

    /**
     * Dot notation was used on a property that is not an embedded object.
     * @type {Integer (Int32)}
     */
    static wbemErrPropertyNotAnObject => -2147217316

    /**
     * A GROUP BY clause references a property that is an embedded object without using dot notation.
     * @type {Integer (Int32)}
     */
    static wbemErrAggregatingByObject => -2147217315

    /**
     * An event provider registration query 
     *      (<a href="https://docs.microsoft.com/windows/desktop/WmiSdk/--eventproviderregistration">__EventProviderRegistration</a>) did not 
     *      specify the classes for which events were provided.
     * @type {Integer (Int32)}
     */
    static wbemErrUninterpretableProviderQuery => -2147217313

    /**
     * An request was made to back up or restore the repository while WMI was using it.
     * @type {Integer (Int32)}
     */
    static wbemErrBackupRestoreWinmgmtRunning => -2147217312

    /**
     * The asynchronous delivery queue overflowed due to the event consumer being too slow.
     * @type {Integer (Int32)}
     */
    static wbemErrQueueOverflow => -2147217311

    /**
     * The operation failed because the client did not have the necessary security privilege.
     * @type {Integer (Int32)}
     */
    static wbemErrPrivilegeNotHeld => -2147217310

    /**
     * The operator is not valid for this property type.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidOperator => -2147217309

    /**
     * The user specified a username, password or authority for a local connection. The user must use a blank 
     *      username/password and rely on default security.
     * @type {Integer (Int32)}
     */
    static wbemErrLocalCredentials => -2147217308

    /**
     * The class was made abstract when its parent class is not abstract.
     * @type {Integer (Int32)}
     */
    static wbemErrCannotBeAbstract => -2147217307

    /**
     * An amended object was put without the <b>wbemFlagUseAmendedQualifiers</b> flag being 
     *      specified.
     * @type {Integer (Int32)}
     */
    static wbemErrAmendedObject => -2147217306

    /**
     * The client was not retrieving objects quickly enough from an enumeration. This constant is returned when a 
     *        client creates an enumeration object but does not retrieve objects from the enumerator in a timely fashion, 
     *        causing the enumerator's object caches to get backed up.
     * @type {Integer (Int32)}
     */
    static wbemErrClientTooSlow => -2147217305

    /**
     * A null security descriptor was used.
     * @type {Integer (Int32)}
     */
    static wbemErrNullSecurityDescriptor => -2147217304

    /**
     * The operation timed out.
     * @type {Integer (Int32)}
     */
    static wbemErrTimeout => -2147217303

    /**
     * The association being used is not valid.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidAssociation => -2147217302

    /**
     * The operation was ambiguous.
     * @type {Integer (Int32)}
     */
    static wbemErrAmbiguousOperation => -2147217301

    /**
     * WMI is taking up too much memory. This could be caused either by low memory availability or excessive 
     *        memory consumption by WMI.
     * @type {Integer (Int32)}
     */
    static wbemErrQuotaViolation => -2147217300

    /**
     * The operation resulted in a transaction conflict.
     * @type {Integer (Int32)}
     */
    static wbemErrTransactionConflict => -2147217299

    /**
     * The transaction forced a rollback.
     * @type {Integer (Int32)}
     */
    static wbemErrForcedRollback => -2147217298

    /**
     * The locale used in the call is not supported.
     * @type {Integer (Int32)}
     */
    static wbemErrUnsupportedLocale => -2147217297

    /**
     * The object handle is out of date.
     * @type {Integer (Int32)}
     */
    static wbemErrHandleOutOfDate => -2147217296

    /**
     * Indicates that the connection to the SQL database failed.
     * @type {Integer (Int32)}
     */
    static wbemErrConnectionFailed => -2147217295

    /**
     * The handle request was not valid.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidHandleRequest => -2147217294

    /**
     * The property name contains more than 255 characters.
     * @type {Integer (Int32)}
     */
    static wbemErrPropertyNameTooWide => -2147217293

    /**
     * The class name contains more than 255 characters.
     * @type {Integer (Int32)}
     */
    static wbemErrClassNameTooWide => -2147217292

    /**
     * The method name contains more than 255 characters.
     * @type {Integer (Int32)}
     */
    static wbemErrMethodNameTooWide => -2147217291

    /**
     * The qualifier name contains more than 255 characters.
     * @type {Integer (Int32)}
     */
    static wbemErrQualifierNameTooWide => -2147217290

    /**
     * Indicates that an SQL command should be rerun because there is a deadlock in SQL. This can be returned 
     *        only when data is being stored in an SQL database.
     * @type {Integer (Int32)}
     */
    static wbemErrRerunCommand => -2147217289

    /**
     * The database version does not match the version that the repository driver processes.
     * @type {Integer (Int32)}
     */
    static wbemErrDatabaseVerMismatch => -2147217288

    /**
     * WMI cannot do the put operation because the provider does not allow it.
     * @type {Integer (Int32)}
     */
    static wbemErrVetoPut => -2147217287

    /**
     * WMI cannot do the delete operation because the provider does not allow it.
     * @type {Integer (Int32)}
     */
    static wbemErrVetoDelete => -2147217286

    /**
     * The specified locale identifier was not valid for the operation.
     * @type {Integer (Int32)}
     */
    static wbemErrInvalidLocale => -2147217280

    /**
     * The provider is suspended.
     * @type {Integer (Int32)}
     */
    static wbemErrProviderSuspended => -2147217279

    /**
     * The object must be committed and retrieved again before the requested operation can succeed. This constant 
     *        is returned when an object must be committed and re-retrieved to see the property value.
     * @type {Integer (Int32)}
     */
    static wbemErrSynchronizationRequired => -2147217278

    /**
     * The operation cannot be completed because no schema is available.
     * @type {Integer (Int32)}
     */
    static wbemErrNoSchema => -2147217277

    /**
     * The provider registration cannot be done because the provider is already registered.
     * @type {Integer (Int32)}
     */
    static wbemErrProviderAlreadyRegistered => -2147217276

    /**
     * The provider for the requested data is not registered.
     * @type {Integer (Int32)}
     */
    static wbemErrProviderNotRegistered => -2147217275

    /**
     * A fatal transport error occurred and other transport will not be attempted.
     * @type {Integer (Int32)}
     */
    static wbemErrFatalTransportError => -2147217274

    /**
     * The client connection to WINMGMT must be encrypted for this operation. The 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> proxy security settings should be adjusted 
     *        and the operation retried.
     * @type {Integer (Int32)}
     */
    static wbemErrEncryptedConnectionRequired => -2147217273

    /**
     * The provider registration overlaps with the system event domain.
     * @type {Integer (Int32)}
     */
    static wbemErrRegistrationTooBroad => -2147213311

    /**
     * A WITHIN clause was not used in this query.
     * @type {Integer (Int32)}
     */
    static wbemErrRegistrationTooPrecise => -2147213310

    /**
     * Automation-specific error.
     * @type {Integer (Int32)}
     */
    static wbemErrTimedout => -2147209215

    /**
     * The user deleted an override default value for the current class. The default value for this property in 
     *        the parent class has been reactivated. An automation-specific error.
     * @type {Integer (Int32)}
     */
    static wbemErrResetToDefault => -2147209214
}
