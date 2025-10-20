#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmFileScreenTemplate.ahk

/**
 * Used to save imported file screen templates.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nn-fsrmscreen-ifsrmfilescreentemplateimported
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmFileScreenTemplateImported extends IFsrmFileScreenTemplate{
    /**
     * The interface identifier for IFsrmFileScreenTemplateImported
     * @type {Guid}
     */
    static IID => Guid("{e1010359-3e5d-4ecd-9fe4-ef48622fdf30}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 22

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} overwrite 
     * @returns {HRESULT} 
     */
    get_OverwriteOnCommit(overwrite) {
        result := ComCall(22, this, "ptr", overwrite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} overwrite 
     * @returns {HRESULT} 
     */
    put_OverwriteOnCommit(overwrite) {
        result := ComCall(23, this, "short", overwrite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
