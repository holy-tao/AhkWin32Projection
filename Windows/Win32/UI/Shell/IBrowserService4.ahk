#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBrowserService3.ahk

/**
 * Deprecated.
 * @remarks
 * 
 * This interface also provides the methods of the <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-ibrowserservice">IBrowserService</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-ibrowserservice2">IBrowserService2</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/shdeprecated/nn-shdeprecated-ibrowserservice3">IBrowserService3</a> interfaces, from which it inherits.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nn-shdeprecated-ibrowserservice4
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IBrowserService4 extends IBrowserService3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBrowserService4
     * @type {Guid}
     */
    static IID => Guid("{639f1bff-e135-4096-abd8-e0f504d649a4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 97

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ActivateView", "SaveViewState", "_ResizeAllBorders"]

    /**
     * Deprecated.
     * @param {BOOL} fPendingView Type: <b>BOOL</b>
     * 
     * Specifies whether the view is pending.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice4-activateview
     */
    ActivateView(fPendingView) {
        result := ComCall(97, this, "int", fPendingView, "HRESULT")
        return result
    }

    /**
     * Deprecated.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice4-saveviewstate
     */
    SaveViewState() {
        result := ComCall(98, this, "HRESULT")
        return result
    }

    /**
     * Deprecated.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shdeprecated/nf-shdeprecated-ibrowserservice4-_resizeallborders
     */
    _ResizeAllBorders() {
        result := ComCall(99, this, "HRESULT")
        return result
    }
}
