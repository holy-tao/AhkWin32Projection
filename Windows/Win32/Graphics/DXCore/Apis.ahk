#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.DXCore
 */

;@region Functions
/**
 * Creates a DXCore adapter factory, which you can use to generate further DXCore objects.
 * @remarks
 * For the duration of time that a reference exists on an [IDXCoreAdapterFactory](../dxcore_interface/nn-dxcore_interface-idxcoreadapterfactory.md) interface, an [IDXCoreAdapterList](../dxcore_interface/nn-dxcore_interface-idxcoreadapterlist.md) interface, or an [IDXCoreAdapter](../dxcore_interface/nn-dxcore_interface-idxcoreadapter.md) interface, additional calls to **DXCoreCreateAdapterFactory**, [IDXCoreAdapterList::GetFactory](../dxcore_interface/nf-dxcore_interface-idxcoreadapterlist-getfactory.md), or [IDXCoreAdapter::GetFactory](../dxcore_interface/nf-dxcore_interface-idxcoreadapter-getfactory.md) will return pointers to the same object, increasing the reference count of the **IDXCoreAdapterFactory** interface.
 * @param {Pointer<Guid>} riid 
 * @returns {Pointer<Void>} 
 * @see https://learn.microsoft.com/windows/win32/dxcore/dxcore/nf-dxcore-dxcorecreateadapterfactory
 */
export DXCoreCreateAdapterFactory(riid) {
    result := DllCall("DXCORE.dll\DXCoreCreateAdapterFactory", Guid.Ptr, riid, "ptr*", &ppvFactory := 0, "HRESULT")
    return ppvFactory
}

;@endregion Functions
