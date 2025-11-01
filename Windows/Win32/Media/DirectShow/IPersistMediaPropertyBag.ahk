#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IPersist.ahk

/**
 * The IPersistMediaPropertyBag interface sets and retrieves INFO and DISP chunks in Audio-Video Interleaved (AVI) streams.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ipersistmediapropertybag
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IPersistMediaPropertyBag extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistMediaPropertyBag
     * @type {Guid}
     */
    static IID => Guid("{5738e040-b67f-11d0-bd4d-00a0c911ce86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitNew", "Load", "Save"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipersistmediapropertybag-initnew
     */
    InitNew() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMediaPropertyBag} pPropBag 
     * @param {IErrorLog} pErrorLog 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipersistmediapropertybag-load
     */
    Load(pPropBag, pErrorLog) {
        result := ComCall(5, this, "ptr", pPropBag, "ptr", pErrorLog, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMediaPropertyBag} pPropBag 
     * @param {BOOL} fClearDirty 
     * @param {BOOL} fSaveAllProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipersistmediapropertybag-save
     */
    Save(pPropBag, fClearDirty, fSaveAllProperties) {
        result := ComCall(6, this, "ptr", pPropBag, "int", fClearDirty, "int", fSaveAllProperties, "HRESULT")
        return result
    }
}
