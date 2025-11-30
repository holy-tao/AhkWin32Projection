#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the direction of the data flow. This determines the formats that the resulting enumerator can enumerate.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/ne-objidl-datadir
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class DATADIR extends Win32Enum{

    /**
     * Requests that <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-enumformatetc">IDataObject::EnumFormatEtc</a> supply an enumerator for the formats that can be specified in<a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a>.
     * @type {Integer (Int32)}
     */
    static DATADIR_GET => 1

    /**
     * Requests that <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-enumformatetc">IDataObject::EnumFormatEtc</a> supply an enumerator for the formats that can be specified in <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-setdata">IDataObject::SetData</a>.
     * @type {Integer (Int32)}
     */
    static DATADIR_SET => 2
}
