#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmFileScreenTemplate.ahk

/**
 * Used to save imported file screen templates.
 * @see https://learn.microsoft.com/windows/win32/api//content/fsrmscreen/nn-fsrmscreen-ifsrmfilescreentemplateimported
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmFileScreenTemplateImported extends IFsrmFileScreenTemplate{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OverwriteOnCommit", "put_OverwriteOnCommit"]

    /**
     * @type {VARIANT_BOOL} 
     */
    OverwriteOnCommit {
        get => this.get_OverwriteOnCommit()
        set => this.put_OverwriteOnCommit(value)
    }

    /**
     * Retrieves or sets a value that determines whether a file screen template is overwritten if it exists when the template is imported. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplateimported-get_overwriteoncommit
     */
    get_OverwriteOnCommit() {
        result := ComCall(22, this, "short*", &overwrite := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return overwrite
    }

    /**
     * Retrieves or sets a value that determines whether a file screen template is overwritten if it exists when the template is imported. (Put)
     * @param {VARIANT_BOOL} overwrite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplateimported-put_overwriteoncommit
     */
    put_OverwriteOnCommit(overwrite) {
        result := ComCall(23, this, "short", overwrite, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
