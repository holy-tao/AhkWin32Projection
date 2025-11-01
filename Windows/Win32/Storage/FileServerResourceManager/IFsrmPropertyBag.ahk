#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_name
     */
    get_Name(name) {
        result := ComCall(7, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_relativepath
     */
    get_RelativePath(path) {
        result := ComCall(8, this, "ptr", path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} volumeName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_volumename
     */
    get_VolumeName(volumeName) {
        result := ComCall(9, this, "ptr", volumeName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} relativeNamespaceRoot 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_relativenamespaceroot
     */
    get_RelativeNamespaceRoot(relativeNamespaceRoot) {
        result := ComCall(10, this, "ptr", relativeNamespaceRoot, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} volumeId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_volumeindex
     */
    get_VolumeIndex(volumeId) {
        volumeIdMarshal := volumeId is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, volumeIdMarshal, volumeId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} fileId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_fileid
     */
    get_FileId(fileId) {
        result := ComCall(12, this, "ptr", fileId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} parentDirectoryId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_parentdirectoryid
     */
    get_ParentDirectoryId(parentDirectoryId) {
        result := ComCall(13, this, "ptr", parentDirectoryId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} size 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_size
     */
    get_Size(size) {
        result := ComCall(14, this, "ptr", size, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} sizeAllocated 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_sizeallocated
     */
    get_SizeAllocated(sizeAllocated) {
        result := ComCall(15, this, "ptr", sizeAllocated, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} creationTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_creationtime
     */
    get_CreationTime(creationTime) {
        result := ComCall(16, this, "ptr", creationTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} lastAccessTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_lastaccesstime
     */
    get_LastAccessTime(lastAccessTime) {
        result := ComCall(17, this, "ptr", lastAccessTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} lastModificationTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_lastmodificationtime
     */
    get_LastModificationTime(lastModificationTime) {
        result := ComCall(18, this, "ptr", lastModificationTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} attributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_attributes
     */
    get_Attributes(attributes) {
        attributesMarshal := attributes is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, attributesMarshal, attributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ownerSid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_ownersid
     */
    get_OwnerSid(ownerSid) {
        result := ComCall(20, this, "ptr", ownerSid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} filePropertyNames 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_filepropertynames
     */
    get_FilePropertyNames(filePropertyNames) {
        result := ComCall(21, this, "ptr*", filePropertyNames, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} messages 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_messages
     */
    get_Messages(messages) {
        result := ComCall(22, this, "ptr*", messages, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-get_propertybagflags
     */
    get_PropertyBagFlags(flags) {
        flagsMarshal := flags is VarRef ? "uint*" : "ptr"

        result := ComCall(23, this, flagsMarshal, flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<IFsrmProperty>} fileProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-getfileproperty
     */
    GetFileProperty(name, fileProperty) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(24, this, "ptr", name, "ptr*", fileProperty, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} pStreamInterface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag-getfilestreaminterface
     */
    GetFileStreamInterface(accessMode, interfaceType, pStreamInterface) {
        result := ComCall(27, this, "int", accessMode, "int", interfaceType, "ptr", pStreamInterface, "HRESULT")
        return result
    }
}
