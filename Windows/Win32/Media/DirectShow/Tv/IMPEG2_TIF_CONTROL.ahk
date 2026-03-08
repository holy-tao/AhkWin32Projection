#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * IMPEG2_TIF_CONTROL is no longer available for use.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMPEG2_TIF_CONTROL)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/bdatif/nn-bdatif-impeg2_tif_control
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMPEG2_TIF_CONTROL extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMPEG2_TIF_CONTROL
     * @type {Guid}
     */
    static IID => Guid("{f9bac2f9-4149-4916-b2ef-faa202326862}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterTIF", "UnregisterTIF", "AddPIDs", "DeletePIDs", "GetPIDCount", "GetPIDs"]

    /**
     * The RegisterTIF method is called by the Transport Information Filter (TIF) to register itself with the Network Provider.
     * @remarks
     * Call this method immediately after the TIF's input pin is connected to the Demux.
     * @param {IUnknown} pUnkTIF Pointer to the TIF's <b>IUnknown</b> interface.
     * @param {Pointer<Integer>} ppvRegistrationContext Pointer to a variable that receives an identifier. Use this value as the parameter to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/bdatif/nf-bdatif-impeg2_tif_control-unregistertif">IMPEG2_TIF_CONTROL::UnregisterTIF</a> method.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not find a necessary interface on the TIF.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_ALREADY_CONNECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A TIF is already registered with the Network Provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-impeg2_tif_control-registertif
     */
    RegisterTIF(pUnkTIF, ppvRegistrationContext) {
        ppvRegistrationContextMarshal := ppvRegistrationContext is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pUnkTIF, ppvRegistrationContextMarshal, ppvRegistrationContext, "HRESULT")
        return result
    }

    /**
     * The UnregisterTIF method unregisters the TIF with the Network Provider.
     * @remarks
     * Call this method after the TIF's input pin has been disconnected from the Demux.
     * @param {Integer} pvRegistrationContext Identifier returned by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/bdatif/nf-bdatif-impeg2_tif_control-registertif">IMPEG2_TIF_CONTROL::RegisterTIF</a> method.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-impeg2_tif_control-unregistertif
     */
    UnregisterTIF(pvRegistrationContext) {
        result := ComCall(4, this, "uint", pvRegistrationContext, "HRESULT")
        return result
    }

    /**
     * The AddPIDs method tells the Network Provider which PIDs the TIF should receive.
     * @remarks
     * Only the TIF knows which table sections it requires. It uses this method to tell the Network Provider the PIDs for the packets that contain those tables. The Network Provider forwards the information to the Demux, which immediately begins routing packets with the specified PIDs to the TIF.
     * @param {Integer} ulcPIDs Specifies the number of PIDs to add. This value must be equal to the number of elements in the array specified by <i>pulPIDs</i>.
     * @param {Pointer<Integer>} pulPIDs Specifies an array of PID values to add. The array must contain <i>ulcPIDs</i> elements.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-impeg2_tif_control-addpids
     */
    AddPIDs(ulcPIDs, pulPIDs) {
        pulPIDsMarshal := pulPIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", ulcPIDs, pulPIDsMarshal, pulPIDs, "HRESULT")
        return result
    }

    /**
     * The DeletePIDs method informs the Network Provider that the TIF no longer requires the specified PID.
     * @remarks
     * This method is called if a set of tables in the transport stream goes away, in order to remove the PSI/SI MPEG2 packet IDs from the TIF's data stream.
     * @param {Integer} ulcPIDs Specifies the number of PIDs to delete. This value must equal the number of elements in the array specified by <i>pulPIDs</i>.
     * @param {Pointer<Integer>} pulPIDs Specifies an array of PID values containing <i>ulcPIDs</i> elements.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-impeg2_tif_control-deletepids
     */
    DeletePIDs(ulcPIDs, pulPIDs) {
        pulPIDsMarshal := pulPIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "uint", ulcPIDs, pulPIDsMarshal, pulPIDs, "HRESULT")
        return result
    }

    /**
     * The GetPIDCount method retrieves the number of MPEG-2 Packet IDs being filtered by the MPEG-2 Demultiplexer into the TIF's input data.
     * @remarks
     * A custom TIF extension might or might not need this method.
     * @returns {Integer} Pointer to a variable that receives the number of PIDs currently being filtered to the Demux.
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-impeg2_tif_control-getpidcount
     */
    GetPIDCount() {
        result := ComCall(7, this, "uint*", &pulcPIDs := 0, "HRESULT")
        return pulcPIDs
    }

    /**
     * The GetPIDs method retrieves the list of MPEG-2 Packet IDs being filtered into the TIF's input data.
     * @remarks
     * A custom TIF extension might or might not have need for this method.
     * @param {Pointer<Integer>} pulcPIDs Pointer to a variable that receives the number of PIDs that were retrieved.
     * @param {Pointer<Integer>} pulPIDs Pointer to a variable that receives an array of returned <b>ULONG</b> values representing the PID values. The number of elements in the array is equal to the value of <i>pulcPIDs</i>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/bdatif/nf-bdatif-impeg2_tif_control-getpids
     */
    GetPIDs(pulcPIDs, pulPIDs) {
        pulcPIDsMarshal := pulcPIDs is VarRef ? "uint*" : "ptr"
        pulPIDsMarshal := pulPIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pulcPIDsMarshal, pulcPIDs, pulPIDsMarshal, pulPIDs, "HRESULT")
        return result
    }
}
