#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * IDirect3DDxgiInterfaceAccess is a COM interface, which must be implemented by anything that implements IDirect3DDevice or IDirect3DSurface.
 * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.directx.direct3d11.interop/ns-windows-graphics-directx-direct3d11-interop-idirect3ddxgiinterfaceaccess
 * @namespace Windows.Win32.System.WinRT.Direct3D11
 * @version v4.0.30319
 */
class IDirect3DDxgiInterfaceAccess extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DDxgiInterfaceAccess
     * @type {Guid}
     */
    static IID => Guid("{a9b3d012-3df2-4ee3-b8d1-8695f457d3c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInterface"]

    /**
     * Retrieves the DXGI interface that is wrapped by the IDirect3DDxgiInterfaceAccess object.
     * @param {Pointer<Guid>} iid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in p.
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * A pointer to a memory block that receives a pointer to the the DXGI interface.
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.directx.direct3d11.interop/nf-windows-graphics-directx-direct3d11-interop-idirect3ddxgiinterfaceaccess-getinterface
     */
    GetInterface(iid) {
        result := ComCall(3, this, "ptr", iid, "ptr*", &p := 0, "HRESULT")
        return p
    }
}
