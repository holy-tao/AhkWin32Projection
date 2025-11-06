#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IFsrmDerivedObjectsResult.ahk
#Include .\IFsrmFileScreenBase.ahk

/**
 * Used to configure templates from which new file screens can be derived.
 * @see https://docs.microsoft.com/windows/win32/api//fsrmscreen/nn-fsrmscreen-ifsrmfilescreentemplate
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmFileScreenTemplate extends IFsrmFileScreenBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmFileScreenTemplate
     * @type {Guid}
     */
    static IID => Guid("{205bebf8-dd93-452a-95a6-32b566b35828}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "CopyTemplate", "CommitAndUpdateDerived"]

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplate-get_name
     */
    get_Name() {
        name := BSTR()
        result := ComCall(18, this, "ptr", name, "HRESULT")
        return name
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplate-put_name
     */
    put_Name(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(19, this, "ptr", name, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} fileScreenTemplateName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplate-copytemplate
     */
    CopyTemplate(fileScreenTemplateName) {
        fileScreenTemplateName := fileScreenTemplateName is String ? BSTR.Alloc(fileScreenTemplateName).Value : fileScreenTemplateName

        result := ComCall(20, this, "ptr", fileScreenTemplateName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} commitOptions 
     * @param {Integer} applyOptions 
     * @returns {IFsrmDerivedObjectsResult} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmscreen/nf-fsrmscreen-ifsrmfilescreentemplate-commitandupdatederived
     */
    CommitAndUpdateDerived(commitOptions, applyOptions) {
        result := ComCall(21, this, "int", commitOptions, "int", applyOptions, "ptr*", &derivedObjectsResult := 0, "HRESULT")
        return IFsrmDerivedObjectsResult(derivedObjectsResult)
    }
}
