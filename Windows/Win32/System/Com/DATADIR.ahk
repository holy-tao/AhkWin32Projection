#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the direction of the data flow. This determines the formats that the resulting enumerator can enumerate.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/ne-objidl-datadir
 * @namespace Windows.Win32.System.Com
 */
export default struct DATADIR {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
