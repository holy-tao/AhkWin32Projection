#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUrlAccessor3.ahk

/**
 * Extends the functionality of the IUrlAccessor3 interface with the IUrlAccessor4::ShouldIndexItemContent method that identifies whether the content of the item should be indexed.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-iurlaccessor4
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IUrlAccessor4 extends IUrlAccessor3{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUrlAccessor4
     * @type {Guid}
     */
    static IID => Guid("{5cc51041-c8d2-41d7-bca3-9e9e286297dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ShouldIndexItemContent", "ShouldIndexProperty"]

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor4-shouldindexitemcontent
     */
    ShouldIndexItemContent() {
        result := ComCall(20, this, "int*", &pfIndexContent := 0, "HRESULT")
        return pfIndexContent
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor4-shouldindexproperty
     */
    ShouldIndexProperty(key) {
        result := ComCall(21, this, "ptr", key, "int*", &pfIndexProperty := 0, "HRESULT")
        return pfIndexProperty
    }
}
