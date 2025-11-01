#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumMcastScope interface provides COM-standard enumeration methods for the IMcastScope interface. The IMcastAddressAllocation::EnumerateScopes method returns a pointer to IEnumMcastScope.
 * @see https://docs.microsoft.com/windows/win32/api//mdhcp/nn-mdhcp-ienummcastscope
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class IEnumMcastScope extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumMcastScope
     * @type {Guid}
     */
    static IID => Guid("{df0daf09-a289-11d1-8697-006008b0e5d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Reset", "Skip", "Clone"]

    /**
     * 
     * @param {Integer} celt 
     * @param {Pointer<IMcastScope>} ppScopes 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-ienummcastscope-next
     */
    Next(celt, ppScopes, pceltFetched) {
        result := ComCall(3, this, "uint", celt, "ptr*", ppScopes, "uint*", pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-ienummcastscope-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-ienummcastscope-skip
     */
    Skip(celt) {
        result := ComCall(5, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumMcastScope>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mdhcp/nf-mdhcp-ienummcastscope-clone
     */
    Clone(ppEnum) {
        result := ComCall(6, this, "ptr*", ppEnum, "HRESULT")
        return result
    }
}
