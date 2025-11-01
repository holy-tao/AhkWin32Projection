#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The IGPMMapEntry interface provides access to a map entry.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/nn-gpmgmt-igpmmapentry
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class IGPMMapEntry extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGPMMapEntry
     * @type {Guid}
     */
    static IID => Guid("{8e79ad06-2381-4444-be4c-ff693e6e6f2b}")

    /**
     * The class identifier for GPMMapEntry
     * @type {Guid}
     */
    static CLSID => Guid("{8c975253-5431-4471-b35d-0626c928258a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Source", "get_Destination", "get_DestinationOption", "get_EntryType"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSource 
     * @returns {HRESULT} 
     */
    get_Source(pbstrSource) {
        result := ComCall(7, this, "ptr", pbstrSource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDestination 
     * @returns {HRESULT} 
     */
    get_Destination(pbstrDestination) {
        result := ComCall(8, this, "ptr", pbstrDestination, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pgpmDestOption 
     * @returns {HRESULT} 
     */
    get_DestinationOption(pgpmDestOption) {
        pgpmDestOptionMarshal := pgpmDestOption is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pgpmDestOptionMarshal, pgpmDestOption, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pgpmEntryType 
     * @returns {HRESULT} 
     */
    get_EntryType(pgpmEntryType) {
        pgpmEntryTypeMarshal := pgpmEntryType is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pgpmEntryTypeMarshal, pgpmEntryType, "HRESULT")
        return result
    }
}
