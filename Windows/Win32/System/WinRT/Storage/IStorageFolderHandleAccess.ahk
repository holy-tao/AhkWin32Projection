#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\HANDLE.ahk
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
     * Creates a handle to a file that is in a storage folder.
     * @param {PWSTR} fileName The name of the file that you want to get a handle to.
     * @param {Integer} creationOptions The action to take on a file that exists or doesn't exist.
     * @param {Integer} accessOptions The level of access that a handle has on the file.
     * @param {Integer} sharingOptions The requested sharing mode of the handle.
     * @param {Integer} options The flags of the file handle.
     * @param {IOplockBreakingHandler} oplockBreakingHandler Not currently implemented.
     * @returns {HANDLE} The handle to the file.
     * @see https://docs.microsoft.com/windows/win32/api//windowsstoragecom/nf-windowsstoragecom-istoragefolderhandleaccess-create
     */
    Create(fileName, creationOptions, accessOptions, sharingOptions, options, oplockBreakingHandler) {
        fileName := fileName is String ? StrPtr(fileName) : fileName

        interopHandle := HANDLE()
        result := ComCall(3, this, "ptr", fileName, "int", creationOptions, "int", accessOptions, "int", sharingOptions, "uint", options, "ptr", oplockBreakingHandler, "ptr", interopHandle, "HRESULT")
        return interopHandle
    }
}
