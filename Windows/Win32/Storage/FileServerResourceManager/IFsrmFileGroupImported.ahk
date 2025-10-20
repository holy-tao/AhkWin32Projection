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
     * 
     * @param {Pointer<VARIANT_BOOL>} overwrite 
     * @returns {HRESULT} 
     */
    get_OverwriteOnCommit(overwrite) {
        result := ComCall(18, this, "ptr", overwrite, "int")
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
        result := ComCall(19, this, "short", overwrite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
