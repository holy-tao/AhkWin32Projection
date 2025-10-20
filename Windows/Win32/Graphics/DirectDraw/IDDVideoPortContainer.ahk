#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class IDDVideoPortContainer extends IUnknown{
    /**
     * The interface identifier for IDDVideoPortContainer
     * @type {Guid}
     */
    static IID => Guid("{6c142760-a733-11ce-a521-0020af0be560}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DDVIDEOPORTDESC>} param1 
     * @param {Pointer<IDirectDrawVideoPort>} param2 
     * @param {Pointer<IUnknown>} param3 
     * @returns {HRESULT} 
     */
    CreateVideoPort(param0, param1, param2, param3) {
        result := ComCall(3, this, "uint", param0, "ptr", param1, "ptr", param2, "ptr", param3, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DDVIDEOPORTCAPS>} param1 
     * @param {Pointer<Void>} param2 
     * @param {Pointer<LPDDENUMVIDEOCALLBACK>} param3 
     * @returns {HRESULT} 
     */
    EnumVideoPorts(param0, param1, param2, param3) {
        result := ComCall(4, this, "uint", param0, "ptr", param1, "ptr", param2, "ptr", param3, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<UInt32>} pcInfo 
     * @param {Pointer<DDVIDEOPORTCONNECT>} param2 
     * @returns {HRESULT} 
     */
    GetVideoPortConnectInfo(param0, pcInfo, param2) {
        result := ComCall(5, this, "uint", param0, "uint*", pcInfo, "ptr", param2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<DDVIDEOPORTSTATUS>} param1 
     * @returns {HRESULT} 
     */
    QueryVideoPortStatus(param0, param1) {
        result := ComCall(6, this, "uint", param0, "ptr", param1, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
