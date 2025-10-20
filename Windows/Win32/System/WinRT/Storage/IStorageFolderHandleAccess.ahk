#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Provides access to the operating system handle of a storage folder.
 * @see https://docs.microsoft.com/windows/win32/api//windowsstoragecom/nn-windowsstoragecom-istoragefolderhandleaccess
 * @namespace Windows.Win32.System.WinRT.Storage
 * @version v4.0.30319
 */
class IStorageFolderHandleAccess extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageFolderHandleAccess
     * @type {Guid}
     */
    static IID => Guid("{df19938f-5462-48a0-be65-d2a3271a08d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * 
     * @param {PWSTR} fileName 
     * @param {Integer} creationOptions 
     * @param {Integer} accessOptions 
     * @param {Integer} sharingOptions 
     * @param {Integer} options 
     * @param {IOplockBreakingHandler} oplockBreakingHandler 
     * @param {Pointer<HANDLE>} interopHandle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/nf-windowsstoragecom-istoragefolderhandleaccess-create
     */
    Create(fileName, creationOptions, accessOptions, sharingOptions, options, oplockBreakingHandler, interopHandle) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        result := ComCall(3, this, "ptr", fileName, "int", creationOptions, "int", accessOptions, "int", sharingOptions, "uint", options, "ptr", oplockBreakingHandler, "ptr", interopHandle, "HRESULT")
        return result
    }
}
