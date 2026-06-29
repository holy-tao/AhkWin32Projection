#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\FsrmFileStreamingInterfaceType.ahk" { FsrmFileStreamingInterfaceType }
#Import ".\FsrmFileStreamingMode.ahk" { FsrmFileStreamingMode }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFsrmProperty.ahk" { IFsrmProperty }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\System\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * Contains the classification properties for a file.
 * @remarks
 * A property bag contains an in-memory copy of all the properties for a file. The list of properties in the 
 *     property bag may include additional properties not defined in FSRM. These properties can be the result of other 
 *     metadata in the file.
 * 
 * This interface can be sent to 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-doespropertyvalueapply">IFsrmClassifierModuleImplementation::DoesPropertyValueApply</a> 
 *     and 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-getpropertyvaluetoapply">IFsrmClassifierModuleImplementation::GetPropertyValueToApply</a> 
 *     if a classifier module is implemented, or to 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduleimplementation-loadproperties">IFsrmStorageModuleImplementation::LoadProperties</a> 
 *     and 
 *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduleimplementation-saveproperties">IFsrmStorageModuleImplementation::SaveProperties</a> 
 *     if a storage module is implemented.
 * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nn-fsrmpipeline-ifsrmpropertybag
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 */
export default struct IFsrmPropertyBag extends IDispatch {
    /**
     * The interface identifier for IFsrmPropertyBag
     * @type {Guid}
     */
    static IID := Guid("{774589d1-d300-4f7a-9a24-f7b766800250}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFsrmPropertyBag interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name                  : IntPtr
        get_RelativePath          : IntPtr
        get_VolumeName            : IntPtr
        get_RelativeNamespaceRoot : IntPtr
        get_VolumeIndex           : IntPtr
        get_FileId                : IntPtr
        get_ParentDirectoryId     : IntPtr
        get_Size                  : IntPtr
        get_SizeAllocated         : IntPtr
        get_CreationTime          : IntPtr
        get_LastAccessTime        : IntPtr
        get_LastModificationTime  : IntPtr
        get_Attributes            : IntPtr
        get_OwnerSid              : IntPtr
        get_FilePropertyNames     : IntPtr
        get_Messages              : IntPtr
        get_PropertyBagFlags      : IntPtr
        GetFileProperty           : IntPtr
        SetFileProperty           : IntPtr
        AddMessage                : IntPtr
        GetFileStreamInterface    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFsrmPropertyBag.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    RelativePath {
        get => this.get_RelativePath()
    }

    /**
     * @type {BSTR} 
     */
    VolumeName {
        get => this.get_VolumeName()
    }

    /**
     * @type {BSTR} 
     */
    RelativeNamespaceRoot {
        get => this.get_RelativeNamespaceRoot()
    }

    /**
     * @type {Integer} 
     */
    VolumeIndex {
        get => this.get_VolumeIndex()
    }

    /**
     * @type {VARIANT} 
     */
    FileId {
        get => this.get_FileId()
    }

    /**
     * @type {VARIANT} 
     */
    ParentDirectoryId {
        get => this.get_ParentDirectoryId()
    }

    /**
     * @type {VARIANT} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * @type {VARIANT} 
     */
    SizeAllocated {
        get => this.get_SizeAllocated()
    }

    /**
     * @type {VARIANT} 
     */
    CreationTime {
        get => this.get_CreationTime()
    }

    /**
     * @type {VARIANT} 
     */
    LastAccessTime {
        get => this.get_LastAccessTime()
    }

    /**
     * @type {VARIANT} 
     */
    LastModificationTime {
        get => this.get_LastModificationTime()
    }

    /**
     * @type {Integer} 
     */
    Attributes {
        get => this.get_Attributes()
    }

    /**
     * @type {BSTR} 
     */
    OwnerSid {
        get => this.get_OwnerSid()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    FilePropertyNames {
        get => this.get_FilePropertyNames()
    }

    /**
     * @type {Pointer<SAFEARRAY>} 
     */
    Messages {
        get => this.get_Messages()
    }

    /**
     * @type {Integer} 
     */
    PropertyBagFlags {
        get => this.get_PropertyBagFlags()
    }

    /**
     * The name of the file that contains the properties in the bag.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_name
     */
    get_Name() {
        name := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * The relative path to the file.
     * @remarks
     * The relative path is the path of the file relative to the volume root.  For example, if the path to the file is "P:\folder1\subfolderA\test.txt", the relative path would be "\folder1\subfolderA".
     * 
     * The caller should not expect that the relative path returned will consistently have leading or trailing backslashes.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_relativepath
     */
    get_RelativePath() {
        _path := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, _path, "HRESULT")
        return _path
    }

    /**
     * The name of the volume on which the file exists.
     * @remarks
     * This property contains the volume name of the location of the file being scanned. For example, if the path to a file is "P:\folder1\subfolderA\test.txt", the volume name is "P:\".
     * 
     * The caller should not expect that the volume name returned will consistently have a trailing backslash.
     * 
     * The volume name that is returned will always be the name of a live volume. In the case where the file being classified is on a snapshot, the name of the live volume that the snapshot corresponds to will be returned.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_volumename
     */
    get_VolumeName() {
        volumeName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, volumeName, "HRESULT")
        return volumeName
    }

    /**
     * The relative path of the namespace root under which the file is being evaluated.
     * @remarks
     * This property is only valid under an evaluation context. Classifier modules that retrieve this property will get the namespace root of the rule under which the file is being evaluated. Because storage modules do not have evaluation contexts, they must not retrieve this property.
     * 
     * The relative namespace root is the path of the namespace root relative to the volume root.  For example, if the path to the file is "P:\folder1\subfolderA\test.txt", and the file is being evaluated by a rule with a namespace root of "P:\folder1", then the relative namespace root would be "\folder1\". Note that the rule's namespace root determines the relative namespace root.
     * 
     * The caller should not expect that the relative namespace root returned will consistently have leading or trailing backslashes.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_relativenamespaceroot
     */
    get_RelativeNamespaceRoot() {
        relativeNamespaceRoot := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, relativeNamespaceRoot, "HRESULT")
        return relativeNamespaceRoot
    }

    /**
     * The index that the scanner uses to refer to the volume on which the file exists.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_volumeindex
     */
    get_VolumeIndex() {
        result := ComCall(11, this, "uint*", &volumeId := 0, "HRESULT")
        return volumeId
    }

    /**
     * The NTFS file identifier of the file.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_fileid
     */
    get_FileId() {
        fileId := VARIANT()
        result := ComCall(12, this, VARIANT.Ptr, fileId, "HRESULT")
        return fileId
    }

    /**
     * The NTFS identifier of the file's parent directory.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_parentdirectoryid
     */
    get_ParentDirectoryId() {
        parentDirectoryId := VARIANT()
        result := ComCall(13, this, VARIANT.Ptr, parentDirectoryId, "HRESULT")
        return parentDirectoryId
    }

    /**
     * The size of the file.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_size
     */
    get_Size() {
        _size := VARIANT()
        result := ComCall(14, this, VARIANT.Ptr, _size, "HRESULT")
        return _size
    }

    /**
     * The allocation size of the file.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_sizeallocated
     */
    get_SizeAllocated() {
        sizeAllocated := VARIANT()
        result := ComCall(15, this, VARIANT.Ptr, sizeAllocated, "HRESULT")
        return sizeAllocated
    }

    /**
     * The date and time that the file was created.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_creationtime
     */
    get_CreationTime() {
        creationTime := VARIANT()
        result := ComCall(16, this, VARIANT.Ptr, creationTime, "HRESULT")
        return creationTime
    }

    /**
     * The date and time of when the file was last accessed.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_lastaccesstime
     */
    get_LastAccessTime() {
        lastAccessTime := VARIANT()
        result := ComCall(17, this, VARIANT.Ptr, lastAccessTime, "HRESULT")
        return lastAccessTime
    }

    /**
     * The date and time of when the file was last modified.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_lastmodificationtime
     */
    get_LastModificationTime() {
        lastModificationTime := VARIANT()
        result := ComCall(18, this, VARIANT.Ptr, lastModificationTime, "HRESULT")
        return lastModificationTime
    }

    /**
     * The attributes of the file.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_attributes
     */
    get_Attributes() {
        result := ComCall(19, this, "uint*", &attributes := 0, "HRESULT")
        return attributes
    }

    /**
     * The SID of the owner of the file.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_ownersid
     */
    get_OwnerSid() {
        ownerSid := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, ownerSid, "HRESULT")
        return ownerSid
    }

    /**
     * A list of the names of the properties that the bag contains.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_filepropertynames
     */
    get_FilePropertyNames() {
        result := ComCall(21, this, "ptr*", &filePropertyNames := 0, "HRESULT")
        return filePropertyNames
    }

    /**
     * A list of the error messages that have been added to the bag.
     * @remarks
     * The format of the message is 
     *     <i>module_name</i>,<i>rule_name</i>|<i>message</i> 
     *     (FSRM adds the <i>module_name</i>,<i>rule_name</i>| components to the 
     *     message that you specified when calling the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-addmessage">IFsrmPropertyBag::AddMessage</a> method).
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_messages
     */
    get_Messages() {
        result := ComCall(22, this, "ptr*", &messages := 0, "HRESULT")
        return messages
    }

    /**
     * A set of flags that provide additional information about the property bag.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_propertybagflags
     */
    get_PropertyBagFlags() {
        result := ComCall(23, this, "uint*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Retrieves the specified property from the property bag.
     * @remarks
     * Use the property name specified in the rule's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassificationrule-get_propertyaffected">PropertyAffected</a> property.
     * @param {BSTR} name The name of the property to retrieve.
     * @returns {IFsrmProperty} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmproperty">IFsrmProperty</a> interface to the retrieved property.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-getfileproperty
     */
    GetFileProperty(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(24, this, BSTR, name, "ptr*", &fileProperty := 0, "HRESULT")
        return IFsrmProperty(fileProperty)
    }

    /**
     * Sets the specified property in the property bag.
     * @remarks
     * The caller must be a storage module to obtain access to this property.
     * @param {BSTR} name The name of the property to set.
     * @param {BSTR} value The value to set the property to.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-setfileproperty
     */
    SetFileProperty(name, value) {
        name := name is String ? BSTR.Alloc(name).Value : name
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(25, this, BSTR, name, BSTR, value, "HRESULT")
        return result
    }

    /**
     * Adds an error message to the bag.
     * @remarks
     * You can add only one message to the bag. The message is written to the error log, if enabled.
     * 
     * If any of the following implementations returns an error code, FSRM automatically adds a message (which does not count against the one-message limit) that includes the error code and associated message string:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-doespropertyvalueapply">IFsrmClassifierModuleImplementation::DoesPropertyValueApply</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmclassifiermoduleimplementation-getpropertyvaluetoapply">IFsrmClassifierModuleImplementation::GetPropertyValueToApply</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduleimplementation-loadproperties">IFsrmStorageModuleImplementation::LoadProperties</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduleimplementation-saveproperties">IFsrmStorageModuleImplementation::SaveProperties</a>
     * </li>
     * </ul>
     * @param {BSTR} message The error message to add to the bag. The message is limited to 4096 characters (the message is truncated if longer than 4096 characters).
     * @returns {HRESULT} The method returns the following return values.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-addmessage
     */
    AddMessage(message) {
        message := message is String ? BSTR.Alloc(message).Value : message

        result := ComCall(26, this, BSTR, message, "HRESULT")
        return result
    }

    /**
     * Retrieves a file stream interface that you can use to access the contents of the file.
     * @remarks
     * To ensure the caller can be authorized for access, it must be a module that has its 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpipelinemoduledefinition-get_needsfilecontent">IFsrmPipelineModuleDefinition::NeedsFileContent</a> 
     *     property set to <b>TRUE</b>. If the <i>accessMode</i> parameter is set to 
     *     <b>FsrmFileStreamingMode_Write</b>, the caller must also be a storage module and have its 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmstoragemoduledefinition-get_updatesfilecontent">IFsrmStorageModuleDefinition::UpdatesFileContent</a> 
     *     property set to <b>TRUE</b>.
     * @param {FsrmFileStreamingMode} accessMode One or more access modes. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmfilestreamingmode">FsrmFileStreamingMode</a> enumeration.
     * @param {FsrmFileStreamingInterfaceType} interfaceType The type of streaming interface to use. For possible interface types, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmfilestreaminginterfacetype">FsrmFileStreamingInterfaceType</a> 
     *       enumeration.
     * @returns {VARIANT} A <b>VARIANT</b> that contains the streaming interface that you can use to access the 
     *       contents of the file. The variant is of type <b>VT_DISPATCH</b>. Query the 
     *       <b>dispval</b> member of the variant to get the specified streaming interface.
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-getfilestreaminterface
     */
    GetFileStreamInterface(accessMode, interfaceType) {
        pStreamInterface := VARIANT()
        result := ComCall(27, this, FsrmFileStreamingMode, accessMode, FsrmFileStreamingInterfaceType, interfaceType, VARIANT.Ptr, pStreamInterface, "HRESULT")
        return pStreamInterface
    }

    Query(iid) {
        if (IFsrmPropertyBag.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_RelativePath := CallbackCreate(GetMethod(implObj, "get_RelativePath"), flags, 2)
        this.vtbl.get_VolumeName := CallbackCreate(GetMethod(implObj, "get_VolumeName"), flags, 2)
        this.vtbl.get_RelativeNamespaceRoot := CallbackCreate(GetMethod(implObj, "get_RelativeNamespaceRoot"), flags, 2)
        this.vtbl.get_VolumeIndex := CallbackCreate(GetMethod(implObj, "get_VolumeIndex"), flags, 2)
        this.vtbl.get_FileId := CallbackCreate(GetMethod(implObj, "get_FileId"), flags, 2)
        this.vtbl.get_ParentDirectoryId := CallbackCreate(GetMethod(implObj, "get_ParentDirectoryId"), flags, 2)
        this.vtbl.get_Size := CallbackCreate(GetMethod(implObj, "get_Size"), flags, 2)
        this.vtbl.get_SizeAllocated := CallbackCreate(GetMethod(implObj, "get_SizeAllocated"), flags, 2)
        this.vtbl.get_CreationTime := CallbackCreate(GetMethod(implObj, "get_CreationTime"), flags, 2)
        this.vtbl.get_LastAccessTime := CallbackCreate(GetMethod(implObj, "get_LastAccessTime"), flags, 2)
        this.vtbl.get_LastModificationTime := CallbackCreate(GetMethod(implObj, "get_LastModificationTime"), flags, 2)
        this.vtbl.get_Attributes := CallbackCreate(GetMethod(implObj, "get_Attributes"), flags, 2)
        this.vtbl.get_OwnerSid := CallbackCreate(GetMethod(implObj, "get_OwnerSid"), flags, 2)
        this.vtbl.get_FilePropertyNames := CallbackCreate(GetMethod(implObj, "get_FilePropertyNames"), flags, 2)
        this.vtbl.get_Messages := CallbackCreate(GetMethod(implObj, "get_Messages"), flags, 2)
        this.vtbl.get_PropertyBagFlags := CallbackCreate(GetMethod(implObj, "get_PropertyBagFlags"), flags, 2)
        this.vtbl.GetFileProperty := CallbackCreate(GetMethod(implObj, "GetFileProperty"), flags, 3)
        this.vtbl.SetFileProperty := CallbackCreate(GetMethod(implObj, "SetFileProperty"), flags, 3)
        this.vtbl.AddMessage := CallbackCreate(GetMethod(implObj, "AddMessage"), flags, 2)
        this.vtbl.GetFileStreamInterface := CallbackCreate(GetMethod(implObj, "GetFileStreamInterface"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_RelativePath)
        CallbackFree(this.vtbl.get_VolumeName)
        CallbackFree(this.vtbl.get_RelativeNamespaceRoot)
        CallbackFree(this.vtbl.get_VolumeIndex)
        CallbackFree(this.vtbl.get_FileId)
        CallbackFree(this.vtbl.get_ParentDirectoryId)
        CallbackFree(this.vtbl.get_Size)
        CallbackFree(this.vtbl.get_SizeAllocated)
        CallbackFree(this.vtbl.get_CreationTime)
        CallbackFree(this.vtbl.get_LastAccessTime)
        CallbackFree(this.vtbl.get_LastModificationTime)
        CallbackFree(this.vtbl.get_Attributes)
        CallbackFree(this.vtbl.get_OwnerSid)
        CallbackFree(this.vtbl.get_FilePropertyNames)
        CallbackFree(this.vtbl.get_Messages)
        CallbackFree(this.vtbl.get_PropertyBagFlags)
        CallbackFree(this.vtbl.GetFileProperty)
        CallbackFree(this.vtbl.SetFileProperty)
        CallbackFree(this.vtbl.AddMessage)
        CallbackFree(this.vtbl.GetFileStreamInterface)
    }
}
