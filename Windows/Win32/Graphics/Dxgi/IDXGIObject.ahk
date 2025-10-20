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
     * 
     * @param {Pointer<Guid>} Name 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiobject-setprivatedata
     */
    SetPrivateData(Name, DataSize, pData) {
        result := ComCall(3, this, "ptr", Name, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Name 
     * @param {IUnknown} pUnknown 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiobject-setprivatedatainterface
     */
    SetPrivateDataInterface(Name, pUnknown) {
        result := ComCall(4, this, "ptr", Name, "ptr", pUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} Name 
     * @param {Pointer<Integer>} pDataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxgi/nf-dxgi-idxgiobject-getprivatedata
     */
    GetPrivateData(Name, pDataSize, pData) {
        result := ComCall(5, this, "ptr", Name, "uint*", pDataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * Retrieves a handle to the specified window's parent or owner.
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppParent 
     * @returns {HRESULT} Type: <b>HWND</b>
     * 
     * If the window is a child window, the return value is a handle to the parent window. If the window is a top-level window with the <b>WS_POPUP</b> style, the return value is a handle to the owner window. 
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * This function typically fails for one of the following reasons:
     * 
     * 
     * <ul>
     * <li>The window is a top-level window that is unowned or does not have the <b>WS_POPUP</b> style. </li>
     * <li>The owner window has <b>WS_POPUP</b> style.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getparent
     */
    GetParent(riid, ppParent) {
        result := ComCall(6, this, "ptr", riid, "ptr*", ppParent, "HRESULT")
        return result
    }
}
