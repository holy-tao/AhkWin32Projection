#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISegmentListIterator.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISegmentList extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISegmentList
     * @type {Guid}
     */
    static IID => Guid("{3050f605-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateIterator", "GetType", "IsEmpty"]

    /**
     * 
     * @returns {ISegmentListIterator} 
     */
    CreateIterator() {
        result := ComCall(3, this, "ptr*", &ppIIter := 0, "HRESULT")
        return ISegmentListIterator(ppIIter)
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetType() {
        result := ComCall(4, this, "int*", &peType := 0, "HRESULT")
        return peType
    }

    /**
     * 
     * @returns {BOOL} 
     */
    IsEmpty() {
        result := ComCall(5, this, "int*", &pfEmpty := 0, "HRESULT")
        return pfEmpty
    }
}
