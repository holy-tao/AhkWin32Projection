#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IResourceConsumer interface provides a callback mechanism for objects using the IResourceManager interface.An object must implement IResourceConsumer if it uses the IResourceManager interface to request resources from the filter graph manager.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iresourceconsumer
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IResourceConsumer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IResourceConsumer
     * @type {Guid}
     */
    static IID => Guid("{56a868ad-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcquireResource", "ReleaseResource"]

    /**
     * 
     * @param {Integer} idResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iresourceconsumer-acquireresource
     */
    AcquireResource(idResource) {
        result := ComCall(3, this, "int", idResource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} idResource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iresourceconsumer-releaseresource
     */
    ReleaseResource(idResource) {
        result := ComCall(4, this, "int", idResource, "HRESULT")
        return result
    }
}
