#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnhancedStorageACT2.ahk

/**
 * @namespace Windows.Win32.Storage.EnhancedStorage
 * @version v4.0.30319
 */
class IEnhancedStorageACT3 extends IEnhancedStorageACT2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnhancedStorageACT3
     * @type {Guid}
     */
    static IID => Guid("{022150a1-113d-11df-bb61-001aa01bbc58}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UnauthorizeEx", "IsQueueFrozen", "GetShellExtSupport"]

    /**
     * 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    UnauthorizeEx(dwFlags) {
        result := ComCall(11, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsQueueFrozen() {
        result := ComCall(12, this, "int*", &pIsQueueFrozen := 0, "HRESULT")
        return pIsQueueFrozen
    }

    /**
     * 
     * @returns {BOOL} 
     */
    GetShellExtSupport() {
        result := ComCall(13, this, "int*", &pShellExtSupport := 0, "HRESULT")
        return pShellExtSupport
    }
}
