#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmFileGroup.ahk

/**
 * Used to configure imported file group objects.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nn-fsrmscreen-ifsrmfilegroupimported
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmFileGroupImported extends IFsrmFileGroup{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmFileGroupImported
     * @type {Guid}
     */
    static IID => Guid("{ad55f10b-5f11-4be7-94ef-d9ee2e470ded}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

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
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupimported-get_overwriteoncommit
     */
    get_OverwriteOnCommit() {
        result := ComCall(18, this, "short*", &overwrite := 0, "HRESULT")
        return overwrite
    }

    /**
     * 
     * @param {VARIANT_BOOL} overwrite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilegroupimported-put_overwriteoncommit
     */
    put_OverwriteOnCommit(overwrite) {
        result := ComCall(19, this, "short", overwrite, "HRESULT")
        return result
    }
}
