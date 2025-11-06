#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IFsrmCollection.ahk
#Include .\IFsrmPropertyBag.ahk

/**
 * IFsrmPropertyBag2 Interface
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmpropertybag2
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmPropertyBag2 extends IFsrmPropertyBag{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFsrmPropertyBag2
     * @type {Guid}
     */
    static IID => Guid("{0e46bdbd-2402-4fed-9c30-9266e6eb2cc9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 28

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetFieldValue", "GetUntrustedInFileProperties"]

    /**
     * 
     * @param {Integer} field 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/fsrmpipeline/nf-fsrmpipeline-ifsrmpropertybag2-getfieldvalue
     */
    GetFieldValue(field) {
        value := VARIANT()
        result := ComCall(28, this, "int", field, "ptr", value, "HRESULT")
        return value
    }

    /**
     * 
     * @returns {IFsrmCollection} 
     */
    GetUntrustedInFileProperties() {
        result := ComCall(29, this, "ptr*", &props := 0, "HRESULT")
        return IFsrmCollection(props)
    }
}
