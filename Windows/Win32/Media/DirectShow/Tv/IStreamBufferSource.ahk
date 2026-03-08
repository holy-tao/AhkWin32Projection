#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IStreamBufferSource interface is exposed by the Stream Buffer Source filter. Use this interface to play live content from the Stream Buffer Sink filter.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferSource)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/nn-sbe-istreambuffersource
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IStreamBufferSource extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStreamBufferSource
     * @type {Guid}
     */
    static IID => Guid("{1c5bd776-6ced-4f44-8164-5eab0e98db12}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetStreamSink"]

    /**
     * The SetStreamSink method sets a pointer to the Stream Buffer Sink filter, so that the Stream Buffer Source filter can stream data from the sink filter.
     * @remarks
     * The source filter and the sink filter must be within the same process, but can reside in different filter graphs. If they are in different processes, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifilesourcefilter-load">IFileSourceFilter::Load</a> with the same file name used in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-istreambuffersink-lockprofile">IStreamBufferSink::LockProfile</a> method.
     * 
     * Several Stream Buffer Source filters can stream from the same sink filter.
     * @param {IStreamBufferSink} pIStreamBufferSink Pointer to the Stream Buffer Sink filter's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-istreambuffersink">IStreamBufferSink Interface</a> interface.
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
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambuffersource-setstreamsink
     */
    SetStreamSink(pIStreamBufferSink) {
        result := ComCall(3, this, "ptr", pIStreamBufferSink, "HRESULT")
        return result
    }
}
