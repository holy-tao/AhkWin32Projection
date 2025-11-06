#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IOpcRelationshipSelector.ahk
#Include .\IOpcRelationshipSelectorEnumerator.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * A read-only enumerator of IOpcRelationshipSelector interface pointers.
 * @remarks
 * 
  * When an enumerator is created, the current position precedes the first pointer.
  * 
  * To set the current position to the first pointer of the enumerator, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationshipselectorenumerator-movenext">MoveNext</a>method after creating the enumerator.
  * 
  * Changes to the set will invalidate the enumerator, and all subsequent calls to it will fail.
  * 
  * To get an 
  * 				 <b>IOpcRelationshipSelectorEnumerator</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcrelationshipselectorset-getenumerator">IOpcRelationshipSelectorSet::GetEnumerator</a> or  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturerelationshipreference-getrelationshipselectorenumerator">IOpcSignatureRelationshipReference::GetRelationshipSelectorEnumerator</a> method.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcrelationshipselectorenumerator
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcRelationshipSelectorEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcRelationshipSelectorEnumerator
     * @type {Guid}
     */
    static IID => Guid("{5e50a181-a91b-48ac-88d2-bca3d8f8c0b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MoveNext", "MovePrevious", "GetCurrent", "Clone"]

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipselectorenumerator-movenext
     */
    MoveNext() {
        result := ComCall(3, this, "int*", &hasNext := 0, "HRESULT")
        return hasNext
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipselectorenumerator-moveprevious
     */
    MovePrevious() {
        result := ComCall(4, this, "int*", &hasPrevious := 0, "HRESULT")
        return hasPrevious
    }

    /**
     * 
     * @returns {IOpcRelationshipSelector} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipselectorenumerator-getcurrent
     */
    GetCurrent() {
        result := ComCall(5, this, "ptr*", &relationshipSelector := 0, "HRESULT")
        return IOpcRelationshipSelector(relationshipSelector)
    }

    /**
     * 
     * @returns {IOpcRelationshipSelectorEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcrelationshipselectorenumerator-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &copy := 0, "HRESULT")
        return IOpcRelationshipSelectorEnumerator(copy)
    }
}
