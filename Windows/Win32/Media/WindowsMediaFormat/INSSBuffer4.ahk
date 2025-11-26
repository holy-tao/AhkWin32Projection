#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INSSBuffer3.ahk

/**
 * The INSSBuffer4 interface provides methods to enumerate buffer properties.
 * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nn-wmsbuffer-inssbuffer4
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class INSSBuffer4 extends INSSBuffer3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INSSBuffer4
     * @type {Guid}
     */
    static IID => Guid("{b6b8fd5a-32e2-49d4-a910-c26cc85465ed}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 12

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPropertyCount", "GetPropertyByIndex"]

    /**
     * The GetPropertyCount method retrieves the total number of buffer properties, also called data unit extensions, associated with the sample contained in the buffer object.
     * @returns {Integer} Pointer to the size of buffer properties.
     * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nf-wmsbuffer-inssbuffer4-getpropertycount
     */
    GetPropertyCount() {
        result := ComCall(12, this, "uint*", &pcBufferProperties := 0, "HRESULT")
        return pcBufferProperties
    }

    /**
     * The GetPropertyByIndex method retrieves a buffer property, also called a data unit extension, that was set using INSSBuffer3::SetProperty.
     * @param {Integer} dwBufferPropertyIndex <b>DWORD</b> containing the buffer property index. This value will be between zero and one less than the total number of properties associated with the sample. You can retrieve the total number of properties by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsbuffer/nf-wmsbuffer-inssbuffer4-getpropertycount">INSSBuffer4::GetPropertyCount</a>.
     * @param {Pointer<Guid>} pguidBufferProperty Pointer to a GUID specifying the type of buffer property.
     * @param {Pointer<Void>} pvBufferProperty Void pointer containing the value of the buffer property.
     * @param {Pointer<Integer>} pdwBufferPropertySize Pointer to a <b>DWORD</b> containing the size of the value pointed to by <i>pvBufferProperty</i>. If you set <i>pvBufferProperty</i> to <b>NULL</b>, this value will be set to the required size in bytes of the buffer needed to store the property value.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsbuffer/nf-wmsbuffer-inssbuffer4-getpropertybyindex
     */
    GetPropertyByIndex(dwBufferPropertyIndex, pguidBufferProperty, pvBufferProperty, pdwBufferPropertySize) {
        pvBufferPropertyMarshal := pvBufferProperty is VarRef ? "ptr" : "ptr"
        pdwBufferPropertySizeMarshal := pdwBufferPropertySize is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "uint", dwBufferPropertyIndex, "ptr", pguidBufferProperty, pvBufferPropertyMarshal, pvBufferProperty, pdwBufferPropertySizeMarshal, pdwBufferPropertySize, "HRESULT")
        return result
    }
}
