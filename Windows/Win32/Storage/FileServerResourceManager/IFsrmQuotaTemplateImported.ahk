#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmQuotaTemplate.ahk

/**
 * Used to modify and save imported quota templates.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmquota/nn-fsrmquota-ifsrmquotatemplateimported
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmQuotaTemplateImported extends IFsrmQuotaTemplate{
    /**
     * The interface identifier for IFsrmQuotaTemplateImported
     * @type {Guid}
     */
    static IID => Guid("{9a2bf113-a329-44cc-809a-5c00fce8da40}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 26

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} overwrite 
     * @returns {HRESULT} 
     */
    get_OverwriteOnCommit(overwrite) {
        result := ComCall(26, this, "ptr", overwrite, "int")
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
        result := ComCall(27, this, "short", overwrite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
