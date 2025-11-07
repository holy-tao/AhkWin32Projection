#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/shell/nn-shobjidl-istorageprovidercopyhook
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IStorageProviderCopyHook extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CopyCallback"]

    /**
     * 
     * @param {HWND} hwnd 
     * @param {Integer} operation 
     * @param {Integer} flags 
     * @param {PWSTR} srcFile 
     * @param {Integer} srcAttribs 
     * @param {PWSTR} destFile 
     * @param {Integer} destAttribs 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/shell/nf-shobjidl-istorageprovidercopyhook-copycallback
     */
    CopyCallback(hwnd, operation, flags, srcFile, srcAttribs, destFile, destAttribs) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        srcFile := srcFile is String ? StrPtr(srcFile) : srcFile
        destFile := destFile is String ? StrPtr(destFile) : destFile

        result := ComCall(3, this, "ptr", hwnd, "uint", operation, "uint", flags, "ptr", srcFile, "uint", srcAttribs, "ptr", destFile, "uint", destAttribs, "uint*", &result := 0, "HRESULT")
        return result
    }
}
