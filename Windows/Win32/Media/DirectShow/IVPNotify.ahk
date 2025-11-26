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
     * Sets the mode (such as bob or weave).
     * @param {Integer} mode Specified mode. This value is a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vptype/ne-vptype-amvp_mode">AMVP_MODE</a> enumerated data type.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//vpnotify/nf-vpnotify-ivpnotify-setdeinterlacemode
     */
    SetDeinterlaceMode(mode) {
        result := ComCall(4, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * The GetDeinterlaceMode method retrieves the mode (such as bob or weave).
     * @param {Pointer<Integer>} pMode Pointer to the retrieved mode. This value is a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vptype/ne-vptype-amvp_mode">AMVP_MODE</a> enumerated data type.
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//vpnotify/nf-vpnotify-ivpnotify-getdeinterlacemode
     */
    GetDeinterlaceMode(pMode) {
        pModeMarshal := pMode is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pModeMarshal, pMode, "HRESULT")
        return result
    }
}
