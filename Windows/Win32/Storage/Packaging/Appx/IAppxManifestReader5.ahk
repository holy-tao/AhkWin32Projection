#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents an object model of the package manifest that provides methods to access manifest elements and attributes.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxmanifestreader5
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestReader5 extends IUnknown{
    /**
     * The interface identifier for IAppxManifestReader5
     * @type {Guid}
     */
    static IID => Guid("{8d7ae132-a690-4c00-b75a-6aae1feaac80}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IAppxManifestMainPackageDependenciesEnumerator>} mainPackageDependencies 
     * @returns {HRESULT} 
     */
    GetMainPackageDependencies(mainPackageDependencies) {
        result := ComCall(3, this, "ptr", mainPackageDependencies, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
