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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NetworkID", "put_NetworkID"]

    /**
     * @type {Integer} 
     */
    NetworkID {
        get => this.get_NetworkID()
        set => this.put_NetworkID(value)
    }

    /**
     * The get_NetworkID method retrieves the Network ID of the DVB system.
     * @returns {Integer} Receive the network ID.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtuningspace2-get_networkid
     */
    get_NetworkID() {
        result := ComCall(28, this, "int*", &NetworkID := 0, "HRESULT")
        return NetworkID
    }

    /**
     * The put_NetworkID method sets the Network ID of the DVB system.
     * @param {Integer} NetworkID Specifies the <i>NetworkID</i> as a <b>long</b> integer.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, error information can be retrieved using the standard COM <b>IErrorInfo</b> interface.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-idvbtuningspace2-put_networkid
     */
    put_NetworkID(NetworkID) {
        result := ComCall(29, this, "int", NetworkID, "HRESULT")
        return result
    }
}
