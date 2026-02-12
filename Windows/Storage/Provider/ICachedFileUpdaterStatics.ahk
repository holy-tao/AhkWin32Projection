#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage.Provider
 * @version WindowsRuntime 1.4
 */
class ICachedFileUpdaterStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICachedFileUpdaterStatics
     * @type {Guid}
     */
    static IID => Guid("{9fc90920-7bcf-4888-a81e-102d7034d7ce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetUpdateInformation"]

    /**
     * 
     * @param {IStorageFile} file_ 
     * @param {HSTRING} contentId 
     * @param {Integer} readMode 
     * @param {Integer} writeMode 
     * @param {Integer} options 
     * @returns {HRESULT} 
     */
    SetUpdateInformation(file_, contentId, readMode, writeMode, options) {
        if(contentId is String) {
            pin := HSTRING.Create(contentId)
            contentId := pin.Value
        }
        contentId := contentId is Win32Handle ? NumGet(contentId, "ptr") : contentId

        result := ComCall(6, this, "ptr", file_, "ptr", contentId, "int", readMode, "int", writeMode, "uint", options, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
