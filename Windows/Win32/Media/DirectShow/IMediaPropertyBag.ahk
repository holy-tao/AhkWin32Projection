#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\IPropertyBag.ahk

/**
 * The IMediaPropertyBag interface is exposed by the Media Property Bag object.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-imediapropertybag
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaPropertyBag extends IPropertyBag{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaPropertyBag
     * @type {Guid}
     */
    static IID => Guid("{6025a880-c0d5-11d0-bd4e-00a0c911ce86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumProperty"]

    /**
     * 
     * @param {Integer} iProperty 
     * @param {Pointer<VARIANT>} pvarPropertyName 
     * @param {Pointer<VARIANT>} pvarPropertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediapropertybag-enumproperty
     */
    EnumProperty(iProperty, pvarPropertyName, pvarPropertyValue) {
        result := ComCall(5, this, "uint", iProperty, "ptr", pvarPropertyName, "ptr", pvarPropertyValue, "HRESULT")
        return result
    }
}
