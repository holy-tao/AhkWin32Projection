#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMIndexer.ahk

/**
 * The IWMIndexer2 interface enables you to change the settings of the indexer object to suit your needs.This interface is implemented as part of the indexer object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmindexer2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMIndexer2 extends IWMIndexer{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMIndexer2
     * @type {Guid}
     */
    static IID => Guid("{b70f1e42-6255-4df0-a6b9-02b212d9e2bb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Configure"]

    /**
     * The Configure method changes the internal settings of the indexer object.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number for which an index is to be made. If you pass 0, all streams will be indexed.
     * @param {Integer} nIndexerType A variable containing one member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_indexer_type">WMT_INDEXER_TYPE</a> enumeration type.
     * @param {Pointer<Void>} pvInterval This void pointer must point to a <b>DWORD</b> containing the desired indexing interval. Intervals for temporal indexing are in milliseconds. Frame-based index intervals are specified in frames.
     * 
     * If you pass <b>NULL</b>, <b>Configure</b> will use the default value. For temporal indexes, the default value is 3000 milliseconds, for frame-based indexes it is 10 frames.
     * @param {Pointer<Void>} pvIndexType This void pointer must point to a <b>WORD</b> value containing one member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_index_type">WMT_INDEX_TYPE</a> enumeration type. If you pass <b>NULL</b>, <b>Configure</b> will use the default value.
     * 
     * The default value is WMT_IT_NEAREST_CLEAN_POINT. Using another index type degrades seeking performance.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is unable to add the stream number to its internal list.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmindexer2-configure
     */
    Configure(wStreamNum, nIndexerType, pvInterval, pvIndexType) {
        pvIntervalMarshal := pvInterval is VarRef ? "ptr" : "ptr"
        pvIndexTypeMarshal := pvIndexType is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "ushort", wStreamNum, "int", nIndexerType, pvIntervalMarshal, pvInterval, pvIndexTypeMarshal, pvIndexType, "HRESULT")
        return result
    }
}
