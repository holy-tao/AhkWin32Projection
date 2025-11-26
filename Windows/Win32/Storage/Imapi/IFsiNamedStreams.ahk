#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Ole\IEnumVARIANT.ahk
#Include .\IFsiFileItem2.ahk
#Include .\IEnumFsiItems.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Use this interface to enumerate the named streams associated with a file in a file system image.
 * @remarks
 * 
 * To access this interface, call the <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nf-imapi2fs-ifsifileitem2-get_fsinamedstreams">IFsiFileItem2::get_FsiNamedStreams</a> method of a file item object representing a standard or 'Real-Time' file.
 * 
 * This interface is provided only for file item objects representing regular or 'Real-Time' files. Named streams cannot have other name streams associated with them.
 * 
 * UDF must be enabled and set to UDF revision 2.00 or later in order to enable named stream support.
 * 
 * This interface is supported in Windows Server 2003 with Service Pack 1 (SP1), Windows XP with Service Pack 2 (SP2),  and Windows Vista  via the Windows Feature Pack for Storage. All  features provided by this  update package are supported natively in Windows 7 and Windows Server 2008 R2.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nn-imapi2fs-ifsinamedstreams
 * @namespace Windows.Win32.Storage.Imapi
 * @version v4.0.30319
 */
class IFsiNamedStreams extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsiNamedStreams
     * @type {Guid}
     */
    static IID => Guid("{ed79ba56-5294-4250-8d46-f9aecee23459}")

    /**
     * The class identifier for FsiNamedStreams
     * @type {Guid}
     */
    static CLSID => Guid("{c6b6f8ed-6d19-44b4-b539-b159b793a32d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "get_EnumNamedStreams"]

    /**
     * @type {IEnumVARIANT} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * @type {IEnumFsiItems} 
     */
    EnumNamedStreams {
        get => this.get_EnumNamedStreams()
    }

    /**
     * Retrieves an IEnumVARIANT list of the named streams associated with a file in the file system image.
     * @returns {IEnumVARIANT} Pointer to a pointer to an <b>IEnumVariant</b> interface that is used to enumerate the named streams associated with a file. The items of the enumeration are variants whose type is <b>VT_BSTR</b>. Use the <b>bstrVal</b> member to retrieve the path to the named stream.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsinamedstreams-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &NewEnum := 0, "HRESULT")
        return IEnumVARIANT(NewEnum)
    }

    /**
     * Retrieves a single named stream associated with a file in the file system image.
     * @param {Integer} index This value indicates the position of the named stream within the  collection.
     * 	The index number is zero-based, i.e. the first item is at location 0 of the collection.
     * @returns {IFsiFileItem2} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ifsifileitem2">IFsiFileItem2</a> object representing the named stream at the  position specified by <i>index</i>. This parameter is set to <b>NULL</b> if the specified index is not within the collection boundary.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsinamedstreams-get_item
     */
    get_Item(index) {
        result := ComCall(8, this, "int", index, "ptr*", &item := 0, "HRESULT")
        return IFsiFileItem2(item)
    }

    /**
     * Returns the number of the named streams associated with a file in the file system image.
     * @returns {Integer} Pointer to a value indicating the total number of named streams in the collection.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsinamedstreams-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Creates a non-variant enumerator for the collection of the named streams associated with a file in the file system image.
     * @returns {IEnumFsiItems} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/imapi2fs/nn-imapi2fs-ienumfsiitems">IEnumFsiItems</a> object representing a collection of named streams associated with a file.
     * @see https://docs.microsoft.com/windows/win32/api//imapi2fs/nf-imapi2fs-ifsinamedstreams-get_enumnamedstreams
     */
    get_EnumNamedStreams() {
        result := ComCall(10, this, "ptr*", &NewEnum := 0, "HRESULT")
        return IEnumFsiItems(NewEnum)
    }
}
