#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetIndex extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetIndex
     * @type {Guid}
     */
    static IID => Guid("{0c733a82-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIndexInfo", "Seek", "SetRange"]

    /**
     * 
     * @param {Pointer<Pointer>} pcKeyColumns 
     * @param {Pointer<Pointer<DBINDEXCOLUMNDESC>>} prgIndexColumnDesc 
     * @param {Pointer<Integer>} pcIndexPropertySets 
     * @param {Pointer<Pointer<DBPROPSET>>} prgIndexPropertySets 
     * @returns {HRESULT} 
     */
    GetIndexInfo(pcKeyColumns, prgIndexColumnDesc, pcIndexPropertySets, prgIndexPropertySets) {
        pcKeyColumnsMarshal := pcKeyColumns is VarRef ? "ptr*" : "ptr"
        prgIndexColumnDescMarshal := prgIndexColumnDesc is VarRef ? "ptr*" : "ptr"
        pcIndexPropertySetsMarshal := pcIndexPropertySets is VarRef ? "uint*" : "ptr"
        prgIndexPropertySetsMarshal := prgIndexPropertySets is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, pcKeyColumnsMarshal, pcKeyColumns, prgIndexColumnDescMarshal, prgIndexColumnDesc, pcIndexPropertySetsMarshal, pcIndexPropertySets, prgIndexPropertySetsMarshal, prgIndexPropertySets, "HRESULT")
        return result
    }

    /**
     * The Seekable attribute is a file-level attribute specifying whether an application can seek to points within the content.
     * @remarks
     * This is a coded attribute.
     * 
     * This attribute cannot be duplicated at the file level. If this attribute is used for an individual stream, it will be treated as custom metadata and will not convey its normal meaning to the objects of the Windows Media Format SDK.
     * 
     * The value of this attribute for a file may vary depending upon the object exposing the [**IWMHeaderInfo**](/previous-versions/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmheaderinfo) or [**IWMHeaderInfo3**](/previous-versions/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmheaderinfo3) interface used to retrieve it. This is because the reader objects (both synchronous and asynchronous) perform a more thorough check than the metadata editor object does, to ascertain whether you can seek to a point in a file. The **Seekable** attribute value returned by a reader object is more accurate.
     * @param {HACCESSOR} _hAccessor 
     * @param {Pointer} cKeyValues 
     * @param {Pointer<Void>} pData 
     * @param {Integer} dwSeekOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/seekable
     */
    Seek(_hAccessor, cKeyValues, pData, dwSeekOptions) {
        _hAccessor := _hAccessor is Win32Handle ? NumGet(_hAccessor, "ptr") : _hAccessor

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", _hAccessor, "ptr", cKeyValues, pDataMarshal, pData, "uint", dwSeekOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HACCESSOR} _hAccessor 
     * @param {Pointer} cStartKeyColumns 
     * @param {Pointer<Void>} pStartData 
     * @param {Pointer} cEndKeyColumns 
     * @param {Pointer<Void>} pEndData 
     * @param {Integer} dwRangeOptions 
     * @returns {HRESULT} 
     */
    SetRange(_hAccessor, cStartKeyColumns, pStartData, cEndKeyColumns, pEndData, dwRangeOptions) {
        _hAccessor := _hAccessor is Win32Handle ? NumGet(_hAccessor, "ptr") : _hAccessor

        pStartDataMarshal := pStartData is VarRef ? "ptr" : "ptr"
        pEndDataMarshal := pEndData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "ptr", _hAccessor, "ptr", cStartKeyColumns, pStartDataMarshal, pStartData, "ptr", cEndKeyColumns, pEndDataMarshal, pEndData, "uint", dwRangeOptions, "HRESULT")
        return result
    }
}
