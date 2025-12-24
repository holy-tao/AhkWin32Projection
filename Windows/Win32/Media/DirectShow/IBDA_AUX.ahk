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
     * Gets the number of auxiliary connectors on the device.
     * @returns {Integer} Receives the number of auxiliary connectors.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_aux-querycapabilities
     */
    QueryCapabilities() {
        result := ComCall(3, this, "uint*", &pdwNumAuxInputsBSTR := 0, "HRESULT")
        return pdwNumAuxInputsBSTR
    }

    /**
     * Gets the capabilities of an auxiliary connector, specified by index.
     * @param {Integer} dwIndex The zero-based index of the auxiliary connector. To get the number of connectors on the device, call <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_aux-querycapabilities">IBDA_AUX::QueryCapabilities</a>.
     * @param {Pointer<Integer>} dwInputID Receives a unique identifier for the auxiliary connector.
     * @param {Pointer<Guid>} pConnectorType Receives a GUID that specifies the type of connector.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PBDA_AUX_CONNECTOR_TYPE_Composite"></a><a id="pbda_aux_connector_type_composite"></a><a id="PBDA_AUX_CONNECTOR_TYPE_COMPOSITE"></a><dl>
     * <dt><b>PBDA_AUX_CONNECTOR_TYPE_Composite</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Composite video connector.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="PBDA_AUX_CONNECTOR_TYPE_SVideo"></a><a id="pbda_aux_connector_type_svideo"></a><a id="PBDA_AUX_CONNECTOR_TYPE_SVIDEO"></a><dl>
     * <dt><b>PBDA_AUX_CONNECTOR_TYPE_SVideo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * S-Video connector.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} ConnTypeNum Receives a numeric identifier for the auxiliary input.
     * @param {Pointer<Integer>} NumVideoStds Receives the number of analog video standards that the connector supports.
     * @param {Pointer<Integer>} AnalogStds Receives a bitwise <b>OR</b> of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/strmif/ne-strmif-analogvideostandard">AnalogVideoStandard</a> enumeration, specifying which analog video standards the connector supports.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bdaiface/nf-bdaiface-ibda_aux-enumcapability
     */
    EnumCapability(dwIndex, dwInputID, pConnectorType, ConnTypeNum, NumVideoStds, AnalogStds) {
        dwInputIDMarshal := dwInputID is VarRef ? "uint*" : "ptr"
        ConnTypeNumMarshal := ConnTypeNum is VarRef ? "uint*" : "ptr"
        NumVideoStdsMarshal := NumVideoStds is VarRef ? "uint*" : "ptr"
        AnalogStdsMarshal := AnalogStds is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwIndex, dwInputIDMarshal, dwInputID, "ptr", pConnectorType, ConnTypeNumMarshal, ConnTypeNum, NumVideoStdsMarshal, NumVideoStds, AnalogStdsMarshal, AnalogStds, "HRESULT")
        return result
    }
}
