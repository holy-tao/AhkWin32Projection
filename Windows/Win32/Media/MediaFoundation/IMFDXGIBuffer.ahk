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
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvObject 
     * @returns {HRESULT} 
     */
    GetResource(riid, ppvObject) {
        result := ComCall(3, this, "ptr", riid, "ptr", ppvObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puSubresource 
     * @returns {HRESULT} 
     */
    GetSubresourceIndex(puSubresource) {
        result := ComCall(4, this, "uint*", puSubresource, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvObject 
     * @returns {HRESULT} 
     */
    GetUnknown(guid, riid, ppvObject) {
        result := ComCall(5, this, "ptr", guid, "ptr", riid, "ptr", ppvObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<IUnknown>} pUnkData 
     * @returns {HRESULT} 
     */
    SetUnknown(guid, pUnkData) {
        result := ComCall(6, this, "ptr", guid, "ptr", pUnkData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
