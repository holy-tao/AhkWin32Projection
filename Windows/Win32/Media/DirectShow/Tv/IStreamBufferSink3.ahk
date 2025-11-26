#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IStreamBufferSink2.ahk

/**
 * The IStreamBufferSink3 interface is exposed by the Stream Buffer Sink filter.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferSink3)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sbe/nn-sbe-istreambuffersink3
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferSink3 extends IStreamBufferSink2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBufferSink3
     * @type {Guid}
     */
    static IID => Guid("{974723f2-887a-4452-9366-2cff3057bc8f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAvailableFilter"]

    /**
     * The SetAvailableFilter method limits how far the Stream Buffer Source filter can seek backward, relative to the current recording position.
     * @param {Pointer<Integer>} prtMin On input, specifies the earliest seek time, in 100-nanosecond units, relative to the recording position when the method is called. The value must be less than or equal to zero. To make the entire backing store available, use the value -MAXLONGLONG.
     * 
     * On output, this parameter receives the actual minimum seek time. The two values may differ if the requested time exceeds the amount of time that is available.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sbe/nf-sbe-istreambuffersink3-setavailablefilter
     */
    SetAvailableFilter(prtMin) {
        prtMinMarshal := prtMin is VarRef ? "int64*" : "ptr"

        result := ComCall(7, this, prtMinMarshal, prtMin, "HRESULT")
        return result
    }
}
