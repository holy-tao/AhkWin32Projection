#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Ole\IEnumVARIANT.ahk
#Include .\IMSVidVideoRenderer.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IMSVidVideoRendererDevices interface represents a collection of video renderers. The MSVidVideoRendererDevices object exposes this method. Applications can use this interface to enumerate the collection.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidVideoRendererDevices)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidvideorendererdevices
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidVideoRendererDevices extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidVideoRendererDevices
     * @type {Guid}
     */
    static IID => Guid("{c5702cd3-9b79-11d3-b654-00c04f79498e}")

    /**
     * The class identifier for MSVidVideoRendererDevices
     * @type {Guid}
     */
    static CLSID => Guid("{c5702cce-9b79-11d3-b654-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Count", "get__NewEnum", "get_Item", "Add", "Remove"]

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IEnumVARIANT} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorendererdevices-get_count
     */
    get_Count() {
        result := ComCall(7, this, "int*", &lCount := 0, "HRESULT")
        return lCount
    }

    /**
     * 
     * @returns {IEnumVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorendererdevices-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &pD := 0, "HRESULT")
        return IEnumVARIANT(pD)
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {IMSVidVideoRenderer} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorendererdevices-get_item
     */
    get_Item(v) {
        result := ComCall(9, this, "ptr", v, "ptr*", &pDB := 0, "HRESULT")
        return IMSVidVideoRenderer(pDB)
    }

    /**
     * 
     * @param {IMSVidVideoRenderer} pDB 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorendererdevices-add
     */
    Add(pDB) {
        result := ComCall(10, this, "ptr", pDB, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidvideorendererdevices-remove
     */
    Remove(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }
}
