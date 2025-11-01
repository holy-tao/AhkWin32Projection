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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStringValue", "GetAppUserModelId"]

    /**
     * 
     * @param {PWSTR} name 
     * @param {Pointer<PWSTR>} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestapplication-getstringvalue
     */
    GetStringValue(name, value) {
        name := name is String ? StrPtr(name) : name

        result := ComCall(3, this, "ptr", name, "ptr", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} appUserModelId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/appxpackaging/nf-appxpackaging-iappxmanifestapplication-getappusermodelid
     */
    GetAppUserModelId(appUserModelId) {
        result := ComCall(4, this, "ptr", appUserModelId, "HRESULT")
        return result
    }
}
