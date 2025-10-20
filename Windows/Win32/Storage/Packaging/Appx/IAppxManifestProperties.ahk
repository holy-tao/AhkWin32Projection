#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides read-only access to the properties section of a package manifest.
 * @remarks
 * 
  * The properties section of the manifest is defined using the <a href="https://docs.microsoft.com/uwp/schemas/appxpackage/appxmanifestschema/element-properties">Properties</a> element.
  * 
  * This object can be retrieved using the <a href="https://docs.microsoft.com/windows/desktop/api/appxpackaging/nf-appxpackaging-iappxmanifestreader-getproperties">IAppxManifestReader::GetProperties</a> method.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxmanifestproperties
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestProperties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppxManifestProperties
     * @type {Guid}
     */
    static IID => Guid("{03faf64d-f26f-4b2c-aaf7-8fe7789b8bca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBoolValue", "GetStringValue"]

    /**
     * 
     * @param {PWSTR} name 
     * @param {Pointer<BOOL>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestproperties-getboolvalue
     */
    GetBoolValue(name, value) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(3, this, "ptr", name, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} name 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestproperties-getstringvalue
     */
    GetStringValue(name, value) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(4, this, "ptr", name, "ptr", value, "HRESULT")
        return result
    }
}
