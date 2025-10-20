#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMDeviceSession interface improves the efficiency of device operations by bundling multiple operations into one session.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmdevicesession
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMDeviceSession extends IUnknown{
    /**
     * The interface identifier for IWMDMDeviceSession
     * @type {Guid}
     */
    static IID => Guid("{82af0a65-9d96-412c-83e5-3c43e4b06cc7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<Byte>} pCtx 
     * @param {Integer} dwSizeCtx 
     * @returns {HRESULT} 
     */
    BeginSession(type, pCtx, dwSizeCtx) {
        result := ComCall(3, this, "int", type, "char*", pCtx, "uint", dwSizeCtx, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<Byte>} pCtx 
     * @param {Integer} dwSizeCtx 
     * @returns {HRESULT} 
     */
    EndSession(type, pCtx, dwSizeCtx) {
        result := ComCall(4, this, "int", type, "char*", pCtx, "uint", dwSizeCtx, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
