#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Represents an object model of the package manifest that provides methods to access manifest elements and attributes.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxmanifestreader6
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestReader6 extends IUnknown{
    /**
     * The interface identifier for IAppxManifestReader6
     * @type {Guid}
     */
    static IID => Guid("{34deaca4-d3c0-4e3e-b312-e42625e3807e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} isNonQualifiedResourcePackage 
     * @returns {HRESULT} 
     */
    GetIsNonQualifiedResourcePackage(isNonQualifiedResourcePackage) {
        result := ComCall(3, this, "ptr", isNonQualifiedResourcePackage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
