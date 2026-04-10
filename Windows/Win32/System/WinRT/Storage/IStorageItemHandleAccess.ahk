#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk
#Include ..\..\..\Foundation\HANDLE.ahk

/**
 * Provides access to the operating system handle of a storage file.
 * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/nn-windowsstoragecom-istorageitemhandleaccess
 * @namespace Windows.Win32.System.WinRT.Storage
 */
class IStorageItemHandleAccess extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStorageItemHandleAccess
     * @type {Guid}
     */
    static IID => Guid("{5ca296b2-2c25-4d22-b785-b885c8201e6a}")

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
     * Creates a handle to a file.
     * @param {HANDLE_ACCESS_OPTIONS} accessOptions The level of access that a handle has on the file.
     * @param {HANDLE_SHARING_OPTIONS} sharingOptions The requested sharing mode of the handle.
     * @param {HANDLE_OPTIONS} options The flags of the file handle.
     * @param {IOplockBreakingHandler} oplockBreakingHandler Not currently implemented.
     * @returns {HANDLE} The handle to the file.
     * @see https://learn.microsoft.com/windows/win32/api/windowsstoragecom/nf-windowsstoragecom-istorageitemhandleaccess-create
     */
    Create(accessOptions, sharingOptions, options, oplockBreakingHandler) {
        interopHandle := HANDLE()
        result := ComCall(3, this, "int", accessOptions, "int", sharingOptions, "uint", options, "ptr", oplockBreakingHandler, "ptr", interopHandle, "HRESULT")
        return interopHandle
    }
}
