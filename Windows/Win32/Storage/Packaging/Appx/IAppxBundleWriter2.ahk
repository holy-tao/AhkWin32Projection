#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a write-only object model for bundle packages.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxbundlewriter2
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleWriter2 extends IUnknown{
    /**
     * The interface identifier for IAppxBundleWriter2
     * @type {Guid}
     */
    static IID => Guid("{6d8fe971-01cc-49a0-b685-233851279962}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {Pointer<IStream>} inputStream 
     * @returns {HRESULT} 
     */
    AddExternalPackageReference(fileName, inputStream) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(3, this, "ptr", fileName, "ptr", inputStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
