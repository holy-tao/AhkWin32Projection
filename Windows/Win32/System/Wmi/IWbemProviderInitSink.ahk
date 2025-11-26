#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IWbemProviderInitSink interface is implemented by WMI and called by providers to report initialization status.
 * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nn-wbemprov-iwbemproviderinitsink
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class IWbemProviderInitSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWbemProviderInitSink
     * @type {Guid}
     */
    static IID => Guid("{1be41571-91dd-11d1-aeb2-00c04fb68820}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetStatus"]

    /**
     * The IWbemProviderInitSink::SetStatus method indicates to Windows Management whether a provider is fully or partially initialized.
     * @param {Integer} lStatus 
     * @param {Integer} lFlags Reserved. This parameter must be 0 (zero).
     * @returns {HRESULT} This method always returns <b>WBEM_S_NO_ERROR</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wbemprov/nf-wbemprov-iwbemproviderinitsink-setstatus
     */
    SetStatus(lStatus, lFlags) {
        result := ComCall(3, this, "int", lStatus, "int", lFlags, "HRESULT")
        return result
    }
}
