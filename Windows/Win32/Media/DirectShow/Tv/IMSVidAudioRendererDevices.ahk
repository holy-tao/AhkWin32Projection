#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * The IMSVidAudioRendererDevices interface represents a collection of audio renderers. Applications can use this interface to enumerate the collection. The MSVidAudioRendererDevices object exposes this method.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidAudioRendererDevices)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidaudiorendererdevices
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidAudioRendererDevices extends IDispatch{
    /**
     * The interface identifier for IMSVidAudioRendererDevices
     * @type {Guid}
     */
    static IID => Guid("{c5702cd4-9b79-11d3-b654-00c04f79498e}")

    /**
     * The class identifier for MSVidAudioRendererDevices
     * @type {Guid}
     */
    static CLSID => Guid("{c5702ccf-9b79-11d3-b654-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} lCount 
     * @returns {HRESULT} 
     */
    get_Count(lCount) {
        result := ComCall(7, this, "int*", lCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumVARIANT>} pD 
     * @returns {HRESULT} 
     */
    get__NewEnum(pD) {
        result := ComCall(8, this, "ptr", pD, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @param {Pointer<IMSVidAudioRenderer>} pDB 
     * @returns {HRESULT} 
     */
    get_Item(v, pDB) {
        result := ComCall(9, this, "ptr", v, "ptr", pDB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMSVidAudioRenderer>} pDB 
     * @returns {HRESULT} 
     */
    Add(pDB) {
        result := ComCall(10, this, "ptr", pDB, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} v 
     * @returns {HRESULT} 
     */
    Remove(v) {
        result := ComCall(11, this, "ptr", v, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
