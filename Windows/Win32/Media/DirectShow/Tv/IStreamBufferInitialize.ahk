#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IStreamBufferInitialize interface is used to configure the stream buffer filters. The Stream Buffer Source filter, Stream Buffer Sink filter, and StreamBufferConfig object all expose this interface.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferInitialize)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambufferinitialize
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferInitialize extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBufferInitialize
     * @type {Guid}
     */
    static IID => Guid("{9ce50f2d-6ba7-40fb-a034-50b1a674ec78}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetHKEY", "SetSIDs"]

    /**
     * The SetHKEY method sets the registry key where the stream buffer object stores its configuration information.
     * @param {HKEY} hkeyRoot Handle to the registry key.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include those in the following table.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>SetHKEY</b> was called on a filter after it initialized internally.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferinitialize-sethkey
     */
    SetHKEY(hkeyRoot) {
        hkeyRoot := hkeyRoot is Win32Handle ? NumGet(hkeyRoot, "ptr") : hkeyRoot

        result := ComCall(3, this, "ptr", hkeyRoot, "HRESULT")
        return result
    }

    /**
     * The SetSIDs method sets the security identifiers (SIDs) that are used to protect access to the backing files.
     * @param {Integer} cSIDs Specifies the size of the array given in the <i>ppSID</i> parameter.
     * @param {Pointer<PSID>} ppSID Pointer to an array of <b>SID</b> structures, of size <i>cSIDs</i>.
     * @returns {HRESULT} Returns an <b>HRESULT</b>. Possible values include those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Null pointer argument.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambufferinitialize-setsids
     */
    SetSIDs(cSIDs, ppSID) {
        ppSIDMarshal := ppSID is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", cSIDs, ppSIDMarshal, ppSID, "HRESULT")
        return result
    }
}
