#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the direction of the data flow. This determines the formats that the resulting enumerator can enumerate.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-datadir
 * @namespace Windows.Win32.System.Com
 */
class DATADIR extends Win32Enum {

    /**
     * Requests that <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-enumformatetc">IDataObject::EnumFormatEtc</a> supply an enumerator for the formats that can be specified in<a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a>.
     * Native name: DATADIR_GET
     * @type {Integer (Int32)}
     */
    static GET => 1

    /**
     * Requests that <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-enumformatetc">IDataObject::EnumFormatEtc</a> supply an enumerator for the formats that can be specified in <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-setdata">IDataObject::SetData</a>.
     * Native name: DATADIR_SET
     * @type {Integer (Int32)}
     */
    static SET => 2
}
