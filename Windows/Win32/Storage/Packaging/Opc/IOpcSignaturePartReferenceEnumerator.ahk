#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * A read-only enumerator of IOpcSignaturePartReference interface pointers.
 * @remarks
 * 
  * When an enumerator is created, the current position precedes the first pointer. To set the current position to the first pointer of the enumerator, call the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturepartreferenceenumerator-movenext">MoveNext</a>method after creating the enumerator.
  * 
  * Changes to the set will invalidate the enumerator, and all subsequent calls to it will fail.
  * 
  * To get an <b>IOpcSignaturePartReferenceEnumerator</b> interface pointer, call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcsignaturepartreferenceset-getenumerator">IOpcSignaturePartReferenceSet::GetEnumerator</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/msopc/nf-msopc-iopcdigitalsignature-getsignaturepartreferenceenumerator">IOpcDigitalSignature::GetSignaturePartReferenceEnumerator</a> method.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msopc/nn-msopc-iopcsignaturepartreferenceenumerator
 * @namespace Windows.Win32.Storage.Packaging.Opc
 * @version v4.0.30319
 */
class IOpcSignaturePartReferenceEnumerator extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpcSignaturePartReferenceEnumerator
     * @type {Guid}
     */
    static IID => Guid("{80eb1561-8c77-49cf-8266-459b356ee99a}")

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
     * @param {Pointer<BOOL>} hasNext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreferenceenumerator-movenext
     */
    MoveNext(hasNext) {
        result := ComCall(3, this, "ptr", hasNext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} hasPrevious 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreferenceenumerator-moveprevious
     */
    MovePrevious(hasPrevious) {
        result := ComCall(4, this, "ptr", hasPrevious, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignaturePartReference>} partReference 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreferenceenumerator-getcurrent
     */
    GetCurrent(partReference) {
        result := ComCall(5, this, "ptr*", partReference, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IOpcSignaturePartReferenceEnumerator>} copy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msopc/nf-msopc-iopcsignaturepartreferenceenumerator-clone
     */
    Clone(copy) {
        result := ComCall(6, this, "ptr*", copy, "HRESULT")
        return result
    }
}
