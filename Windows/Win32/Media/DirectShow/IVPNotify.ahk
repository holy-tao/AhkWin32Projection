#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IVPBaseNotify.ahk

/**
 * Supports a private communication mechanism between the Overlay Mixer filter and a VPE decoder filter that represents a hardware decoder.Only the Overlay Mixer filter implements this interface. Applications should never use it.
 * @remarks
 * 
  * Include Vptype.h before Vpnotify.h.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vpnotify/nn-vpnotify-ivpnotify
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IVPNotify extends IVPBaseNotify{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVPNotify
     * @type {Guid}
     */
    static IID => Guid("{c76794a1-d6c5-11d0-9e69-00c04fd7c15b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDeinterlaceMode", "GetDeinterlaceMode"]

    /**
     * 
     * @param {Integer} mode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vpnotify/nf-vpnotify-ivpnotify-setdeinterlacemode
     */
    SetDeinterlaceMode(mode) {
        result := ComCall(4, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/vpnotify/nf-vpnotify-ivpnotify-getdeinterlacemode
     */
    GetDeinterlaceMode(pMode) {
        result := ComCall(5, this, "int*", pMode, "HRESULT")
        return result
    }
}
