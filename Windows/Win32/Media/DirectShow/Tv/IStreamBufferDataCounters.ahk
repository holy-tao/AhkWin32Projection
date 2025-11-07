#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\SBE_PIN_DATA.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IStreamBufferDataCounters interface returns performance statistics for the Stream Buffer filters. This interface is exposed by the pins on the Stream Buffer Sink filter and the Stream Buffer Source filter.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferDataCounters)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambufferdatacounters
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferDataCounters extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBufferDataCounters
     * @type {Guid}
     */
    static IID => Guid("{9d2a2563-31ab-402e-9a6b-adb903489440}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetData", "ResetData"]

    /**
     * 
     * @returns {SBE_PIN_DATA} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferdatacounters-getdata
     */
    GetData() {
        pPinData := SBE_PIN_DATA()
        result := ComCall(3, this, "ptr", pPinData, "HRESULT")
        return pPinData
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambufferdatacounters-resetdata
     */
    ResetData() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
