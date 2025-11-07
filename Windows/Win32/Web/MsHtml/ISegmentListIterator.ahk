#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISegment.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISegmentListIterator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISegmentListIterator
     * @type {Guid}
     */
    static IID => Guid("{3050f692-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Current", "First", "IsDone", "Advance"]

    /**
     * 
     * @returns {ISegment} 
     */
    Current() {
        result := ComCall(3, this, "ptr*", &ppISegment := 0, "HRESULT")
        return ISegment(ppISegment)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    First() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsDone() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Advance() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
