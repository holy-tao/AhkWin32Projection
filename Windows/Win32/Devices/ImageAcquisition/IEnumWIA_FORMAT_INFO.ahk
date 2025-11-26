#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumWIA_FORMAT_INFO.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use the IEnumWIA_FORMAT_INFO interface to enumerate the format and media type information for a device.
 * @remarks
 * 
 * The <b>IEnumWIA_FORMAT_INFO</b> interface is a specific implementation for Windows Image Acquisition (WIA) of the standard Component Object Model (COM) enumeration interface. For details, see <a href="https://docs.microsoft.com/previous-versions/ms680089(v=vs.85)">IEnumXXXX</a>.
 * 
 * Applications obtain a pointer to the <b>IEnumWIA_FORMAT_INFO</b> interface by invoking the <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nf-wia_xp-iwiadatatransfer-idtenumwia_format_info">IWiaDataTransfer::idtEnumWIA_FORMAT_INFO</a> method of an item's <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-iwiadatatransfer">IWiaDataTransfer</a> interface.
 * 
 * The <b>IEnumWIA_FORMAT_INFO</b> interface, like all COM interfaces, inherits the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface methods. 
 * 
 * <table class="clsStd">
 * <tr>
 * <th>IUnknown Methods</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>
 * </td>
 * <td>Returns pointers to supported interfaces.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IUnknown::AddRef</a>
 * </td>
 * <td>Increments reference count.</td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a>
 * </td>
 * <td>Decrements reference count.</td>
 * </tr>
 * </table>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nn-wia_xp-ienumwia_format_info
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IEnumWIA_FORMAT_INFO extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumWIA_FORMAT_INFO
     * @type {Guid}
     */
    static IID => Guid("{81befc5b-656d-44f1-b24c-d41d51b4dc81}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone", "GetCount"]

    /**
     * The IEnumWIA_FORMAT_INFO::Next method returns an array of WIA_FORMAT_INFO structures.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * Specifies the number of elements requested.
     * @param {Pointer<WIA_FORMAT_INFO>} rgelt Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/ns-wia_xp-wia_format_info">WIA_FORMAT_INFO</a>*</b>
     * 
     * Receives the address of the array of <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/ns-wia_xp-wia_format_info">WIA_FORMAT_INFO</a> structures.
     * @param {Pointer<Integer>} pceltFetched Type: <b>ULONG*</b>
     * 
     * On output, receives the address of a <b>ULONG</b> that contains the number of <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/ns-wia_xp-wia_format_info">WIA_FORMAT_INFO</a> structures actually returned in the <i>rgelt</i> parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If the enumeration is continuing, this method returns S_OK and sets the value pointed to by <i>pceltFetched</i> to the number of capabilities returned. If the enumeration is complete, it returns S_FALSE and sets the value pointed to by <i>pceltFetched</i> to zero. If the method fails, it returns a standard COM error.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwia_format_info-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * The IEnumWIA_FORMAT_INFO::Skip method skips the specified number of structures in the enumeration.
     * @param {Integer} celt Type: <b>ULONG</b>
     * 
     * Specifies the number of structures to skip.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method returns S_OK if it is able to skip the specified number of elements. It returns S_FALSE if it is unable to skip the specified number of elements. If the method fails, it returns a standard COM error.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwia_format_info-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * The IEnumWIA_FORMAT_INFO::Reset method sets the enumeration back to the first WIA_FORMAT_INFO structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwia_format_info-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * The IEnumWIA_FORMAT_INFO::Clone method creates an additional instance of the IEnumWIA_FORMAT_INFO interface and returns an interface pointer to the new interface.
     * @returns {IEnumWIA_FORMAT_INFO} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_format_info">IEnumWIA_FORMAT_INFO</a>**</b>
     * 
     * Pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wia_xp/nn-wia_xp-ienumwia_format_info">IEnumWIA_FORMAT_INFO</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwia_format_info-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppIEnum := 0, "HRESULT")
        return IEnumWIA_FORMAT_INFO(ppIEnum)
    }

    /**
     * The IEnumWIA_FORMAT_INFO::GetCount method returns the number of elements stored by this enumerator.
     * @returns {Integer} Type: <b>ULONG*</b>
     * 
     * Pointer to a <b>ULONG</b> that receives the number of elements in the enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//wia_xp/nf-wia_xp-ienumwia_format_info-getcount
     */
    GetCount() {
        result := ComCall(7, this, "uint*", &pcelt := 0, "HRESULT")
        return pcelt
    }
}
