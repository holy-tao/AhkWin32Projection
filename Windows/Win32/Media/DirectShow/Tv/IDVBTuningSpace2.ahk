#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IDVBTuningSpace.ahk

/**
 * The IDVBTuningSpace2 interface is implemented on the DVBTuningSpace object. It provides methods for working with tuning spaces with a network type of DVB.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IDVBTuningSpace2)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-idvbtuningspace2
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IDVBTuningSpace2 extends IDVBTuningSpace{
    /**
     * The interface identifier for IDVBTuningSpace2
     * @type {Guid}
     */
    static IID => Guid("{843188b4-ce62-43db-966b-8145a094e040}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * 
     * @param {Pointer<Int32>} NetworkID 
     * @returns {HRESULT} 
     */
    get_NetworkID(NetworkID) {
        result := ComCall(28, this, "int*", NetworkID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} NetworkID 
     * @returns {HRESULT} 
     */
    put_NetworkID(NetworkID) {
        result := ComCall(29, this, "int", NetworkID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
