#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IFsrmProperty.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Contains the classification properties for a file.
 * @remarks
 * 
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
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmpropertybag
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmPropertyBag extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmPropertyBag
     * @type {Guid}
     */
    static IID => Guid("{774589d1-d300-4f7a-9a24-f7b766800250}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_RelativePath", "get_VolumeName", "get_RelativeNamespaceRoot", "get_VolumeIndex", "get_FileId", "get_ParentDirectoryId", "get_Size", "get_SizeAllocated", "get_CreationTime", "get_LastAccessTime", "get_LastModificationTime", "get_Attributes", "get_OwnerSid", "get_FilePropertyNames", "get_Messages", "get_PropertyBagFlags", "GetFileProperty", "SetFileProperty", "AddMessage", "GetFileStreamInterface"]

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
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * The relative path to the file.
     * @remarks
     * 
     * The relative path is the path of the file relative to the volume root.  For example, if the path to the file is "P:\folder1\subfolderA\test.txt", the relative path would be "\folder1\subfolderA".
     * 
     * The caller should not expect that the relative path returned will consistently have leading or trailing backslashes.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_relativepath
     */
    get_RelativePath() {
        path := BSTR()
        result := ComCall(8, this, "ptr", path, "HRESULT")
        return path
    }

    /**
     * The name of the volume on which the file exists.
     * @remarks
     * 
     * This property contains the volume name of the location of the file being scanned. For example, if the path to a file is "P:\folder1\subfolderA\test.txt", the volume name is "P:\".
     * 
     * The caller should not expect that the volume name returned will consistently have a trailing backslash.
     * 
     * The volume name that is returned will always be the name of a live volume. In the case where the file being classified is on a snapshot, the name of the live volume that the snapshot corresponds to will be returned.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_volumename
     */
    get_VolumeName() {
        volumeName := BSTR()
        result := ComCall(9, this, "ptr", volumeName, "HRESULT")
        return volumeName
    }

    /**
     * The relative path of the namespace root under which the file is being evaluated.
     * @remarks
     * 
     * This property is only valid under an evaluation context. Classifier modules that retrieve this property will get the namespace root of the rule under which the file is being evaluated. Because storage modules do not have evaluation contexts, they must not retrieve this property.
     * 
     * The relative namespace root is the path of the namespace root relative to the volume root.  For example, if the path to the file is "P:\folder1\subfolderA\test.txt", and the file is being evaluated by a rule with a namespace root of "P:\folder1", then the relative namespace root would be "\folder1\". Note that the rule's namespace root determines the relative namespace root.
     * 
     * The caller should not expect that the relative namespace root returned will consistently have leading or trailing backslashes.
     * 
     * 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_relativenamespaceroot
     */
    get_RelativeNamespaceRoot() {
        relativeNamespaceRoot := BSTR()
        result := ComCall(10, this, "ptr", relativeNamespaceRoot, "HRESULT")
        return relativeNamespaceRoot
    }

    /**
     * The index that the scanner uses to refer to the volume on which the file exists.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_volumeindex
     */
    get_VolumeIndex() {
        result := ComCall(11, this, "uint*", &volumeId := 0, "HRESULT")
        return volumeId
    }

    /**
     * The NTFS file identifier of the file.
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_fileid
     */
    get_FileId() {
        fileId := VARIANT()
        result := ComCall(12, this, "ptr", fileId, "HRESULT")
        return fileId
    }

    /**
     * The NTFS identifier of the file's parent directory.
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_parentdirectoryid
     */
    get_ParentDirectoryId() {
        parentDirectoryId := VARIANT()
        result := ComCall(13, this, "ptr", parentDirectoryId, "HRESULT")
        return parentDirectoryId
    }

    /**
     * The size of the file.
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_size
     */
    get_Size() {
        size := VARIANT()
        result := ComCall(14, this, "ptr", size, "HRESULT")
        return size
    }

    /**
     * The allocation size of the file.
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_sizeallocated
     */
    get_SizeAllocated() {
        sizeAllocated := VARIANT()
        result := ComCall(15, this, "ptr", sizeAllocated, "HRESULT")
        return sizeAllocated
    }

    /**
     * The date and time that the file was created.
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_creationtime
     */
    get_CreationTime() {
        creationTime := VARIANT()
        result := ComCall(16, this, "ptr", creationTime, "HRESULT")
        return creationTime
    }

    /**
     * The date and time of when the file was last accessed.
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_lastaccesstime
     */
    get_LastAccessTime() {
        lastAccessTime := VARIANT()
        result := ComCall(17, this, "ptr", lastAccessTime, "HRESULT")
        return lastAccessTime
    }

    /**
     * The date and time of when the file was last modified.
     * @returns {VARIANT} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_lastmodificationtime
     */
    get_LastModificationTime() {
        lastModificationTime := VARIANT()
        result := ComCall(18, this, "ptr", lastModificationTime, "HRESULT")
        return lastModificationTime
    }

    /**
     * The attributes of the file.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_attributes
     */
    get_Attributes() {
        result := ComCall(19, this, "uint*", &attributes := 0, "HRESULT")
        return attributes
    }

    /**
     * The SID of the owner of the file.
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_ownersid
     */
    get_OwnerSid() {
        ownerSid := BSTR()
        result := ComCall(20, this, "ptr", ownerSid, "HRESULT")
        return ownerSid
    }

    /**
     * A list of the names of the properties that the bag contains.
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_filepropertynames
     */
    get_FilePropertyNames() {
        result := ComCall(21, this, "ptr*", &filePropertyNames := 0, "HRESULT")
        return filePropertyNames
    }

    /**
     * A list of the error messages that have been added to the bag.
     * @remarks
     * 
     * The format of the message is 
     *     <i>module_name</i>,<i>rule_name</i>|<i>message</i> 
     *     (FSRM adds the <i>module_name</i>,<i>rule_name</i>| components to the 
     *     message that you specified when calling the 
     *     <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-addmessage">IFsrmPropertyBag::AddMessage</a> method).
     * 
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_messages
     */
    get_Messages() {
        result := ComCall(22, this, "ptr*", &messages := 0, "HRESULT")
        return messages
    }

    /**
     * A set of flags that provide additional information about the property bag.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_propertybagflags
     */
    get_PropertyBagFlags() {
        result := ComCall(23, this, "uint*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * Retrieves the specified property from the property bag.
     * @param {BSTR} name The name of the property to retrieve.
     * @returns {IFsrmProperty} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/fsrmpipeline/nn-fsrmpipeline-ifsrmproperty">IFsrmProperty</a> interface to the retrieved property.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-getfileproperty
     */
    GetFileProperty(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(24, this, "ptr", name, "ptr*", &fileProperty := 0, "HRESULT")
        return IFsrmProperty(fileProperty)
    }

    /**
     * Sets the specified property in the property bag.
     * @param {BSTR} name The name of the property to set.
     * @param {BSTR} value The value to set the property to.
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-setfileproperty
     */
    SetFileProperty(name, value) {
        name := name is String ? BSTR.Alloc(name).Value : name
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(25, this, "ptr", name, "ptr", value, "HRESULT")
        return result
    }

    /**
     * Adds an error message to the bag.
     * @param {BSTR} message The error message to add to the bag. The message is limited to 4096 characters (the message is truncated if longer than 4096 characters).
     * @returns {HRESULT} The method returns the following return values.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-addmessage
     */
    AddMessage(message) {
        message := message is String ? BSTR.Alloc(message).Value : message

        result := ComCall(26, this, "ptr", message, "HRESULT")
        return result
    }

    /**
     * Retrieves a file stream interface that you can use to access the contents of the file.
     * @param {Integer} accessMode One or more access modes. For possible values, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmfilestreamingmode">FsrmFileStreamingMode</a> enumeration.
     * @param {Integer} interfaceType The type of streaming interface to use. For possible interface types, see the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/fsrmenums/ne-fsrmenums-fsrmfilestreaminginterfacetype">FsrmFileStreamingInterfaceType</a> 
     *       enumeration.
     * @returns {VARIANT} A <b>VARIANT</b> that contains the streaming interface that you can use to access the 
     *       contents of the file. The variant is of type <b>VT_DISPATCH</b>. Query the 
     *       <b>dispval</b> member of the variant to get the specified streaming interface.
     * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-getfilestreaminterface
     */
    GetFileStreamInterface(accessMode, interfaceType) {
        pStreamInterface := VARIANT()
        result := ComCall(27, this, "int", accessMode, "int", interfaceType, "ptr", pStreamInterface, "HRESULT")
        return pStreamInterface
    }
}
