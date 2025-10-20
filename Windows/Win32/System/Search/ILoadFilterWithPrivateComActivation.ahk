#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ILoadFilter.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ILoadFilterWithPrivateComActivation extends ILoadFilter{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILoadFilterWithPrivateComActivation
     * @type {Guid}
     */
    static IID => Guid("{40bdbd34-780b-48d3-9bb6-12ebd4ad2e75}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadIFilterWithPrivateComActivation"]

    /**
     * 
     * @param {Pointer<FILTERED_DATA_SOURCES>} filteredSources 
     * @param {BOOL} useDefault 
     * @param {Pointer<Guid>} filterClsid 
     * @param {Pointer<BOOL>} isFilterPrivateComActivated 
     * @param {Pointer<IFilter>} filterObj 
     * @returns {HRESULT} 
     */
    LoadIFilterWithPrivateComActivation(filteredSources, useDefault, filterClsid, isFilterPrivateComActivated, filterObj) {
        result := ComCall(6, this, "ptr", filteredSources, "int", useDefault, "ptr", filterClsid, "ptr", isFilterPrivateComActivated, "ptr*", filterObj, "HRESULT")
        return result
    }
}
