#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Get radio signal quality of a Mobile Broadband connection.
 * @remarks
 * 
 * The calling application can acquire this interface by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/mbnapi/nn-mbnapi-imbninterface">IMbnInterface</a>
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nn-mbnapi-imbnsignal
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class IMbnSignal extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMbnSignal
     * @type {Guid}
     */
    static IID => Guid("{dcbbbab6-2003-4bbb-aaee-338e368af6fa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSignalStrength", "GetSignalError"]

    /**
     * Gets the signal strength received by the device.
     * @returns {Integer} Pointer to the signal quality received by the device.  When the signal strength is not known or it is not detectable by the device then this is set to <b>MBN_RSSI_UNKNOWN</b>.
     * If this method returns any value other than S_OK, this parameter is 0.
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsignal-getsignalstrength
     */
    GetSignalStrength() {
        result := ComCall(3, this, "uint*", &signalStrength := 0, "HRESULT")
        return signalStrength
    }

    /**
     * Gets the received signal error rate.
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
     * @see https://docs.microsoft.com/windows/win32/api//mbnapi/nf-mbnapi-imbnsignal-getsignalerror
     */
    GetSignalError() {
        result := ComCall(4, this, "uint*", &signalError := 0, "HRESULT")
        return signalError
    }
}
