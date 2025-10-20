#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * A read-only enumerator of IOpcRelationship interface pointers.
 * @remarks
 * 
  * To get a pointer to this interface, call either the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationshipset-getenumerator">IOpcRelationshipSet::GetEnumerator</a> or the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationshipset-getenumeratorfortype">IOpcRelationshipSet::GetEnumeratorForType</a> method.
  * 
  * When an enumerator is created, the current position precedes the first pointer. To set the current position to the first pointer of the enumerator, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationshipenumerator-movenext">MoveNext</a>method after creating the enumerator.
  * 
  * 
  * <div class="alert"><b>Note</b>  Changes to the set will invalidate the enumerator, and all subsequent calls will fail.</div>
  * <div> </div>
  * 
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcrelationshipenumerator
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcRelationshipEnumerator extends IUnknown{
    /**
     * The interface identifier for IOpcRelationshipEnumerator
     * @type {Guid}
     */
    static IID => Guid("{42195949-3b79-4fc8-89c6-fc7fb979ee76}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} hasNext 
     * @returns {HRESULT} 
     */
    MoveNext(hasNext) {
        result := ComCall(3, this, "ptr", hasNext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} hasPrevious 
     * @returns {HRESULT} 
     */
    MovePrevious(hasPrevious) {
        result := ComCall(4, this, "ptr", hasPrevious, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcRelationship>} relationship 
     * @returns {HRESULT} 
     */
    GetCurrent(relationship) {
        result := ComCall(5, this, "ptr", relationship, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IOpcRelationshipEnumerator>} copy 
     * @returns {HRESULT} 
     */
    Clone(copy) {
        result := ComCall(6, this, "ptr", copy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
