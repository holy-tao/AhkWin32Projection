#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Interface to pass requests from an application to the underlying Mobile Broadband miniport drivers.
 * @remarks
 * 
  * The calling application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnvendorspecificoperation
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnVendorSpecificOperation extends IUnknown{
    /**
     * The interface identifier for IMbnVendorSpecificOperation
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2019-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<SAFEARRAY>} vendorSpecificData 
     * @param {Pointer<UInt32>} requestID 
     * @returns {HRESULT} 
     */
    SetVendorSpecific(vendorSpecificData, requestID) {
        result := ComCall(3, this, "ptr", vendorSpecificData, "uint*", requestID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
