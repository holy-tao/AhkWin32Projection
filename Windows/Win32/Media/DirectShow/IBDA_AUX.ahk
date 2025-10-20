#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Gets the capabilities of a device's auxiliary input connectors. This interface provides access to a device's Aux Service.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_AUX)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nn-bdaiface-ibda_aux
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_AUX extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_AUX
     * @type {Guid}
     */
    static IID => Guid("{7def4c09-6e66-4567-a819-f0e17f4a81ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryCapabilities", "EnumCapability"]

    /**
     * 
     * @param {Pointer<Integer>} pdwNumAuxInputsBSTR 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_aux-querycapabilities
     */
    QueryCapabilities(pdwNumAuxInputsBSTR) {
        result := ComCall(3, this, "uint*", pdwNumAuxInputsBSTR, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<Integer>} dwInputID 
     * @param {Pointer<Guid>} pConnectorType 
     * @param {Pointer<Integer>} ConnTypeNum 
     * @param {Pointer<Integer>} NumVideoStds 
     * @param {Pointer<Integer>} AnalogStds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_aux-enumcapability
     */
    EnumCapability(dwIndex, dwInputID, pConnectorType, ConnTypeNum, NumVideoStds, AnalogStds) {
        result := ComCall(4, this, "uint", dwIndex, "uint*", dwInputID, "ptr", pConnectorType, "uint*", ConnTypeNum, "uint*", NumVideoStds, "uint*", AnalogStds, "HRESULT")
        return result
    }
}
