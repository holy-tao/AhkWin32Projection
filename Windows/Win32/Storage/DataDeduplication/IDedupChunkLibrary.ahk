#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Storage.DataDeduplication
 * @version v4.0.30319
 */
class IDedupChunkLibrary extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDedupChunkLibrary
     * @type {Guid}
     */
    static IID => Guid("{bb5144d7-2720-4dcc-8777-78597416ec23}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeForPushBuffers", "Uninitialize", "SetParameter", "StartChunking"]

    /**
     * 
     * @returns {HRESULT} 
     */
    InitializeForPushBuffers() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Uninitializes flat scroll bars for a particular window. The specified window will revert to standard scroll bars.
     * @remarks
     * <div class="alert"><b>Note</b>  Flat scroll bar functions are implemented in Comctl32.dll versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do not support flat scroll bars.</div>
     * <div> </div>
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns one of the following values. 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the window's scroll bars is currently in use. The operation cannot be completed at this time. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The window does not have flat scroll bars initialized. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/commctrl/nf-commctrl-uninitializeflatsb
     */
    Uninitialize() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} dwParamType 
     * @param {VARIANT} vParamValue 
     * @returns {HRESULT} 
     */
    SetParameter(dwParamType, vParamValue) {
        result := ComCall(5, this, "uint", dwParamType, "ptr", vParamValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Guid} iidIteratorInterfaceID 
     * @returns {IUnknown} 
     */
    StartChunking(iidIteratorInterfaceID) {
        result := ComCall(6, this, "ptr", iidIteratorInterfaceID, "ptr*", &ppChunksEnum := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppChunksEnum)
    }
}
