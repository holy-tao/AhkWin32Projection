#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The **IDXCoreAdapterList** interface implements methods for retrieving adapter items from a generated list, as well as details about the list.
 * @see https://docs.microsoft.com/windows/win32/api//dxcore_interface/nn-dxcore_interface-idxcoreadapterlist
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class IDXCoreAdapterList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXCoreAdapterList
     * @type {Guid}
     */
    static IID => Guid("{526c7776-40e9-459b-b711-f32ad76dfc28}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAdapter", "GetAdapterCount", "IsStale", "GetFactory", "Sort", "IsAdapterPreferenceSupported"]

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvAdapter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterlist-getadapter
     */
    GetAdapter(index, riid, ppvAdapter) {
        result := ComCall(3, this, "uint", index, "ptr", riid, "ptr*", ppvAdapter, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterlist-getadaptercount
     */
    GetAdapterCount() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterlist-isstale
     */
    IsStale() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvFactory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterlist-getfactory
     */
    GetFactory(riid, ppvFactory) {
        result := ComCall(6, this, "ptr", riid, "ptr*", ppvFactory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} numPreferences 
     * @param {Pointer<Integer>} preferences 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterlist-sort
     */
    Sort(numPreferences, preferences) {
        preferencesMarshal := preferences is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "uint", numPreferences, preferencesMarshal, preferences, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} preference 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/windows/win32/api/dxcore_interface/nf-dxcore_interface-idxcoreadapterlist-isadapterpreferencesupported
     */
    IsAdapterPreferenceSupported(preference) {
        result := ComCall(8, this, "uint", preference, "int")
        return result
    }
}
