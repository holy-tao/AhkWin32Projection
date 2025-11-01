#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IEnumVARIANT>} NewEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsinamedstreams-get__newenum
     */
    get__NewEnum(NewEnum) {
        result := ComCall(7, this, "ptr*", NewEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<IFsiFileItem2>} item 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsinamedstreams-get_item
     */
    get_Item(index, item) {
        result := ComCall(8, this, "int", index, "ptr*", item, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsinamedstreams-get_count
     */
    get_Count(count) {
        countMarshal := count is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumFsiItems>} NewEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/imapi2fs/nf-imapi2fs-ifsinamedstreams-get_enumnamedstreams
     */
    get_EnumNamedStreams(NewEnum) {
        result := ComCall(10, this, "ptr*", NewEnum, "HRESULT")
        return result
    }
}
