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
     * 
     * @param {Integer} index 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvAdapter 
     * @returns {HRESULT} 
     */
    GetAdapter(index, riid, ppvAdapter) {
        result := ComCall(3, this, "uint", index, "ptr", riid, "ptr", ppvAdapter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetAdapterCount() {
        result := ComCall(4, this, "uint")
        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    IsStale() {
        result := ComCall(5, this, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvFactory 
     * @returns {HRESULT} 
     */
    GetFactory(riid, ppvFactory) {
        result := ComCall(6, this, "ptr", riid, "ptr", ppvFactory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} numPreferences 
     * @param {Pointer<UInt32>} preferences 
     * @returns {HRESULT} 
     */
    Sort(numPreferences, preferences) {
        result := ComCall(7, this, "uint", numPreferences, "uint*", preferences, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} preference 
     * @returns {Boolean} 
     */
    IsAdapterPreferenceSupported(preference) {
        result := ComCall(8, this, "uint", preference, "int")
        return result
    }
}
