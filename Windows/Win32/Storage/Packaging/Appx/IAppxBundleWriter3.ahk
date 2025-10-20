#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides a write-only object model for bundle packages.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxbundlewriter3
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxBundleWriter3 extends IUnknown{
    /**
     * The interface identifier for IAppxBundleWriter3
     * @type {Guid}
     */
    static IID => Guid("{ad711152-f969-4193-82d5-9ddf2786d21a}")

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
    AddPackageReference(fileName, inputStream) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(3, this, "ptr", fileName, "ptr", inputStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} hashMethodString 
     * @returns {HRESULT} 
     */
    Close(hashMethodString) {
        hashMethodString := hashMethodString is String ? StrPtr(hashMethodString) : hashMethodString

        result := ComCall(4, this, "ptr", hashMethodString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
