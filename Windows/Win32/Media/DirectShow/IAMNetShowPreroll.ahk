#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IAMNetShowPreroll interface sets and retrieves the preroll settings for the legacy Windows Media Player 6.4 source filter. The Windows Media Source filter implements this interface. The filter's default preroll time is five seconds.
 * @remarks
 * 
 * To define the interface identifier, include the header file Initguid.h before Qnetwork.h, but after Dshow.h and other header files:
 * 
 * <pre class="syntax" xml:space="preserve"><code>#include &lt;dshow.h&gt;
 * 
 * @see https://docs.microsoft.com/windows/win32/api//qnetwork/nn-qnetwork-iamnetshowpreroll
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IAMNetShowPreroll extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAMNetShowPreroll
     * @type {Guid}
     */
    static IID => Guid("{aae7e4e2-6388-11d1-8d93-006097c9a2b2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_Preroll", "get_Preroll"]

    /**
     */
    Preroll {
        get => this.get_Preroll()
        set => this.put_Preroll(value)
    }

    /**
     * 
     * @param {VARIANT_BOOL} fPreroll 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowpreroll-put_preroll
     */
    put_Preroll(fPreroll) {
        result := ComCall(7, this, "short", fPreroll, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfPreroll 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/qnetwork/nf-qnetwork-iamnetshowpreroll-get_preroll
     */
    get_Preroll(pfPreroll) {
        pfPrerollMarshal := pfPreroll is VarRef ? "short*" : "ptr"

        result := ComCall(8, this, pfPrerollMarshal, pfPreroll, "HRESULT")
        return result
    }
}
