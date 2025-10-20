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
     * 
     * @param {Integer} lStatus 
     * @param {Integer} lFlags 
     * @returns {HRESULT} 
     */
    SetStatus(lStatus, lFlags) {
        result := ComCall(3, this, "int", lStatus, "int", lFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
