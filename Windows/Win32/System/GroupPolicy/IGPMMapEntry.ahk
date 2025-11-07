#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @returns {BSTR} 
     */
    get_Source() {
        pbstrSource := BSTR()
        result := ComCall(7, this, "ptr", pbstrSource, "HRESULT")
        return pbstrSource
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Destination() {
        pbstrDestination := BSTR()
        result := ComCall(8, this, "ptr", pbstrDestination, "HRESULT")
        return pbstrDestination
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DestinationOption() {
        result := ComCall(9, this, "int*", &pgpmDestOption := 0, "HRESULT")
        return pgpmDestOption
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EntryType() {
        result := ComCall(10, this, "int*", &pgpmEntryType := 0, "HRESULT")
        return pgpmEntryType
    }
}
