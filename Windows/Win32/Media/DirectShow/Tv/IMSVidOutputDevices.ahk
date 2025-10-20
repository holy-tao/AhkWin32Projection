#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IMSVidOutputDevices interface represents a collection of output devices.Output devices include video and audio renderers, and the Stream Buffer Sink object.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidOutputDevices)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidoutputdevices
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidOutputDevices extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidOutputDevices
     * @type {Guid}
     */
    static IID => Guid("{c5702cd2-9b79-11d3-b654-00c04f79498e}")

    /**
     * The class identifier for MSVidOutputDevices
     * @type {Guid}
     */
    static CLSID => Guid("{c5702ccd-9b79-11d3-b654-00c04f79498e}")

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
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidoutputdevices-get_count
     */
    get_Count(lCount) {
        result := ComCall(7, this, "int*", lCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} pD 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidoutputdevices-get__newenum
     */
    get__NewEnum(pD) {
        result := ComCall(8, this, "ptr*", pD, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @param {Pointer<IMSVidOutputDevice>} pDB 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidoutputdevices-get_item
     */
    get_Item(v, pDB) {
        result := ComCall(9, this, "ptr", v, "ptr*", pDB, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMSVidOutputDevice} pDB 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidoutputdevices-add
     */
    Add(pDB) {
        result := ComCall(10, this, "ptr", pDB, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidoutputdevices-remove
     */
    Remove(v) {
        result := ComCall(11, this, "ptr", v, "HRESULT")
        return result
    }
}
