#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a buffer that contains a Microsoft DirectX Graphics Infrastructure (DXGI)surface.
 * @remarks
 * 
  * To create a DXGImedia buffer, first create the DXGIsurface. Then call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatedxgisurfacebuffer">MFCreateDXGISurfaceBuffer</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfdxgibuffer
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFDXGIBuffer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFDXGIBuffer
     * @type {Guid}
     */
    static IID => Guid("{e7174cfa-1c9e-48b1-8866-626226bfc258}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResource", "GetSubresourceIndex", "GetUnknown", "SetUnknown"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgibuffer-getresource
     */
    GetResource(riid) {
        result := ComCall(3, this, "ptr", riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgibuffer-getsubresourceindex
     */
    GetSubresourceIndex() {
        result := ComCall(4, this, "uint*", &puSubresource := 0, "HRESULT")
        return puSubresource
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgibuffer-getunknown
     */
    GetUnknown(guid, riid) {
        result := ComCall(5, this, "ptr", guid, "ptr", riid, "ptr*", &ppvObject := 0, "HRESULT")
        return ppvObject
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {IUnknown} pUnkData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfdxgibuffer-setunknown
     */
    SetUnknown(guid, pUnkData) {
        result := ComCall(6, this, "ptr", guid, "ptr", pUnkData, "HRESULT")
        return result
    }
}
