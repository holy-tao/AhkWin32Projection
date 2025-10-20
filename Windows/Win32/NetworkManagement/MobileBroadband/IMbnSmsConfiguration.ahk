#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the SMS configuration of a device.
 * @remarks
 * 
  * This interface is acquired by a call to the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsms-getsmsconfiguration">GetSmsConfiguration</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsms">IMbnSms</a> interface.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnsmsconfiguration
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnSmsConfiguration extends IUnknown{
    /**
     * The interface identifier for IMbnSmsConfiguration
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2012-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} scAddress 
     * @returns {HRESULT} 
     */
    get_ServiceCenterAddress(scAddress) {
        result := ComCall(3, this, "ptr", scAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} scAddress 
     * @returns {HRESULT} 
     */
    put_ServiceCenterAddress(scAddress) {
        scAddress := scAddress is String ? StrPtr(scAddress) : scAddress

        result := ComCall(4, this, "ptr", scAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} index 
     * @returns {HRESULT} 
     */
    get_MaxMessageIndex(index) {
        result := ComCall(5, this, "uint*", index, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} shortMsgSize 
     * @returns {HRESULT} 
     */
    get_CdmaShortMsgSize(shortMsgSize) {
        result := ComCall(6, this, "uint*", shortMsgSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} smsFormat 
     * @returns {HRESULT} 
     */
    get_SmsFormat(smsFormat) {
        result := ComCall(7, this, "int*", smsFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} smsFormat 
     * @returns {HRESULT} 
     */
    put_SmsFormat(smsFormat) {
        result := ComCall(8, this, "int", smsFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
