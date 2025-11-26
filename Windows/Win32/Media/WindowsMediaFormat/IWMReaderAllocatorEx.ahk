#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INSSBuffer.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMReaderAllocatorEx interface provides expanded alternatives to the AllocateForOutput and AllocateForStream methods of the IWMReaderCallbackAdvanced interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreaderallocatorex
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderAllocatorEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMReaderAllocatorEx
     * @type {Guid}
     */
    static IID => Guid("{9f762fa7-a22e-428d-93c9-ac82f3aafe5a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AllocateForStreamEx", "AllocateForOutputEx"]

    /**
     * The AllocateForStreamEx method allocates a user-created buffer for samples delivered to the IWMReaderCallbackAdvanced::OnStreamSample method.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number.
     * @param {Integer} cbBuffer Size of <i>ppBuffer</i>, in bytes.
     * @param {Integer} dwFlags <b>DWORD</b> containing the relevant flags.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WM_SFEX_NOTASYNCPOINT</td>
     * <td>This flag is the opposite of the WM_SF_CLEANPOINT flag used in other methods of this SDK. It indicates that the point is not a <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">key frame</a>, or is not a good point to go to during a seek. This inverse definition is used for compatibility with Direct Show.</td>
     * </tr>
     * <tr>
     * <td>WM_SFEX_DATALOSS</td>
     * <td>Some data has been lost between the previous sample and the sample with the flag set.</td>
     * </tr>
     * </table>
     * @param {Integer} cnsSampleTime Specifies the sample time, in 100-nanosecond units.
     * @param {Integer} cnsSampleDuration Specifies the sample duration, in 100-nanosecond units.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application. This pointer is the context pointer given to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-start">IWMReader::Start</a> method.
     * @returns {INSSBuffer} Pointer to a pointer to an <b>INSSBuffer</b> object.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderallocatorex-allocateforstreamex
     */
    AllocateForStreamEx(wStreamNum, cbBuffer, dwFlags, cnsSampleTime, cnsSampleDuration, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ushort", wStreamNum, "uint", cbBuffer, "ptr*", &ppBuffer := 0, "uint", dwFlags, "uint", cnsSampleTime, "uint", cnsSampleDuration, pvContextMarshal, pvContext, "HRESULT")
        return INSSBuffer(ppBuffer)
    }

    /**
     * The AllocateForOutputEx method allocates a user-created buffer for samples delivered to the IWMReaderCallback::OnSample method.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @param {Integer} cbBuffer Size of <i>ppBuffer</i>, in bytes.
     * @param {Integer} dwFlags <b>DWORD</b> containing the relevant flags.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WM_SFEX_NOTASYNCPOINT</td>
     * <td>This flag is the opposite of the WM_SF_CLEANPOINT flag used in other methods of this SDK. It indicates that the point is not a <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">key frame</a>, or is not a good point to go to during a seek. This inverse definition is used for compatibility with DirectShow.</td>
     * </tr>
     * <tr>
     * <td>WM_SFEX_DATALOSS</td>
     * <td>Some data has been lost between the previous sample and the sample with the flag set.</td>
     * </tr>
     * </table>
     * @param {Integer} cnsSampleTime Specifies the sample time, in 100-nanosecond units.
     * @param {Integer} cnsSampleDuration Specifies the sample duration, in 100-nanosecond units.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application. This pointer is the context pointer given to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-start">IWMReader::Start</a> method.
     * @returns {INSSBuffer} Pointer to a pointer to an <b>INSSBuffer</b> object.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreaderallocatorex-allocateforoutputex
     */
    AllocateForOutputEx(dwOutputNum, cbBuffer, dwFlags, cnsSampleTime, cnsSampleDuration, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", dwOutputNum, "uint", cbBuffer, "ptr*", &ppBuffer := 0, "uint", dwFlags, "uint", cnsSampleTime, "uint", cnsSampleDuration, pvContextMarshal, pvContext, "HRESULT")
        return INSSBuffer(ppBuffer)
    }
}
