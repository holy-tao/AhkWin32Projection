#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IPinInfo extends IDispatch{
    /**
     * The interface identifier for IPinInfo
     * @type {Guid}
     */
    static IID => Guid("{56a868bd-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IUnknown>} ppUnk 
     * @returns {HRESULT} 
     */
    get_Pin(ppUnk) {
        result := ComCall(7, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppUnk 
     * @returns {HRESULT} 
     */
    get_ConnectedTo(ppUnk) {
        result := ComCall(8, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppUnk 
     * @returns {HRESULT} 
     */
    get_ConnectionMediaType(ppUnk) {
        result := ComCall(9, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppUnk 
     * @returns {HRESULT} 
     */
    get_FilterInfo(ppUnk) {
        result := ComCall(10, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} ppUnk 
     * @returns {HRESULT} 
     */
    get_Name(ppUnk) {
        result := ComCall(11, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} ppDirection 
     * @returns {HRESULT} 
     */
    get_Direction(ppDirection) {
        result := ComCall(12, this, "int*", ppDirection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strPinID 
     * @returns {HRESULT} 
     */
    get_PinID(strPinID) {
        result := ComCall(13, this, "ptr", strPinID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDispatch>} ppUnk 
     * @returns {HRESULT} 
     */
    get_MediaTypes(ppUnk) {
        result := ComCall(14, this, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pPin 
     * @returns {HRESULT} 
     */
    Connect(pPin) {
        result := ComCall(15, this, "ptr", pPin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pPin 
     * @returns {HRESULT} 
     */
    ConnectDirect(pPin) {
        result := ComCall(16, this, "ptr", pPin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pPin 
     * @param {Pointer<IDispatch>} pMediaType 
     * @returns {HRESULT} 
     */
    ConnectWithType(pPin, pMediaType) {
        result := ComCall(17, this, "ptr", pPin, "ptr", pMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Disconnect() {
        result := ComCall(18, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Render() {
        result := ComCall(19, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
