#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Provides access to attribute values of the application.
 * @see https://docs.microsoft.com/windows/win32/api//appxpackaging/nn-appxpackaging-iappxmanifestapplication
 * @namespace Windows.Win32.Storage.Packaging.Appx
 * @version v4.0.30319
 */
class IAppxManifestApplication extends IUnknown{
    /**
     * The interface identifier for IAppxManifestApplication
     * @type {Guid}
     */
    static IID => Guid("{5da89bf4-3773-46be-b650-7e744863b7e8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {PWSTR} name 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     */
    GetStringValue(name, value) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(3, this, "ptr", name, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} appUserModelId 
     * @returns {HRESULT} 
     */
    GetAppUserModelId(appUserModelId) {
        result := ComCall(4, this, "ptr", appUserModelId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
