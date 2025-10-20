#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class ISegmentList extends IUnknown{
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
     * 
     * @param {Pointer<ISegmentListIterator>} ppIIter 
     * @returns {HRESULT} 
     */
    CreateIterator(ppIIter) {
        result := ComCall(3, this, "ptr", ppIIter, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} peType 
     * @returns {HRESULT} 
     */
    GetType(peType) {
        result := ComCall(4, this, "int*", peType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEmpty 
     * @returns {HRESULT} 
     */
    IsEmpty(pfEmpty) {
        result := ComCall(5, this, "ptr", pfEmpty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
