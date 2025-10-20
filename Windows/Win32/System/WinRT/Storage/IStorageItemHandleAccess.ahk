#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Provides access to the operating system handle of a storage file.
 * @see https://docs.microsoft.com/windows/win32/api//windowsstoragecom/nn-windowsstoragecom-istorageitemhandleaccess
 * @namespace Windows.Win32.System.WinRT.Storage
 * @version v4.0.30319
 */
class IStorageItemHandleAccess extends IUnknown{
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
     * 
     * @param {Integer} accessOptions 
     * @param {Integer} sharingOptions 
     * @param {Integer} options 
     * @param {Pointer<IOplockBreakingHandler>} oplockBreakingHandler 
     * @param {Pointer<HANDLE>} interopHandle 
     * @returns {HRESULT} 
     */
    Create(accessOptions, sharingOptions, options, oplockBreakingHandler, interopHandle) {
        result := ComCall(3, this, "int", accessOptions, "int", sharingOptions, "uint", options, "ptr", oplockBreakingHandler, "ptr", interopHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
