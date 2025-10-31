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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OverwriteOnCommit", "put_OverwriteOnCommit"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} overwrite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplateimported-get_overwriteoncommit
     */
    get_OverwriteOnCommit(overwrite) {
        result := ComCall(26, this, "ptr", overwrite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} overwrite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmquota/nf-fsrmquota-ifsrmquotatemplateimported-put_overwriteoncommit
     */
    put_OverwriteOnCommit(overwrite) {
        result := ComCall(27, this, "short", overwrite, "HRESULT")
        return result
    }
}
