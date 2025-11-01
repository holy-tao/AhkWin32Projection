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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginSession", "EndSession"]

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<Integer>} pCtx 
     * @param {Integer} dwSizeCtx 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicesession-beginsession
     */
    BeginSession(type, pCtx, dwSizeCtx) {
        result := ComCall(3, this, "int", type, "char*", pCtx, "uint", dwSizeCtx, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} type 
     * @param {Pointer<Integer>} pCtx 
     * @param {Integer} dwSizeCtx 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mswmdm/nf-mswmdm-iwmdmdevicesession-endsession
     */
    EndSession(type, pCtx, dwSizeCtx) {
        result := ComCall(4, this, "int", type, "char*", pCtx, "uint", dwSizeCtx, "HRESULT")
        return result
    }
}
