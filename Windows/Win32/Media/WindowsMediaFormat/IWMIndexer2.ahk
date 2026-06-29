#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WMT_INDEXER_TYPE.ahk" { WMT_INDEXER_TYPE }
#Import ".\IWMIndexer.ahk" { IWMIndexer }

/**
 * The IWMIndexer2 interface enables you to change the settings of the indexer object to suit your needs.This interface is implemented as part of the indexer object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmindexer2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMIndexer2 extends IWMIndexer {
    /**
     * The interface identifier for IWMIndexer2
     * @type {Guid}
     */
    static IID := Guid("{b70f1e42-6255-4df0-a6b9-02b212d9e2bb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMIndexer2 interfaces
    */
    struct Vtbl extends IWMIndexer.Vtbl {
        Configure : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMIndexer2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Configure method changes the internal settings of the indexer object.
     * @remarks
     * You can call <b>Configure</b> as many times as needed to configure multiple streams in a file. You must make all desired calls to <b>Configure</b> before you start indexing. If you configure and index a file that already has an index, the existing index will be deleted.
     * 
     * If you configure the indexer to build a frame-based index, it will also create a temporal index. This is required for synchronizing audio and video.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number for which an index is to be made. If you pass 0, all streams will be indexed.
     * @param {WMT_INDEXER_TYPE} nIndexerType A variable containing one member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_indexer_type">WMT_INDEXER_TYPE</a> enumeration type.
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmindexer2-configure
     */
    Configure(wStreamNum, nIndexerType, pvInterval, pvIndexType) {
        pvIntervalMarshal := pvInterval is VarRef ? "ptr" : "ptr"
        pvIndexTypeMarshal := pvIndexType is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "ushort", wStreamNum, WMT_INDEXER_TYPE, nIndexerType, pvIntervalMarshal, pvInterval, pvIndexTypeMarshal, pvIndexType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMIndexer2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Configure := CallbackCreate(GetMethod(implObj, "Configure"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Configure)
    }
}
