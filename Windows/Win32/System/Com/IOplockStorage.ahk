#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IOplockStorage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOplockStorage
     * @type {Guid}
     */
    static IID => Guid("{8d19c834-8879-11d1-83e9-00c04fc2c6d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateStorageEx", "OpenStorageEx"]

    /**
     * 
     * @param {PWSTR} pwcsName 
     * @param {Integer} grfMode 
     * @param {Integer} stgfmt 
     * @param {Integer} grfAttrs 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateStorageEx(pwcsName, grfMode, stgfmt, grfAttrs, riid) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        result := ComCall(3, this, "ptr", pwcsName, "uint", grfMode, "uint", stgfmt, "uint", grfAttrs, "ptr", riid, "ptr*", &ppstgOpen := 0, "HRESULT")
        return ppstgOpen
    }

    /**
     * 
     * @param {PWSTR} pwcsName 
     * @param {Integer} grfMode 
     * @param {Integer} stgfmt 
     * @param {Integer} grfAttrs 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    OpenStorageEx(pwcsName, grfMode, stgfmt, grfAttrs, riid) {
        pwcsName := pwcsName is String ? StrPtr(pwcsName) : pwcsName

        result := ComCall(4, this, "ptr", pwcsName, "uint", grfMode, "uint", stgfmt, "uint", grfAttrs, "ptr", riid, "ptr*", &ppstgOpen := 0, "HRESULT")
        return ppstgOpen
    }
}
