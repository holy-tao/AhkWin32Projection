#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IStorageProviderCopyHook extends IUnknown{
    /**
     * The interface identifier for IStorageProviderCopyHook
     * @type {Guid}
     */
    static IID => Guid("{7bf992a9-af7a-4dba-b2e5-4d080b1ecbc6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} operation 
     * @param {Integer} flags 
     * @param {PWSTR} srcFile 
     * @param {Integer} srcAttribs 
     * @param {PWSTR} destFile 
     * @param {Integer} destAttribs 
     * @param {Pointer<UInt32>} result 
     * @returns {HRESULT} 
     */
    CopyCallback(hwnd, operation, flags, srcFile, srcAttribs, destFile, destAttribs, result) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        srcFile := srcFile is String ? StrPtr(srcFile) : srcFile
        destFile := destFile is String ? StrPtr(destFile) : destFile

        result := ComCall(3, this, "ptr", hwnd, "uint", operation, "uint", flags, "ptr", srcFile, "uint", srcAttribs, "ptr", destFile, "uint", destAttribs, "uint*", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
