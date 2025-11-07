#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRegisterProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRegisterProvider
     * @type {Guid}
     */
    static IID => Guid("{0c733ab9-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetURLMapping", "SetURLMapping", "UnregisterProvider"]

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {Pointer} dwReserved 
     * @returns {Guid} 
     */
    GetURLMapping(pwszURL, dwReserved) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        pclsidProvider := Guid()
        result := ComCall(3, this, "ptr", pwszURL, "ptr", dwReserved, "ptr", pclsidProvider, "HRESULT")
        return pclsidProvider
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {Pointer} dwReserved 
     * @param {Pointer<Guid>} rclsidProvider 
     * @returns {HRESULT} 
     */
    SetURLMapping(pwszURL, dwReserved, rclsidProvider) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(4, this, "ptr", pwszURL, "ptr", dwReserved, "ptr", rclsidProvider, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {Pointer} dwReserved 
     * @param {Pointer<Guid>} rclsidProvider 
     * @returns {HRESULT} 
     */
    UnregisterProvider(pwszURL, dwReserved, rclsidProvider) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(5, this, "ptr", pwszURL, "ptr", dwReserved, "ptr", rclsidProvider, "HRESULT")
        return result
    }
}
