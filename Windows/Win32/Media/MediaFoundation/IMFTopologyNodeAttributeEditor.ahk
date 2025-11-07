#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Updates the attributes of one or more nodes in the Media Session's current topology.
 * @remarks
 * 
 * Currently the only attribute that can be updated is the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-toponode-mediastop-attribute">MF_TOPONODE_MEDIASTOP</a> attribute.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imftopologynodeattributeeditor
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFTopologyNodeAttributeEditor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFTopologyNodeAttributeEditor
     * @type {Guid}
     */
    static IID => Guid("{676aa6dd-238a-410d-bb99-65668d01605a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateNodeAttributes"]

    /**
     * 
     * @param {Integer} TopoId 
     * @param {Integer} cUpdates 
     * @param {Pointer<MFTOPONODE_ATTRIBUTE_UPDATE>} pUpdates 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imftopologynodeattributeeditor-updatenodeattributes
     */
    UpdateNodeAttributes(TopoId, cUpdates, pUpdates) {
        result := ComCall(3, this, "uint", TopoId, "uint", cUpdates, "ptr", pUpdates, "HRESULT")
        return result
    }
}
