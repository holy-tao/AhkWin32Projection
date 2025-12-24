#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IEnumUnknown.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides access to all the controls on a Visual Basic container.
 * @see https://docs.microsoft.com/windows/win32/api//vbinterf/nn-vbinterf-ivbgetcontrol
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class IVBGetControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVBGetControl
     * @type {Guid}
     */
    static IID => Guid("{40a050a0-3c31-101b-a82e-08002b2b2337}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumControls"]

    /**
     * Enumerates the controls on the form.
     * @param {Integer} dwOleContF Specifies the type of OLE objects to be enumerated. This parameter can be one of the following 
     *       values enumerated by the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/ne-oleidl-olecontf">OLECONTF</a> enumeration.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OLECONTF_EMBEDDINGS"></a><a id="olecontf_embeddings"></a><dl>
     * <dt><b>OLECONTF_EMBEDDINGS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerates the embedded objects on the form. Include this flag to enumerate OLE controls.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OLECONTF_LINKS"></a><a id="olecontf_links"></a><dl>
     * <dt><b>OLECONTF_LINKS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerates the linked objects on the form.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OLECONTF_OTHER"></a><a id="olecontf_other"></a><dl>
     * <dt><b>OLECONTF_OTHER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerates all pseudo OLE objects. Include this flag to enumerate VBX controls.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OLECONTF_ONLYUSER"></a><a id="olecontf_onlyuser"></a><dl>
     * <dt><b>OLECONTF_ONLYUSER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerates only objects that the user is aware of.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="OLECONTF_ONLYIFRUNNING"></a><a id="olecontf_onlyifrunning"></a><dl>
     * <dt><b>OLECONTF_ONLYIFRUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Enumerates only the objects that are running on the form.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * When enumerating OLE controls, it is recommended that you combine the flags 
     *       <b>OLECONTF_ONLYUSER</b>, <b>OLECONTF_ONLYIFRUNNING</b>, and 
     *       <b>OLECONTF_EMBEDDINGS</b>. To include both OLE controls and VBX controls, add the 
     *       <b>OLECONTF_OTHERS</b> flag to this list. To enumerate only VBX controls, remove the 
     *       <b>OLECONTF_EMBEDDINGS</b> flag and include the <b>OLECONTF_OTHERS</b> 
     *       flag.
     * @param {Integer} dwWhich 
     * @returns {IEnumUnknown} Pointer to an enumeration of OLE objects.
     * @see https://docs.microsoft.com/windows/win32/api//vbinterf/nf-vbinterf-ivbgetcontrol-enumcontrols
     */
    EnumControls(dwOleContF, dwWhich) {
        result := ComCall(3, this, "uint", dwOleContF, "uint", dwWhich, "ptr*", &ppenumUnk := 0, "HRESULT")
        return IEnumUnknown(ppenumUnk)
    }
}
