#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Get radio signal quality of a Mobile Broadband connection.
 * @remarks
 * The calling application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nn-mbnapi-imbnsignal
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct IMbnSignal extends IUnknown {
    /**
     * The interface identifier for IMbnSignal
     * @type {Guid}
     */
    static IID := Guid("{dcbbbab6-2003-4bbb-aaee-338e368af6fa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMbnSignal interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSignalStrength : IntPtr
        GetSignalError    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMbnSignal.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the signal strength received by the device.
     * @remarks
     * <b>GetSignalStrength</b> reports signal strength received by the Mobile Broadband device. For GSM based devices it reports signal strength as signal strength received in a coded value. For CDMA devices it reports based on the Compensated RSSI (accounts for noise) and not based on Raw RSSI.
     * 
     * 
     * The following table contains the coded values that may be returned.<table>
     * <tr>
     * <th>Signal Strength (in dBm) </th>
     * <th>Coded Value (Min: 0 Max: 31)</th>
     * </tr>
     * <tr>
     * <td>-113 or less</td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td>-111</td>
     * <td>1</td>
     * </tr>
     * <tr>
     * <td>-109</td>
     * <td>2</td>
     * </tr>
     * <tr>
     * <td>...</td>
     * <td>...</td>
     * </tr>
     * <tr>
     * <td>...</td>
     * <td>...</td>
     * </tr>
     * <tr>
     * <td>-51 or greater</td>
     * <td>31</td>
     * </tr>
     * <tr>
     * <td>Unknown or undetectable</td>
     * <td><b>MBN_RSSI_UNKNOWN</b></td>
     * </tr>
     * </table>
     *  
     * 
     * 
     * 
     * For recoverable errors <b>E_MBN_PIN_REQUIRED</b>, and <b>E_MBN_RADIO_POWER_OFF</b>, the Mobile Broadband service will query the device again for signal state when the error condition is over. This method will return E_PENDING until the query operation is complete. When the new query is complete, the Mobile Broadband  service will call the <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nf-mbnapi-imbnsignalevents-onsignalstatechange">OnSignalStateChange</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbnsignalevents">IMbnSignalEvents</a>.
     * @returns {Integer} Pointer to the signal quality received by the device.  When the signal strength is not known or it is not detectable by the device then this is set to <b>MBN_RSSI_UNKNOWN</b>.
     * If this method returns any value other than S_OK, this parameter is 0.
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsignal-getsignalstrength
     */
    GetSignalStrength() {
        result := ComCall(3, this, "uint*", &signalStrength := 0, "HRESULT")
        return signalStrength
    }

    /**
     * Gets the received signal error rate.
     * @remarks
     * Mobile Broadband interfaces report the signal error rate as a coded value that maps to a percentage range of error rates.   This is the Channel Bit Error Rate for GSM and Frame Error Rate for CDMA.  For both the cases, <b>MBN_ERROR_RATE_UNKNOWN</b> specifies an unknown error rate.
     * @returns {Integer} Pointer to the error rate in the received signal.
     * 
     * Mobile Broadband Interfaces report the signal error rate as a coded value that maps to the percentage range of error rates.   This is the Channel Bit Error Rate for GSM and Frame Error Rate for CDMA.  In both the cases, MBN_ERROR_RATE_UNKNOWN specifies an unknown error rate.
     * 
     * The following table shows the values for the error rate codes.
     * 
     * <table>
     * <tr>
     * <th>Bit error rate (in %)</th>
     * <th>Frame error rate (in %)</th>
     * <th>Coded value (0-7)</th>
     * </tr>
     * <tr>
     * <td>&lt; 0.2</td>
     * <td>&lt; 0.01</td>
     * <td>0</td>
     * </tr>
     * <tr>
     * <td>0.2 - 0.4</td>
     * <td>0.01 - 0.1</td>
     * <td>1</td>
     * </tr>
     * <tr>
     * <td>0.4 - 0.8</td>
     * <td>0.1 - 0.5</td>
     * <td>2</td>
     * </tr>
     * <tr>
     * <td>0.8 - 1.6</td>
     * <td>0.5 - 1.0</td>
     * <td>3</td>
     * </tr>
     * <tr>
     * <td>1.6 - 3.2</td>
     * <td>1.0 - 2.0</td>
     * <td>4</td>
     * </tr>
     * <tr>
     * <td>3.2 - 6.4</td>
     * <td>2.0 - 4.0</td>
     * <td>5</td>
     * </tr>
     * <tr>
     * <td>6.4 - 12.8</td>
     * <td>4.0 - 8.0</td>
     * <td>6</td>
     * </tr>
     * <tr>
     * <td>&gt; 12.8</td>
     * <td>&gt; 8.0</td>
     * <td>7</td>
     * </tr>
     * <tr>
     * <td>unknown</td>
     * <td>unknown</td>
     * <td>MBN_ERROR_RATE_UNKNOWN</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mbnapi/nf-mbnapi-imbnsignal-getsignalerror
     */
    GetSignalError() {
        result := ComCall(4, this, "uint*", &signalError := 0, "HRESULT")
        return signalError
    }

    Query(iid) {
        if (IMbnSignal.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSignalStrength := CallbackCreate(GetMethod(implObj, "GetSignalStrength"), flags, 2)
        this.vtbl.GetSignalError := CallbackCreate(GetMethod(implObj, "GetSignalError"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSignalStrength)
        CallbackFree(this.vtbl.GetSignalError)
    }
}
