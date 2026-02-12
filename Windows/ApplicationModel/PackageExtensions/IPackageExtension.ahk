#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Package.ahk
#Include ..\..\Foundation\Collections\IPropertySet.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Storage\StorageFolder.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.PackageExtensions
 * @version WindowsRuntime 1.4
 */
class IPackageExtension extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageExtension
     * @type {Guid}
     */
    static IID => Guid("{da70c957-7ead-5c3b-9cf0-cc43faf474b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_DisplayName", "get_Description", "get_Package", "GetExtensionProperties", "GetExtensionPropertiesAsync", "GetPublicPath", "GetPublicFolder", "GetPublicFolderAsync"]

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * @type {Package} 
     */
    Package {
        get => this.get_Package()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Package} 
     */
    get_Package() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Package(value)
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    GetExtensionProperties() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertySet(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<IPropertySet>} 
     */
    GetExtensionPropertiesAsync() {
        result := ComCall(11, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IPropertySet, operation)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    GetPublicPath() {
        result_ := HSTRING()
        result := ComCall(12, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {StorageFolder} 
     */
    GetPublicFolder() {
        result := ComCall(13, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StorageFolder(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<StorageFolder>} 
     */
    GetPublicFolderAsync() {
        result := ComCall(14, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(StorageFolder, operation)
    }
}
