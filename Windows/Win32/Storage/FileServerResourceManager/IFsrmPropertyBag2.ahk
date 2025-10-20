#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFsrmPropertyBag.ahk

/**
 * IFsrmPropertyBag2 Interface
 * @see https://docs.microsoft.com/windows/win32/api//fsrmpipeline/nn-fsrmpipeline-ifsrmpropertybag2
 * @namespace Windows.Win32.Storage.FileServerResourceManager
 * @version v4.0.30319
 */
class IFsrmPropertyBag2 extends IFsrmPropertyBag{
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
     * 
     * @param {Integer} field 
     * @param {Pointer<VARIANT>} value 
     * @returns {HRESULT} 
     */
    GetFieldValue(field, value) {
        result := ComCall(28, this, "int", field, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFsrmCollection>} props 
     * @returns {HRESULT} 
     */
    GetUntrustedInFileProperties(props) {
        result := ComCall(29, this, "ptr", props, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
