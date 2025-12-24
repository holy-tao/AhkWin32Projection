#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * An IDXGIObject interface is a base interface for all DXGI objects; IDXGIObject supports associating caller-defined (private data) with an object and retrieval of an interface to the parent object.
 * @remarks
 * 
 * <b>IDXGIObject</b> implements base-class functionality for the following interfaces:
 *         
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiadapter">IDXGIAdapter</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgidevice">IDXGIDevice</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory">IDXGIFactory</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a>
 * </li>
 * </ul>
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/nn-dxgi-idxgiobject
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIObject extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIObject
     * @type {Guid}
     */
    static IID => Guid("{aec22fb8-76f3-4639-9be0-28eb43a67a2e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPrivateData", "SetPrivateDataInterface", "GetPrivateData", "GetParent"]

    /**
     * Sets application-defined data to the object and associates that data with a GUID.
     * @param {Pointer<Guid>} Name Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * A GUID that identifies the data. Use this GUID in a call to <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiobject-getprivatedata">GetPrivateData</a> to get the data.
     * @param {Integer} DataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The size of the object's data.
     * @param {Pointer} pData Type: <b>const void*</b>
     * 
     * A pointer to the object's data.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> values.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgiobject-setprivatedata
     */
    SetPrivateData(Name, DataSize, pData) {
        result := ComCall(3, this, "ptr", Name, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Set an interface in the object's private data.
     * @param {Pointer<Guid>} Name Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * A GUID identifying the interface.
     * @param {IUnknown} pUnknown Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>*</b>
     * 
     * The interface to set.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgiobject-setprivatedatainterface
     */
    SetPrivateDataInterface(Name, pUnknown) {
        result := ComCall(4, this, "ptr", Name, "ptr", pUnknown, "HRESULT")
        return result
    }

    /**
     * Get a pointer to the object's data.
     * @param {Pointer<Guid>} Name Type: <b><a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-oaut/6e7d7108-c213-40bc-8294-ac13fe68fd50">REFGUID</a></b>
     * 
     * A GUID identifying the data.
     * @param {Pointer<Integer>} pDataSize Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * The size of the data.
     * @param {Pointer} pData Type: <b>void*</b>
     * 
     * Pointer to the data.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgiobject-getprivatedata
     */
    GetPrivateData(Name, pDataSize, pData) {
        pDataSizeMarshal := pDataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", Name, pDataSizeMarshal, pDataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Gets the parent of the object.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The ID of the requested interface.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * The address of a pointer to the parent object.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi/nf-dxgi-idxgiobject-getparent
     */
    GetParent(riid) {
        result := ComCall(6, this, "ptr", riid, "ptr*", &ppParent := 0, "HRESULT")
        return ppParent
    }
}
