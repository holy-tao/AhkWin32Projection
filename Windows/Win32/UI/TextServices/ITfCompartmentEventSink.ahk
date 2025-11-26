#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfCompartmentEventSink interface is implemented by a client (application or text service) and used by the TSF manager to notify the client when compartment data changes.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcompartmenteventsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfCompartmentEventSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfCompartmentEventSink
     * @type {Guid}
     */
    static IID => Guid("{743abd5f-f26d-48df-8cc5-238492419b64}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnChange"]

    /**
     * ITfCompartmentEventSink::OnChange method
     * @param {Pointer<Guid>} rguid Contains a GUID that identifies the compartment that changed.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcompartmenteventsink-onchange
     */
    OnChange(rguid) {
        result := ComCall(3, this, "ptr", rguid, "HRESULT")
        return result
    }
}
