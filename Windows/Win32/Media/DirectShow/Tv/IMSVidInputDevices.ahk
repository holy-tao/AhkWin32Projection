#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IMSVidInputDevices interface represents a collection of input devices. The MSVidInputDevices object exposes this object.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidInputDevices)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidinputdevices
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidInputDevices extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidInputDevices
     * @type {Guid}
     */
    static IID => Guid("{c5702cd1-9b79-11d3-b654-00c04f79498e}")

    /**
     * The class identifier for MSVidInputDevices
     * @type {Guid}
     */
    static CLSID => Guid("{c5702ccc-9b79-11d3-b654-00c04f79498e}")

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
     * 
     * @param {Pointer<Integer>} lCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidinputdevices-get_count
     */
    get_Count(lCount) {
        lCountMarshal := lCount is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, lCountMarshal, lCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} pD 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidinputdevices-get__newenum
     */
    get__NewEnum(pD) {
        result := ComCall(8, this, "ptr*", pD, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @param {Pointer<IMSVidInputDevice>} pDB 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidinputdevices-get_item
     */
    get_Item(v, pDB) {
        result := ComCall(9, this, "ptr", v, "ptr*", pDB, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMSVidInputDevice} pDB 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidinputdevices-add
     */
    Add(pDB) {
        result := ComCall(10, this, "ptr", pDB, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidinputdevices-remove
     */
    Remove(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }
}
