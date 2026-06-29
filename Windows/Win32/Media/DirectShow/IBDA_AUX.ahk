#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Gets the capabilities of a device's auxiliary input connectors. This interface provides access to a device's Aux Service.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IBDA_AUX)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nn-bdaiface-ibda_aux
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IBDA_AUX extends IUnknown {
    /**
     * The interface identifier for IBDA_AUX
     * @type {Guid}
     */
    static IID := Guid("{7def4c09-6e66-4567-a819-f0e17f4a81ab}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IBDA_AUX interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryCapabilities : IntPtr
        EnumCapability    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IBDA_AUX.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the number of auxiliary connectors on the device.
     * @returns {Integer} Receives the number of auxiliary connectors.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_aux-querycapabilities
     */
    QueryCapabilities() {
        result := ComCall(3, this, "uint*", &pdwNumAuxInputsBSTR := 0, "HRESULT")
        return pdwNumAuxInputsBSTR
    }

    /**
     * Gets the capabilities of an auxiliary connector, specified by index.
     * @remarks
     * You must call the <a href="https://docs.microsoft.com/windows/desktop/api/bdaiface/nf-bdaiface-ibda_aux-querycapabilities">IBDA_AUX::QueryCapabilities</a> method before calling this method.
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
     * @param {Pointer<Integer>} AnalogStds Receives a bitwise <b>OR</b> of flags from the <a href="https://docs.microsoft.com/windows/win32/api/strmif/ne-strmif-analogvideostandard">AnalogVideoStandard</a> enumeration, specifying which analog video standards the connector supports.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/bdaiface/nf-bdaiface-ibda_aux-enumcapability
     */
    EnumCapability(dwIndex, dwInputID, pConnectorType, ConnTypeNum, NumVideoStds, AnalogStds) {
        dwInputIDMarshal := dwInputID is VarRef ? "uint*" : "ptr"
        ConnTypeNumMarshal := ConnTypeNum is VarRef ? "uint*" : "ptr"
        NumVideoStdsMarshal := NumVideoStds is VarRef ? "uint*" : "ptr"
        AnalogStdsMarshal := AnalogStds is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwIndex, dwInputIDMarshal, dwInputID, Guid.Ptr, pConnectorType, ConnTypeNumMarshal, ConnTypeNum, NumVideoStdsMarshal, NumVideoStds, AnalogStdsMarshal, AnalogStds, "HRESULT")
        return result
    }

    Query(iid) {
        if (IBDA_AUX.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryCapabilities := CallbackCreate(GetMethod(implObj, "QueryCapabilities"), flags, 2)
        this.vtbl.EnumCapability := CallbackCreate(GetMethod(implObj, "EnumCapability"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryCapabilities)
        CallbackFree(this.vtbl.EnumCapability)
    }
}
