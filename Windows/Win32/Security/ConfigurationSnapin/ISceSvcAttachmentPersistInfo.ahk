#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ISceSvcAttachmentPersistInfo interface retrieves any modified configuration or analysis information from an attachment snap-in.
 * @see https://docs.microsoft.com/windows/win32/api//scesvc/nn-scesvc-iscesvcattachmentpersistinfo
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 * @version v4.0.30319
 */
class ISceSvcAttachmentPersistInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISceSvcAttachmentPersistInfo
     * @type {Guid}
     */
    static IID => Guid("{6d90e0d0-200d-11d1-affb-00c04fb984f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Save", "IsDirty", "FreeBuffer"]

    /**
     * 
     * @param {Pointer<Integer>} lpTemplateName 
     * @param {Pointer<Pointer<Void>>} scesvcHandle 
     * @param {Pointer<Pointer<Void>>} ppvData 
     * @param {Pointer<BOOL>} pbOverwriteAll 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/scesvc/nf-scesvc-iscesvcattachmentpersistinfo-save
     */
    Save(lpTemplateName, scesvcHandle, ppvData, pbOverwriteAll) {
        result := ComCall(3, this, "char*", lpTemplateName, "ptr*", scesvcHandle, "ptr*", ppvData, "ptr", pbOverwriteAll, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lpTemplateName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/scesvc/nf-scesvc-iscesvcattachmentpersistinfo-isdirty
     */
    IsDirty(lpTemplateName) {
        result := ComCall(4, this, "char*", lpTemplateName, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/scesvc/nf-scesvc-iscesvcattachmentpersistinfo-freebuffer
     */
    FreeBuffer(pvData) {
        result := ComCall(5, this, "ptr", pvData, "HRESULT")
        return result
    }
}
