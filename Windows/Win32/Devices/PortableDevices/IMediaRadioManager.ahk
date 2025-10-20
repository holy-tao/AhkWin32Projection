#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IMediaRadioManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaRadioManager
     * @type {Guid}
     */
    static IID => Guid("{6cfdcab5-fc47-42a5-9241-074b58830e73}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRadioInstances", "OnSystemRadioStateChange"]

    /**
     * 
     * @param {Pointer<IRadioInstanceCollection>} ppCollection 
     * @returns {HRESULT} 
     */
    GetRadioInstances(ppCollection) {
        result := ComCall(3, this, "ptr*", ppCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} sysRadioState 
     * @param {Integer} uTimeoutSec 
     * @returns {HRESULT} 
     */
    OnSystemRadioStateChange(sysRadioState, uTimeoutSec) {
        result := ComCall(4, this, "int", sysRadioState, "uint", uTimeoutSec, "HRESULT")
        return result
    }
}
