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
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_relativepath
     */
    get_RelativePath() {
        path := BSTR()
        result := ComCall(8, this, "ptr", path, "HRESULT")
        return path
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_volumename
     */
    get_VolumeName() {
        volumeName := BSTR()
        result := ComCall(9, this, "ptr", volumeName, "HRESULT")
        return volumeName
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_relativenamespaceroot
     */
    get_RelativeNamespaceRoot() {
        relativeNamespaceRoot := BSTR()
        result := ComCall(10, this, "ptr", relativeNamespaceRoot, "HRESULT")
        return relativeNamespaceRoot
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_volumeindex
     */
    get_VolumeIndex() {
        result := ComCall(11, this, "uint*", &volumeId := 0, "HRESULT")
        return volumeId
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_fileid
     */
    get_FileId() {
        fileId := VARIANT()
        result := ComCall(12, this, "ptr", fileId, "HRESULT")
        return fileId
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_parentdirectoryid
     */
    get_ParentDirectoryId() {
        parentDirectoryId := VARIANT()
        result := ComCall(13, this, "ptr", parentDirectoryId, "HRESULT")
        return parentDirectoryId
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_size
     */
    get_Size() {
        size := VARIANT()
        result := ComCall(14, this, "ptr", size, "HRESULT")
        return size
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_sizeallocated
     */
    get_SizeAllocated() {
        sizeAllocated := VARIANT()
        result := ComCall(15, this, "ptr", sizeAllocated, "HRESULT")
        return sizeAllocated
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_creationtime
     */
    get_CreationTime() {
        creationTime := VARIANT()
        result := ComCall(16, this, "ptr", creationTime, "HRESULT")
        return creationTime
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_lastaccesstime
     */
    get_LastAccessTime() {
        lastAccessTime := VARIANT()
        result := ComCall(17, this, "ptr", lastAccessTime, "HRESULT")
        return lastAccessTime
    }

    /**
     * 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_lastmodificationtime
     */
    get_LastModificationTime() {
        lastModificationTime := VARIANT()
        result := ComCall(18, this, "ptr", lastModificationTime, "HRESULT")
        return lastModificationTime
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_attributes
     */
    get_Attributes() {
        result := ComCall(19, this, "uint*", &attributes := 0, "HRESULT")
        return attributes
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_ownersid
     */
    get_OwnerSid() {
        ownerSid := BSTR()
        result := ComCall(20, this, "ptr", ownerSid, "HRESULT")
        return ownerSid
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_filepropertynames
     */
    get_FilePropertyNames() {
        result := ComCall(21, this, "ptr*", &filePropertyNames := 0, "HRESULT")
        return filePropertyNames
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_messages
     */
    get_Messages() {
        result := ComCall(22, this, "ptr*", &messages := 0, "HRESULT")
        return messages
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_propertybagflags
     */
    get_PropertyBagFlags() {
        result := ComCall(23, this, "uint*", &flags := 0, "HRESULT")
        return flags
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {IFsrmProperty} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-getfileproperty
     */
    GetFileProperty(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(24, this, "ptr", name, "ptr*", &fileProperty := 0, "HRESULT")
        return IFsrmProperty(fileProperty)
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-setfileproperty
     */
    SetFileProperty(name, value) {
        name := name is String ? BSTR.Alloc(name).Value : name
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(25, this, "ptr", name, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} message 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-addmessage
     */
    AddMessage(message) {
        message := message is String ? BSTR.Alloc(message).Value : message

        result := ComCall(26, this, "ptr", message, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} accessMode 
     * @param {Integer} interfaceType 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-getfilestreaminterface
     */
    GetFileStreamInterface(accessMode, interfaceType) {
        pStreamInterface := VARIANT()
        result := ComCall(27, this, "int", accessMode, "int", interfaceType, "ptr", pStreamInterface, "HRESULT")
        return pStreamInterface
    }
}
