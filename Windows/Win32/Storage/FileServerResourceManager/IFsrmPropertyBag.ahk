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
     * 
     * @param {Pointer<BSTR>} name 
     * @returns {HRESULT} 
     */
    get_Name(name) {
        result := ComCall(7, this, "ptr", name, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} path 
     * @returns {HRESULT} 
     */
    get_RelativePath(path) {
        result := ComCall(8, this, "ptr", path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} volumeName 
     * @returns {HRESULT} 
     */
    get_VolumeName(volumeName) {
        result := ComCall(9, this, "ptr", volumeName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} relativeNamespaceRoot 
     * @returns {HRESULT} 
     */
    get_RelativeNamespaceRoot(relativeNamespaceRoot) {
        result := ComCall(10, this, "ptr", relativeNamespaceRoot, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} volumeId 
     * @returns {HRESULT} 
     */
    get_VolumeIndex(volumeId) {
        result := ComCall(11, this, "uint*", volumeId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} fileId 
     * @returns {HRESULT} 
     */
    get_FileId(fileId) {
        result := ComCall(12, this, "ptr", fileId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} parentDirectoryId 
     * @returns {HRESULT} 
     */
    get_ParentDirectoryId(parentDirectoryId) {
        result := ComCall(13, this, "ptr", parentDirectoryId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} size 
     * @returns {HRESULT} 
     */
    get_Size(size) {
        result := ComCall(14, this, "ptr", size, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} sizeAllocated 
     * @returns {HRESULT} 
     */
    get_SizeAllocated(sizeAllocated) {
        result := ComCall(15, this, "ptr", sizeAllocated, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} creationTime 
     * @returns {HRESULT} 
     */
    get_CreationTime(creationTime) {
        result := ComCall(16, this, "ptr", creationTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} lastAccessTime 
     * @returns {HRESULT} 
     */
    get_LastAccessTime(lastAccessTime) {
        result := ComCall(17, this, "ptr", lastAccessTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} lastModificationTime 
     * @returns {HRESULT} 
     */
    get_LastModificationTime(lastModificationTime) {
        result := ComCall(18, this, "ptr", lastModificationTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} attributes 
     * @returns {HRESULT} 
     */
    get_Attributes(attributes) {
        result := ComCall(19, this, "uint*", attributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ownerSid 
     * @returns {HRESULT} 
     */
    get_OwnerSid(ownerSid) {
        result := ComCall(20, this, "ptr", ownerSid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} filePropertyNames 
     * @returns {HRESULT} 
     */
    get_FilePropertyNames(filePropertyNames) {
        result := ComCall(21, this, "ptr", filePropertyNames, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} messages 
     * @returns {HRESULT} 
     */
    get_Messages(messages) {
        result := ComCall(22, this, "ptr", messages, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} flags 
     * @returns {HRESULT} 
     */
    get_PropertyBagFlags(flags) {
        result := ComCall(23, this, "uint*", flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<IFsrmProperty>} fileProperty 
     * @returns {HRESULT} 
     */
    GetFileProperty(name, fileProperty) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(24, this, "ptr", name, "ptr", fileProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     */
    SetFileProperty(name, value) {
        name := name is String ? BSTR.Alloc(name).Value : name
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(25, this, "ptr", name, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} message 
     * @returns {HRESULT} 
     */
    AddMessage(message) {
        message := message is String ? BSTR.Alloc(message).Value : message

        result := ComCall(26, this, "ptr", message, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} accessMode 
     * @param {Integer} interfaceType 
     * @param {Pointer<VARIANT>} pStreamInterface 
     * @returns {HRESULT} 
     */
    GetFileStreamInterface(accessMode, interfaceType, pStreamInterface) {
        result := ComCall(27, this, "int", accessMode, "int", interfaceType, "ptr", pStreamInterface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
