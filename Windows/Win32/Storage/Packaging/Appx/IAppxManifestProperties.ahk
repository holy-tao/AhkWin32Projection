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
     * Gets the value of the specified Boolean element in the properties section.
     * @param {PWSTR} name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the Boolean element. Valid values include:
     * 
     * <p class="indent">"Framework"
     * 
     * <p class="indent">"ResourcePackage" for Windows 8.1 and later
     * @returns {BOOL} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a>*</b>
     * 
     * The value of the specified Boolean element.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxmanifestproperties-getboolvalue
     */
    GetBoolValue(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(3, this, "ptr", name, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets the value of the specified string element in the properties section.
     * @param {PWSTR} name Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The name of the string element. Valid values include:
     * 
     * <p class="indent">"Description"
     * 
     * <p class="indent">"DisplayName"
     * 
     * <p class="indent">"Logo"
     * 
     * <p class="indent">"PublisherDisplayName"
     * @returns {PWSTR} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a>*</b>
     * 
     * The value of the specified element.
     * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nf-appxpackaging-iappxmanifestproperties-getstringvalue
     */
    GetStringValue(name) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(4, this, "ptr", name, "ptr*", &value := 0, "HRESULT")
        return value
    }
}
